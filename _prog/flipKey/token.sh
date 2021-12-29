

_token_set() {
	if [[ "$flipKey_tokenID" != "" ]] && [[ "$flipKey_token_keyID" != "" ]]
	then
		export flipKey_headerKeyFile="$scriptLocal"/token/keys/"$flipKey_token_keyID"/c-h-flipKey
		return
	fi
	return
}

# ATTENTION: Override with 'ops.sh' , 'disk.sh' , or similar!
_token_mount() {
	# && [[ "$flipKey_headerKeyFile" == "$scriptLocal"/token/keys/"$flipKey_token_keyID"/c-h-flipKey ]]
	if [[ "$flipKey_tokenID" != "" ]] && [[ "$flipKey_token_keyID" != "" ]]
	then
		_token_mount_procedure "$@"
		return
	fi
	return 0
}

# ATTENTION: Override with 'ops.sh' , 'disk.sh' , or similar!
_token_unmount() {
	# && [[ "$flipKey_headerKeyFile" == "$scriptLocal"/token/keys/"$flipKey_token_keyID"/c-h-flipKey ]]
	if [[ "$flipKey_tokenID" != "" ]] && [[ "$flipKey_token_keyID" != "" ]]
	then
		_token_unmount_procedure "$@"
		return
	fi
	return 0
}


_token_mount_procedure() {
	_mustGetSudo
	
	local currentRO=ro
	[[ "$1" != "" ]] && currentRO="$1"
	
	_token_set "$@"
	
	mkdir -p -m 700 "$scriptLocal"/token
	
	[[ "$currentRO" == "ro" ]] && ! sudo -n mount -o ro /dev/disk/by-uuid/"$flipKey_tokenID" "$scriptLocal"/token && _token_FAIL
	
	if [[ "$currentRO" == "rw" ]]
	then
		# WARNING: 'util-linux 2.23' , 'Linux 2.6.15'
		! sudo -n mount -o rw --make-private --make-unbindable /dev/disk/by-uuid/"$flipKey_tokenID" "$scriptLocal"/token && _token_FAIL
		sudo -n mkdir -p -m 700 "$scriptLocal"/token/keys/"$flipKey_token_keyID"
		sudo -n chown "$USER":"$USER" "$scriptLocal"/token
		sudo -n chown "$USER":"$USER" "$scriptLocal"/token/keys
		sudo -n chown "$USER":"$USER" "$scriptLocal"/token/keys/"$flipKey_token_keyID"
		sudo -n chmod 700 "$scriptLocal"/token/keys/"$flipKey_token_keyID"
		sudo -n "$scriptAbsoluteLocation" _touch-flipKey-touch-random "$flipKey_headerKeyFile"
		sudo -n chown -R "$USER":"$USER" "$scriptLocal"/token/keys/"$flipKey_token_keyID"
		sudo -n chmod 600 "$flipKey_headerKeyFile"
		_touch-flipKey-touch-random "$flipKey_headerKeyFile"
	fi
	
	# Persistently mounted token (discouraged) .
	#mkdir -p -m 700 "$scriptLocal"/token/keys/"$flipKey_token_keyID"
	#_relink /media/token/keys/"$flipKey_token_keyID"/c-h-flipKey "$flipKey_headerKeyFile" > /dev/null 2>&1
	
	! [[ -e "$flipKey_headerKeyFile" ]] && _token_FAIL
	return 0
}

_token_unmount_procedure() {
	local currentRO=ro
	[[ "$1" != "" ]] && currentRO="$1"
	
	_token_set "$@"
	[[ "$currentRO" == "ro" ]] && sudo -n umount "$scriptLocal"/token && return 0
	[[ "$currentRO" == "rw" ]] && sudo -n umount "$scriptLocal"/token && return 0
	_token_FAIL
	return 1
}



_token_FAIL() {
	#_messagePlain_bad 'fail: token'
	_messageError 'FAIL: token'
	#_messageFAIL
	sleep 2
	_stop 1
	return 1
}



