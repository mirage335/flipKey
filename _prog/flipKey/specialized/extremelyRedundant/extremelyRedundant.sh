
_set_occasional_read_redundant_headerKey() {
	export flipKey_headerKeyFile="$flipKey_headerKey_mult01_devFile"
	
	# https://unix.stackexchange.com/questions/538397/how-to-run-a-command-1-out-of-n-times-in-bash
	[ "$RANDOM" -lt 3277 ] && export flipKey_headerKeyFile="$flipKey_headerKey_mult03_devFile"
	[ "$RANDOM" -lt 3277 ] && export flipKey_headerKeyFile="$flipKey_headerKey_mult05_devFile"
	[ "$RANDOM" -lt 3277 ] && export flipKey_headerKeyFile="$flipKey_headerKey_mult07_devFile"
}




_extremelyRedundant_cryptsetup() {
	sudo -n cat "$flipKey_headerKeyFile" | head --bytes=8192000 | sudo -n /sbin/cryptsetup --hash whirlpool --key-size=512 --cipher aes-xts-plain64 --key-file=- create flipKey_"$flipKey_container_mult02_uuid" "$flipKey_container_mult02_devFile"
	sudo -n cat "$flipKey_headerKeyFile" | head --bytes=8192000 | sudo -n /sbin/cryptsetup --hash whirlpool --key-size=512 --cipher aes-xts-plain64 --key-file=- create flipKey_"$flipKey_container_mult04_uuid" "$flipKey_container_mult04_devFile"
	sudo -n cat "$flipKey_headerKeyFile" | head --bytes=8192000 | sudo -n /sbin/cryptsetup --hash whirlpool --key-size=512 --cipher aes-xts-plain64 --key-file=- create flipKey_"$flipKey_container_mult06_uuid" "$flipKey_container_mult06_devFile"
	sudo -n cat "$flipKey_headerKeyFile" | head --bytes=8192000 | sudo -n /sbin/cryptsetup --hash whirlpool --key-size=512 --cipher aes-xts-plain64 --key-file=- create flipKey_"$flipKey_container_mult08_uuid" "$flipKey_container_mult08_devFile"
}

_extremelyRedundant_cryptsetup_remove() {
	sync ; sleep 12
	local currentIterations
	[[ -e /dev/mapper/flipKey_"$flipKey_container_mult02_uuid" ]] && currentIterations=0 && while [[ "$currentIterations" -lt 3 ]] && ! sudo -n /sbin/cryptsetup remove flipKey_"$flipKey_container_mult02_uuid" ; do sleep 20 ; let currentIterations=currentIterations+1 ; done
	[[ -e /dev/mapper/flipKey_"$flipKey_container_mult04_uuid" ]] && currentIterations=0 && while [[ "$currentIterations" -lt 3 ]] && ! sudo -n /sbin/cryptsetup remove flipKey_"$flipKey_container_mult04_uuid" ; do sleep 15 ; let currentIterations=currentIterations+1 ; done
	[[ -e /dev/mapper/flipKey_"$flipKey_container_mult06_uuid" ]] && currentIterations=0 && while [[ "$currentIterations" -lt 3 ]] && ! sudo -n /sbin/cryptsetup remove flipKey_"$flipKey_container_mult06_uuid" ; do sleep 15 ; let currentIterations=currentIterations+1 ; done
	[[ -e /dev/mapper/flipKey_"$flipKey_container_mult08_uuid" ]] && currentIterations=0 && while [[ "$currentIterations" -lt 3 ]] && ! sudo -n /sbin/cryptsetup remove flipKey_"$flipKey_container_mult08_uuid" ; do sleep 15 ; let currentIterations=currentIterations+1 ; done
}

_extremelyRedundant_format() {
	local currentExitStatus
	currentExitStatus=0
	
	sudo -n dd if=/dev/urandom of=/dev/mapper/flipKey_"$flipKey_container_mult02_uuid" bs=2M oflag=direct conv=fdatasync status=progress
	sudo -n dd if=/dev/urandom of=/dev/mapper/flipKey_"$flipKey_container_mult04_uuid" bs=2M oflag=direct conv=fdatasync status=progress
	sudo -n dd if=/dev/urandom of=/dev/mapper/flipKey_"$flipKey_container_mult06_uuid" bs=2M oflag=direct conv=fdatasync status=progress
	sudo -n dd if=/dev/urandom of=/dev/mapper/flipKey_"$flipKey_container_mult08_uuid" bs=2M oflag=direct conv=fdatasync status=progress
	sync
	
	sudo -n mkfs.btrfs -f --checksum sha256 -M -d RAID1C4 -m RAID1C4 /dev/mapper/flipKey_"$flipKey_container_mult02_uuid" /dev/mapper/flipKey_"$flipKey_container_mult04_uuid" /dev/mapper/flipKey_"$flipKey_container_mult06_uuid" /dev/mapper/flipKey_"$flipKey_container_mult08_uuid"
	currentExitStatus=$?
	sync
	
	return "$currentExitStatus"
}



_extremelyRedundant_create() {
	! _extremelyRedundant_cryptsetup && _messagePlain_bad 'fail: create: cryptsetup' && _stop 1
	
	! _extremelyRedundant_format && _messagePlain_bad 'fail: create: format' && _stop 1
	
	! _extremelyRedundant_cryptsetup_remove && _messagePlain_bad 'fail: create: cryptsetup' && _stop 1
	
	return 0
}


_extremelyRedundant_mount() {
	local currentExitStatus
	currentExitStatus=0
	
	_disk_declare
	_check_keyPartition
	
	_messagePlain_probe_cmd _touch-flipKey-trivial
	
	! _extremelyRedundant_cryptsetup && _messagePlain_bad 'fail: cryptsetup' && _stop 1
	
	! mkdir -p "$flipKey_mount" && sudo -n mkdir -p "$flipKey_mount"
	
	#commit=3
	#autodefrag
	#compress-force,compress=zlib:9
	if ! sudo -n mount -o "commit=45,autodefrag,compress-force,compress=zlib:9" /dev/mapper/flipKey_"$flipKey_container_mult02_uuid" "$flipKey_mount"
	then
		currentExitStatus=1
	fi
	# Compression. May break some 'direct' writing to filesystem, but these only seem effectively used by large networked databases. Other applications seem to rely on a reasonable default write interval, which seems adequate.
	# Redundancy is expected to imply storage is not solid-state, with emphasis on reliability, so compression will not meaningfully reduce transfer speed.
	#if ! sudo -n mount -o remount,"compress-force,compress=zlib:9" "$flipKey_mount"
	#	then
	#	currentExitStatus=1
	#fi
	
	sudo -n chown "$USER":"$USER" "$flipKey_mount"
	if ! chmod 770 "$flipKey_mount"
	then
		sudo -n chmod 775 "$flipKey_mount"
	fi
	
	_touch-flipKey-trivial
	
	[[ "$currentExitStatus" == "0" ]] && _messagePlain_good 'good: mount'
	[[ "$currentExitStatus" != "0" ]] && _messagePlain_bad 'fail: mount'
	
	sleep 3
	
	return "$currentExitStatus"
}

_extremelyRedundant_unmount() {
	local currentExitStatus
	currentExitStatus=0
	
	_disk_declare
	#_check_keyPartition
	
	_messagePlain_probe_cmd _touch-flipKey-trivial
	
	if ! sudo -n umount "$flipKey_mount"
	then
		currentExitStatus=1
	fi
	
	if ! _extremelyRedundant_cryptsetup_remove
	then
		_messagePlain_bad 'fail: cryptsetup'
		currentExitStatus=1
	fi
	
	_touch-flipKey-trivial
	
	sudo -n chown "$USER":"$USER" "$flipKey_mount"
	if ! chmod 500 "$flipKey_mount"
	then
		sudo -n chmod 500 "$flipKey_mount"
	fi
	
	[[ "$currentExitStatus" == "0" ]] && _messagePlain_good 'good: unmount'
	[[ "$currentExitStatus" != "0" ]] && _messagePlain_bad 'fail: unmount'
	
	sleep 3
	
	return "$currentExitStatus"
}


