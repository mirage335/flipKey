
# WARNING: May be untested. Misses much of the compatibility and testing benefits of veracrypt backend. Only expected use is to encrypt '/', '/home/user', or similar directories with less risk of 'losetup' or '/dev/mapper/veracrypt*' conflicts.




# ATTENTION: Override with 'ops.sh' .



#__create() {
	#_generate
	#_simpleCrypt_create
#}
#_zzCreate()

#__grab() {
	#_simpleCrypt_mount
#}

#__toss() {
	#_simpleCrypt_umount
#}

#_purge()
#_generate()
#__zzGenerate()




_simpleCrypt_cryptsetup() {
	#echo -n $ubiquitousBashID | md5sum | head -c32 | md5sum | head -c32 | md5sum | head -c32 | head -c18
	#71b362f4bea9a57dde
	
	[[ $(sudo -n cat "$flipKey_headerKeyFile" | head --bytes=48 | tail --bytes=48 | sudo -n cat "$flipKey_headerKeyFile" - | tail --bytes=+250 | tail --bytes=8192000 | wc -c | tr -dc '0-9') -lt "393015" ]] && _messagePlain_bad 'fail: size: key' && return 1
	
	sudo -n cat "$flipKey_headerKeyFile" | sudo -n /sbin/cryptsetup --allow-discards --hash whirlpool --key-size=512 --cipher aes-xts-plain64 --key-file=- create simpleCrypt_71b362f4bea9a57dde "$flipKey_container"
}

_simpleCrypt_cryptsetup_remove() {
	sync ; sleep 12
	local currentIterations
	[[ -e /dev/mapper/simpleCrypt_71b362f4bea9a57dde ]] && currentIterations=0 && while [[ "$currentIterations" -lt 3 ]] && ! sudo -n /sbin/cryptsetup remove simpleCrypt_71b362f4bea9a57dde ; do sleep 20 ; let currentIterations=currentIterations+1 ; done
	
}

_simpleCrypt_format() {
	local currentExitStatus
	currentExitStatus=0
	
	sudo -n dd if=/dev/urandom of=/dev/mapper/simpleCrypt_71b362f4bea9a57dde bs=2M oflag=direct conv=fdatasync status=progress
	sync
	
	sudo -n mkfs.btrfs -f --checksum sha256 -M -d single /dev/mapper/simpleCrypt_71b362f4bea9a57dde
	currentExitStatus=$?
	sync
	
	return "$currentExitStatus"
}



_simpleCrypt_create() {
	_mix_keyfile_vector
	
	_disk_declare
	_check_keyPartition
	
	_token_mount ro
	
	
	! _simpleCrypt_cryptsetup && _messagePlain_bad 'fail: create: cryptsetup' && _stop 1
	
	! _simpleCrypt_format && _messagePlain_bad 'fail: create: format' && _stop 1
	
	! _simpleCrypt_cryptsetup_remove && _messagePlain_bad 'fail: create: cryptsetup' && _stop 1
	
	
	_token_unmount ro
	
	return 0
}



_simpleCrypt_mount() {
	local currentExitStatus
	_mix_keyfile_vector
	
	_disk_declare
	_check_keyPartition
	
	_token_mount ro
	
	_simpleCrypt_mount_procedure "$@"
	currentExitStatus="$?"
	
	_token_unmount ro
	
	return "$currentExitStatus"
}
_simpleCrypt_mount_procedure() {
	local currentExitStatus
	currentExitStatus=0
	
	_disk_declare
	_check_keyPartition
	
	_messagePlain_probe_cmd _touch-flipKey-trivial
	
	! _simpleCrypt_cryptsetup && _messagePlain_bad 'fail: cryptsetup' && _stop 1
	
	! mkdir -p "$flipKey_mount" && sudo -n mkdir -p "$flipKey_mount"
	
	#commit=3
	#autodefrag
	#compress-force,compress=zlib:9
	if ! sudo -n mount -o "commit=45,autodefrag,compress-force,compress=zstd:1" /dev/mapper/simpleCrypt_71b362f4bea9a57dde "$flipKey_mount"
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

_simpleCrypt_unmount() {
	local currentExitStatus
	_mix_keyfile_vector
	
	_disk_declare
	_check_keyPartition
	
	_token_mount ro
	
	_simpleCrypt_unmount_procedure "$@"
	currentExitStatus="$?"
	
	_token_unmount ro
	
	return "$currentExitStatus"
}
_simpleCrypt_unmount_procedure() {
	local currentExitStatus
	currentExitStatus=0
	
	_disk_declare
	#_check_keyPartition
	
	_messagePlain_probe_cmd _touch-flipKey-trivial
	
	if ! sudo -n umount "$flipKey_mount"
	then
		currentExitStatus=1
	fi
	
	if ! _simpleCrypt_cryptsetup_remove
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










_test_simpleCrypt() {
	
	true
	
}

