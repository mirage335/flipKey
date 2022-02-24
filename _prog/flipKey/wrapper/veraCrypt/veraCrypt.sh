#veraCrypt


_veracrypt_create() {
	local currentExitStatus
	
	_disk_declare
	_check_keyPartition
	
	_token_mount ro
	
	_veracrypt_create_procedure "$@"
	currentExitStatus="$?"
	
	_token_unmount ro
	
	return "$currentExitStatus"
}

_veracrypt_create_procedure() {
	_messageNormal 'init: _veracrypt_create'
	
	if ( [[ "$flipKey_filesystem" == "nilfs2" ]] || [[ "$flipKey_filesystem_alternate" == "nilfs2" ]] ) && ! sudo -n "$scriptAbsoluteLocation" _typeDep mkfs.nilfs2
	then
		_messagePlain_bad 'fail: create: missing: nilfs2'
	fi
	
	if ( [[ "$flipKey_filesystem" == "btrfs"* ]] ) && ! sudo -n "$scriptAbsoluteLocation" _typeDep mkfs.btrfs
	then
		_messagePlain_bad 'fail: create: missing: btrfs'
	fi
	
	if ( [[ "$flipKey_filesystem" == "btrfs-raid1c4" ]] || [[ "$flipKey_filesystem" == "btrfs-raid1c3" ]] ) && ! man mkfs.btrfs | grep raid1c4
	then
		_messagePlain_bad 'fail: create: missing: btrfs: raid1c4'
	fi
	
	if [[ "$flipKey_filesystem" == "btrfs-raid1c4" ]] || [[ "$flipKey_filesystem" == "btrfs-raid1c3" ]] || [[ "$flipKey_filesystem" == "btrfs-dup" ]] || [[ "$flipKey_filesystem" == "btrfs-mix" ]] || [[ "$flipKey_filesystem" == "nilfs2" ]] || [[ "$flipKey_filesystem" == "ext2" ]] || [[ "$flipKey_filesystem" == "fat" ]]
	then
		export flipKey_filesystem_alternate="$flipKey_filesystem"
		export flipKey_filesystem="ext4"
	fi
	
	if [[ "$flipKey_filesystem" == "udf" ]] || [[ "$flipKey_filesystem" == "udf-vat" ]]
	then
		export flipKey_filesystem_alternate="$flipKey_filesystem"
		export flipKey_filesystem="ext4"
	fi
	
	if [[ "$flipKey_headerKeyFile" != "/dev/"* ]] || [[ "$flipKey_headerKeyFile" == "/dev/shm/"* ]]
	then
		[[ $(cat "$flipKey_headerKeyFile" | wc -c | tr -dc '0-9') != "$flipKey_headerKeySize" ]] && _messagePlain_bad 'fail: create: size' && return 1
	fi
	
	_veracrypt_binOverride
	
	_messagePlain_probe_cmd _touch-flipKey-trivial
	#_touch-flipKey-trivial
	
	local currentExitStatus
	
	if _if_cygwin
	then
		rm -f "$cygwin_flipKey_container" > /dev/null 2>&1
		#sudo -n rm -f "$cygwin_flipKey_container" > /dev/null 2>&1
		
		#/silent /q
		#/l "$flipKey_MSWdrive"
		#/nowaitdlg /secureDesktop n
		#/keyfile "$flipKey_headerKeyFile"
		
		# https://superuser.com/questions/1358094/generate-a-new-veracrypt-container-on-the-linux-command-line
		#"C:\Program Files\VeraCrypt\VeraCrypt Format.exe" /create c:\Data\test.hc /password test /hash sha512 /encryption serpent /filesystem FAT /size 10M /force
		
		local cygwin_flipKey_container
		cygwin_flipKey_container=$(cygpath --windows "$flipKey_container")
		
		local cygwin_flipKey_headerKeyFile
		cygwin_flipKey_headerKeyFile=$(cygpath --windows "$flipKey_headerKeyFile")
		
		if [[ "$flipKey_packetDisc_writeOnce" != "true" ]]
		then
			_messagePlain_probe_cmd veracrypt_format /create "$cygwin_flipKey_container" /keyfile "$cygwin_flipKey_headerKeyFile" /hash sha512 /encryption aes /filesystem "$flipKey_filesystem" /size "$flipKey_containerSize" /force /silent
			currentExitStatus="$?"
		else
			# eg. writeOnce , fastFormat
			# WARNING: Experimental . May be untested.
			# DANGER: May be ineffective.
			_messagePlain_probe_cmd veracrypt_format /create "$cygwin_flipKey_container" /keyfile "$cygwin_flipKey_headerKeyFile" /hash sha512 /encryption aes /filesystem "$flipKey_filesystem" /size "$flipKey_containerSize" /dynamic /force /silent
			currentExitStatus="$?"
		fi
		
		[[ "$currentExitStatus" == "0" ]] && _messagePlain_good 'good: create'
		[[ "$currentExitStatus" != "0" ]] && _messagePlain_bad 'fail: create'
		
		#veracrypt -t --version 2>/dev/null "$scriptLocal"/veracrypt_version-cygwin
		
		_touch-flipKey-trivial
		#_touch-flipKey-trivial
		sleep 3
		
		mkdir -p "$flipKey_mount"
		#sudo -n mkdir -p "$flipKey_mount"
		#sudo -n chown "$USER":"$USER" "$flipKey_mount"
		chmod 500 "$flipKey_mount"
		#if ! chmod 500 "$flipKey_mount"
		#then
			#sudo -n chmod 500 "$flipKey_mount"
		#fi
		
		return "$currentExitStatus"
	else
		rm -f "$cygwin_flipKey_container" > /dev/null 2>&1
		#sudo -n rm -f "$cygwin_flipKey_container" > /dev/null 2>&1
		
		#--quick
		
		# https://security.stackexchange.com/questions/200950/how-and-what-information-does-trim-reveal-when-using-encrypted-veracrypt-volumes
		# 'veracrypt does this in it's own way, linux has it's own way to do this intercept operation'
		
		if [[ "$flipKey_container" != "/dev"* ]] || [[ "$flipKey_container" == "/dev/shm/"* ]]
		then
			if [[ "$flipKey_packetDisc_writeOnce" != "true" ]]
			then
				# https://kifarunix.com/how-to-use-veracrypt-on-command-line-to-encrypt-drives-on-ubuntu-18-04/
				# https://wiki.archlinux.org/title/TrueCrypt#Accessing_a_TrueCrypt_or_VeraCrypt_container_using_cryptsetup
				_messagePlain_probe_cmd veracrypt -t --create --size "$flipKey_containerSize" --volume-type=normal "$flipKey_container" --encryption=AES --hash=sha-512 --filesystem="$flipKey_filesystem" --keyfiles="$flipKey_headerKeyFile" --random-source=/dev/urandom --non-interactive
				currentExitStatus="$?"
			else
				# eg. writeOnce , fastFormat
				# WARNING: Experimental . May be untested.
				# DANGER: May be ineffective.
				_messagePlain_probe_cmd veracrypt -t --create --size "$flipKey_containerSize" --volume-type=normal "$flipKey_container" --encryption=AES --hash=sha-512 --filesystem="$flipKey_filesystem" --quick --keyfiles="$flipKey_headerKeyFile" --random-source=/dev/urandom --non-interactive
				currentExitStatus="$?"
			fi
		else
			if [[ "$flipKey_packetDisc_writeOnce" != "true" ]]
			then
				_messagePlain_probe_cmd veracrypt -t --create --volume-type=normal "$flipKey_container" --encryption=AES --hash=sha-512 --filesystem="$flipKey_filesystem" --keyfiles="$flipKey_headerKeyFile" --random-source=/dev/urandom --non-interactive
				currentExitStatus="$?"
			else
				# eg. writeOnce , fastFormat
				# WARNING: Experimental . May be untested.
				# DANGER: May be ineffective.
				_messagePlain_probe_cmd veracrypt -t --create --volume-type=normal "$flipKey_container" --encryption=AES --hash=sha-512 --filesystem="$flipKey_filesystem" --quick --keyfiles="$flipKey_headerKeyFile" --random-source=/dev/urandom --non-interactive
				currentExitStatus="$?"
			fi
		fi
		
		# ATTENTION: WIP: Ideally some custom options would be used for the 'ext4' filesystem, considering the benefits of not reserving blocks for root user, minimizing inode size, full init of inode table, etc.
		if [[ "$flipKey_filesystem" == "ext4" ]] || [[ "$flipKey_filesystem" == "btrfs" ]]
		then
			mkdir -p "$flipKey_mount"
			sudo -n mkdir -p "$flipKey_mount"
			
			
			local currentIterations
			
			# https://sourceforge.net/p/veracrypt/discussion/general/thread/a6399ca7/
			# 'There is currently no option to disable this; why would that be desirable?'
			currentIterations=0
			while [[ "$currentIterations" -lt 30 ]] && ! _messagePlain_probe_cmd veracrypt -t --dismount "$flipKey_container" --force --non-interactive
			do
				sync
				sleep 3
				let currentIterations=currentIterations+1
			done
			
			currentIterations=0
			while [[ "$currentIterations" -lt 30 ]] && ! _messagePlain_probe_cmd veracrypt -t --hash sha512 --volume-type=normal "$flipKey_container" --keyfiles="$flipKey_headerKeyFile" "$flipKey_mount" --force --non-interactive
			do
				sync
				sleep 3
				let currentIterations=currentIterations+1
			done
			
			! mountpoint "$flipKey_mount" && _messagePlain_bad 'fail: create: mkfs: mountpoint'
			
			
			local currentMountDir
			currentMountDir="$flipKey_mount"
			
			local currentVeracryptMountDevice
			currentVeracryptMountDevice=""
			
			local currentMountDevice
			currentMountDevice=""
			local currentComparisonDirectoryName
			currentComparisonDirectoryName=""
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
			
			currentVeracryptMountDevice="$currentMountDevice"
			
			
			! [[ "$currentVeracryptMountDevice" != "" ]] && _messagePlain_bad 'fail: create: mkfs: currentVeracryptMountDevice: blank'
			! [[ -e "$currentVeracryptMountDevice" ]] && _messagePlain_bad 'fail: create: mkfs: currentVeracryptMountDevice: nonexistent'
			! sudo -n dd if="$currentVeracryptMountDevice" of=/dev/null bs=1k count=1 > /dev/null 2>&1 && _messagePlain_bad 'fail: create: mkfs: currentVeracryptMountDevice: unreadable'
			
			
			if [[ "$currentVeracryptMountDevice" != "" ]] && [[ -e "$currentVeracryptMountDevice" ]] && sudo -n dd if="$currentVeracryptMountDevice" of=/dev/null bs=1k count=1 > /dev/null 2>&1
			then
				local currentMinimumBlockSize
				currentMinimumBlockSize=4096
				# | grep -v '\#'
				type _disk_declare 2>/dev/null | grep 'disk_floppy' > /dev/null 2>&1 && currentMinimumBlockSize=1024
				type _disk_declare 2>/dev/null | grep 'disk_zip' > /dev/null 2>&1 && currentMinimumBlockSize=1024
				type _disk_declare 2>/dev/null | grep 'disk_mo' > /dev/null 2>&1 && currentMinimumBlockSize=2048
				type _disk_declare 2>/dev/null | grep 'disc_mo' > /dev/null 2>&1 && currentMinimumBlockSize=2048
				type _disk_declare 2>/dev/null | grep 'disc_mo128' > /dev/null 2>&1 && currentMinimumBlockSize=1024
				type _disk_declare 2>/dev/null | grep 'disc_mo230' > /dev/null 2>&1 && currentMinimumBlockSize=1024
				type _disk_declare 2>/dev/null | grep 'disc_mo540' > /dev/null 2>&1 && currentMinimumBlockSize=1024
				type _disk_declare 2>/dev/null | grep 'disc_packet' > /dev/null 2>&1 && currentMinimumBlockSize=2048
				[[ "$flipKey_packetDisc_exhaustible" == "true" ]] && currentMinimumBlockSize=2048
				
				
				sudo -n umount "$flipKey_mount"
				
				if [[ "$flipKey_filesystem" == "ext4" ]] && ( [[ "$flipKey_filesystem_alternate" == "" ]] || [[ "$flipKey_filesystem_alternate" == "ext4" ]] )
				then
					if [[ "$flipKey_badblocks" == "true" ]]
					then
						_messagePlain_probe_cmd sudo -n mkfs.ext4 -O 64bit,metadata_csum -cc -b -"$currentMinimumBlockSize" -e remount-ro -E lazy_itable_init=0,lazy_journal_init=0 -m 0 -I 256 -F "$currentVeracryptMountDevice"
						currentExitStatus="$?"
					else
						_messagePlain_probe_cmd sudo -n mkfs.ext4 -O 64bit,metadata_csum -b -"$currentMinimumBlockSize" -e remount-ro -E lazy_itable_init=0,lazy_journal_init=0 -m 0 -I 256 -F "$currentVeracryptMountDevice"
						currentExitStatus="$?"
					fi
				fi
				
				# Small devices will have much less free space than in mixed mode. However, metadata duplication may be highly valuable in some cases.
				if [[ "$flipKey_filesystem" == "btrfs" ]] || [[ "$flipKey_filesystem_alternate" == "btrfs" ]]
				then
					local currentBlockSize
					currentBlockSize="$currentMinimumBlockSize"
					_messagePlain_probe_cmd sudo -n mkfs.btrfs -f --checksum sha256 -d single -m dup "$currentVeracryptMountDevice"
					currentExitStatus="$?"
				fi
				
				# Preferred for smaller devices, rather than defaults.
				if [[ "$flipKey_filesystem_alternate" == "btrfs-mix" ]]
				then
					local currentBlockSize
					currentBlockSize="$currentMinimumBlockSize"
					_messagePlain_probe_cmd sudo -n mkfs.btrfs -f --checksum sha256 -M -d single "$currentVeracryptMountDevice"
					currentExitStatus="$?"
				fi
				
				if [[ "$flipKey_filesystem_alternate" == "btrfs-dup" ]]
				then
					local currentBlockSize
					currentBlockSize="$currentMinimumBlockSize"
					_messagePlain_probe_cmd sudo -n mkfs.btrfs -f --checksum sha256 -M -d dup -m dup "$currentVeracryptMountDevice"
					currentExitStatus="$?"
				fi
				
				if [[ "$flipKey_filesystem_alternate" == "btrfs-raid1c4" ]] || [[ "$flipKey_filesystem_alternate" == "btrfs-raid1c3" ]]
				then
					_messagePlain_warn 'fail: automatic subpartitoning of veracrypt not available'
					currentExitStatus=1
				fi
				
				
				if [[ "$flipKey_filesystem_alternate" == "nilfs2" ]]
				then
					local currentBlockSize
					currentBlockSize="$currentMinimumBlockSize"
					_messagePlain_probe_cmd sudo -n mkfs.nilfs2 -c -b "$currentBlockSize" -m 5 -f "$currentVeracryptMountDevice"
					currentExitStatus="$?"
				fi
				
				if [[ "$flipKey_filesystem_alternate" == "ext2" ]]
				then
					local currentBlockSize
					currentBlockSize="$currentMinimumBlockSize"
					_messagePlain_probe_cmd sudo -n mkfs.ext2 -c -b -"$currentMinimumBlockSize" -e remount-ro -E lazy_itable_init=0,lazy_journal_init=0 -m 0 -I 256 -F "$currentVeracryptMountDevice"
					currentExitStatus="$?"
				fi
				
				if [[ "$flipKey_filesystem_alternate" == "fat" ]]
				then
					local currentBlockSize
					currentBlockSize="$currentMinimumBlockSize"
					_messagePlain_probe_cmd sudo -n mkfs.fat -c -S "$currentBlockSize" -I "$currentVeracryptMountDevice"
					currentExitStatus="$?"
				fi
				
				
				if [[ "$flipKey_filesystem_alternate" == "udf" ]]
				then
					local currentRandomLabel
					currentRandomLabel=$(cat /dev/urandom 2> /dev/null | base64 2> /dev/null | tr -dc 'a-zA-Z' 2> /dev/null | tr -d 'acdefhilmnopqrsuvACDEFHILMNOPQRSU14580' | head -c 1 2> /dev/null)$(cat /dev/urandom 2> /dev/null | base64 2> /dev/null | tr -dc 'a-zA-Z0-9' 2> /dev/null | tr -d 'acdefhilmnopqrsuvACDEFHILMNOPQRSU14580' | head -c 10 2> /dev/null)
					_messagePlain_probe_cmd sudo -n mkudffs --utf8 --blocksize=2048 --media-type=dvdram --udfrev=0x0201 --bootarea mbr --lvid="$currentRandomLabel" --vid="$currentRandomLabel" "$currentVeracryptMountDevice"
					currentExitStatus="$?"
				fi
				
				# WARNING: May be untested.
				if [[ "$flipKey_filesystem_alternate" == "udf-vat" ]]
				then
					local currentRandomLabel
					currentRandomLabel=$(cat /dev/urandom 2> /dev/null | base64 2> /dev/null | tr -dc 'a-zA-Z' 2> /dev/null | tr -d 'acdefhilmnopqrsuvACDEFHILMNOPQRSU14580' | head -c 1 2> /dev/null)$(cat /dev/urandom 2> /dev/null | base64 2> /dev/null | tr -dc 'a-zA-Z0-9' 2> /dev/null | tr -d 'acdefhilmnopqrsuvACDEFHILMNOPQRSU14580' | head -c 10 2> /dev/null)
					_messagePlain_probe_cmd sudo -n mkudffs --utf8 --blocksize=2048 --vat --media-type=dvdr --udfrev=0x0201 --bootarea mbr --uuid "$currentRandomUUID" --lvid="$currentRandomLabel" --vid="$currentRandomLabel" "$currentVeracryptMountDevice"
					currentExitStatus="$?"
				fi
				
				
				currentIterations=0
				while [[ "$currentIterations" -lt 30 ]] && ! _messagePlain_probe_cmd veracrypt -t --dismount "$flipKey_container" --force --non-interactive
				do
					sync
					sleep 3
					let currentIterations=currentIterations+1
				done
			else
				currentExitStatus=1
			fi
			
			
			#sudo -n umount "$flipKey_mount"
			#sudo -n dmsetup remove "$currentVeracryptMountDevice"
		fi
		
		[[ "$currentExitStatus" == "0" ]] && _messagePlain_good 'good: create'
		[[ "$currentExitStatus" != "0" ]] && _messagePlain_bad 'fail: create'
		
		#veracrypt -t --version 2>/dev/null "$scriptLocal"/veracrypt_version
		
		sudo -n chown "$USER":"$USER" "$flipKey_container"
		sudo -n chmod 600 "$flipKey_container"
		
		_touch-flipKey-trivial
		#_touch-flipKey-trivial
		
		mkdir -p "$flipKey_mount"
		sudo -n mkdir -p "$flipKey_mount"
		sudo -n chown "$USER":"$USER" "$flipKey_mount"
		chmod 500 "$flipKey_mount"
		if ! chmod 500 "$flipKey_mount"
		then
			sudo -n chmod 500 "$flipKey_mount"
		fi
		
		
		return "$currentExitStatus"
	fi
	
	return 1
}


_veracrypt_mount() {
	local currentExitStatus
	
	_disk_declare
	_check_keyPartition
	
	_token_mount ro
	
	_veracrypt_mount_procedure "$@"
	currentExitStatus="$?"
	
	_token_unmount ro
	
	return "$currentExitStatus"
}

_veracrypt_mount_procedure() {
	_messageNormal 'init: _veracrypt_mount'
	
	if [[ "$flipKey_headerKeyFile" != "/dev/"* ]] || [[ "$flipKey_headerKeyFile" == "/dev/shm/"* ]]
	then
		[[ $(cat "$flipKey_headerKeyFile" | wc -c | tr -dc '0-9') != "$flipKey_headerKeySize" ]] && _messagePlain_bad 'fail: size' && return 1
	fi
	
	_veracrypt_binOverride
	
	_messagePlain_probe_cmd _touch-flipKey-trivial
	#_touch-flipKey-trivial
	
	local currentExitStatus
	
	if _if_cygwin
	then
		#/silent /q
		#/l "$flipKey_MSWdrive"
		#/history n
		#/secureDesktop n
		
		local cygwin_flipKey_container
		cygwin_flipKey_container=$(cygpath --windows "$flipKey_container")
		
		local cygwin_flipKey_headerKeyFile
		cygwin_flipKey_headerKeyFile=$(cygpath --windows "$flipKey_headerKeyFile")
		
		# WARNING: Reading 'read-only' volumes with MSW/Cygwin (even with compatible NTFS and such) may require copying associated files elsewhere first.
		# Considering the archival use of any 'writeOnce' disc or similar, this is unlikely to cause much inconvenience.
		# https://github.com/veracrypt/VeraCrypt/issues/440
		# https://documentation.help/VeraCrypt/Command%20Line%20Usage.html
		# Adding '/m ro' may not be effective.
		# https://www.reddit.com/r/VeraCrypt/comments/7dqwxi/how_to_mount_a_volume_from_the_windows_command/
		_messagePlain_probe_cmd veracrypt /hash sha512 /volume "$cygwin_flipKey_container" /letter "$flipKey_MSWdrive" /nowaitdlg /secureDesktop n /history n /keyfile "$cygwin_flipKey_headerKeyFile" /tryemptypass y /force /silent /quit
		currentExitStatus="$?"
		
		[[ "$currentExitStatus" == "0" ]] && _messagePlain_good 'good: mount'
		[[ "$currentExitStatus" != "0" ]] && _messagePlain_bad 'fail: mount'
		
		_touch-flipKey-trivial
		#_touch-flipKey-trivial
		sleep 3
		return "$currentExitStatus"
	else
		mkdir -p "$flipKey_mount"
		sudo -n mkdir -p "$flipKey_mount"
		
		_messagePlain_probe_cmd veracrypt -t --hash sha512 --volume-type=normal "$flipKey_container" --keyfiles="$flipKey_headerKeyFile" "$flipKey_mount" --force --non-interactive
		currentExitStatus="$?"
		
		sync
		[[ "$currentExitStatus" == "0" ]] && ! mountpoint "$flipKey_mount" > /dev/null && currentExitStatus=1
		
		
		if [[ "$flipKey_filesystem" == "nilfs2" ]]
		then
			_messagePlain_probe 'remount: nilfs2: '"$flipKey_mount"
			
			# https://nilfs.sourceforge.io/en/faq.html
			# Default of 'one hour' is absurd for small discs (likely with even smaller files and mostly free space). Accidential deletion is most likely not going to happen simultaneously with a huge disc write.
			# WARNING: Beware 'checkpoints' are NOT a substitute for version control (ie. 'git'). A project file becoming too large for the disc will not be possible to save!
			if ! sudo -n mount -o remount,pp=10 "$flipKey_mount"
			then
				currentExitStatus=1
			fi
			
			# https://nilfs.sourceforge.io/en/faq.html
			rm -f "$flipKey_mount"/.nilfs
			sudo -n rm -f "$flipKey_mount"/.nilfs
		fi
		
		if [[ "$flipKey_filesystem" == "btrfs" ]]
		then
			_messagePlain_probe 'remount: btrfs: '"$flipKey_mount"
			
			# ATTENTION: If necessary, another remount in an override of '__grab' with 'disk.sh' or similar may disable compression.
			# Compression. May break some 'direct' writing to filesystem, but these only seem effectively used by large networked databases. Other applications seem to rely on a reasonable default write interval, which seems adequate.
			#compress=zlib:9
			#compress-force=zlib:9,
			if ! sudo -n mount -o remount,"compress=zlib:9" "$flipKey_mount"
			then
				currentExitStatus=1
			fi
		fi
		if [[ "$flipKey_filesystem" == "btrfs-mix" ]]
		then
			_messagePlain_probe 'remount: btrfs-mix: '"$flipKey_mount"
			
			# Compression. May break some 'direct' writing to filesystem, but these only seem effectively used by large networked databases. Other applications seem to rely on a reasonable default write interval, which seems adequate.
			#compress=zlib:9
			#compress-force=zlib:9
			if ! sudo -n mount -o remount,"compress=zlib:9" "$flipKey_mount"
			then
				currentExitStatus=1
			fi
		fi
		
		if [[ "$flipKey_filesystem" == "btrfs-dup" ]]
		then
			_messagePlain_probe 'remount: btrfs-dup: '"$flipKey_mount"
			
			# Compression. May break some 'direct' writing to filesystem, but these only seem effectively used by large networked databases. Other applications seem to rely on a reasonable default write interval, which seems adequate.
			# Redundancy is expected to imply storage is not solid-state, with emphasis on reliability, so compression will not meaningfully reduce transfer speed.
			#compress=zlib:9
			#compress-force=zlib:9
			if ! sudo -n mount -o remount,"compress=zlib:9" "$flipKey_mount"
			then
				currentExitStatus=1
			fi
		fi
		
		if [[ "$flipKey_filesystem" == "btrfs-raid1c4" ]] || [[ "$flipKey_filesystem" == "btrfs-raid1c3" ]]
		then
			_messagePlain_probe 'remount: btrfs-raid1c4: '"$flipKey_mount"
			
			# Compression. May break some 'direct' writing to filesystem, but these only seem effectively used by large networked databases. Other applications seem to rely on a reasonable default write interval, which seems adequate.
			# Redundancy is expected to imply storage is not solid-state, with emphasis on reliability, so compression will not meaningfully reduce transfer speed.
			#compress=zlib:9
			#compress-force=zlib:9
			if ! sudo -n mount -o remount,"compress=zlib:9" "$flipKey_mount"
			then
				currentExitStatus=1
			fi
		fi
		
		
		[[ "$currentExitStatus" == "0" ]] && _messagePlain_good 'good: mount'
		[[ "$currentExitStatus" != "0" ]] && _messagePlain_bad 'fail: mount'
		
		sudo -n chown "$USER":"$USER" "$flipKey_mount"
		if ! chmod 770 "$flipKey_mount"
		then
			sudo -n chmod 775 "$flipKey_mount"
		fi
		
		_touch-flipKey-trivial
		#_touch-flipKey-trivial
		return "$currentExitStatus"
	fi
}


_veracrypt_unmount() {
	local currentExitStatus
	
	_disk_declare
	#_check_keyPartition
	
	#_token_set
	
	_veracrypt_unmount_procedure "$@"
	currentExitStatus="$?"
	
	return "$currentExitStatus"
}

_veracrypt_unmount_procedure() {
	_messageNormal 'init: _veracrypt_unmount'
	
	#if [[ "$flipKey_headerKeyFile" != "/dev/"* ]] || [[ "$flipKey_headerKeyFile" == "/dev/shm/"* ]]
	#then
		#[[ $(cat "$flipKey_headerKeyFile" | wc -c | tr -dc '0-9') != "$flipKey_headerKeySize" ]] && _messagePlain_bad 'fail: size' && return 1
	#fi
	
	_veracrypt_binOverride
	
	_messagePlain_probe_cmd _touch-flipKey-trivial
	_touch-flipKey-trivial
	
	local currentExitStatus
	
	if _if_cygwin
	then
		#/silent /q
		#/history n
		#/secureDesktop n
		
		_messagePlain_probe_cmd veracrypt /dismount "$flipKey_MSWdrive" /nowaitdlg /secureDesktop n /history n /force /silent /quit
		currentExitStatus="$?"
		
		[[ "$currentExitStatus" == "0" ]] && _messagePlain_good 'good: unmount'
		[[ "$currentExitStatus" != "0" ]] && _messagePlain_bad 'fail: unmount'
		
		_touch-flipKey-trivial
		_touch-flipKey-trivial
		sleep 3
		return "$currentExitStatus"
	else
		true
		
		_messagePlain_probe_cmd veracrypt -t --dismount "$flipKey_container" --force --non-interactive
		currentExitStatus="$?"
		
		[[ "$currentExitStatus" == "0" ]] && mountpoint "$flipKey_mount" > /dev/null && currentExitStatus=1
		
		[[ "$currentExitStatus" == "0" ]] && _messagePlain_good 'good: unmount'
		[[ "$currentExitStatus" != "0" ]] && _messagePlain_bad 'fail: unmount'
		
		_touch-flipKey-trivial
		_touch-flipKey-trivial
		
		sudo -n chown "$USER":"$USER" "$flipKey_mount"
		if ! chmod 500 "$flipKey_mount"
		then
			sudo -n chmod 500 "$flipKey_mount"
		fi
		
		return "$currentExitStatus"
	fi
}









_veracrypt_cygwinOverride() {
	_discoverResource-cygwinNative-ProgramFiles 'VeraCrypt' 'VeraCrypt' false
	! type veracrypt > /dev/null 2>&1 && type VeraCrypt > /dev/null 2>&1 && veracrypt() { VeraCrypt "$@" ; }
	
	_discoverResource-cygwinNative-ProgramFiles 'VeraCrypt Format' 'VeraCrypt' false
	! type veracrypt_format > /dev/null 2>&1 && type VeraCryptFormat > /dev/null 2>&1 && veracrypt_format() { VeraCryptFormat "$@" ; }
}

_veracrypt_binOverride() {
	if _if_cygwin
	then
		_veracrypt_cygwinOverride
	fi
	
	# Not available through 'sudo' .
	if ! _if_cygwin
	then
		if _wantSudo && type -p veracrypt > /dev/null 2>&1
		then
			export currentOverridePATHbin_veracrypt=$(type -p veracrypt 2>/dev/null)
			type -p veracrypt > /dev/null 2>&1 && veracrypt() { sudo -n veracrypt "$@" ; }
			type -p veracrypt > /dev/null 2>&1 && veracrypt_format() { sudo -n veracrypt "$@" ; }
		else
			type -p veracrypt > /dev/null 2>&1 && veracrypt_format() { veracrypt "$@" ; }
		fi
	fi
	
	export -f veracrypt_format 2>/dev/null
	export -f veracrypt 2>/dev/null
}


_vector_veracrypt() {
	if _if_cygwin
	then
		return 0
	else
		veracrypt -t --test --non-interactive 2>/dev/null | grep pass > /dev/null 2>&1 && return 0
	fi
	return 1
}

_test_veracrypt() {
	_getDep cryptsetup
	
	#_getDep '/usr/share/lintian/overrides/libwxgtk3.0-gtk3-0v5'
	
	_veracrypt_binOverride
	
	if ! type veracrypt > /dev/null 2>&1 && _wantSudo
	then
		if [[ -e /etc/issue ]] && cat /etc/issue | grep 'Debian' > /dev/null 2>&1
		then
			[[ -e "$scriptLib"/_setups/veracrypt/veracrypt-1.24-Update7-Debian-10-amd64.deb ]] && sudo -n dpkg -i "$scriptLib"/_setups/veracrypt/veracrypt-1.24-Update7-Debian-10-amd64.deb
		fi
	fi
	
	if ! type veracrypt > /dev/null 2>&1 || ! type veracrypt_format > /dev/null 2>&1
	then
		_messagePlain_request "request: install: 'veracrypt' "
		_stop 1
	fi
	return 0
	
	
	! man grep | grep '\-\-fixed\-strings' > /dev/null 2>&1 && echo 'warn: missing: grep: fixed-strings'
	true
}

