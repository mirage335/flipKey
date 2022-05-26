
# WARNING: May be untested. Misses much of the compatibility and testing benefits of veracrypt backend. Only expected use is to encrypt '/', '/home/user', or similar directories with less risk of '/dev/mapper/veracrypt*' conflicts, and with more assurance of trim/discard available for nested use of flipKey , etc .

# WARNING: Container filename will have '*.vc' extension, although not compatible with veracrypt !




# ATTENTION: Override with 'ops.sh' , 'disk.sh' , or similar .
# See 'flipKey_disk.sh' for '_disk_simple_ops' .
#_disk_simple_ops()



_simpleCrypt_cryptsetup() {
	#echo -n $ubiquitousBashID | md5sum | head -c32 | md5sum | head -c32 | md5sum | head -c32 | head -c18
	#71b362f4bea9a57dde
	
	local flipKey_headerKeyFile_summary
	flipKey_headerKeyFile_summary=$(_mix_keyfile "$flipKey_headerKeyFile" "summary")
	echo "$flipKey_headerKeyFile_summary" | wc -c
	
	#sudo -n cat "$flipKey_headerKeyFile" | sudo -n /sbin/cryptsetup --allow-discards --hash whirlpool --key-size=512 --cipher aes-xts-plain64 --key-file=- create simpleCrypt_71b362f4bea9a57dde "$flipKey_container"
	echo "$flipKey_headerKeyFile_summary" | sudo -n /sbin/cryptsetup --allow-discards --hash whirlpool --key-size=512 --cipher aes-xts-plain64 --key-file=- create simpleCrypt_71b362f4bea9a57dde "$flipKey_container"
}

_simpleCrypt_cryptsetup_remove() {
	_mustGetSudo
	
	sync ; sleep 1
	
	[[ -e /dev/mapper/simpleCrypt_71b362f4bea9a57dde ]] && sudo -n /sbin/cryptsetup remove simpleCrypt_71b362f4bea9a57dde
}

# WARNING: Exit status important.
_simpleCrypt_mkfs() {
	if [[ -e /simpleCrypt_ext4 ]]
	then
		sudo -n mkfs.ext4 -e remount-ro -E lazy_itable_init=0,lazy_journal_init=0 -m 0 /dev/mapper/simpleCrypt_71b362f4bea9a57dde
		return
	else
		sudo -n mkfs.btrfs -f --checksum xxhash -M -d single /dev/mapper/simpleCrypt_71b362f4bea9a57dde
		return
	fi
}
_simpleCrypt_format() {
	_mustGetSudo
	
	local currentExitStatus
	currentExitStatus=0
	
	# DANGER: Uncomment if '-allow-discards' is disabled.
	#oflag=direct conv=fdatasync
	#sudo -n dd if=/dev/urandom of=/dev/mapper/simpleCrypt_71b362f4bea9a57dde bs=2M status=progress
	#sync
	
	_simpleCrypt_mkfs "$@"
	currentExitStatus=$?
	sync
	
	return "$currentExitStatus"
}



_simpleCrypt_create() {
	_mustGetSudo
	
	_mix_keyfile_vector
	
	_disk_declare
	_check_keyPartition
	
	_token_mount ro
	
	
	sudo -n fstrim "$scriptAbsoluteFolder"
	
	# DANGER: Uncomment, instead of allocated or sparse file, if '-allow-discards' is disabled.
	##oflag=direct conv=fdatasync
	#sudo -n rm -f "$flipKey_container"
	##dd if=/dev/urandom of="$flipKey_container" bs=1M count=$(bc <<< "scale=0; ""$flipKey_containerSize / 1048576")  status=progress
	##sudo -n ... tee ...
	## | tee "$flipKey_container" > /dev/null
	#_openssl_rand-flipKey | head -c "$flipKey_containerSize" | pv > "$flipKey_container"
	
	# https://serverfault.com/questions/696554/creating-a-grow-on-demand-encrypted-volume-with-luks
	dd of="$flipKey_container" bs=1M count=0 seek=$(bc <<< "scale=0; ""$flipKey_containerSize / 1048576") status=progress
	
	
	sudo -n fstrim "$scriptAbsoluteFolder"
	sync
	
	! _simpleCrypt_cryptsetup && _messagePlain_bad 'fail: create: cryptsetup' && _stop 1
	
	! _simpleCrypt_format && _messagePlain_bad 'fail: create: format' && _stop 1
	
	! _simpleCrypt_cryptsetup_remove && _messagePlain_bad 'fail: create: cryptsetup' && _stop 1
	
	
	_token_unmount ro
	
	return 0
}



_simpleCrypt_mount() {
	_mustGetSudo
	
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
	
	#_messagePlain_probe_cmd _touch-flipKey-trivial
	
	! _simpleCrypt_cryptsetup && _messagePlain_bad 'fail: cryptsetup' && _stop 1
	
	! mkdir -p "$flipKey_mount" && sudo -n mkdir -p "$flipKey_mount"
	
	
	if [[ -e /simpleCrypt_ext4 ]]
	then
		if ! sudo -n mount -o "defaults,errors=remount-ro,discard" /dev/mapper/simpleCrypt_71b362f4bea9a57dde "$flipKey_mount"
		then
			currentExitStatus=1
			return
		fi
	else
		# https://www.reddit.com/r/btrfs/comments/tnyc53/so_autodefrag_really_increases_ssd_wear/
		#commit=3
		#autodefrag
		#compress-force,compress=zlib:9
		if ! sudo -n mount -o "commit=45,discard,compress=zstd:1,notreelog" /dev/mapper/simpleCrypt_71b362f4bea9a57dde "$flipKey_mount"
		then
			currentExitStatus=1
			return
		fi
	fi
	
	
	sudo -n chown "$USER":"$USER" "$flipKey_mount"
	if ! chmod 770 "$flipKey_mount"
	then
		sudo -n chmod 775 "$flipKey_mount"
	fi
	
	#_touch-flipKey-trivial
	
	[[ "$currentExitStatus" == "0" ]] && _messagePlain_good 'good: mount'
	[[ "$currentExitStatus" != "0" ]] && _messagePlain_bad 'fail: mount'
	
	sleep 0.3
	#sleep 3
	
	return "$currentExitStatus"
}

_simpleCrypt_unmount() {
	_mustGetSudo
	
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
	
	#_messagePlain_probe_cmd _touch-flipKey-trivial
	
	if ! sudo -n umount "$flipKey_mount"
	then
		currentExitStatus=1
	fi
	
	if ! _simpleCrypt_cryptsetup_remove
	then
		_messagePlain_bad 'fail: cryptsetup'
		currentExitStatus=1
	fi
	
	#_touch-flipKey-trivial
	
	sudo -n chown "$USER":"$USER" "$flipKey_mount"
	if ! chmod 500 "$flipKey_mount"
	then
		sudo -n chmod 500 "$flipKey_mount"
	fi
	
	[[ "$currentExitStatus" == "0" ]] && _messagePlain_good 'good: unmount'
	[[ "$currentExitStatus" != "0" ]] && _messagePlain_bad 'fail: unmount'
	
	sleep 0.3
	#sleep 3
	
	return "$currentExitStatus"
}










_test_simpleCrypt() {
	
	true
	
}

