
___nilfs_gc() {
	_nilfs_gc "$@"
}
__nilfs_gc() {
	_nilfs_gc "$@"
}
_nilfs_gc() {
	_messageNormal 'init: _nilfs_gc'
	
	local currentMountDir
	
	currentMountDir="$1"
	[[ "$currentMountDir" == "" ]] && currentMountDir=$(_nilfs_gc_mountDir)
	
	[[ ! -e "$currentMountDir" ]] && _messagePlain_bad 'FAIL: missing: currentMountDir= '"$currentMountDir" && return 1
	currentMountDir=$(_getAbsoluteLocation "$currentMountDir")
	[[ ! -e "$currentMountDir" ]] && _messagePlain_bad 'FAIL: missing: currentMountDir= '"$currentMountDir" && return 1
	! mountpoint "$currentMountDir" > /dev/null 2>&1 && _messagePlain_bad 'FAIL: unmounted: currentMountDir= '"$currentMountDir" && return 1
	
	_messagePlain_probe "$currentMountDir"
	
	local currentMountDevice
	currentMountDevice=""
	local currentComparisonDirectoryName
	currentComparisonDirectoryName=""
	
	currentIterations=0
	while [[ "$currentIterations" -lt 30 ]] && [[ "$currentMountDevice" == "" ]]
	do
		
		while read -r currentString && [[ "$currentMountDevice" == "" ]]
		do
			if [ "$currentString" ]
			then
				currentComparisonDirectoryName="$currentMountDir"
				if printf '%b' "$currentString" | cut -f2 -d\  | grep --line-regexp --fixed-strings "$currentComparisonDirectoryName" > /dev/null 2>&1
				then
					currentMountDevice=$(printf '%b' "$currentString" | cut -f1 -d\  )
				fi
				currentComparisonDirectoryName=$(_getAbsoluteLocation "$currentComparisonDirectoryName")
				if printf '%b' "$currentString" | cut -f2 -d\  | grep --line-regexp --fixed-strings "$currentComparisonDirectoryName" > /dev/null 2>&1
				then
					currentMountDevice=$(printf '%b' "$currentString" | cut -f1 -d\  )
				fi
				currentComparisonDirectoryName=$(_realpath_L "$currentComparisonDirectoryName")
				if printf '%b' "$currentString" | cut -f2 -d\  | grep --line-regexp --fixed-strings "$currentComparisonDirectoryName" > /dev/null 2>&1
				then
					currentMountDevice=$(printf '%b' "$currentString" | cut -f1 -d\  )
				fi
			fi
			#echo
		done < /proc/mounts
		
		_messagePlain_probe 'currentMountDevice='"$currentMountDevice"
		
		sleep 1
		let currentIterations=currentIterations+1
	done
	
	! mountpoint "$currentMountDir" > /dev/null 2>&1 && _messagePlain_bad 'FAIL: unmounted: currentMountDir= '"$currentMountDir" return 1
	! [[ -e "$currentMountDevice" ]] && "$currentMountDir" && _messagePlain_bad 'FAIL: unmounted: currentMountDir= '"$currentMountDir" return 1
	
	_messagePlain_probe 'found: currentMountDevice= '"$currentMountDevice"
	
	if _messagePlain_probe_cmd sudo -n nilfs-clean "$currentMountDevice"
	then
		_messagePlain_probe_cmd sync
		_messageNormal 'done: _nilfs_gc'
		
		sleep 3
		return 0
	fi
	
	_messageError 'FAIL: _nilfs_gc'
	return 1
}


# ATTENTION: Override with 'ops.sh' or similar!
_nilfs_gc_mountDir() {
	#[[ "$objectName" == 'special' ]] && [[ -e "$scriptAbsoluteFolder"/../../"$USER" ]] && [[ -e "$scriptAbsoluteFolder"/../../fs ]] && echo "$scriptAbsoluteFolder"/'../../fs' && return 0
	#[[ "$objectName" == 'special' ]] && [[ -e "$scriptAbsoluteFolder"/../../user ]] && [[ -e "$scriptAbsoluteFolder"/../../fs ]] && echo "$scriptAbsoluteFolder"/'../../fs' && return 0
	
	[[ -e "$scriptAbsoluteFolder"/../../"$USER" ]] && [[ -e "$scriptAbsoluteFolder"/../../fs ]] && echo "$scriptAbsoluteFolder"/'../../fs' && return 0
	[[ -e "$scriptAbsoluteFolder"/../../user ]] && [[ -e "$scriptAbsoluteFolder"/../../fs ]] && echo "$scriptAbsoluteFolder"/'../../fs' && return 0
	
	
	echo "$scriptAbsoluteFolder"
	return 1
}


# Obsolete. No production use.
_nilfs_gc_device_filter() {
	cat
	#grep '^/dev/mapper' | grep 'veracrypt'
}













