##### Core


__create() {
	_generate
	_veracrypt_create
}
_zzCreate() {
	__create "$@"
}

__grab() {
	_veracrypt_mount
}

# WARNING: Toss in this case exceptionally does *NOT* imply sweep of 'header key' from local storage! Merely unmount.
__toss() {
	_veracrypt_unmount
}







_refresh_anchors() {
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/__grab.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/__toss.bat
	
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_zzCreate.bat
	
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_bash.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_test.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_setup.bat
	
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_bin.bat
	
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_pattern.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_pattern_reset.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_zzGenerate.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_zzPurge.bat
	
	#cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_garbage.bat
	
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/___nilfs_gc.bat
	
	
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_z__grab_fsTemp.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_z__toss_fsTemp.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_zz_zzCreate_fsTemp.bat
	
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/__packetTemp-enable.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/__packetTemp.bat
	
	
	
	cp -a "$scriptAbsoluteFolder"/_anchor.bat  "$scriptAbsoluteFolder"/___btrfs_balance.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat  "$scriptAbsoluteFolder"/___btrfs_defrag.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat  "$scriptAbsoluteFolder"/___btrfs_scrub_start.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat  "$scriptAbsoluteFolder"/___btrfs_scrub_status.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat  "$scriptAbsoluteFolder"/___btrfs_snapshot.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat  "$scriptAbsoluteFolder"/___btrfs_gc.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat  "$scriptAbsoluteFolder"/___btrfs_compsize.bat
}

_associate_anchors_request() {
	if ! _if_cygwin
	then
		# WARNING: Necessarily relies on a 'deprecated' 'field code' with the 'Exec key' of a 'Desktop Entry' file association.
		# https://specifications.freedesktop.org/desktop-entry-spec/desktop-entry-spec-latest.html
		_messagePlain_request 'association: *.bat'
		echo 'konsole --workdir %d -e /bin/bash %f (open in graphical terminal emulator from file manager)'
		echo 'bash'
	fi
	return 0
}

# ATTENTION: Override with 'ops.sh' , 'disk.sh' , or similar !
_pattern() {
	_disk_declare
	#_check_keyPartition
	
	if ! [[ -e "$scriptLocal"/pattern ]]
	then
		mkdir -p "$scriptLocal"/pattern
		! [[ -e "$scriptLocal"/pattern ]] && _stop 1
	fi
	
	if [[ $(ls -A -1 "$scriptLocal"/pattern/*.fll 2>/dev/null | wc -c) == "0" ]]
	then
		current_bs=10000000
		current_count=3
		[[ "$flipKey_pattern_bs" != "" ]] && current_bs="$flipKey_pattern_bs"
		[[ "$flipKey_pattern_count" != "" ]] && current_count="$flipKey_pattern_count"
		
		_pattern_define "$scriptLocal"/pattern bs="$current_bs" count="$current_count"
	fi
	
	_messageNormal 'verify...'
	_pattern_verify "$scriptLocal"/pattern && _messageDONE && sleep 12 && return 0
	
	_messageError 'FAIL'
	sleep 12
	return 1
}

# ATTENTION: Override with 'ops.sh' , 'disk.sh' , or similar !
_pattern_reset() {
	#_disk_declare
	#_check_keyPartition
	
	! [[ -e "$scriptLocal"/pattern ]] && return 1
	
	_messagePlain_nominal 'init: _pattern_reset'
	_pattern_rm "$scriptLocal"/pattern > /dev/null 2>&1 && sleep 3 && return 0
	
	sleep 3
	return 1
}


# ATTENTION: Override with 'ops.sh' , 'disk.sh' , or similar !
_purge() {
	local currentExitStatus
	
	_disk_declare
	_check_keyPartition
	_delay_exists_mount
	
	_token_mount rw
	
	_sweep-flipKey "$flipKey_headerKeyFile"
	currentExitStatus="$?"
	
	#rm -f "$flipKey_headerKeyFile"
	
	if [[ "$flipKey_removable" == 'false' ]]
	then
		_messagePlain_warn 'warn: flipKey_removable=false: ignore: _clean-flipKey'
	elif [[ "$flipKey_physical" == 'true' ]]
	then
		_messagePlain_warn 'warn: flipKey_physical=true: ignore: _clean-flipKey'
	else
		_clean-flipKey
	fi
	
	# Deleting container only AFTER wiping 'empty' space allows the keyfile to be overwritten (which is vastly more important) more quickly.
	rm -f "$flipKey_container"
	
	[[ "$flipKey_tokenID" != "" ]] && [[ "$flipKey_token_keyID" != "" ]] && [[ -e "$scriptLocal"/token/keys/"$flipKey_token_keyID" ]] && rmdir "$scriptLocal"/token/keys/"$flipKey_token_keyID"
	! _token_unmount rw && currentExitStatus=1
	
	sleep 3
	return "$currentExitStatus"
}
_zzPurge() {
	_purge "$@"
}


# ATTENTION: Override with 'ops.sh' , 'disk.sh' , or similar !
_generate() {
	local currentExitStatus
	
	_disk_declare
	_check_keyPartition
	_delay_exists_mount
	
	#_purge
	
	
	_token_mount rw
	
	_generate_flipKey_header
	currentExitStatus="$?"
	
	! _token_unmount rw && currentExitStatus=1
	
	sleep 3
	return "$currentExitStatus"
}
_zzGenerate() {
	_generate "$@"
}



# Point being that a new key could have been generated at any time for entirely appropriate 'experimental' reasons.
_garbage() {
	_generate "$@"
}
_zzGarbage() {
	_garbage "$@"
}







_disk_declare() {
	_disk_default
	
	export flipKey_filesystem="NTFS"
}

_disk_default() {
	export flipKey_headerKeyFile="$scriptLocal"/c-h-flipKey
	export flipKey_removable='false'
	export flipKey_physical='false'
	export flipKey_headerKeySize=1800000000
	export flipKey_containerSize=12000000000

	export flipKey_mount="$scriptLocal"/fs

	# Rarely worthwhile to override with partition or device file (eg. multi-TeraByte volumes).
	export flipKey_container="$scriptLocal"/container.vc
	export flipKey_MSWdrive='V'

	export flipKey_pattern_bs=40000000000
	export flipKey_pattern_count=300
	
	unset flipKey_tokenID
	unset flipKey_token_keyID
	#export flipKey_tokenID=UUID-UUID-UUID-UUID-UUID
	#export flipKey_token_keyID=0123456789012345678901234
	
	export flipKey_filesystem="NTFS"
}









_touch_experimental() {
	
	_touch-flipKey-trivial_cygwin_procedure() {
		_touch-flipKey-touch-loop "$1" 1 1 1 1
	}
	_touch-flipKey-trivial() {
		if _if_cygwin
		then
			#[[ -e "$flipKey_mount" ]] && _touch-flipKey-trivial_cygwin_procedure "$flipKey_mount"
			[[ -e "$flipKey_container" ]] && _touch-flipKey-trivial_cygwin_procedure "$flipKey_container"
			[[ -e "$flipKey_headerKeyFile" ]] && _touch-flipKey-trivial_cygwin_procedure "$flipKey_headerKeyFile" && return 0
		else
			[[ -e "$flipKey_mount" ]] && _touch-flipKey-touch-loop "$flipKey_mount" 1 1 1 1
			[[ -e "$flipKey_container" ]] && _touch-flipKey-touch-loop "$flipKey_container" 1 1 1 1
			[[ -e "$flipKey_headerKeyFile" ]] && _touch-flipKey-touch-loop "$flipKey_headerKeyFile" 1 1 1 1 && return 0
		fi
		return 1
	}
	_touch-flipKey() {
		if _if_cygwin
		then
			[[ -e "$flipKey_container" ]] && _touch-flipKey-trivial_cygwin_procedure "$flipKey_container" 1 1 1 1
			_touch-flipKey-touch-loop "$1" 1 1 1 1
			return 0
		fi
		
		mkdir -p "$flipKey_mount"
		[[ -e "$flipKey_mount" ]] && _touch-flipKey-touch-loop "$flipKey_mount" 1 1 1 1
		[[ -e "$flipKey_container" ]] && _touch-flipKey-touch-loop "$flipKey_mount" 1 1 1 1
		_touch-flipKey-touch-loop "$1" 1 1 1 1
		return 0
	}
	
}






_check_keyPartition() {
	if [[ "$flipKey_headerKeyFile" == "" ]]
	then
		_messageError 'FAIL: keyPartition'
		sleep 2
		_stop 1
		return 1
	fi
	
	if [[ "$flipKey_headerKeyFile" == "/dev/"* ]] && [[ "$flipKey_headerKeyFile" != "/dev/shm/"* ]]
	then
		if ! [[ -e "$flipKey_headerKeyFile" ]]
		then
			_messageError 'FAIL: keyPartition'
			sleep 2
			_stop 1
			return 1
		fi
		
		export flipKey_removable='true'
		export flipKey_physical='true'
	fi
	
	if [[ -d "$flipKey_headerKeyFile" ]]
	then
		_messageError 'FAIL: keyPartition: DANGER: directory instead of file!'
		_stop 1
	fi
	
	return 0
}



_delay_exists_mount() {
	! [[ -e "$flipKey_mount" ]] && ! [[ -e "$scriptLocal"/fs ]] && return 0
	
	_messagePlain_warn 'warn: Directory found, presumed data may exist!'
	_messageError 'delay: 1800sec (aka. 30min) (Ctrl+c repeatedly to cancel)'
	local currentIteration
	
	while [[ "$currentIteration" -lt 180 ]]
	do
		sleep 10
		let currentIteration=currentIteration+1
	done
	
	_messagePlain_bad 'bad: proceeding (unsafe)'
	return 1
	
	_messagePlain_good 'good: stop'
	_stop 1
}




