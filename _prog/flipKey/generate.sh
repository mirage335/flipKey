#generate.sh


_generate_keyData() {
	local currentHeaderKeySize
	currentHeaderKeySize=6000000000
	[[ "$flipKey_headerKeySize" != "" ]] && currentHeaderKeySize="$flipKey_headerKeySize"
	[[ "$1" != "" ]] && currentHeaderKeySize="$1"
	
	
	# ATTENTION: Apparently, preventing MSW from 'offering' formatting based on partition *contents* may not be feasible.
	# https://superuser.com/questions/49382/how-do-i-disable-you-need-to-format-this-disk-message-in-windows-vista-7
	# https://unix.stackexchange.com/questions/508890/how-to-change-partition-type-id-without-formatting
	# https://en.wikipedia.org/wiki/Partition_type
	
	
	# WARNING: Include newlines.
	#currentHeaderKeySize=$(bc <<< "$currentHeaderKeySize - 2 - 3")
	#echo 'x'
	_openssl_rand-flipKey "$currentHeaderKeySize"
	#echo
	#echo 'x'
}


_generate_flipKey_header() {
	_messageNormal 'init: _generate_flipKey_header'
	
	if [[ -e "$flipKey_headerKeyFile" ]]
	then
		_sweep-flipKey "$flipKey_headerKeyFile"
		
		if [[ "$flipKey_removable" == 'false' ]]
		then
			_messagePlain_warn 'warn: flipKey_removable=false: ignore: _clean-flipKey'
		elif [[ "$flipKey_physical" == 'true' ]]
		then
			_messagePlain_warn 'warn: flipKey_physical=true: ignore: _clean-flipKey'
		else
			_clean-flipKey
		fi
	fi
	
	local currentHeaderKeySize
	currentHeaderKeySize=6000000000
	[[ "$flipKey_headerKeySize" != "" ]] && currentHeaderKeySize="$flipKey_headerKeySize"
	[[ "$1" != "" ]] && currentHeaderKeySize="$1"
	
	_messagePlain_nominal 'attempt: write: keyfile'
	_messagePlain_probe_var currentHeaderKeySize
	
	_touch-flipKey-touch-random "$flipKey_headerKeyFile"
	
	if [[ "$flipKey_headerKeyFile" != "/dev/"* ]]
	then
		chmod 600 "$flipKey_headerKeyFile"
		chown "$USER":"$USER" "$flipKey_headerKeyFile"
		_generate_keyData "$1" | pv > "$flipKey_headerKeyFile"
		
		[[ -e "$flipKey_headerKeyFile" ]] && ! [[ -s "$flipKey_headerKeyFile" ]] && _messagePlain_bad 'fail: write: empty'
		[[ "$flipKey_headerKeyFile" != "/dev/"* ]] && [[ -e "$flipKey_headerKeyFile" ]] && [[ $(cat "$flipKey_headerKeyFile" | wc -c | tr -dc '0-9') != "$currentHeaderKeySize" ]] && _messagePlain_bad 'fail: write: size'
	else
		if ! _generate_keyData "$1" | pv > "$flipKey_headerKeyFile"
		then
			sync
			_generate_keyData "$1" | pv | sudo -n tee "$flipKey_headerKeyFile" > /dev/null
			sync
		fi
		sync
		if ! _generate_keyData 320000 | pv > "$flipKey_headerKeyFile"
		then
			sync
			if ! _generate_keyData 320000 | pv | sudo -n tee "$flipKey_headerKeyFile" > /dev/null
			then
				sync
				_messageError 'FAIL: write'
				sleep 2
				_stop 1
				return 1
			fi
		fi
		sync
		if ! _generate_keyData 3500000 | pv > "$flipKey_headerKeyFile"
		then
			sync
			if ! _generate_keyData 3500000 | pv | sudo -n tee "$flipKey_headerKeyFile" > /dev/null
			then
				sync
				#_messageError 'FAIL: write'
				sleep 2
				#_stop 1
				#return 1
			fi
		fi
	fi
	sync
	
	! [[ -e "$flipKey_headerKeyFile" ]] && _messagePlain_bad 'fail: write'
	
	echo 'attempt: touch: keyfile'
	_touch-flipKey "$flipKey_headerKeyFile"
	
	
	[[ -e "$flipKey_headerKeyFile" ]] && [[ -s "$flipKey_headerKeyFile" ]] && [[ "$flipKey_headerKeyFile" != "/dev/"* ]] && [[ $(cat "$flipKey_headerKeyFile" | wc -c | tr -dc '0-9') == "$currentHeaderKeySize" ]] && _messagePlain_good 'good: write'
	return
}

_touch-flipKey-trivial_cygwin_procedure() {
	_touch-flipKey-touch-loop "$1" 1 2 1 1
}
_touch-flipKey-trivial() {
	if [[ "$flipKey_packetDisc_exhaustible" == "true" ]]
	then
		[[ -e "$flipKey_mount" ]] && _touch-flipKey-touch-loop "$flipKey_mount" 1 1 2 1
		[[ -e "$flipKey_container" ]] && _touch-flipKey-touch-loop "$flipKey_container" 1 1 2 1
		[[ -e "$flipKey_headerKeyFile" ]] && _touch-flipKey-touch-loop "$flipKey_headerKeyFile" 1 1 2 1 && return 0
		return 1
	fi
	
	if _if_cygwin
	then
		#[[ -e "$flipKey_mount" ]] && _touch-flipKey-trivial_cygwin_procedure "$flipKey_mount"
		[[ -e "$flipKey_container" ]] && _touch-flipKey-trivial_cygwin_procedure "$flipKey_container"
		[[ -e "$flipKey_headerKeyFile" ]] && _touch-flipKey-trivial_cygwin_procedure "$flipKey_headerKeyFile" && return 0
	else
		[[ -e "$flipKey_mount" ]] && _touch-flipKey-touch-loop "$flipKey_mount" 2 15 3 5
		[[ -e "$flipKey_container" ]] && _touch-flipKey-touch-loop "$flipKey_container" 2 15 3 5
		[[ -e "$flipKey_headerKeyFile" ]] && _touch-flipKey-touch-loop "$flipKey_headerKeyFile" 2 15 3 5 && return 0
	fi
	return 1
}


_touch-flipKey-touch-numeric() {
	touch -d "+$(($(_extractEntropy-flipKey-number)%"$2")) day +$(($(_extractEntropy-flipKey-number)%24)) hour +$(($(_extractEntropy-flipKey-number)%60)) minute +$(($(_extractEntropy-flipKey-number)%60)) second" "$1"
	touch -a -d "+$(($(_extractEntropy-flipKey-number)%"$2")) day +$(($(_extractEntropy-flipKey-number)%24)) hour +$(($(_extractEntropy-flipKey-number)%60)) minute +$(($(_extractEntropy-flipKey-number)%60)) second" "$1"
	sync
}
_touch-flipKey-touch-random() {
	touch -t "$(date +%C%y%m%d%H%M.%S -d @$(echo $(($(_extractEntropy-flipKey-number)%32767))" * "$(($(_extractEntropy-flipKey-number)%32767))" * "$(($(_extractEntropy-flipKey-number)%32767))" / 1000" | bc -l))" "$1"
	touch -a -t "$(date +%C%y%m%d%H%M.%S -d @$(echo $(($(_extractEntropy-flipKey-number)%32767))" * "$(($(_extractEntropy-flipKey-number)%32767))" * "$(($(_extractEntropy-flipKey-number)%32767))" / 1000" | bc -l))" "$1"
	sync
}
_touch-flipKey-touch-loop() {
	if [[ "$1" == "/dev/"* ]]
	then
		_touch-flipKey-touch-numeric "$1" 1
		_touch-flipKey-touch-random "$1"
		return
	fi
	
	local currentIteration
	for (( currentIteration=1; currentIteration<="$2"; currentIteration++ )) ; do
		_touch-flipKey-touch-numeric "$1" 1
	done
	for (( currentIteration=1; currentIteration<="$3"; currentIteration++ )) ; do
		_touch-flipKey-touch-numeric "$1" 365
	done
	for (( currentIteration=1; currentIteration<="$4"; currentIteration++ )) ; do
		_touch-flipKey-touch-numeric "$1" 3650
	done
	for (( currentIteration=1; currentIteration<="$5"; currentIteration++ )) ; do
		_touch-flipKey-touch-random "$1"
	done
	return 0
}
_touch-flipKey() {
	mkdir -p "$flipKey_mount"
	
	if [[ "$flipKey_packetDisc_exhaustible" == "true" ]]
	then
		[[ -e "$flipKey_mount" ]] && _touch-flipKey-touch-loop "$flipKey_mount" 1 1 2 1
		[[ -e "$flipKey_container" ]] && _touch-flipKey-touch-loop "$flipKey_container" 1 1 2 1
		_touch-flipKey-touch-loop "$1" 1 1 2 1
		return 0
	fi
	
	if _if_cygwin
	then
		[[ -e "$flipKey_container" ]] && _touch-flipKey-trivial_cygwin_procedure "$flipKey_container" 1 2 1 1
		_touch-flipKey-touch-loop "$1" 2 15 3 5
		return 0
	fi
	
	[[ -e "$flipKey_mount" ]] && _touch-flipKey-touch-loop "$flipKey_mount" 1 2 1 1
	[[ -e "$flipKey_container" ]] && _touch-flipKey-touch-loop "$flipKey_mount" 1 2 1 1
	_touch-flipKey-touch-loop "$1" 2 180 30 60
	return 0
}


_sweep_branch-flipKey() {
	_if_cygwin && ! _discoverResource-cygwinNative-ProgramFiles 'sdelete' 'sdelete' false
	
	if ! [[ -e "$1" ]]
	then
		return 1
	fi
	
	local currentIteration
	
	if [[ "$flipKey_packetDisc_exhaustible" == "true" ]]
	then
		for currentIteration in {1..2}
		do
			if ! dd if=/dev/urandom of="$flipKey_headerKeyFile" bs=256K count=4 oflag=direct conv=fdatasync status=progress
			then
				sudo -n dd if=/dev/urandom of="$flipKey_headerKeyFile" bs=256K count=4 oflag=direct conv=fdatasync status=progress
			fi
			sync
		done
		dd if=/dev/urandom of="$flipKey_headerKeyFile" bs=256K oflag=direct conv=fdatasync status=progress
		sudo -n dd if=/dev/urandom of="$flipKey_headerKeyFile" bs=256K oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$flipKey_headerKeyFile" bs=256K count=2 oflag=direct conv=fdatasync status=progress
		sync
		
		return 0
	fi
	
	
	if [[ "$flipKey_headerKeyFile" == "/dev/"* ]]
	then
		for currentIteration in {1..12}
		do
			if ! dd if=/dev/urandom of="$flipKey_headerKeyFile" bs=256K count=4 oflag=direct conv=fdatasync status=progress
			then
				sudo -n dd if=/dev/urandom of="$flipKey_headerKeyFile" bs=256K count=4 oflag=direct conv=fdatasync status=progress
			fi
			sync
		done
		dd if=/dev/urandom of="$flipKey_headerKeyFile" bs=256K oflag=direct conv=fdatasync status=progress
		sudo -n dd if=/dev/urandom of="$flipKey_headerKeyFile" bs=256K oflag=direct conv=fdatasync status=progress
		sync
	fi
	
	if [[ "$flipKey_headerKeyFile" == "/dev/"* ]]
	then
		sudo -n blkdiscard "$flipKey_headerKeyFile"
		
		#sudo -n mkfs.ext2 -F -E discard "$flipKey_headerKeyFile"
		
		sudo -n dd if=/dev/urandom of="$flipKey_headerKeyFile" bs=256K oflag=direct conv=fdatasync status=progress
		sync
	fi
	
	if [[ "$flipKey_headerKeyFile" == "/dev/"* ]]
	then
		for currentIteration in {1..20}
		do
			if ! dd if=/dev/urandom of="$flipKey_headerKeyFile" bs=256K count=4 oflag=direct conv=fdatasync status=progress
			then
				sudo -n dd if=/dev/urandom of="$flipKey_headerKeyFile" bs=256K count=4 oflag=direct conv=fdatasync status=progress
			fi
			sync
		done
		dd if=/dev/urandom of="$flipKey_headerKeyFile" bs=256K oflag=direct conv=fdatasync status=progress
		sudo -n dd if=/dev/urandom of="$flipKey_headerKeyFile" bs=256K oflag=direct conv=fdatasync status=progress
		sync
	fi
	
	if man wipe 2> /dev/null | grep 'Berke Durak' > /dev/null && man wipe 2> /dev/null | grep '\-Q <number\-of\-passes>' > /dev/null && man wipe 2> /dev/null | grep '\-s (silent mode)' > /dev/null
	then
		if [[ "$flipKey_headerKeyFile" == "/dev/"* ]]
		then
			if ! wipe -l 36K -k -F -f -D "$@"
			then
				sudo -n wipe -l 36K -k -F -f -D "$@"
			fi
			sync
			if ! wipe -l 1440K -k -F -f -D "$@"
			then
				sudo -n wipe -l 1440K -k -F -f -D "$@"
			fi
			sync
		fi
		
		
		# Fully wiping large (multi-gigabyte) keyfiles from non-physical storage is pointless - erasing free space is already necessary.
		echo '_timeout 180 (1 of 2)'
		#if ! false
		if ! _timeout 180 wipe -k -F -q -f -D "$@"
		then
			echo '_timeout 180 (2 of 2)'
			sudo -n "$scriptAbsoluteLocation" _timeout 180 wipe -k -F -q -f -D "$@"
		fi
		
		sync
		
		if [[ "$flipKey_headerKeyFile" == "/dev/"* ]]
		then
			if ! dd if=/dev/urandom of="$flipKey_headerKeyFile" bs=256K count=4 oflag=direct conv=fdatasync status=progress && ! dd if=/dev/urandom of="$flipKey_headerKeyFile" bs=256K count=4 oflag=direct conv=fdatasync status=progress
			then
				if ! sudo -n dd if=/dev/urandom of="$flipKey_headerKeyFile" bs=256K count=1 oflag=direct conv=fdatasync status=progress
				then
					sync
					return 1
				fi
			fi
		fi
		sync
		
		return 0
	fi
	
	if _if_cygwin && type 'sdelete' > /dev/null 2>&1
	then
		local currentCygwinMSWpath
		currentCygwinMSWpath=$(cygpath --windows "$1")
		shift
		sdelete -p 2 -r -nobanner "$currentCygwinMSWpath"
		return 0
	fi
	
	
	return 1
	
}

_sweep-flipKey() {
	_messagePlain_nominal 'init: _sweep-flipKey'
	_messagePlain_probe 'sweep: '"$1"
	! [[ -e "$1" ]] && _messagePlain_good 'good: sweep: absent' && return 0
	#! [[ -e "$1" ]] && return 0
	
	if [[ "$flipKey_packetDisc_exhaustible" == "true" ]]
	then
		_touch-flipKey-trivial
	else
		_touch-flipKey-trivial
		_touch-flipKey-trivial
	fi
	
	if _sweep_branch-flipKey "$@"
	then
		[[ "$flipKey_headerKeyFile" == "/dev/"* ]] && _messagePlain_good 'good: sweep' && return 0
	fi
	
	[[ -e "$1" ]] && _messagePlain_bad 'fail: sweep (unless timeout)'
	! [[ -e "$1" ]] && _messagePlain_good 'good: sweep'
	
	[[ -e "$1" ]] && rm -f "$@"
	
	! [[ -e "$1" ]] && return 0
	return 1
}

_clean-flipKey() {
	_messagePlain_nominal 'init: _clean-flipKey'
	
	[[ "$flipKey_tokenID" != "" ]] && [[ "$flipKey_token_keyID" != "" ]] && currentFillPath="$scriptLocal"/token/fill
	
	[[ -e "$currentFillPath" ]] && _messagePlain_warn 'warn: clean: previous: fill'
	
	echo _
	if [[ "$flipKey_physical" != 'true' ]]
	then
		_messagePlain_probe 'cat /dev/zero | pv > "$currentFillPath"'
		cat /dev/zero | pv > "$currentFillPath"
		sync
	else
		_messagePlain_probe '_openssl_rand-flipKey | pv > "$currentFillPath"'
		_openssl_rand-flipKey | pv > "$currentFillPath"
		sync
	fi
	! [[ -e "$currentFillPath" ]] && _messagePlain_bad 'fail: clean'
	[[ -e "$currentFillPath" ]] && ! [[ -s "$currentFillPath" ]] && _messagePlain_bad 'fail: clean: empty'
	rm -f "$currentFillPath"
	rm -f "$currentFillPath" > /dev/null 2>&1
	rm -f "$currentFillPath" > /dev/null 2>&1
	[[ -e "$currentFillPath" ]] && _messagePlain_bad 'fail: clean'
	
	echo __
	# ATTENTION: 'cipher /w:C' and similar may require 'privileges'
	_messagePlain_probe '_openssl_rand-flipKey | pv > "$currentFillPath"'
	_openssl_rand-flipKey | pv > "$currentFillPath"
	sync
	! [[ -e "$currentFillPath" ]] && _messagePlain_bad 'fail: clean'
	[[ -e "$currentFillPath" ]] && ! [[ -s "$currentFillPath" ]] && _messagePlain_bad 'fail: clean: empty'
	rm -f "$currentFillPath"
	rm -f "$currentFillPath" > /dev/null 2>&1
	rm -f "$currentFillPath" > /dev/null 2>&1
	[[ -e "$currentFillPath" ]] && _messagePlain_bad 'fail: clean'
	
	echo ___
	_messagePlain_probe 'cat /dev/zero | pv > "$currentFillPath"'
	cat /dev/zero | pv > "$currentFillPath"
	sync
	! [[ -e "$currentFillPath" ]] && _messagePlain_bad 'fail: clean'
	[[ -e "$currentFillPath" ]] && ! [[ -s "$currentFillPath" ]] && _messagePlain_bad 'fail: clean: empty'
	rm -f "$currentFillPath"
	rm -f "$currentFillPath" > /dev/null 2>&1
	rm -f "$currentFillPath" > /dev/null 2>&1
	[[ -e "$currentFillPath" ]] && _messagePlain_bad 'fail: clean'
	
	sync
	! [[ -e "$currentFillPath" ]] && _messagePlain_good 'good: clean' && return 0
}




# https://en.wikipedia.org/wiki/CryptGenRandom
# https://pynative.com/cryptographically-secure-random-data-in-python/
# https://stackoverflow.com/questions/3854692/generate-password-in-python
_extractEntropy-flipKey-key() {
	if ! _if_cygwin
	then
		cat /dev/urandom 2> /dev/null | base64 2> /dev/null | tr -dc 'a-zA-Z0-9' 2> /dev/null | head -c "48" 2> /dev/null
	fi
	
	# https://stackoverflow.com/questions/3854692/generate-password-in-python
	python3 <<< '
import string
import os
from os import urandom
chars = string.ascii_letters + string.digits
print("".join(chars[c % len(chars)] for c in urandom(48)))
' | tr -dc 'a-zA-Z0-9'
	
	
	# https://stackoverflow.com/questions/3854692/generate-password-in-python
	python3 <<< '
import secrets
import string
alphabet = string.ascii_letters + string.digits
print("".join(secrets.choice(alphabet) for i in range(48)))
' | tr -dc 'a-zA-Z0-9'
	
	if ! _if_cygwin
	then
		cat /dev/urandom 2> /dev/null | base64 2> /dev/null | tr -dc 'a-zA-Z0-9' 2> /dev/null | head -c "48" 2> /dev/null
	fi
}

_extractEntropy-flipKey-number-raw() {
	if ! _if_cygwin
	then
		cat /dev/urandom 2> /dev/null | base64 2> /dev/null | tr -dc '0-9' 2> /dev/null | head -c "8" | sed 's/^0*//g' 2> /dev/null
	else
		python3 <<< '
import secrets
import string
alphabet = string.digits
print("".join(secrets.choice(alphabet) for i in range(8)))
' | tr -dc '0-9' | sed 's/^0*//g'
	fi
}

_extractEntropy-flipKey-number() {
	echo $(( $(_extractEntropy-flipKey-number-raw) %32767 ))
}


_openssl_rand-flipKey-openssl() {
	if [[ "$1" != "" ]]
	then
		openssl enc -e -aes-256-cbc -pass stdin -nosalt -md sha1 -in /dev/zero 2>/dev/null | head -c "$1"
		return
	else
		openssl enc -e -aes-256-cbc -pass stdin -nosalt -md sha1 -in /dev/zero 2>/dev/null
	fi
}

#./ubiquitous_bash.sh _openssl_rand-flipKey 10000000000 | pv > /dev/null
_openssl_rand-flipKey() {
	_extractEntropy-flipKey-key | xxd -p | tr -d '\n' | _openssl_rand-flipKey-openssl "$@"
}




_test_rand-flipKey() {
	_getDep python3
	_getDep openssl
	
	_getDep pv
}


_vector_rand-flipKey() {
	! _if_cygwin && [[ $(_extractEntropy-flipKey-key | wc -c) != 192 ]] && _messageFAIL && _stop 1
	_if_cygwin && [[ $(_extractEntropy-flipKey-key | wc -c) != 96 ]] && _messageFAIL && _stop 1
	
	[[ $(_openssl_rand-flipKey 1000000 | wc -c) != "1000000" ]] && _messageFAIL && _stop 1
	
	return 0
}



_vector_openssl-flipKey-pattern-echo() {
	echo $( {
		echo "$1"
		local currentIteration
		for (( currentIteration=1; currentIteration<="$4"; currentIteration++ )) ; do
			echo "00"
		done
		echo "$2"
		for (( currentIteration=1; currentIteration<="$5"; currentIteration++ )) ; do
			echo "00"
		done
		echo "$3"
	} | xxd -p | tr -d '\n' | _openssl_rand-flipKey-openssl "8" | xxd -p | tr -d '\n' )
	return 0
}

_vector_openssl-flipKey-pattern-compare() {
	[[ $( _vector_openssl-flipKey-pattern-echo "$1" "$2" "$3" "$4" "$5" ) != "$6" ]] && _messageFAIL && _stop 1
	return 0
}



_vector_openssl-flipKey() {
	#echo -n 555555 | xxd -r -p | xxd -b
	#echo -n aaaaaa | xxd -r -p | xxd -b
	
	#echo -n 000001 | xxd -r -p | xxd -b
	#echo -n 800000 | xxd -r -p | xxd -b
	
	[[ $( {
		echo 80
		local currentIteration
		for (( currentIteration=1; currentIteration<="46"; currentIteration++ )) ; do
			echo 00
		done
		echo 01
	} | xxd -r -p | xxd -p | tr -d '\n' ) != '800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001' ]] && _messageFAIL && _stop 1
	
	
	
	_vector_openssl-flipKey-pattern-compare 00 00 00 22 23 ef1dc87623404fb7
	
	_vector_openssl-flipKey-pattern-compare 80 00 01 22 23 fb6f7078a24eb674
	_vector_openssl-flipKey-pattern-compare 80 00 00 22 23 6c7baeac93768e31
	_vector_openssl-flipKey-pattern-compare 00 00 01 22 23 2ff83260f2dc3801
	
	_vector_openssl-flipKey-pattern-compare 80 01 01 22 23 bc36feca6d83aeb1
	_vector_openssl-flipKey-pattern-compare 80 80 01 22 23 3b7acb2ea9d3eed0
	
	
	_vector_openssl-flipKey-pattern-compare 55 55 55 22 23 c7368714e1ffb45d
	_vector_openssl-flipKey-pattern-compare aa 55 55 22 23 4de310a8806d5e80
	_vector_openssl-flipKey-pattern-compare 55 55 aa 22 23 536616a4786099b3
	_vector_openssl-flipKey-pattern-compare 55 aa 55 22 23 8c5d906ff4019895
	
	_vector_openssl-flipKey-pattern-compare aa aa aa 22 23 f3afd749fcc8ba08
	_vector_openssl-flipKey-pattern-compare 55 aa aa 22 23 f8959fbefe803f5a
	_vector_openssl-flipKey-pattern-compare aa aa 55 22 23 96c1dcd2158c1107
	_vector_openssl-flipKey-pattern-compare 55 aa 55 22 23 8c5d906ff4019895
	
	
	
	_vector_openssl-flipKey-pattern-compare 55 55 55 47 48 5f1398f8baaaf229
	_vector_openssl-flipKey-pattern-compare aa 55 55 47 48 7a250030092cc74b
	_vector_openssl-flipKey-pattern-compare 55 55 aa 47 48 0dda0c3afc3fbbf8
	_vector_openssl-flipKey-pattern-compare 55 aa 55 47 48 427bc7bbc208bf2d
	
	
	
	return 0
}





