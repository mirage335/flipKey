
_set_occasional_read_redundant_headerKey_fsTemp() {
	export flipKey_headerKeyFile="$flipKey_headerKey_temp01_devFile"
	
	# https://unix.stackexchange.com/questions/538397/how-to-run-a-command-1-out-of-n-times-in-bash
	[ "$RANDOM" -lt 6554 ] && export flipKey_headerKeyFile="$flipKey_headerKey_temp02_devFile"
}



_z__grab_fsTemp() {
	echo 'fs: temp: '${FUNCNAME[0]}
	export flipKey_mount="$flipKey_mount_temp"
	export flipKey_functions_fsTemp='true'
	export flipKey_filesystem="btrfs-dup"
	__grab() {
		_veracrypt_mount
	}
	
	_set_occasional_read_redundant_headerKey_fsTemp
	export flipKey_container="$flipKey_container_temp01_devFile"
	
	
	__grab "$@"
}
_z__toss_fsTemp() {
	echo 'fs: temp: '${FUNCNAME[0]}
	export flipKey_mount="$flipKey_mount_temp"
	export flipKey_functions_fsTemp='true'
	export flipKey_filesystem="btrfs-dup"
	__toss() {
		_veracrypt_unmount
	}
	
	_set_occasional_read_redundant_headerKey_fsTemp
	export flipKey_container="$flipKey_container_temp01_devFile"
	
	
	__toss "$@"
}
_zz_zzCreate_fsTemp() {
	echo 'fs: temp: '${FUNCNAME[0]}
	export flipKey_mount="$flipKey_mount_temp"
	export flipKey_functions_fsTemp='true'
	export flipKey_filesystem="btrfs-dup"
	__create() {
		_generate
		_veracrypt_create
	}
	
	export flipKey_headerKeyFile="$flipKey_headerKey_temp01_devFile"
	export flipKey_container="$flipKey_container_temp01_devFile"
	
	_disk_declare
	_check_keyPartition
	_delay_exists_mount
	
	
	
	export flipKey_headerKeyFile="$flipKey_headerKey_temp02_devFile"
	_sweep-flipKey "$flipKey_headerKeyFile"
	
	export flipKey_headerKeyFile="$flipKey_headerKey_temp01_devFile"
	_sweep-flipKey "$flipKey_headerKeyFile"
	
	
	
	__create "$@"
	
	echo 'fs: temp: redundancy: key'
	sudo -n dd if="$flipKey_headerKey_temp01_devFile" of="$flipKey_headerKey_temp02_devFile" bs=128K
}



