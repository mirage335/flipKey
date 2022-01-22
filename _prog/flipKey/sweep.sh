

_sweep_branch() {
	_if_cygwin && ! _discoverResource-cygwinNative-ProgramFiles 'sdelete' 'sdelete' false
	
	if ! [[ -e "$1" ]]
	then
		return 1
	fi
	
	if [[ -d "$1" ]]
	then
		return 1
	fi
	
	if man wipe 2> /dev/null | grep 'Berke Durak' > /dev/null && man wipe 2> /dev/null | grep '\-Q <number\-of\-passes>' > /dev/null && man wipe 2> /dev/null | grep '\-s (silent mode)' > /dev/null
	then
		wipe -q -f -s "$@" > /dev/null
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

_sweep() {
	[[ "$1" == "" ]] && return 1
	[[ -d "$1" ]] && return 1
	
	_sweep_branch "$@"
	
	[[ -e "$1" ]] && rm -f "$@"
	
	! [[ -e "$1" ]] && return 0
	return 1
}

_clean() {
	local currentFillPath
	currentFillPath="$scriptLocal"/fill
	[[ "$flipKey_fillPath" != "" ]] && currentFillPath="$flipKey_fillPath"
	[[ "$1" != "" ]] && currentFillPath="$1"
	
	cat /dev/zero | pv > "$currentFillPath"
	rm -f "$currentFillPath"
	rm -f "$currentFillPath" > /dev/null 2>&1
	rm -f "$currentFillPath" > /dev/null 2>&1
	
	# ATTENTION: 'cipher /w:C' and similar may require 'privileges'
	_openssl_rand-flipKey | pv > "$currentFillPath"
	rm -f "$currentFillPath"
	rm -f "$currentFillPath" > /dev/null 2>&1
	rm -f "$currentFillPath" > /dev/null 2>&1
	
	cat /dev/zero | pv > "$currentFillPath"
	rm -f "$currentFillPath"
	rm -f "$currentFillPath" > /dev/null 2>&1
	rm -f "$currentFillPath" > /dev/null 2>&1
}


_test_sweep() {
	if ! _if_cygwin
	then
		_wantGetDep 'wipe'
		if man wipe 2> /dev/null | grep 'Berke Durak' > /dev/null && man wipe 2> /dev/null | grep '\-Q <number\-of\-passes>' > /dev/null && man wipe 2> /dev/null | grep '\-s (silent mode)' > /dev/null
		then
			true
		else
			echo 'warn: missing: wipe (Berke Durak)'
		fi
	fi
	
	
	if _if_cygwin
	then
		# WARNING: Expect 'sdelete' to return '0' (ie. 'true') although the file to delete does not exist. Mostly called only to provoke the 'first run' popup box.
		if ( ! _discoverResource-cygwinNative-ProgramFiles 'sdelete' 'sdelete' false || ! sdelete -nobanner C:/"$ubiquitousBashID"_"$ub_setScriptChecksum_contents" > /dev/null 2>&1 )
		then
			_messagePlain_request "request: install: 'Windows Systernals SDelete' "
		fi
	fi
	
	
	return 0
}


