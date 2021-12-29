
_pattern_data() {
	echo -n "$1" | openssl enc -e -aes-256-cbc -pass stdin -nosalt -md sha1 -in /dev/zero 2>/dev/null | pv | head -c "$2"
}

_pattern_checksum() {
	_pattern_data "$1" "$2" | env CMD_ENV=xpg4 cksum | cut -f1 -d\  | tr -dc '0-9'
}

_pattern_write() {
	local currentPatternChecksum
	currentPatternChecksum=$(_pattern_checksum "$1" "$2")
	if ! _pattern_data "$1" "$2" > "$3"/"$currentPatternChecksum".fll
	then
		rm -f "$3"/"$currentPatternChecksum".fll
		_messagePlain_bad 'fail: _pattern_write'
		return 1
	fi
	#env CMD_ENV=xpg4 cksum "$3"/"$currentPatternChecksum".fll
	_messagePlain_good 'good: _pattern_write: '"$1"': '"$3"/"$currentPatternChecksum".fll
	return 0
}




#./ubiquitous_bash.sh _pattern_define
#./ubiquitous_bash.sh _pattern_define . bs=10000000 count=2 ; ./ubiquitous_bash _pattern_rm
# $1 == patternOutDirectory ( "." , "" , etc )
# $2 == fileSize ( 10000000 default - 10MB )
# $3 == count ( indefinite default )
_pattern_define() {
	_messagePlain_nominal 'init: _pattern_define'
	local currentPatternOutDirectory
	currentPatternOutDirectory="$PWD"
	[[ "$1" != "" ]] && currentPatternOutDirectory="$1"
	
	local currentFileSize
	currentFileSize=10000000
	[[ "$2" != "" ]] && currentFileSize=$(_safeEcho "$2" | tr -dc '0-9')
	
	local currentCount
	currentCount=2400000
	#currentCount=100000000
	#currentCount=900000000
	[[ "$3" != "" ]] && currentCount=$(_safeEcho "$3" | tr -dc '0-9')
	
	local currentOffset
	currentOffset=0
	local randomOffset
	while [[ "$currentOffset" -lt "$currentCount" ]]
	do
		# WARNING: Not cryptographically random.
		#let "randomOffset = $RANDOM % 32768"
		randomOffset=$RANDOM$RANDOM
		
		#_messagePlain_probe_var currentOffset
		#_messagePlain_probe_var randomOffset
		
		! _pattern_write "$currentOffset" "$currentFileSize" "$currentPatternOutDirectory" && return 1
		#! _pattern_write "$randomOffset" "$currentFileSize" "$currentPatternOutDirectory" && return 1
		
		sync
		
		let currentOffset="$currentOffset + 1"
	done
	
	
	return 0
}



_pattern_verify_cksum() {
	#cat "$1"/*.fll | pv | env CMD_ENV=xpg4 cksum
	env CMD_ENV=xpg4 cksum "$1"/*.fll
}

#./ubiquitous_bash.sh _pattern_define . bs=10000000 count=2 ; ./ubiquitous_bash.sh _pattern_verify ; ./ubiquitous_bash.sh _pattern_rm
_pattern_verify() {
	_messagePlain_nominal 'init: _pattern_verify'
	local currentPatternOutDirectory
	currentPatternOutDirectory="."
	[[ "$1" != "" ]] && currentPatternOutDirectory="$1"
	
	
	local currentLine
	local currentFail
	currentFail='false'
	while read -r currentLine
	do
		if [[ $(_safeEcho "$currentLine" | cut -f1 -d\  | tr -dc '0-9') != $(_safeEcho "$currentLine" | cut -f3- -d\  | sed 's/\/.*\///g' | tr -dc '0-9') ]]
		then
			export currentFail='true'
			echo "$currentLine"
		fi
	done <<<$(_pattern_verify_cksum "$currentPatternOutDirectory")
	
	
	if [[ "$currentFail" == 'true' ]]
	then
		_messagePlain_bad 'fail: mismatch'
		return 1
	else
		_messagePlain_good 'good: pass'
		return 0
	fi
	return 0
}

_pattern_rm() {
	_messagePlain_nominal 'init: _pattern_rm'
	local currentPatternOutDirectory
	currentPatternOutDirectory="$PWD"
	[[ "$1" != "" ]] && currentPatternOutDirectory="$1"
	
	rm "$currentPatternOutDirectory"/*.fll
}


_test_pattern() {
	_getDep openssl
}






