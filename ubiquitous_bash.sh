#!/usr/bin/env bash

if [[ "$ub_setScriptChecksum" != "" ]]
then
	export ub_setScriptChecksum=
fi

_ub_cksum_special_derivativeScripts_header() {
	local currentFile_cksum
	if [[ "$1" == "" ]]
	then
		currentFile_cksum="$0"
	else
		currentFile_cksum="$1"
	fi
	
	head -n 30 "$currentFile_cksum" | env CMD_ENV=xpg4 cksum | cut -f1 -d\  | tr -dc '0-9'
}
_ub_cksum_special_derivativeScripts_contents() {
	local currentFile_cksum
	if [[ "$1" == "" ]]
	then
		currentFile_cksum="$0"
	else
		currentFile_cksum="$1"
	fi
	
	tail -n +45 "$currentFile_cksum" | env CMD_ENV=xpg4 cksum | cut -f1 -d\  | tr -dc '0-9'
}
##### CHECKSUM BOUNDARY - 30 lines

#export ub_setScriptChecksum_disable='true'
( [[ -e "$0".nck ]] || [[ "${BASH_SOURCE[0]}" != "${0}" ]] || [[ "$1" == '--profile' ]] || [[ "$1" == '--script' ]] || [[ "$1" == '--call' ]] || [[ "$1" == '--return' ]] || [[ "$1" == '--devenv' ]] || [[ "$1" == '--shell' ]] || [[ "$1" == '--bypass' ]] || [[ "$1" == '--parent' ]] || [[ "$1" == '--embed' ]] || [[ "$1" == '--compressed' ]] || [[ "$0" == "/bin/bash" ]] || [[ "$0" == "-bash" ]] || [[ "$0" == "/usr/bin/bash" ]] || [[ "$0" == "bash" ]] ) && export ub_setScriptChecksum_disable='true'
export ub_setScriptChecksum_header='1891409836'
export ub_setScriptChecksum_contents='2699094298'

# CAUTION: Symlinks may cause problems. Disable this test for such cases if necessary.
# WARNING: Performance may be crucial here.
#[[ -e "$0" ]] && ! [[ -h "$0" ]] && [[ "$ub_setScriptChecksum" != "" ]]
if [[ -e "$0" ]] && [[ "$ub_setScriptChecksum_header" != "" ]] && [[ "$ub_setScriptChecksum_contents" != "" ]] && [[ "$ub_setScriptChecksum_disable" != 'true' ]]
then
	[[ $(_ub_cksum_special_derivativeScripts_header) != "$ub_setScriptChecksum_header" ]] && exit 1
	[[ $(_ub_cksum_special_derivativeScripts_contents) != "$ub_setScriptChecksum_contents" ]] && exit 1
fi
##### CHECKSUM BOUNDARY - 45 lines

_ub_cksum_special_derivativeScripts_write() {
	local current_ub_setScriptChecksum_header
	local current_ub_setScriptChecksum_contents

	current_ub_setScriptChecksum_header=$(_ub_cksum_special_derivativeScripts_header "$1")
	current_ub_setScriptChecksum_contents=$(_ub_cksum_special_derivativeScripts_contents "$1")

	sed -i 's/'#'#'###uk4uPhB663kVcygT0q-UbiquitousBash-ScriptSelfModify-SetScriptChecksumHeader-UbiquitousBash-uk4uPhB663kVcygT0q#####'/'"$current_ub_setScriptChecksum_header"'/' "$1"
	sed -i 's/'#'#'###uk4uPhB663kVcygT0q-UbiquitousBash-ScriptSelfModify-SetScriptChecksumContents-UbiquitousBash-uk4uPhB663kVcygT0q#####'/'"$current_ub_setScriptChecksum_contents"'/' "$1"
}


#Universal debugging filesystem.
_user_log-ub() {
	# DANGER Do NOT create automatically, or reference any existing directory!
	! [[ -d "$HOME"/.ubcore/userlog ]] && cat - > /dev/null 2>&1 && return 0
	
	#Terminal session may be used - the sessionid may be set through .bashrc/.ubcorerc .
	if [[ "$sessionid" != "" ]]
	then
		cat - >> "$HOME"/.ubcore/userlog/u-"$sessionid".log
		return 0
	fi
	cat - >> "$HOME"/.ubcore/userlog/u-undef.log
	
	return 0
}

#Cyan. Harmless status messages.
_messagePlain_nominal() {
	echo -e -n '\E[0;36m '
	echo -n "$@"
	echo -e -n ' \E[0m'
	echo
	return 0
}

#Blue. Diagnostic instrumentation.
_messagePlain_probe() {
	echo -e -n '\E[0;34m '
	echo -n "$@"
	echo -e -n ' \E[0m'
	echo
	return 0
}

#Blue. Diagnostic instrumentation.
_messagePlain_probe_expr() {
	echo -e -n '\E[0;34m '
	echo -e -n "$@"
	echo -e -n ' \E[0m'
	echo
	return 0
}

#Blue. Diagnostic instrumentation.
_messagePlain_probe_var() {
	echo -e -n '\E[0;34m '
	
	echo -n "$1"'= '
	
	eval echo -e -n \$"$1"
	
	echo -e -n ' \E[0m'
	echo
	return 0
}
_messageVar() {
	_messagePlain_probe_var "$@"
}

#Green. Working as expected.
_messagePlain_good() {
	echo -e -n '\E[0;32m '
	echo -n "$@"
	echo -e -n ' \E[0m'
	echo
	return 0
}

#Yellow. May or may not be a problem.
_messagePlain_warn() {
	echo -e -n '\E[1;33m '
	echo -n "$@"
	echo -e -n ' \E[0m'
	echo
	return 0
}

#Red. Will result in missing functionality, reduced performance, etc, but not necessarily program failure overall.
_messagePlain_bad() {
	echo -e -n '\E[0;31m '
	echo -n "$@"
	echo -e -n ' \E[0m'
	echo
	return 0
}



##Parameters
#"--shell", ""
#"--profile"
#"--parent", "--embed", "--return", "--devenv"
#"--call", "--script" "--bypass"
#if [[ "$ub_import" != "" ]]
#then
	#[[ "$ub_import" != "" ]] && export ub_import="" && unset ub_import
	
	#[[ "$importScriptLocation" != "" ]] && export importScriptLocation= && unset importScriptLocation
	#[[ "$importScriptFolder" != "" ]] && export importScriptFolder= && unset importScriptFolder
#fi
#[[ "$ub_import" != "" ]] && export ub_import="" && unset ub_import
#[[ "$ub_import_param" != "" ]] && export ub_import_param="" && unset ub_import_param
#[[ "$ub_import_script" != "" ]] && export ub_import_script="" && unset ub_import_script
#[[ "$ub_loginshell" != "" ]] && export ub_loginshell="" && unset ub_loginshell
ub_import=
ub_import_param=
ub_import_script=
ub_loginshell=


# ATTENTION: Apparently (Portable) Cygwin Bash interprets correctly.
[[ "${BASH_SOURCE[0]}" != "${0}" ]] && ub_import="true"

( [[ "$1" == '--profile' ]] || [[ "$1" == '--script' ]] || [[ "$1" == '--call' ]] || [[ "$1" == '--return' ]] || [[ "$1" == '--devenv' ]] || [[ "$1" == '--shell' ]] || [[ "$1" == '--bypass' ]] || [[ "$1" == '--parent' ]] || [[ "$1" == '--embed' ]] || [[ "$1" == '--compressed' ]] ) && ub_import_param="$1" && shift
( [[ "$0" == "/bin/bash" ]] || [[ "$0" == "-bash" ]] || [[ "$0" == "/usr/bin/bash" ]] || [[ "$0" == "bash" ]] ) && ub_loginshell="true"	#Importing ubiquitous bash into a login shell with "~/.bashrc" is the only known cause for "_getScriptAbsoluteLocation" to return a result such as "/bin/bash".
[[ "$ub_import" == "true" ]] && ! [[ "$ub_loginshell" == "true" ]] && ub_import_script="true"

_messagePlain_probe_expr '$0= '"$0"'\n ''$1= '"$1"'\n ''ub_import= '"$ub_import"'\n ''ub_import_param= '"$ub_import_param"'\n ''ub_import_script= '"$ub_import_script"'\n ''ub_loginshell= '"$ub_loginshell" | _user_log-ub

# DANGER Prohibited import from login shell. Use _setupUbiquitous, call from another script, or manually set importScriptLocation.
# WARNING Import from shell can be detected. Import from script cannot. Asserting that script has been imported is possible. Asserting that script has not been imported is not possible. Users may be protected from interactive mistakes. Script developers are NOT protected.
if [[ "$ub_import_param" == "--profile" ]]
then
	if ( [[ "$profileScriptLocation" == "" ]] ||  [[ "$profileScriptFolder" == "" ]] ) && _messagePlain_bad 'import: profile: missing: profileScriptLocation, missing: profileScriptFolder' | _user_log-ub
	then
		return 1 >/dev/null 2>&1
		exit 1
	fi
elif ( [[ "$ub_import_param" == "--parent" ]] || [[ "$ub_import_param" == "--embed" ]] || [[ "$ub_import_param" == "--return" ]] || [[ "$ub_import_param" == "--devenv" ]] )
then
	if ( [[ "$scriptAbsoluteLocation" == "" ]] || [[ "$scriptAbsoluteFolder" == "" ]] || [[ "$sessionid" == "" ]] ) && _messagePlain_bad 'import: parent: missing: scriptAbsoluteLocation, missing: scriptAbsoluteFolder, missing: sessionid' | _user_log-ub
	then
		return 1 >/dev/null 2>&1
		exit 1
	fi
elif [[ "$ub_import_param" == "--call" ]] || [[ "$ub_import_param" == "--script" ]] || [[ "$ub_import_param" == "--bypass" ]] || [[ "$ub_import_param" == "--shell" ]] || [[ "$ub_import_param" == "--compressed" ]] || ( [[ "$ub_import" == "true" ]] && [[ "$ub_import_param" == "" ]] )
then
	if ( [[ "$importScriptLocation" == "" ]] || [[ "$importScriptFolder" == "" ]] ) && _messagePlain_bad 'import: call: missing: importScriptLocation, missing: importScriptFolder' | _user_log-ub
	then
		return 1 >/dev/null 2>&1
		exit 1
	fi
elif [[ "$ub_import" != "true" ]]	#"--shell", ""
then
	_messagePlain_warn 'import: undetected: cannot determine if imported' | _user_log-ub
	true #no problem
else	#FAIL, implies [[ "$ub_import" == "true" ]]
	_messagePlain_bad 'import: fall: fail' | _user_log-ub
	return 1 >/dev/null 2>&1
	exit 1
fi

#Override.
# DANGER: Recursion hazard. Do not create override alias/function without checking that alternate exists.


# Workaround for very minor OS misconfiguration. Setting this variable at all may be undesirable however. Consider enabling and generating all locales with 'sudo dpkg-reconfigure locales' or similar .
#[[ "$LC_ALL" == '' ]] && export LC_ALL="en_US.UTF-8"



# WARNING: Only partially compatible.
if ! type md5sum > /dev/null 2>&1 && type md5 > /dev/null 2>&1
then
	md5sum() {
		md5 "$@"
	}
fi

# DANGER: No production use. Testing only.
# WARNING: Only partially compatible.
#if ! type md5 > /dev/null 2>&1 && type md5sum > /dev/null 2>&1
#then
#	md5() {
#		md5sum "$@"
#	}
#fi


# WARNING: DANGER: Compatibility may not be guaranteed!
if ! type unionfs-fuse > /dev/null 2>&1 && type unionfs > /dev/null 2>&1 && man unionfs | grep 'unionfs-fuse - A userspace unionfs implementation' > /dev/null 2>&1
then
	unionfs-fuse() {
		unionfs "$@"
	}
fi

if ! type qemu-arm-static > /dev/null 2>&1 && type qemu-arm > /dev/null 2>&1
then
	qemu-arm-static() {
		qemu-arm "$@"
	}
fi

if ! type qemu-armeb-static > /dev/null 2>&1 && type qemu-armeb > /dev/null 2>&1
then
	qemu-armeb-static() {
		qemu-armeb "$@"
	}
fi




# Only production use is Inter-Process Communication (IPC) loops which may be theoretically impossible to make fully deterministic under Operating Systems which do not have hard-real-time kernels and/or may serve an unlimited number of processes.
_here_header_bash_or_dash() {
	if [[ -e /bin/dash ]]
		then
		
cat << 'CZXWXcRMTo8EmM8i4d'
#!/bin/dash

CZXWXcRMTo8EmM8i4d
	
	else
	
cat << 'CZXWXcRMTo8EmM8i4d'
#!/usr/bin/env bash

CZXWXcRMTo8EmM8i4d

	fi
}



# Delay to attempt to avoid InterProcess-Communication (IPC) problems caused by typical UNIX/MSW Operating System kernel latency and/or large numbers of processes/threads.
# Widely deployed Linux compatible hardware and software is able to run with various 'preemption' 'configured'/'patched' kernels. Detecting such kernels may allow reduction of this arbitrary delay.
# CAUTION: Merely attempts to avoid a problem which may be inherently unavoidably unpredictable.
_sleep_spinlock() {
	# CAUTION: Spinlocks on the order of 8s are commonly observed with 'desktop' operating systems. Do NOT reduce this delay without thorough consideration! Theoretically, it may not be possible to determine whether the parent of a process is still running in less than spinlock time, only the existence of the parent process guarantees against PID rollover, and multiple spinlocks may occur between the necessary IPC events to determine any of the above.
	# ATTENTION: Consider setting this to the worst-case acceptable latency for a system still considered 'responsive' (ie. a number of seconds greater than that which would cause a user or other 'watchdog' to forcibly reboot the system).
	local currentWaitSpinlock
	let currentWaitSpinlock="$RANDOM"%4
	#let currentWaitSpinlock="$currentWaitSpinlock"+12
	let currentWaitSpinlock="$currentWaitSpinlock"+10
	sleep "$currentWaitSpinlock"
}


_____special_live_hibernate_rmmod_remainder-vbox_procedure() {
	local currentLine
	sudo -n lsmod | grep '^vbox.*$' | cut -f1 -d\  | while read currentLine
	do
		#echo "$currentLine"
		sudo -n rmmod "$currentLine"
	done
}

_____special_live_hibernate_rmmod_remainder-vbox() {
	local currentIterations
	currentIterations=0
	while [[ "$currentIterations" -lt 2 ]]
	do
		let currentIterations="$currentIterations + 1"
		_____special_live_hibernate_rmmod_remainder-vbox_procedure "$@" > /dev/null 2>&1
	done
	
	_____special_live_hibernate_rmmod_remainder-vbox_procedure "$@"
}

# CAUTION: Do not alow similarity of this function name to other commonly used function names . Unintended tab completion could significantly and substantially impede user , particularly if 'disk' hibernation is not properly available .
_____special_live_hibernate() {
	! _mustGetSudo && exit 1
	
	_messageNormal 'init: _____special_live_hibernate'
	
	local currentIterations
	
	_messagePlain_nominal 'attempt: swapon'
	sudo -n swapon /dev/disk/by-uuid/469457fc-293f-46ec-92da-27b5d0c36b17
	free -m
	
	_messagePlain_nominal 'detect: vboxguest'
	sudo -n lsmod | grep vboxguest > /dev/null 2>&1 && export ub_current_special_live_consider_vbox='true'
	[[ "$ub_current_special_live_consider_vbox" == 'true' ]] && _messagePlain_good 'good: detected: vboxguest'
	
	if [[ "$ub_current_special_live_consider_vbox" == 'true' ]]
	then
		_messagePlain_nominal 'attempt: terminate: VBoxService , VBoxClient'
		sudo -n pkill VBoxService
		sudo -n pkill VBoxClient
		
		pgrep ^VBox && sleep 0.1 && pgrep ^VBox && sleep 0.3 && pgrep ^VBox && sleep 1
		sudo -n pkill -KILL VBoxService
		sudo -n pkill -KILL VBoxClient
		
		
		pgrep ^VBox && sleep 0.3
		_messagePlain_nominal 'attempt: rmmod (vbox)'
		sleep 0.05
		sudo -n rmmod vboxsf
		sudo -n rmmod vboxvideo
		sudo -n rmmod vboxguest
		_____special_live_hibernate_rmmod_remainder-vbox
		
		sleep 0.02
		sudo -n rmmod vboxsf
		sudo -n rmmod vboxvideo
		sudo -n rmmod vboxguest
		_____special_live_hibernate_rmmod_remainder-vbox
	fi
	
	_messagePlain_nominal 'attempt: HIBERNATE'
	sudo -n journalctl --rotate
	sudo -n journalctl --vacuum-time=1s
	sudo -n systemctl hibernate
	
	
	# ~1.0s
	sleep 1.1
	currentIterations=0
	while [[ "$currentIterations" -lt 3 ]]
	do
		sudo -n systemctl status hibernate.target | tail -n2 | head -n1 | grep ' Reached ' > /dev/null 2>&1 && _messagePlain_probe 'Reached'
		sudo -n systemctl status hibernate.target | tail -n1 | grep ' Stopped ' > /dev/null 2>&1 && _messagePlain_probe 'Stopped'
		sudo -n systemctl status hibernate.target | grep 'inactive (dead)' > /dev/null 2>&1 && _messagePlain_probe 'inactive'
		
		
		sudo -n systemctl status hibernate.target | tail -n2 | head -n1 | grep ' Reached ' > /dev/null 2>&1 &&
		sudo -n systemctl status hibernate.target | tail -n1 | grep ' Stopped ' > /dev/null 2>&1 &&
		sudo -n systemctl status hibernate.target | grep 'inactive (dead)' > /dev/null 2>&1 &&
		break
		
		_messagePlain_good 'delay: resume'
		
		let currentIterations="$currentIterations + 1"
		sleep 0.3
	done
	
	_messagePlain_nominal 'delay: spinlock (optimistic)'
	# Expected to result in longer delay if system is not idle.
	# ~2s
	currentIterations=0
	while [[ "$currentIterations" -lt 6 ]]
	do
		let currentIterations="$currentIterations + 1"
		sleep 0.3
	done
	# 0.5s
	currentIterations=0
	while [[ "$currentIterations" -lt 5 ]]
	do
		let currentIterations="$currentIterations + 1"
		sleep 0.1
	done
	# 0.15s
	currentIterations=0
	while [[ "$currentIterations" -lt 15 ]]
	do
		let currentIterations="$currentIterations + 1"
		sleep 0.01
	done
	
	#_messagePlain_nominal 'delay: spinlock (arbitrary)'
	#sleep 1
	
	#_messagePlain_nominal 'delay: spinlock (pessimistic)'
	#_sleep_spinlock
	
	
	if [[ "$ub_current_special_live_consider_vbox" == 'true' ]]
	then
		_messagePlain_nominal 'attempt: modprobe (vbox)'
		sudo -n modprobe vboxsf
		sudo -n modprobe vboxvideo
		sudo -n modprobe vboxguest
		
		
		sleep 0.1
		_messagePlain_nominal 'attempt: VBoxService'
		sudo -n VBoxService --pidfile /var/run/vboxadd-service.sh
		
		# 0.3s
		currentIterations=0
		while [[ "$currentIterations" -lt 3 ]]
		do
			let currentIterations="$currentIterations + 1"
			sleep 0.1
		done
		_messagePlain_nominal 'attempt: VBoxClient'
		#sudo -n VBoxClient --vmsvga
		#sudo -n VBoxClient --seamless
		#sudo -n VBoxClient --draganddrop
		#sudo -n VBoxClient --clipboard
		sudo -n VBoxClient-all
	fi
	
	disown -a -h -r
	disown -a -r
	
	_messageNormal 'done: _____special_live_hibernate'
	return 0
}

_____special_live_bulk_rw() {
	! _mustGetSudo && exit 1
	_messageNormal 'init: _____special_live_bulk_rw'
	
	sudo -n mkdir -p /mnt/bulk
	_messagePlain_nominal 'detect: mount: bulk'
	if ! mountpoint /mnt/bulk
	then
		_messagePlain_nominal 'mount: rw: bulk'
		sudo -n mount -o rw /dev/disk/by-uuid/f1edb7fb-13b1-4c97-91d2-baf50e6d65d8 /mnt/bulk
	fi
	
	! mountpoint /mnt/bulk && _messagePlain_bad 'fail: detect: mount: bulk' && exit 1
	
	_messagePlain_nominal 'remount: rw: bulk'
	sudo -n mount -o remount,rw /mnt/bulk
	
	_messageNormal 'done: _____special_live_bulk_rw'
	return 0
}

# No production use. Not expected to be desirable. Any readonly files could be added, compressed, to the 'live' 'root' .
_____special_live_bulk_ro() {
	! _mustGetSudo && exit 1
	_messageNormal 'init: _____special_live_bulk_ro'
	
	sudo -n mkdir -p /mnt/bulk
	_messagePlain_nominal 'detect: mount: bulk'
	if ! mountpoint /mnt/bulk
	then
		_messagePlain_nominal 'mount: ro: bulk'
		sudo -n mount -o ro /dev/disk/by-uuid/f1edb7fb-13b1-4c97-91d2-baf50e6d65d8 /mnt/bulk
	fi
	
	! mountpoint /mnt/bulk && _messagePlain_bad 'fail: detect: mount: bulk' && exit 1
	
	_messagePlain_nominal 'remount: ro: bulk'
	sudo -n mount -o remount,ro /mnt/bulk
	
	_messageNormal 'done: _____special_live_bulk_ro'
	return 0
}


# DANGER: Simultaneous use of any 'rw' mounted filesystem with any 'restored' hibernation file/partition is expected to result in extreme filesystem corruption! Take extra precautions to avoid this mistake!
# CAUTION: Do not alow similarity of this function name to other commonly used function names . Unintended tab completion could significantly and substantially impede user.
_____special_live_dent_backup() {
	! _mustGetSudo && exit 1
	_messageNormal 'init: _____special_live_dent_backup'
	
	_messagePlain_nominal 'attempt: mount: dent'
	sudo -n mkdir -p /mnt/dent
	! mountpoint /mnt/dent && sudo -n mount -o ro /dev/disk/by-uuid/d82e3d89-3156-4484-bde2-ccc534ca440b /mnt/dent
	! mountpoint /mnt/dent && exit 1
	
	sudo -n mount -o remount,rw /mnt/dent
	
	_messagePlain_nominal 'attempt: copy: hint'
	if type -p 'pigz' > /dev/null 2>&1
	then
		sudo -n dd if=/dev/disk/by-uuid/469457fc-293f-46ec-92da-27b5d0c36b17 bs=1M | pigz --fast | sudo -n tee /mnt/dent/hint_bak.gz > /dev/null
	elif type -p 'gzip' > /dev/null 2>&1
	then
		sudo -n dd if=/dev/disk/by-uuid/469457fc-293f-46ec-92da-27b5d0c36b17 bs=1M | gzip --fast | sudo -n tee /mnt/dent/hint_bak.gz > /dev/null
	else
		sudo -n dd if=/dev/disk/by-uuid/469457fc-293f-46ec-92da-27b5d0c36b17 bs=1M | sudo -n tee /mnt/dent/hint_bak > /dev/null
	fi
	sync
	
	_messagePlain_nominal 'attempt: mount: ro: bulk'
	sudo -n mkdir -p /mnt/bulk
	! mountpoint /mnt/bulk && sudo -n mount -o ro /dev/disk/by-uuid/f1edb7fb-13b1-4c97-91d2-baf50e6d65d8 /mnt/bulk
	! mountpoint /mnt/bulk && exit 1
	
	
	_messagePlain_nominal 'attempt: copy: bulk'
	sudo -n mkdir -p /mnt/dent/bulk_bak
	[[ ! -e /mnt/dent/bulk_bak ]] && exit 1
	[[ ! -d /mnt/dent/bulk_bak ]] && exit 1
	
	sudo -n rsync -ax --delete /mnt/bulk/. /mnt/dent/bulk_bak/.
	
	
	
	_messagePlain_nominal 'attempt: umount: dent'
	sudo -n mount -o remount,ro /mnt/dent
	sync
	
	sudo -n umount /mnt/dent
	sync
	
	_messageNormal 'done: _____special_live_dent_backup'
	return 0
}


# DANGER: Simultaneous use of any 'rw' mounted filesystem with any 'restored' hibernation file/partition is expected to result in extreme filesystem corruption! Take extra precautions to avoid this mistake!
# CAUTION: Do not alow similarity of this function name to other commonly used function names . Unintended tab completion could significantly and substantially impede user.
# WARNING: By default does not restore contents of '/mnt/bulk' assuming simultaneous use of persistent storage and hibernation backup is sufficiently unlikely and risky that a request to the user is preferable.
_____special_live_dent_restore() {
	! _mustGetSudo && exit 1
	_messageNormal 'init: _____special_live_dent_restore'
	
	_messagePlain_nominal 'attempt: mount: dent'
	sudo -n mkdir -p /mnt/dent
	! mountpoint /mnt/dent && sudo -n mount -o ro /dev/disk/by-uuid/d82e3d89-3156-4484-bde2-ccc534ca440b /mnt/dent
	! mountpoint /mnt/dent && exit 1
	#sudo -n mount -o remount,ro /mnt/dent
	
	
	_messagePlain_nominal 'attempt: copy: hint'
	#sudo -n dd if=/dev/zero of=/dev/disk/by-uuid/469457fc-293f-46ec-92da-27b5d0c36b17 bs=1M
	if type -p 'pigz' > /dev/null 2>&1 || type -p 'gzip' > /dev/null 2>&1
	then
		sudo -n gzip -d -c /mnt/dent/hint_bak.gz | sudo -n dd of=/dev/disk/by-uuid/469457fc-293f-46ec-92da-27b5d0c36b17 bs=1M
	else
		sudo cat /mnt/dent/hint_bak | sudo -n dd of=/dev/disk/by-uuid/469457fc-293f-46ec-92da-27b5d0c36b17 bs=1M
	fi
	sync
	
	
	
	
	#_messagePlain_nominal 'attempt: mount: rw: bulk'
	#sudo -n mkdir -p /mnt/bulk
	#! mountpoint /mnt/bulk && sudo -n mount -o ro /dev/disk/by-uuid/f1edb7fb-13b1-4c97-91d2-baf50e6d65d8 /mnt/bulk
	#! mountpoint /mnt/bulk && exit 1
	#sudo -n mount -o remount,rw /mnt/bulk
	
	#_messagePlain_nominal 'attempt: copy: bulk'
	#sudo -n mkdir -p /mnt/dent/bulk_bak
	#[[ ! -e /mnt/dent/bulk_bak ]] && exit 1
	#[[ ! -d /mnt/dent/bulk_bak ]] && exit 1
	
	#sudo -n rsync -ax --delete /mnt/dent/bulk_bak/. /mnt/bulk/.
	
	
	
	_messagePlain_nominal 'attempt: umount: dent'
	sudo -n mount -o remount,ro /mnt/dent
	sync
	sudo -n umount /mnt/dent
	sync
	
	_messagePlain_request 'request: consider restoring /mnt/bulk (not overwritten by default)'
	
	_messageNormal 'done: _____special_live_dent_restore'
	return 0
}








#Override (Program).

#Override, cygwin.


# WARNING: What is otherwise considered bad practice may be accepted to reduce substantial MSW/Cygwin inconvenience .
#/usr/local/bin:/usr/bin:/cygdrive/c/WINDOWS/system32:/cygdrive/c/WINDOWS:/usr/bin:/usr/lib/lapack:/cygdrive/x:/cygdrive/x/_bin:/cygdrive/x/_bundle:/opt/ansible/bin:/opt/nodejs/current:/opt/testssl:/home/root/bin
#/cygdrive/c/WINDOWS/system32:/cygdrive/c/WINDOWS:/usr/bin:/usr/lib/lapack:/cygdrive/x:/cygdrive/x/_bin:/cygdrive/x/_bundle:/opt/ansible/bin:/opt/nodejs/current:/opt/testssl:/home/root/bin
if [[ "$PATH" == "/cygdrive"* ]] || ( [[ "$PATH" == *"/cygdrive"* ]] && [[ "$PATH" != *"/usr/local/bin"* ]] )
then
	if [[ "$PATH" == "/cygdrive"* ]]
	then
		export PATH=/usr/local/bin:/usr/bin:/bin:"$PATH"
	fi
	
	[[ "$PATH" != *"/usr/local/bin"* ]] && export PATH=/usr/local/bin:"$PATH"
	[[ "$PATH" != *"/usr/bin"* ]] && export PATH=/usr/bin:"$PATH"
	[[ "$PATH" != *"/bin:"* ]] && export PATH=/bin:"$PATH"
fi



# WARNING: Multiple reasons to instead consider direct detection by other commands -  ' uname -a | grep -i cygwin > /dev/null 2>&1 ' , ' [[ -e '/cygdrive' ]] ' , etc .
_if_cygwin() {
	if uname -a | grep -i cygwin > /dev/null 2>&1
	then
		return 0
	fi
	return 1
}

# ATTENTION: Workaround - Cygwin Portable - change directory to current directory as detected by 'ubcp.cmd' .
if [[ "$CWD" != "" ]] && [[ "$cygwin_CWD_onceOnly_done" != 'true' ]] && uname -a | grep -i cygwin > /dev/null 2>&1
then
	! cd "$CWD" && exit 1
	export cygwin_CWD_onceOnly_done='true'
fi


# ATTENTION: User must launch "tmux" (no parameters) in a graphical Cygwin terminal.
# Launches graphical application through "tmux new-window" if available.
# https://superuser.com/questions/531787/starting-windows-gui-program-in-windows-through-cygwin-sshd-from-ssh-client
_workaround_cygwin_tmux() {
	if pgrep -u "$USER" ^tmux$ > /dev/null 2>&1
	then
		tmux new-window "$@"
		return "$?"
	fi
	
	"$@"
	return "$?"
}


# DANGER: Severely differing functionality. Intended only to stand in for "ip addr show" and similar.
if ! type ip > /dev/null 2>&1 && type 'ipconfig' > /dev/null 2>&1 && uname -a | grep -i cygwin > /dev/null 2>&1
then
	ip() {
		if [[ "$1" == "addr" ]] && [[ "$2" == "show" ]]
		then
			ipconfig
			return $?
		fi
		
		return 1
	}
fi


if _if_cygwin
then
	# WARNING: Since MSW/Cygwin is hardly suitable for mounting UNIX/tmpfs/ramfs/etc filesystems, 'mountpoint' 'safety checks' are merely disabled.
	mountpoint() {
		true
	}
	losetup() {
		false
	}
	
	tc() {
		false
	}
	wondershaper() {
		false
	}
	
	ionice() {
		false
	}
fi


# CAUTION: Fragile, at best.
# DANGER: MSW apparently does not necessarily allow 'Administrator' access to all network 'drives'. Workaround copying of obvious files is limited.
# WARNING: Most likely, after significant delay, will 'prompt' the user with a very much obstructive, and not securing very much, dialog box.
# https://stackoverflow.com/questions/4090301/root-user-sudo-equivalent-in-cygwin
# https://superuser.com/questions/812018/run-a-command-in-another-cygwin-window-and-not-exit
_sudo_cygwin_sequence() {
	_start
	
	# 'If already admin, just run the command in-line.'
	# 'This works on my Win10 machine; dunno about others.'
	if id -G | grep -q ' 544 '
	then
		"$@"
		_stop "$?"
	fi
	
	# 'cygstart/runas doesn't handle arguments with spaces correctly so create'
	# 'a script that will do so properly.'
	echo "#!/bin/bash" >> "$safeTmp"/cygwin_sudo_temp.sh
	echo "export PATH=\"$PATH\"" >> "$safeTmp"/cygwin_sudo_temp.sh
	
	
	_safeEcho_newline "$safeTmp"/_bin.bat "$@" >> "$safeTmp"/cygwin_sudo_temp.sh
	echo 'echo > "'"$safeTmp"'"/sequenceDone_'"$ubiquitousBashID" >> "$safeTmp"/cygwin_sudo_temp.sh
	echo 'sleep 3' >> "$safeTmp"/cygwin_sudo_temp.sh
	chmod u+x "$safeTmp"/cygwin_sudo_temp.sh
	
	
	
	cp "$scriptAbsoluteLocation" "$safeTmp"/
	chmod u+x "$safeTmp"/$(basename "$scriptAbsoluteLocation")
	
	cp "$scriptAbsoluteFolder"/_bin.bat "$safeTmp"/_bin.bat
	chmod u+x "$safeTmp"/_bin.bat
	

	# 'Do it as Administrator.'
	#cygstart --action=runas "$scriptAbsoluteFolder"/_bin.bat bash
	
	if [[ "$scriptAbsoluteFolder" == "/cygdrive/c"* ]]
	then
		# WARNING: May be untested, or (especially under interactive shell) may call obsolete code.
		cygstart --action=runas "$scriptAbsoluteFolder"/_bin.bat "$safeTmp"/cygwin_sudo_temp.sh
	else
		cygstart --action=runas "$safeTmp"/_bin.bat "$safeTmp"/cygwin_sudo_temp.sh
	fi
	
	
	while ! [[ -e "$safeTmp"/sequenceDone_"$ubiquitousBashID" ]]
	do
		sleep 3
	done
	
	_stop "$?"
}
_sudo_cygwin() {
	"$scriptAbsoluteLocation" _sudo_cygwin_sequence "$@"
}

# CAUTION: BROKEN !
if _if_cygwin && type cygstart > /dev/null 2>&1
then
	sudo() {
		[[ "$1" == "-n" ]] && shift
		if type cygstart > /dev/null 2>&1
		then
			_sudo_cygwin "$@"
			#cygstart --action=runas "$@"
			#"$@"
			return
		else
			"$@"
			return
		fi
		
		return 1
	}
fi




_discoverResource-cygwinNative-ProgramFiles-declaration-ProgramFiles() {
	local currentBinary
	currentBinary="$1"
	
	local currentBinary_functionName
	currentBinary_functionName=$(echo "$1" | tr -dc 'a-zA-Z0-9')
	
	local currentExpectedSubdir
	currentExpectedSubdir="$2"
	
	local forceNativeBinary
	forceNativeBinary='false'
	
	[[ "$3" != "true" ]] && type "$currentBinary_functionName" > /dev/null 2>&1 && return 0
	
	local forceWorkaroundPrefix
	forceWorkaroundPrefix="$4"
	
	if ! type "$currentBinary_functionName" > /dev/null 2>&1 && type '/cygdrive/'"$currentDriveLetter_cygwin_uk4uPhB663kVcygT0q"'/Program Files/'"$currentExpectedSubdir"'/'"$currentBinary".exe > /dev/null 2>&1
	then
		eval $currentBinary_functionName'() { '"$forceWorkaroundPrefix"'/cygdrive/"'"$currentDriveLetter_cygwin_uk4uPhB663kVcygT0q"'"/"'"Program Files"'"/"'"$currentExpectedSubdir"'"/"'"$currentBinary"'".exe "$@" ; }'
		false
	fi
	
	if ! type "$currentBinary_functionName" > /dev/null 2>&1 && type '/cygdrive/'"$currentDriveLetter_cygwin_uk4uPhB663kVcygT0q"'/Program Files (x86)/'"$currentExpectedSubdir"'/'"$currentBinary".exe > /dev/null 2>&1
	then
		eval $currentBinary_functionName'() { '"$forceWorkaroundPrefix"'/cygdrive/"'"$currentDriveLetter_cygwin_uk4uPhB663kVcygT0q"'"/"'"Program Files (x86)"'"/"'"$currentExpectedSubdir"'"/"'"$currentBinary"'".exe "$@" ; }'
	fi
	type "$currentBinary_functionName" > /dev/null 2>&1 && export -f "$currentBinary" > /dev/null 2>&1 && return 0
	return 1
}

_discoverResource-cygwinNative-ProgramFiles-declaration-core() {
	local currentBinary
	currentBinary="$1"
	
	local currentBinary_functionName
	currentBinary_functionName=$(echo "$1" | tr -dc 'a-zA-Z0-9')
	
	local currentExpectedSubdir
	currentExpectedSubdir="$2"
	
	local forceNativeBinary
	forceNativeBinary='false'
	
	[[ "$3" != "true" ]] && type "$currentBinary_functionName" > /dev/null 2>&1 && return 0
	
	local forceWorkaroundPrefix
	forceWorkaroundPrefix="$4"
	
	local currentCygdriveC_equivalent
	currentCygdriveC_equivalent=$(cygpath -S | sed 's/\/Windows\/System32//g' | sed 's/^\/cygdrive\///')
	
	if ! type "$currentBinary_functionName" > /dev/null 2>&1 && type '/cygdrive/'"$currentCygdriveC_equivalent"'/core/installations/'"$currentExpectedSubdir"'/'"$currentBinary".exe > /dev/null 2>&1
	then
		eval $currentBinary_functionName'() { '"$forceWorkaroundPrefix"'/cygdrive/"'"$currentCygdriveC_equivalent"'"/"'"core/installations"'"/"'"$currentExpectedSubdir"'"/"'"$currentBinary"'".exe "$@" ; }'
	fi
	type "$currentBinary_functionName" > /dev/null 2>&1 && return 0
	
	if ! type "$currentBinary_functionName" > /dev/null 2>&1 && type '/cygdrive/'"$currentCygdriveC_equivalent"'/core/installations/'"$currentExpectedSubdir"'/'"$currentBinary".exe > /dev/null 2>&1
	then
		eval $currentBinary_functionName'() { '"$forceWorkaroundPrefix"'/cygdrive/"'"$currentCygdriveC_equivalent"'"/"'"core/installations"'"/"'"$currentExpectedSubdir"'"/"'"$currentBinary"'".exe "$@" ; }'
	fi
	type "$currentBinary_functionName" > /dev/null 2>&1 && export -f "$currentBinary" > /dev/null 2>&1 && return 0
	return 1
}

_discoverResource-cygwinNative-ProgramFiles() {
	local currentBinary
	currentBinary="$1"
	local currentBinary_functionName
	currentBinary_functionName=$(echo "$1" | tr -dc 'a-zA-Z0-9')
	[[ "$3" != "true" ]] && type "$currentBinary_functionName" > /dev/null 2>&1 && return 0
	
	local currentCygdriveC_equivalent
	currentCygdriveC_equivalent=$(cygpath -S | sed 's/\/Windows\/System32//g' | sed 's/^\/cygdrive\///')
	unset currentDriveLetter_cygwin_uk4uPhB663kVcygT0q
	export currentDriveLetter_cygwin_uk4uPhB663kVcygT0q="$currentCygdriveC_equivalent"
	_discoverResource-cygwinNative-ProgramFiles-declaration-ProgramFiles "$@"
	
	
	# ATTENTION: Configure: 'c..w' (aka. 'w..c') .
	unset currentDriveLetter_cygwin_uk4uPhB663kVcygT0q
	for currentDriveLetter_cygwin_uk4uPhB663kVcygT0q in {c..w}
	do
		_discoverResource-cygwinNative-ProgramFiles-declaration-ProgramFiles "$@"
	done
	
	_discoverResource-cygwinNative-ProgramFiles-declaration-core "$@"
	
	type "$currentBinary_functionName" > /dev/null 2>&1 && export -f "$currentBinary_functionName" > /dev/null 2>&1 && return 0
	return 1
}


_ops_cygwinOverride_allDisks() {
	# DANGER: Calling a script from every connected Cygwin/MSW drive arguably causes obvious problems, although any device or network directly connected to any MSW machine inevitably entails such risks.
	# WARNING: Looping through {w..c} completely may impose delays sufficient to break "_test_selfTime", "_test_broadcastPipe_page", etc, if extremely slow storage is attached.
	# ATTENTION: Configure: 'w..c' (aka. 'c..w') .
	unset currentDriveLetter_cygwin_uk4uPhB663kVcygT0q
	for currentDriveLetter_cygwin_uk4uPhB663kVcygT0q in {w..c}
	do
		# WARNING: May require export of functions!
		[[ -e /cygdrive/$currentDriveLetter_cygwin_uk4uPhB663kVcygT0q ]] && [[ -e /cygdrive/$currentDriveLetter_cygwin_uk4uPhB663kVcygT0q/ops-cygwin.sh ]] && . /cygdrive/$currentDriveLetter_cygwin_uk4uPhB663kVcygT0q/ops-cygwin.sh
	done
	unset currentDriveLetter_cygwin_uk4uPhB663kVcygT0q
}


if [[ -e /cygdrive ]] && _if_cygwin
then
	# WARNING: Reduces incidents of extremely slow storage attachment from breaking "_test_selfTime", "_test_broadcastPipe_page", etc, at risks of not recognizing newly installed 'native' programs for up to 20minutes .
	export cygwinOverride_measureDateB=$(date +%s%N | cut -b1-13)
	[[ "$cygwinOverride_measureDateA" == "" ]] && export cygwinOverride_measureDateA=$(bc <<< "$cygwinOverride_measureDateB - 900000000" | tr -dc '0-9')
	
	# WARNING: Experiment without checking checksum to ensure functions are exported correctly!
	if [[ $(bc <<< "$cygwinOverride_measureDateB - $cygwinOverride_measureDateA" | tr -dc '0-9') -gt 1200000 ]] || [[ "$ub_setScriptChecksum_contents_cygwinOverride" != "$ub_setScriptChecksum_contents" ]]
	then
		export cygwinOverride_measureDateA=$(date +%s%N | cut -b1-13)
		export ub_setScriptChecksum_contents_cygwinOverride="$ub_setScriptChecksum_contents"
		
		_discoverResource-cygwinNative-ProgramFiles 'nmap' 'Nmap' false
		
		# WARNING: Native 'vncviewer.exe' is a GUI app, and cannot be launched directly from Cygwin SSH server.
		_discoverResource-cygwinNative-ProgramFiles 'vncviewer' 'TigerVNC' false '_workaround_cygwin_tmux '
		
		_discoverResource-cygwinNative-ProgramFiles 'qalc' 'Qalculate' false
		
		
		# WARNING: CAUTION: DANGER: UNIX EOL *MANDATORY* !
		[[ -e "$scriptAbsoluteFolder"/ops-cygwin.sh ]] && . "$scriptAbsoluteFolder"/ops-cygwin.sh
		
		# export ubiquitousBashID=uk4uPhB663kVcygT0q
		unset currentDriveLetter_cygwin_uk4uPhB663kVcygT0q
		export currentDriveLetter_cygwin_uk4uPhB663kVcygT0q=$(cygpath -S | sed 's/\/Windows\/System32//g' | sed 's/^\/cygdrive\///')
		[[ -e /cygdrive/$currentDriveLetter_cygwin_uk4uPhB663kVcygT0q ]] && [[ -e /cygdrive/$currentDriveLetter_cygwin_uk4uPhB663kVcygT0q/ops-cygwin.sh ]] && . /cygdrive/$currentDriveLetter_cygwin_uk4uPhB663kVcygT0q/ops-cygwin.sh
		
		#_ops_cygwinOverride_allDisks "$@"
		
		unset currentDriveLetter_cygwin_uk4uPhB663kVcygT0q
	fi
fi









_setup_ubiquitousBash_cygwin_procedure_root() {
	local cygwinMSWdesktopDir
	local cygwinMSWmenuDir
	
	cygwinMSWdesktopDir=$(cygpath -u -a -A -D)
	cygwinMSWmenuDir=$(cygpath -u -a -A -P)
	
	mkdir -p "$cygwinMSWdesktopDir"
	mkdir -p "$cygwinMSWmenuDir"/ubiquitous_bash
	
	cp "$scriptAbsoluteFolder"/_bash.bat "$cygwinMSWdesktopDir"/
	cp "$scriptAbsoluteFolder"/_bash.bat "$cygwinMSWmenuDir"/ubiquitous_bash/
	
	
	cygwinMSWdesktopDir=$(cygpath -u -a -D)
	cygwinMSWmenuDir=$(cygpath -u -a -P)
	
	chown -R "$USER":"$USER" "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash > /dev/null 2>&1
	chown -R "$USER":None "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash
	
	chown "$USER":"$USER" "$cygwinMSWdesktopDir"/_bash.bat > /dev/null 2>&1
	chown "$USER":None "$cygwinMSWdesktopDir"/_bash.bat
	chown -R "$USER":"$USER" "$cygwinMSWmenuDir"/ubiquitous_bash/ > /dev/null 2>&1
	chown -R "$USER":None "$cygwinMSWmenuDir"/ubiquitous_bash/
}

_setup_ubiquitousBash_cygwin_procedure() {
	[[ "$scriptAbsoluteFolder" != '/cygdrive'* ]] && _stop 1
	
	_messagePlain_nominal 'init: _setup_ubiquitousBash_cygwin'
	
	local currentCygdriveC_equivalent
	currentCygdriveC_equivalent=$(cygpath -S | sed 's/\/Windows\/System32//g')
	
	mkdir -p "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash
	cd "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash
	
	cp "$scriptAbsoluteFolder"/ubiquitous_bash.sh "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/
	cp "$scriptAbsoluteFolder"/lean.sh "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/
	cp "$scriptAbsoluteFolder"/ubcore.sh "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/
	
	cp "$scriptAbsoluteFolder"/lean.py "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/
	
	#cp "$scriptAbsoluteFolder"/_bash "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/
	cp "$scriptAbsoluteFolder"/_bash.bat "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/
	
	#cp "$scriptAbsoluteFolder"/_bin "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/
	cp "$scriptAbsoluteFolder"/_bin.bat "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/
	
	cp "$scriptAbsoluteFolder"/_test "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/
	cp "$scriptAbsoluteFolder"/_test.bat "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/
	
	cp "$scriptAbsoluteFolder"/_true "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/
	cp "$scriptAbsoluteFolder"/_true.bat "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/
	
	cp "$scriptAbsoluteFolder"/_false "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/
	cp "$scriptAbsoluteFolder"/_false.bat "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/
	
	cp "$scriptAbsoluteFolder"/_anchor "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/
	cp "$scriptAbsoluteFolder"/_anchor.bat "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/
	cp "$scriptAbsoluteFolder"/_setup_ubcp.bat "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/
	
	
	cp "$scriptAbsoluteFolder"/package.tar.xz "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/
	
	
	
	mkdir -p "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/_local/ubcp
	
	cp -a "$scriptLocal"/ubcp/_upstream "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/_local/ubcp/
	cp -a "$scriptLocal"/ubcp/overlay "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/_local/ubcp/
	
	cp "$scriptLocal"/ubcp/.gitignore "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/_local/ubcp/
	
	cp "$scriptLocal"/ubcp/agpl-3.0.txt "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/_local/ubcp/
	
	cp "$scriptLocal"/ubcp/cygwin-portable.cmd "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/_local/ubcp/
	cp "$scriptLocal"/ubcp/cygwin-portable-updater.cmd "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/_local/ubcp/
	
	cp "$scriptLocal"/ubcp/gpl-2.0.txt "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/_local/ubcp/
	cp "$scriptLocal"/ubcp/gpl-3.0.txt "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/_local/ubcp/
	cp "$scriptLocal"/ubcp/license.txt "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/_local/ubcp/
	
	cp "$scriptLocal"/ubcp/README.md "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/_local/ubcp/
	
	cp "$scriptLocal"/ubcp/ubcp.cmd "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/_local/ubcp/
	cp "$scriptLocal"/ubcp/ubcp_rename-to-enable.cmd "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/_local/ubcp/
	cp "$scriptLocal"/ubcp/ubcp-cygwin-portable-installer.cmd "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash/_local/ubcp/
	
	
	
	
	cygwinMSWdesktopDir=$(cygpath -u -a -A -D)
	cygwinMSWmenuDir=$(cygpath -u -a -A -P)
	
	mkdir -p "$cygwinMSWdesktopDir"
	mkdir -p "$cygwinMSWmenuDir"/ubiquitous_bash
	
	cp "$scriptAbsoluteFolder"/_bash.bat "$cygwinMSWdesktopDir"/
	cp "$scriptAbsoluteFolder"/_bash.bat "$cygwinMSWmenuDir"/ubiquitous_bash/
	
	
	
	local cygwinMSWdesktopDir
	local cygwinMSWmenuDir
	cygwinMSWdesktopDir=$(cygpath -u -a -D)
	cygwinMSWmenuDir=$(cygpath -u -a -P)
	
	mkdir -p "$cygwinMSWdesktopDir"
	mkdir -p "$cygwinMSWmenuDir"/ubiquitous_bash
	
	cp "$scriptAbsoluteFolder"/_bash.bat "$cygwinMSWdesktopDir"/
	cp "$scriptAbsoluteFolder"/_bash.bat "$cygwinMSWmenuDir"/ubiquitous_bash/
	
	
	
	chown -R "$USER":"$USER" "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash > /dev/null 2>&1
	chown -R "$USER":None "$currentCygdriveC_equivalent"/core/infrastructure/ubiquitous_bash
	
	chown "$USER":"$USER" "$cygwinMSWdesktopDir"/_bash.bat > /dev/null 2>&1
	chown "$USER":None "$cygwinMSWdesktopDir"/_bash.bat
	chown -R "$USER":"$USER" "$cygwinMSWmenuDir"/ubiquitous_bash/ > /dev/null 2>&1
	chown -R "$USER":None "$cygwinMSWmenuDir"/ubiquitous_bash/
	
	
	#sudo -n "$scriptAbsoluteLocation" _setup_ubiquitousBash_cygwin_procedure_root "$@"
	
	
	_messagePlain_good 'done: _setup_ubiquitousBash_cygwin: lean'
	sleep 1
}


_setup_ubiquitousBash_cygwin() {
	"$scriptAbsoluteLocation" _setup_ubiquitousBash_cygwin_procedure "$@"
}





_setup_ubcp_procedure() {
	_messagePlain_nominal 'init: _setup_ubcp_procedure'
	! uname -a | grep -i cygwin > /dev/null 2>&1 && _stop 1
	
	tskill ssh-pageant > /dev/null 2>&1
	
	local currentCygdriveC_equivalent
	currentCygdriveC_equivalent=$(cygpath -S | sed 's/\/Windows\/System32//g')
	
	export safeToDeleteGit="true"
	if [[ -e "$currentCygdriveC_equivalent"/core/infrastructure/ubcp ]]
	then
		# DANGER: Not only does this use 'rm -rf' without sanity checking, the behavior is undefined if this ubcp installation has been used to start this script!
		#[[ -e "$currentCygdriveC_equivalent"/core/infrastructure/ubcp ]] && rm -rf "$currentCygdriveC_equivalent"/core/infrastructure/ubcp
		
		_messageError 'FAIL: ubcp already installed locally and must be deleted prior to script!'
		sleep 10
		_stop 1
		exit 1
		return 1
	fi
	
	
	
	
	
	#cd "$scriptLocal"/
	
	mkdir -p "$currentCygdriveC_equivalent"/core/infrastructure/
	cd "$currentCygdriveC_equivalent"/core/infrastructure/
	
	#tar -xvf "$scriptLocal"/ubcp/package_ubcp-cygwinOnly.tar.gz
	tar -xvf "$scriptLocal"/ubcp/package_ubcp-cygwinOnly.tar.xz
	
	_messagePlain_good 'done: _setup_ubcp_procedure: ubcp'
	sleep 10
	
	cd "$outerPWD"
}



# CAUTION: Do NOT hook to '_setup' .
# No production use. Developer feature.
# Highly irregular accommodation for usage of 'ubiquitous_bash' through 'ubcp' (cygwin portable) compatibility layer through MSW network drive (especially '_userVBox' MSW guest network drive) .
# WARNING: May require 'administrator' privileges under MSW. However, it may be better for this directory to be 'owned' by the 'primary' 'user' account. Particularly considering the VR/gaming/CAD software that remains 'exclusive' to MSW is 'legacy' software which for both licensing and technical reasons may be inherently incompatible with 'multi-user' access.
# WARNING: MSW 'administrator' 'privileges' may break 'ubcp' .
_setup_ubcp() {
	# WARNING: May break if 'mitigation' has not been applied!
	if ! [[ -e "$scriptLocal"/ubcp/package_ubcp-cygwinOnly.tar.gz ]] && ! [[ -e "$scriptLocal"/ubcp/package_ubcp-cygwinOnly.tar.xz ]] && [[ -e "$scriptLocal"/ubcp/cygwin ]]
	then
		"$scriptAbsoluteLocation" _package_procedure-cygwinOnly "$@"
	fi
	
	"$scriptAbsoluteLocation" _setup_ubcp_procedure "$@"
	"$scriptAbsoluteLocation" _setup_ubiquitousBash_cygwin_procedure "$@"
}






_mitigate-ubcp_rewrite_procedure() {
	_messagePlain_nominal 'init: _mitigate-ubcp_rewrite_procedure'
	
	local currentRoot=$(_getAbsoluteLocation "$PWD")
	
	local currentLink="$1"
	local currentLinkFile=$(basename "$1" )
	local currentLinkFolder=$(dirname "$1")
	currentLinkFolder=$(_getAbsoluteLocation "$currentLinkFolder")
	
	local currentLinkDirective=$(readlink "$1")
	
	
	_messagePlain_probe_var currentRoot
	_messagePlain_probe_var currentLink
	_messagePlain_probe_var currentLinkFile
	_messagePlain_probe_var currentLinkFolder
	_messagePlain_probe_var currentLinkDirective
	
	[[ "$currentLinkDirective" == '/proc/'* ]] && return 0
	[[ "$currentLinkDirective" == '/dev/'* ]] && return 0
	
	
	
	local currentRelativeRoot
	local currentLinkFolder_eval
	
	local currentDots='..'
	
	local currentMatch=false
	local currentIterations=0
	
	if [[ "$currentLinkFolder" == "$currentRoot" ]]
	then
		currentRelativeRoot='.'
		currentMatch='true'
	else
		while [[ "$currentMatch" == 'false' ]] && [[ "$currentIterations" -lt 14 ]]
		do
			_messagePlain_probe "$currentLinkFolder"/"$currentDots"
			currentLinkFolder_eval=$(_getAbsoluteLocation "$currentLinkFolder"/"$currentDots")
			[[ "$currentLinkFolder_eval" == "$currentRoot" ]] && currentMatch='true'
			
			if [[ "$currentMatch" == 'true' ]]
			then
				currentRelativeRoot="$currentDots"
			elif [[ "$currentMatch" == 'false' ]]
			then
				currentDots='../'"$currentDots"
				let currentIterations="$currentIterations"+1
			fi
		done
	fi
	
	
	
	
	_messagePlain_probe_var currentRelativeRoot
	
	
	local processedLinkDirective
	
	if [[ "$currentLinkDirective" == '/'* ]]
	then
		processedLinkDirective="$currentRelativeRoot""$currentLinkDirective"
		
	fi
	
	_messagePlain_probe_var processedLinkDirective
	
	
	
	if [[ "$currentLinkDirective" == '/'* ]]
	then
		cd "$currentLinkFolder"
		
		ls -l "$processedLinkDirective"
		
		
		# ATTENTION: Forces scenario '2'!
		# CAUTION: Three possible scenarios to consider.
		# 2) Symlinks rewritten to '/bin'. Links now pointing to '/bin' should return files when retrieved through network drive, without this link.
		# In any case, Cygwin will not be managing this directory .
		if [[ "$mitigate_ubcp_modifySymlink" == 'true' ]]
		then
			if [[ "$currentLinkDirective" == '/usr/bin/'* ]]
			then
				processedLinkDirective="${processedLinkDirective/'/usr/bin/'/'/bin/'}"
			fi
		fi
		
		
		
		ln -sf "$processedLinkDirective" "$currentLinkFolder"/"$currentLinkFile"
		
		ls -ld "$currentLinkFolder"/"$currentLinkFile"
		[[ -d "$currentLinkFolder"/"$currentLinkFile" ]] && ls -l "$currentLinkFolder"/"$currentLinkFile"
		
		#rm -f "$currentLink"
		##currentLink=$(_getAbsoluteLocation "$currentLink)
		##cd "$currentLinkFolder"
		#ln -sf "$currentLinkDirective" "$currentLink"
		# ... replace symlink with file if not also a symlink
		
		cd "$outerPWD"
	fi
	
	# ATTENTION: Forces scenario '3'!
	# CAUTION: Three possible scenarios to consider.
	# 3) Symlinks replaced. No links, files only.
	if [[ "$mitigate_ubcp_replaceSymlink" == 'true' ]]
	then
		cd "$currentLinkFolder"
		
		ls -ld "$currentLinkFolder"/"$currentLinkFile"
		
		
		
		_messagePlain_nominal 'directive: replace: true'
		cp -L -R --preserve=all "$currentLinkFolder"/"$currentLinkFile" "$currentLinkFolder"/"$currentLinkFile".replace
		rm -f "$currentLinkFolder"/"$currentLinkFile"
		mv "$currentLinkFolder"/"$currentLinkFile".replace "$currentLinkFolder"/"$currentLinkFile"
		
		ls -ld "$currentLinkFolder"/"$currentLinkFile"
		[[ -d "$currentLinkFolder"/"$currentLinkFile" ]] && ls -l "$currentLinkFolder"/"$currentLinkFile"
		
		cd "$outerPWD"
	fi
	
	
	
	return 0
}

_mitigate-ubcp_rewrite() {
	export safeToDeleteGit="true"
	! _safePath "$1" && _stop 1
	cd "$1"
	
	find "$2" -type l -exec "$scriptAbsoluteLocation" _mitigate-ubcp_rewrite_procedure '{}' \;
	
	return 0
}




_mitigate-ubcp_procedure() {
	export safeToDeleteGit="true"
	! _safePath "$1" && _stop 1
	
	# DANGER: REQUIRED for symbolic links to be valid as necessary during rewrite/replace algorithm.
	ln -s "$1"/bin "$1"/usr/bin
	
	_mitigate-ubcp_rewrite "$1" "$1"/etc/alternatives
	
	_mitigate-ubcp_rewrite "$1" "$1"/bin
	_mitigate-ubcp_rewrite "$1" "$1"/usr/share
	_mitigate-ubcp_rewrite "$1" "$1"/usr/libexec
	_mitigate-ubcp_rewrite "$1" "$1"/lib
	_mitigate-ubcp_rewrite "$1" "$1"/etc/pki
	_mitigate-ubcp_rewrite "$1" "$1"/etc/ssl
	_mitigate-ubcp_rewrite "$1" "$1"/etc/crypto-policies
	_mitigate-ubcp_rewrite "$1" "$1"/etc/mc
	
	_mitigate-ubcp_rewrite "$1" "$1"/opt
	
	
	
	
	
	# CAUTION: Three possible scenarios to consider.
	# 1) Symlinks rewritten as is to '/usr/bin'. Links pointing to '/usr/bin' directory will not work through network drive unless this link remains.
		# PREVENT - ' rm -f "$1"/usr/bin ' .
		# Tested - known working ( _userVBox , _userQemu ) .
	# 2) Symlinks rewritten to '/bin'. Links now pointing to '/bin' should return files when retrieved through network drive, without this link.
		# ALLOW - ' rm -f "$1"/usr/bin ' .
		# Tested - known working ( _userVBox , _userQemu ) .
	# 3) Symlinks replaced. No links, files only.
		# ALLOW - ' rm -f "$1"/usr/bin ' 
		# Tested - known working ( _userVBox , _userQemu ) .
	# In any case, Cygwin will not be managing this directory .
	( [[ "$mitigate_ubcp_replaceSymlink" == 'true' ]] || [[ "$mitigate_ubcp_modifySymlink" == 'true' ]] ) && rm -f "$1"/usr/bin
}




_mitigate-ubcp_directory() {
	mkdir -p "$safeTmp"/package/_local
	
	if [[ -e "$scriptLocal"/ubcp/cygwin ]]
	then
		_mitigate-ubcp_procedure "$scriptLocal"/ubcp/cygwin
		return 0
	fi
# 	if [[ -e "$scriptLib"/ubcp/cygwin ]]
# 	then
# 		_mitigate-ubcp_procedure "$scriptLib"/ubcp/cygwin
# 		return 0
# 	fi
# 	if [[ -e "$scriptAbsoluteFolder"/ubcp/cygwin ]]
# 	then
# 		_mitigate-ubcp_procedure "$scriptAbsoluteFolder"/ubcp/cygwin
# 		return 0
# 	fi
	
	
	export mitigate_ubcp_replaceSymlink='false'
	cd "$outerPWD"
	_stop 1
}

# ATTENTION: Override with 'ops' or similar.
_mitigate-ubcp() {
	export mitigate_ubcp_modifySymlink='true'
	export mitigate_ubcp_replaceSymlink='false'
	_mitigate-ubcp_directory "$@"
	
	export mitigate_ubcp_replaceSymlink='true'
	_mitigate-ubcp_directory "$@"
}



_package_procedure-cygwinOnly() {
	_start
	mkdir -p "$safeTmp"/package
	
	# WARNING: Largely due to presence of '.gitignore' files in 'ubcp' .
	export safeToDeleteGit="true"
	
	rm -f "$scriptAbsoluteFolder"/package_ubcp-cygwinOnly.tar.gz > /dev/null 2>&1
	rm -f "$scriptLocal"/package_ubcp-cygwinOnly.tar.gz > /dev/null 2>&1
	rm -f "$scriptLocal"/ubcp/package_ubcp-cygwinOnly.tar.gz > /dev/null 2>&1
	
	rm -f "$scriptAbsoluteFolder"/package_ubcp-cygwinOnly.tar.xz > /dev/null 2>&1
	rm -f "$scriptLocal"/package_ubcp-cygwinOnly.tar.xz > /dev/null 2>&1
	rm -f "$scriptLocal"/ubcp/package_ubcp-cygwinOnly.tar.xz > /dev/null 2>&1
	
	if [[ "$ubPackage_enable_ubcp" == 'true' ]]
	then
		_package_ubcp_copy "$@"
	fi
	
	cd "$safeTmp"/package/
	_package_subdir
	
	# ATTENTION: Unusual. Expected to result in a package containing only 'ubcp' directory in the root.
	# WARNING: Having these subdirectories opened in MSW 'explorer' (file manager) may cause this directory to not exist.
	! cd "$safeTmp"/package/"$objectName"/_local && _stop 1
	
	#tar -czvf "$scriptAbsoluteFolder"/package_ubcp-cygwinOnly.tar.gz .
	env XZ_OPT=-5 tar -cJvf "$scriptAbsoluteFolder"/package_ubcp-cygwinOnly.tar.xz .
	
	mkdir -p "$scriptLocal"/ubcp/
	mv "$scriptAbsoluteFolder"/package_ubcp-cygwinOnly.tar.gz "$scriptLocal"/ubcp/ > /dev/null 2>&1
	mv "$scriptAbsoluteFolder"/package_ubcp-cygwinOnly.tar.xz "$scriptLocal"/ubcp/
	
	_messagePlain_request 'request: review contents of _local/ubcp/cygwin/home and similar directories'
	sleep 20
	
	cd "$outerPWD"
	_stop
}




_package-cygwinOnly() {
	export ubPackage_enable_ubcp='true'
	"$scriptAbsoluteLocation" _package_procedure-cygwinOnly "$@"
}
_package-cygwin() {
	_package-cygwinOnly "$@"
}



















#veraCrypt_override.sh

#if _if_cygwin
#then
	#discoverResource
#fi






#####Utilities

_test_getAbsoluteLocation_sequence() {
	_start scriptLocal_mkdir_disable
	
	local testScriptLocation_actual
	local testScriptLocation
	local testScriptFolder
	
	local testLocation_actual
	local testLocation
	local testFolder
	
	#script location/folder work directories
	mkdir -p "$safeTmp"/sAL_dir
	cp "$scriptAbsoluteLocation" "$safeTmp"/sAL_dir/script
	ln -s "$safeTmp"/sAL_dir/script "$safeTmp"/sAL_dir/lnk
	[[ ! -e "$safeTmp"/sAL_dir/script ]] && _stop 1
	[[ ! -e "$safeTmp"/sAL_dir/lnk ]] && _stop 1
	
	ln -s "$safeTmp"/sAL_dir "$safeTmp"/sAL_lnk
	[[ ! -e "$safeTmp"/sAL_lnk/script ]] && _stop 1
	[[ ! -e "$safeTmp"/sAL_lnk/lnk ]] && _stop 1
	
	#_getScriptAbsoluteLocation
	testScriptLocation_actual=$("$safeTmp"/sAL_dir/script _getScriptAbsoluteLocation)
	[[ "$safeTmp"/sAL_dir/script != "$testScriptLocation_actual" ]] && echo 'crit: "$safeTmp"/sAL_dir/script != "$testScriptLocation_actual"' && _stop 1
	
	testScriptLocation=$("$safeTmp"/sAL_dir/script _getScriptAbsoluteLocation)
	[[ "$testScriptLocation" != "$testScriptLocation_actual" ]] && echo 'crit: ! location "$safeTmp"/sAL_dir/script' && _stop 1
	testScriptLocation=$("$safeTmp"/sAL_dir/lnk _getScriptAbsoluteLocation)
	[[ "$testScriptLocation" != "$testScriptLocation_actual" ]] && echo 'crit: ! location "$safeTmp"/sAL_dir/lnk' && _stop 1
	
	testScriptLocation=$("$safeTmp"/sAL_lnk/script _getScriptAbsoluteLocation)
	[[ "$testScriptLocation" != "$testScriptLocation_actual" ]] && echo 'crit: ! location "$safeTmp"/sAL_lnk/script' && _stop 1
	testScriptLocation=$("$safeTmp"/sAL_lnk/lnk _getScriptAbsoluteLocation)
	[[ "$testScriptLocation" != "$testScriptLocation_actual" ]] && echo 'crit: ! location "$safeTmp"/sAL_lnk/lnk' && _stop 1
	
	#_getScriptAbsoluteFolder
	testScriptFolder_actual=$("$safeTmp"/sAL_dir/script _getScriptAbsoluteFolder)
	[[ "$safeTmp"/sAL_dir != "$testScriptFolder_actual" ]] && echo 'crit: "$safeTmp"/sAL_dir != "$testScriptFolder_actual"' && _stop 1
	
	testScriptFolder=$("$safeTmp"/sAL_dir/script _getScriptAbsoluteFolder)
	[[ "$testScriptFolder" != "$testScriptFolder_actual" ]] && echo 'crit: ! folder "$safeTmp"/sAL_dir/script' && _stop 1
	testScriptFolder=$("$safeTmp"/sAL_dir/lnk _getScriptAbsoluteFolder)
	[[ "$testScriptFolder" != "$testScriptFolder_actual" ]] && echo 'crit: ! folder "$safeTmp"/sAL_dir/lnk' && _stop 1
	
	testScriptFolder=$("$safeTmp"/sAL_lnk/script _getScriptAbsoluteFolder)
	[[ "$testScriptFolder" != "$testScriptFolder_actual" ]] && echo 'crit: ! folder "$safeTmp"/sAL_lnk/script' && _stop 1
	testScriptFolder=$("$safeTmp"/sAL_lnk/lnk _getScriptAbsoluteFolder)
	[[ "$testScriptFolder" != "$testScriptFolder_actual" ]] && echo 'crit: ! folder "$safeTmp"/sAL_lnk/lnk' && _stop 1
	
	
	#_getAbsoluteLocation
	testLocation_actual=$("$safeTmp"/sAL_dir/script _getAbsoluteLocation "$safeTmp"/sAL_dir/script)
	[[ "$safeTmp"/sAL_dir/script != "$testLocation_actual" ]] && echo 'crit: "$safeTmp"/sAL_dir/script != "$testLocation_actual"' && _stop 1
	
	testLocation=$("$safeTmp"/sAL_dir/script _getAbsoluteLocation "$safeTmp"/sAL_dir/script)
	[[ "$testLocation" != "$testLocation_actual" ]] && echo 'crit: ! location "$safeTmp"/sAL_dir/script' && _stop 1
	testLocation=$("$safeTmp"/sAL_dir/lnk _getAbsoluteLocation "$safeTmp"/sAL_dir/lnk)
	[[ "$testLocation" != "$testLocation_actual" ]] && echo 'crit: ! location "$safeTmp"/sAL_dir/lnk' && _stop 1
	
	testLocation=$("$safeTmp"/sAL_lnk/script _getAbsoluteLocation "$safeTmp"/sAL_lnk/script)
	[[ "$testLocation" != "$testLocation_actual" ]] && echo 'crit: ! location "$safeTmp"/sAL_lnk/script' && _stop 1
	testLocation=$("$safeTmp"/sAL_lnk/lnk _getAbsoluteLocation "$safeTmp"/sAL_lnk/lnk)
	[[ "$testLocation" != "$testLocation_actual" ]] && echo 'crit: ! location "$safeTmp"/sAL_lnk/lnk' && _stop 1
	
	#_getAbsoluteFolder
	testFolder_actual=$("$safeTmp"/sAL_dir/script _getAbsoluteFolder "$safeTmp"/sAL_dir/script)
	[[ "$safeTmp"/sAL_dir != "$testFolder_actual" ]] && echo 'crit: "$safeTmp"/sAL_dir != "$testFolder_actual"' && _stop 1
	
	testFolder=$("$safeTmp"/sAL_dir/script _getAbsoluteFolder "$safeTmp"/sAL_dir/script)
	[[ "$testFolder" != "$testFolder_actual" ]] && echo 'crit: ! folder "$safeTmp"/sAL_dir/script' && _stop 1
	testFolder=$("$safeTmp"/sAL_dir/lnk _getAbsoluteFolder "$safeTmp"/sAL_dir/script)
	[[ "$testFolder" != "$testFolder_actual" ]] && echo 'crit: ! folder "$safeTmp"/sAL_dir/lnk' && _stop 1
	
	testFolder=$("$safeTmp"/sAL_lnk/script _getAbsoluteFolder "$safeTmp"/sAL_lnk/script)
	[[ "$testFolder" != "$testFolder_actual" ]] && echo 'crit: ! folder "$safeTmp"/sAL_lnk/script' && _stop 1
	testFolder=$("$safeTmp"/sAL_lnk/lnk _getAbsoluteFolder "$safeTmp"/sAL_lnk/script)
	[[ "$testFolder" != "$testFolder_actual" ]] && echo 'crit: ! folder "$safeTmp"/sAL_lnk/lnk' && _stop 1
	
	_stop
}

_test_getAbsoluteLocation() {
	"$scriptAbsoluteLocation" _test_getAbsoluteLocation_sequence "$@"
	[[ "$?" != "0" ]] && _stop 1
	return 0
}

#https://unix.stackexchange.com/questions/293892/realpath-l-vs-p
_test_realpath_L_s_sequence() {
	_start scriptLocal_mkdir_disable
	local functionEntryPWD
	functionEntryPWD="$PWD"
	
	
	local testPath_actual
	local testPath
	
	mkdir -p "$safeTmp"/src
	mkdir -p "$safeTmp"/sub
	ln -s  "$safeTmp"/src "$safeTmp"/sub/lnk
	
	echo > "$safeTmp"/sub/point
	
	ln -s "$safeTmp"/sub/point "$safeTmp"/sub/lnk/ref
	
	#correct
	#"$safeTmp"/sub/ref
	#realpath -L "$safeTmp"/sub/lnk/../ref
	
	#default, wrong
	#"$safeTmp"/ref
	#realpath -P "$safeTmp"/sub/lnk/../ref
	#echo -n '>'
	#readlink -f "$safeTmp"/sub/lnk/../ref
	
	testPath_actual="$safeTmp"/sub/ref
	
	cd "$functionEntryPWD"
	testPath=$(_realpath_L "$safeTmp"/sub/lnk/../ref)
	[[ "$testPath" != "$testPath_actual" ]] && echo 'crit: ! _realpath_L' && _stop 1
	
	cd "$safeTmp"
	testPath=$(_realpath_L ./sub/lnk/../ref)
	[[ "$testPath" != "$testPath_actual" ]] && echo 'crit: ! _realpath_L' && _stop 1
	
	#correct
	#"$safeTmp"/sub/lnk/ref
	#realpath -L -s "$safeTmp"/sub/lnk/ref
	
	#default, wrong for some use cases
	#"$safeTmp"/sub/point
	#realpath -L "$safeTmp"/sub/lnk/ref
	#echo -n '>'
	#readlink -f "$safeTmp"/sub/lnk/ref
	
	testPath_actual="$safeTmp"/sub/lnk/ref
	
	cd "$functionEntryPWD"
	testPath=$(_realpath_L_s "$safeTmp"/sub/lnk/ref)
	[[ "$testPath" != "$testPath_actual" ]] && echo 'crit: ! _realpath_L_s' && _stop 1
	
	cd "$safeTmp"
	testPath=$(_realpath_L_s ./sub/lnk/ref)
	[[ "$testPath" != "$testPath_actual" ]] && echo 'crit: ! _realpath_L_s' && _stop 1
	
	
	cd "$functionEntryPWD"
	_stop
}

_test_realpath_L_s() {
	#Optional safety check. Nonconformant realpath solution should be caught by synthetic test cases.
	#_compat_realpath
	#! [[ -e "$compat_realpath_bin" ]] && [[ "$compat_realpath_bin" != "" ]] && echo 'crit: missing: realpath' && _stop 1
	
	"$scriptAbsoluteLocation" _test_realpath_L_s_sequence "$@"
	[[ "$?" != "0" ]] && _stop 1
	return 0
}

_test_realpath_L() {
	_test_realpath_L_s "$@"
}

_test_realpath() {
	_test_realpath_L_s "$@"
}

_test_readlink_f_sequence() {
	_start scriptLocal_mkdir_disable
	
	echo > "$safeTmp"/realFile
	ln -s "$safeTmp"/realFile "$safeTmp"/linkA
	ln -s "$safeTmp"/linkA "$safeTmp"/linkB
	
	local currentReadlinkResult
	currentReadlinkResult=$(readlink -f "$safeTmp"/linkB)
	
	local currentReadlinkResultBasename
	currentReadlinkResultBasename=$(basename "$currentReadlinkResult")
	
	if [[ "$currentReadlinkResultBasename" != "realFile" ]]
	then
		#echo 'fail: readlink -f'
		_stop 1
	fi
	
	_stop 0
}

_test_readlink_f() {
	if ! "$scriptAbsoluteLocation" _test_readlink_f_sequence
	then
		# May fail through MSW network drive provided by '_userVBox' .
		uname -a | grep -i cygwin > /dev/null 2>&1 && echo 'warn: broken (cygwin): readlink -f' && return 1
		echo 'fail: readlink -f'
		_stop 1
	fi
	
	return 0
}

_compat_realpath() {
	[[ -e "$compat_realpath_bin" ]] && [[ "$compat_realpath_bin" != "" ]] && return 0
	
	#Workaround, Mac. See https://github.com/mirage335/ubiquitous_bash/issues/1 .
	export compat_realpath_bin=/opt/local/libexec/gnubin/realpath
	[[ -e "$compat_realpath_bin" ]] && [[ "$compat_realpath_bin" != "" ]] && return 0
	
	export compat_realpath_bin=$(type -p realpath)
	[[ -e "$compat_realpath_bin" ]] && [[ "$compat_realpath_bin" != "" ]] && return 0
	
	export compat_realpath_bin=/bin/realpath
	[[ -e "$compat_realpath_bin" ]] && [[ "$compat_realpath_bin" != "" ]] && return 0
	
	export compat_realpath_bin=/usr/bin/realpath
	[[ -e "$compat_realpath_bin" ]] && [[ "$compat_realpath_bin" != "" ]] && return 0
	
	# ATTENTION
	# Command "readlink -f" or text processing can be used as fallbacks to obtain absolute path
	# https://stackoverflow.com/questions/3572030/bash-script-absolute-path-with-osx
	
	export compat_realpath_bin=""
	return 1
}

_compat_realpath_run() {
	! _compat_realpath && return 1
	
	"$compat_realpath_bin" "$@"
}

_realpath_L() {
	if ! _compat_realpath_run -L . > /dev/null 2>&1
	then
		readlink -f "$@"
		return
	fi
	
	realpath -L "$@"
}

_realpath_L_s() {
	if ! _compat_realpath_run -L . > /dev/null 2>&1
	then
		readlink -f "$@"
		return
	fi
	
	realpath -L -s "$@"
}


_cygwin_translation_rootFileParameter() {
	if ! uname -a | grep -i cygwin > /dev/null 2>&1
	then
		echo "$0"
		return 0
	fi
	
	
	local currentScriptLocation
	currentScriptLocation="$0"
	
	# CAUTION: Lookup table is used to avoid pulling in any additional dependencies. Additionally, Cygwin apparently may ignore letter case of path .
	
	[[ "$currentScriptLocation" == 'A:'* ]] && currentScriptLocation=${currentScriptLocation/A\://cygdrive/a} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'B:'* ]] && currentScriptLocation=${currentScriptLocation/B\://cygdrive/b} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'C:'* ]] && currentScriptLocation=${currentScriptLocation/C\://cygdrive/c} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'D:'* ]] && currentScriptLocation=${currentScriptLocation/D\://cygdrive/d} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'E:'* ]] && currentScriptLocation=${currentScriptLocation/E\://cygdrive/e} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'F:'* ]] && currentScriptLocation=${currentScriptLocation/F\://cygdrive/f} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'G:'* ]] && currentScriptLocation=${currentScriptLocation/G\://cygdrive/g} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'H:'* ]] && currentScriptLocation=${currentScriptLocation/H\://cygdrive/h} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'I:'* ]] && currentScriptLocation=${currentScriptLocation/I\://cygdrive/i} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'J:'* ]] && currentScriptLocation=${currentScriptLocation/J\://cygdrive/j} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'K:'* ]] && currentScriptLocation=${currentScriptLocation/K\://cygdrive/k} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'L:'* ]] && currentScriptLocation=${currentScriptLocation/L\://cygdrive/l} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'M:'* ]] && currentScriptLocation=${currentScriptLocation/M\://cygdrive/m} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'N:'* ]] && currentScriptLocation=${currentScriptLocation/N\://cygdrive/n} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'O:'* ]] && currentScriptLocation=${currentScriptLocation/O\://cygdrive/o} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'P:'* ]] && currentScriptLocation=${currentScriptLocation/P\://cygdrive/p} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'Q:'* ]] && currentScriptLocation=${currentScriptLocation/Q\://cygdrive/q} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'R:'* ]] && currentScriptLocation=${currentScriptLocation/R\://cygdrive/r} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'S:'* ]] && currentScriptLocation=${currentScriptLocation/S\://cygdrive/s} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'T:'* ]] && currentScriptLocation=${currentScriptLocation/T\://cygdrive/t} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'U:'* ]] && currentScriptLocation=${currentScriptLocation/U\://cygdrive/u} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'V:'* ]] && currentScriptLocation=${currentScriptLocation/V\://cygdrive/v} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'W:'* ]] && currentScriptLocation=${currentScriptLocation/W\://cygdrive/w} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'X:'* ]] && currentScriptLocation=${currentScriptLocation/X\://cygdrive/x} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'Y:'* ]] && currentScriptLocation=${currentScriptLocation/Y\://cygdrive/y} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'Z:'* ]] && currentScriptLocation=${currentScriptLocation/Z\://cygdrive/z} && echo "$currentScriptLocation" && return 0
	
	[[ "$currentScriptLocation" == 'a:'* ]] && currentScriptLocation=${currentScriptLocation/a\://cygdrive/a} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'b:'* ]] && currentScriptLocation=${currentScriptLocation/b\://cygdrive/b} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'c:'* ]] && currentScriptLocation=${currentScriptLocation/c\://cygdrive/c} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'd:'* ]] && currentScriptLocation=${currentScriptLocation/d\://cygdrive/d} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'e:'* ]] && currentScriptLocation=${currentScriptLocation/e\://cygdrive/e} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'f:'* ]] && currentScriptLocation=${currentScriptLocation/f\://cygdrive/f} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'g:'* ]] && currentScriptLocation=${currentScriptLocation/g\://cygdrive/g} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'h:'* ]] && currentScriptLocation=${currentScriptLocation/h\://cygdrive/h} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'i:'* ]] && currentScriptLocation=${currentScriptLocation/i\://cygdrive/i} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'j:'* ]] && currentScriptLocation=${currentScriptLocation/j\://cygdrive/j} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'k:'* ]] && currentScriptLocation=${currentScriptLocation/k\://cygdrive/k} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'l:'* ]] && currentScriptLocation=${currentScriptLocation/l\://cygdrive/l} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'm:'* ]] && currentScriptLocation=${currentScriptLocation/m\://cygdrive/m} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'n:'* ]] && currentScriptLocation=${currentScriptLocation/n\://cygdrive/n} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'o:'* ]] && currentScriptLocation=${currentScriptLocation/o\://cygdrive/o} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'p:'* ]] && currentScriptLocation=${currentScriptLocation/p\://cygdrive/p} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'q:'* ]] && currentScriptLocation=${currentScriptLocation/q\://cygdrive/q} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'r:'* ]] && currentScriptLocation=${currentScriptLocation/r\://cygdrive/r} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 's:'* ]] && currentScriptLocation=${currentScriptLocation/s\://cygdrive/s} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 't:'* ]] && currentScriptLocation=${currentScriptLocation/t\://cygdrive/t} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'u:'* ]] && currentScriptLocation=${currentScriptLocation/u\://cygdrive/u} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'v:'* ]] && currentScriptLocation=${currentScriptLocation/v\://cygdrive/v} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'w:'* ]] && currentScriptLocation=${currentScriptLocation/w\://cygdrive/w} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'x:'* ]] && currentScriptLocation=${currentScriptLocation/x\://cygdrive/x} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'y:'* ]] && currentScriptLocation=${currentScriptLocation/y\://cygdrive/y} && echo "$currentScriptLocation" && return 0
	[[ "$currentScriptLocation" == 'z:'* ]] && currentScriptLocation=${currentScriptLocation/z\://cygdrive/z} && echo "$currentScriptLocation" && return 0
	
	
	echo "$currentScriptLocation" && return 0
}


#Critical prerequsites.
_getAbsolute_criticalDep() {
	#! type realpath > /dev/null 2>&1 && return 1
	! type readlink > /dev/null 2>&1 && return 1
	! type dirname > /dev/null 2>&1 && return 1
	! type basename > /dev/null 2>&1 && return 1
	
	#Known to succeed under BusyBox (OpenWRT), NetBSD, and common Linux variants. No known failure modes. Extra precaution.
	! readlink -f . > /dev/null 2>&1 && return 1
	
	! echo 'qwerty123.git' | grep '\.git$' > /dev/null 2>&1 && return 1
	echo 'qwerty1234git' | grep '\.git$' > /dev/null 2>&1 && return 1
	
	return 0
}
! _getAbsolute_criticalDep && exit 1

#Retrieves absolute path of current script, while maintaining symlinks, even when "./" would translate with "readlink -f" into something disregarding symlinked components in $PWD.
#However, will dereference symlinks IF the script location itself is a symlink. This is to allow symlinking to scripts to function normally.
#Suitable for allowing scripts to find other scripts they depend on. May look like an ugly hack, but it has proven reliable over the years.
_getScriptAbsoluteLocation() {
	if [[ "$0" == "-"* ]]
	then
		return 1
	fi
	
	local currentScriptLocation
	currentScriptLocation="$0"
	uname -a | grep -i cygwin > /dev/null 2>&1 && type _cygwin_translation_rootFileParameter > /dev/null 2>&1 && currentScriptLocation=$(_cygwin_translation_rootFileParameter)
	
	
	local absoluteLocation
	if [[ (-e $PWD\/$currentScriptLocation) && ($currentScriptLocation != "") ]] && [[ "$currentScriptLocation" != "/"* ]]
	then
		absoluteLocation="$PWD"\/"$currentScriptLocation"
		absoluteLocation=$(_realpath_L_s "$absoluteLocation")
	else
		absoluteLocation=$(_realpath_L "$currentScriptLocation")
	fi
	
	if [[ -h "$absoluteLocation" ]]
	then
		absoluteLocation=$(readlink -f "$absoluteLocation")
		absoluteLocation=$(_realpath_L "$absoluteLocation")
	fi
	echo $absoluteLocation
}
alias getScriptAbsoluteLocation=_getScriptAbsoluteLocation

#Retrieves absolute path of current script, while maintaining symlinks, even when "./" would translate with "readlink -f" into something disregarding symlinked components in $PWD.
#Suitable for allowing scripts to find other scripts they depend on.
_getScriptAbsoluteFolder() {
	if [[ "$0" == "-"* ]]
	then
		return 1
	fi
	
	dirname "$(_getScriptAbsoluteLocation)"
}
alias getScriptAbsoluteFolder=_getScriptAbsoluteFolder

#Retrieves absolute path of parameter, while maintaining symlinks, even when "./" would translate with "readlink -f" into something disregarding symlinked components in $PWD.
#Suitable for finding absolute paths, when it is desirable not to interfere with symlink specified folder structure.
_getAbsoluteLocation() {
	if [[ "$1" == "-"* ]]
	then
		return 1
	fi
	
	if [[ "$1" == "" ]]
	then
		echo
		return
	fi
	
	local absoluteLocation
	if [[ (-e $PWD\/$1) && ($1 != "") ]] && [[ "$1" != "/"* ]]
	then
		absoluteLocation="$PWD"\/"$1"
		absoluteLocation=$(_realpath_L_s "$absoluteLocation")
	else
		absoluteLocation=$(_realpath_L "$1")
	fi
	echo "$absoluteLocation"
}
alias getAbsoluteLocation=_getAbsoluteLocation

#Retrieves absolute path of parameter, while maintaining symlinks, even when "./" would translate with "readlink -f" into something disregarding symlinked components in $PWD.
#Suitable for finding absolute paths, when it is desirable not to interfere with symlink specified folder structure.
_getAbsoluteFolder() {
	if [[ "$1" == "-"* ]]
	then
		return 1
	fi
	
	local absoluteLocation=$(_getAbsoluteLocation "$1")
	dirname "$absoluteLocation"
}
alias getAbsoluteLocation=_getAbsoluteLocation

_getScriptLinkName() {
	! [[ -e "$0" ]] && return 1
	! [[ -L "$0" ]] && return 1
	
	! type basename > /dev/null 2>&1 && return 1
	
	local scriptLinkName
	scriptLinkName=$(basename "$0")
	
	[[ "$scriptLinkName" == "" ]] && return 1
	echo "$scriptLinkName"
}

#https://unix.stackexchange.com/questions/27021/how-to-name-a-file-in-the-deepest-level-of-a-directory-tree?answertab=active#tab-top
_filter_lowestPath() {
	awk -F'/' 'NF > depth {
depth = NF;
deepest = $0;
}
END {
print deepest;
}'
}

#https://stackoverflow.com/questions/1086907/can-find-or-any-other-tool-search-for-files-breadth-first
_filter_highestPath() {
	awk -F'/' '{print "", NF, $F}' | sort -n | awk '{print $2}' | head -n 1
}

_recursion_guard() {
	! [[ -e "$1" ]] && return 1
	
	! type "$1" >/dev/null 2>&1 && return 1
	
	local launchGuardScriptAbsoluteLocation
	launchGuardScriptAbsoluteLocation=$(_getScriptAbsoluteLocation)
	local launchGuardTestAbsoluteLocation
	launchGuardTestAbsoluteLocation=$(_getAbsoluteLocation "$1")
	[[ "$launchGuardScriptAbsoluteLocation" == "$launchGuardTestAbsoluteLocation" ]] && return 1
	
	return 0
}

#Checks whether command or function is available.
# DANGER Needed by safeRMR .
_checkDep() {
	if ! type "$1" >/dev/null 2>&1
	then
		echo "$1" missing
		_stop 1
	fi
}

_tryExec() {
	type "$1" >/dev/null 2>&1 && "$1"
}

_tryExecFull() {
	type "$1" >/dev/null 2>&1 && "$@"
}

#Fails if critical global variables point to nonexistant locations. Code may be duplicated elsewhere for extra safety.
_failExec() {
	[[ ! -e "$scriptAbsoluteLocation" ]] && return 1
	[[ ! -e "$scriptAbsoluteFolder" ]] && return 1
	return 0
}

#Portable sanity checked "rm -r" command.
# DANGER Last line of defense against catastrophic errors where "rm -r" or similar would be used!
# WARNING Not foolproof. Use to guard against systematic errors, not carelessness.
# WARNING Do NOT rely upon outside of internal programmatic usage inside script!
# WARNING Consider using this function even if program control flow can be proven safe. Redundant checks just might catch catastrophic memory errors.
#"$1" == directory to remove
_safeRMR() {
	! type _getAbsolute_criticalDep > /dev/null 2>&1 && return 1
	! _getAbsolute_criticalDep && return 1
	
	#Fail sooner, avoiding irrelevant error messages. Especially important to cases where an upstream process has already removed the "$safeTmp" directory of a downstream process which reaches "_stop" later.
	! [[ -e "$1" ]] && return 1
	
	[[ ! -e "$scriptAbsoluteLocation" ]] && return 1
	[[ ! -e "$scriptAbsoluteFolder" ]] && return 1
	_failExec || return 1
	
	#if [[ ! -e "$0" ]]
	#then
	#	return 1
	#fi
	
	if [[ "$1" == "" ]]
	then
		return 1
	fi
	
	if [[ "$1" == "/" ]]
	then
		return 1
	fi
	
	if [[ "$1" == "-"* ]]
	then
		return 1
	fi
	
	#Denylist.
	[[ "$1" == "/home" ]] && return 1
	[[ "$1" == "/home/" ]] && return 1
	[[ "$1" == "/home/$USER" ]] && return 1
	[[ "$1" == "/home/$USER/" ]] && return 1
	[[ "$1" == "/$USER" ]] && return 1
	[[ "$1" == "/$USER/" ]] && return 1
	
	[[ "$1" == "/tmp" ]] && return 1
	[[ "$1" == "/tmp/" ]] && return 1
	
	[[ "$1" == "$HOME" ]] && return 1
	[[ "$1" == "$HOME/" ]] && return 1
	
	#Allowlist.
	local safeToRM=false
	
	local safeScriptAbsoluteFolder
	#safeScriptAbsoluteFolder="$(_getScriptAbsoluteFolder)"
	safeScriptAbsoluteFolder="$scriptAbsoluteFolder"
	
	[[ "$1" == "./"* ]] && [[ "$PWD" == "$safeScriptAbsoluteFolder"* ]] && safeToRM="true"
	
	[[ "$1" == "$safeScriptAbsoluteFolder"* ]] && safeToRM="true"
	
	#[[ "$1" == "/home/$USER"* ]] && safeToRM="true"
	[[ "$1" == "/tmp/"* ]] && safeToRM="true"
	
	# WARNING: Allows removal of temporary folders created by current ubiquitous bash session only.
	[[ "$sessionid" != "" ]] && [[ "$1" == *"$sessionid"* ]] && safeToRM="true"
	[[ "$tmpSelf" != "$safeScriptAbsoluteFolder" ]] && [[ "$sessionid" != "" ]] && [[ "$1" == *$(echo "$sessionid" | head -c 16)* ]] && safeToRM="true"
	#[[ "$tmpSelf" != "$safeScriptAbsoluteFolder" ]] && [[ "$1" == "$tmpSelf"* ]] && safeToRM="true"
	
	# ATTENTION: CAUTION: Unusual Cygwin override to accommodate MSW network drive ( at least when provided by '_userVBox' ) !
	# ATTENTION: Search for verbatim warning to find related workarounds!
	if [[ "$scriptAbsoluteFolder" == '/cygdrive/'* ]] && [[ -e /cygdrive ]] && uname -a | grep -i cygwin > /dev/null 2>&1 && [[ "$scriptAbsoluteFolder" != '/cygdrive/c'* ]] && [[ "$scriptAbsoluteFolder" != '/cygdrive/C'* ]]
	then
		if [[ "$tmpSelf" != "$safeScriptAbsoluteFolder" ]] && [[ "$tmpSelf" != "" ]] && [[ "$tmpSelf" == "/cygdrive/"* ]] && [[ "$tmpSelf" == "$tmpMSW"* ]]
		then
			safeToRM="true"
		fi
	fi
	
	
	[[ "$safeToRM" == "false" ]] && return 1
	
	#Safeguards/
	[[ "$safeToDeleteGit" != "true" ]] && [[ -d "$1" ]] && [[ -e "$1" ]] && find "$1" 2>/dev/null | grep -i '\.git$' >/dev/null 2>&1 && return 1
	
	#Validate necessary tools were available for path building and checks.
	#! type realpath > /dev/null 2>&1 && return 1
	! type readlink > /dev/null 2>&1 && return 1
	! type dirname > /dev/null 2>&1 && return 1
	! type basename > /dev/null 2>&1 && return 1
	
	if [[ -e "$1" ]]
	then
		#sleep 0
		#echo "$1"
		# WARNING Recommend against adding any non-portable flags.
		rm -rf "$1" > /dev/null 2>&1
	fi
}

#Portable sanity checking for less, but, dangerous, commands.
# WARNING Not foolproof. Use to guard against systematic errors, not carelessness.
# WARNING Do NOT rely upon outside of internal programmatic usage inside script!
#"$1" == file/directory path to sanity check
_safePath() {
	! type _getAbsolute_criticalDep > /dev/null 2>&1 && return 1
	! _getAbsolute_criticalDep && return 1
	
	[[ ! -e "$scriptAbsoluteLocation" ]] && return 1
	[[ ! -e "$scriptAbsoluteFolder" ]] && return 1
	_failExec || return 1
	
	#if [[ ! -e "$0" ]]
	#then
	#	return 1
	#fi
	
	if [[ "$1" == "" ]]
	then
		return 1
	fi
	
	if [[ "$1" == "/" ]]
	then
		return 1
	fi
	
	if [[ "$1" == "-"* ]]
	then
		return 1
	fi
	
	#Denylist.
	[[ "$1" == "/home" ]] && return 1
	[[ "$1" == "/home/" ]] && return 1
	[[ "$1" == "/home/$USER" ]] && return 1
	[[ "$1" == "/home/$USER/" ]] && return 1
	[[ "$1" == "/$USER" ]] && return 1
	[[ "$1" == "/$USER/" ]] && return 1
	
	[[ "$1" == "/tmp" ]] && return 1
	[[ "$1" == "/tmp/" ]] && return 1
	
	[[ "$1" == "$HOME" ]] && return 1
	[[ "$1" == "$HOME/" ]] && return 1
	
	#Allowlist.
	local safeToRM=false
	
	local safeScriptAbsoluteFolder
	#safeScriptAbsoluteFolder="$(_getScriptAbsoluteFolder)"
	safeScriptAbsoluteFolder="$scriptAbsoluteFolder"
	
	[[ "$1" == "./"* ]] && [[ "$PWD" == "$safeScriptAbsoluteFolder"* ]] && safeToRM="true"
	
	[[ "$1" == "$safeScriptAbsoluteFolder"* ]] && safeToRM="true"
	
	#[[ "$1" == "/home/$USER"* ]] && safeToRM="true"
	[[ "$1" == "/tmp/"* ]] && safeToRM="true"
	
	# WARNING: Allows removal of temporary folders created by current ubiquitous bash session only.
	[[ "$sessionid" != "" ]] && [[ "$1" == *"$sessionid"* ]] && safeToRM="true"
	[[ "$tmpSelf" != "$safeScriptAbsoluteFolder" ]] && [[ "$sessionid" != "" ]] && [[ "$1" == *$(echo "$sessionid" | head -c 16)* ]] && safeToRM="true"
	#[[ "$tmpSelf" != "$safeScriptAbsoluteFolder" ]] && [[ "$1" == "$tmpSelf"* ]] && safeToRM="true"
	
	
	# ATTENTION: CAUTION: Unusual Cygwin override to accommodate MSW network drive ( at least when provided by '_userVBox' ) !
	# ATTENTION: Search for verbatim warning to find related workarounds!
	if [[ "$scriptAbsoluteFolder" == '/cygdrive/'* ]] && [[ -e /cygdrive ]] && uname -a | grep -i cygwin > /dev/null 2>&1 && [[ "$scriptAbsoluteFolder" != '/cygdrive/c'* ]] && [[ "$scriptAbsoluteFolder" != '/cygdrive/C'* ]]
	then
		if [[ "$tmpSelf" != "$safeScriptAbsoluteFolder" ]] && [[ "$tmpSelf" != "" ]] && [[ "$tmpSelf" == "/cygdrive/"* ]] && [[ "$tmpSelf" == "$tmpMSW"* ]]
		then
			safeToRM="true"
		fi
	fi
	
	
	[[ "$safeToRM" == "false" ]] && return 1
	
	#Safeguards/
	[[ "$safeToDeleteGit" != "true" ]] && [[ -d "$1" ]] && [[ -e "$1" ]] && find "$1" 2>/dev/null | grep -i '\.git$' >/dev/null 2>&1 && return 1
	
	#Validate necessary tools were available for path building and checks.
	#! type realpath > /dev/null 2>&1 && return 1
	! type readlink > /dev/null 2>&1 && return 1
	! type dirname > /dev/null 2>&1 && return 1
	! type basename > /dev/null 2>&1 && return 1
	
	if [[ -e "$1" ]]
	then
		#sleep 0
		#echo "$1"
		# WARNING Recommend against adding any non-portable flags.
		return 0
	fi
}

# DANGER Last line of defense against catastrophic errors when using "delete" flag with rsync or similar!
_safeBackup() {
	! type _getAbsolute_criticalDep > /dev/null 2>&1 && return 1
	! _getAbsolute_criticalDep && return 1
	
	[[ ! -e "$scriptAbsoluteLocation" ]] && return 1
	[[ ! -e "$scriptAbsoluteFolder" ]] && return 1
	
	#Fail sooner, avoiding irrelevant error messages. Especially important to cases where an upstream process has already removed the "$safeTmp" directory of a downstream process which reaches "_stop" later.
	! [[ -e "$1" ]] && return 1
	
	[[ "$1" == "" ]] && return 1
	[[ "$1" == "/" ]] && return 1
	[[ "$1" == "-"* ]] && return 1
	
	[[ "$1" == "/home" ]] && return 1
	[[ "$1" == "/home/" ]] && return 1
	[[ "$1" == "/home/$USER" ]] && return 1
	[[ "$1" == "/home/$USER/" ]] && return 1
	[[ "$1" == "/$USER" ]] && return 1
	[[ "$1" == "/$USER/" ]] && return 1
	
	[[ "$1" == "/root" ]] && return 1
	[[ "$1" == "/root/" ]] && return 1
	[[ "$1" == "/root/$USER" ]] && return 1
	[[ "$1" == "/root/$USER/" ]] && return 1
	[[ "$1" == "/$USER" ]] && return 1
	[[ "$1" == "/$USER/" ]] && return 1
	
	[[ "$1" == "/tmp" ]] && return 1
	[[ "$1" == "/tmp/" ]] && return 1
	
	[[ "$1" == "$HOME" ]] && return 1
	[[ "$1" == "$HOME/" ]] && return 1
	
	! type realpath > /dev/null 2>&1 && return 1
	! type readlink > /dev/null 2>&1 && return 1
	! type dirname > /dev/null 2>&1 && return 1
	! type basename > /dev/null 2>&1 && return 1
	
	return 0
}

# DANGER Last line of defense against catastrophic errors when using "delete" flag with rsync or similar!
# WARNING Intended for direct copy/paste inclusion into independent launch wrapper scripts. Kept here for redundancy as well as example and maintenance.
_command_safeBackup() {
	! type _command_getAbsolute_criticalDep > /dev/null 2>&1 && return 1
	! _command_getAbsolute_criticalDep && return 1
	
	[[ ! -e "$commandScriptAbsoluteLocation" ]] && return 1
	[[ ! -e "$commandScriptAbsoluteFolder" ]] && return 1
	
	#Fail sooner, avoiding irrelevant error messages. Especially important to cases where an upstream process has already removed the "$safeTmp" directory of a downstream process which reaches "_stop" later.
	! [[ -e "$1" ]] && return 1
	
	[[ "$1" == "" ]] && return 1
	[[ "$1" == "/" ]] && return 1
	[[ "$1" == "-"* ]] && return 1
	
	[[ "$1" == "/home" ]] && return 1
	[[ "$1" == "/home/" ]] && return 1
	[[ "$1" == "/home/$USER" ]] && return 1
	[[ "$1" == "/home/$USER/" ]] && return 1
	[[ "$1" == "/$USER" ]] && return 1
	[[ "$1" == "/$USER/" ]] && return 1
	
	[[ "$1" == "/root" ]] && return 1
	[[ "$1" == "/root/" ]] && return 1
	[[ "$1" == "/root/$USER" ]] && return 1
	[[ "$1" == "/root/$USER/" ]] && return 1
	[[ "$1" == "/$USER" ]] && return 1
	[[ "$1" == "/$USER/" ]] && return 1
	
	[[ "$1" == "/tmp" ]] && return 1
	[[ "$1" == "/tmp/" ]] && return 1
	
	[[ "$1" == "$HOME" ]] && return 1
	[[ "$1" == "$HOME/" ]] && return 1
	
	#! type realpath > /dev/null 2>&1 && return 1
	! type readlink > /dev/null 2>&1 && return 1
	! type dirname > /dev/null 2>&1 && return 1
	! type basename > /dev/null 2>&1 && return 1
	
	return 0
}




# Equivalent to 'mv -n' with an error exit status if file cannot be overwritten.
# https://unix.stackexchange.com/questions/248544/mv-move-file-only-if-destination-does-not-exist
_moveconfirm() {
	local currentExitStatusText
	currentExitStatusText=$(mv -vn "$1" "$2" 2>/dev/null)
	[[ "$currentExitStatusText" == "" ]] && return 1
	return 0
}


_test_moveconfirm_procedure() {
	echo > "$safeTmp"/mv_src
	echo > "$safeTmp"/mv_dst
	
	_moveconfirm "$safeTmp"/mv_src "$safeTmp"/mv_dst && return 1
	
	rm -f "$safeTmp"/mv_dst
	! _moveconfirm "$safeTmp"/mv_src "$safeTmp"/mv_dst && return 1
	
	rm -f "$safeTmp"/mv_dst
	
	return 0
}

_test_moveconfirm_sequence() {
	_start
	
	if ! _test_moveconfirm_procedure "$@"
	then
		_stop 1
	fi
	
	_stop
}

_test_moveconfirm() {
	"$scriptAbsoluteLocation" _test_moveconfirm_sequence "$@"
}


_all_exist() {
	local currentArg
	for currentArg in "$@"
	do
		! [[ -e "$currentArg" ]] && return 1
	done
	
	return 0
}

_wait_not_all_exist() {
	while ! _all_exist "$@"
	do
		sleep 0.1
	done
}

#http://stackoverflow.com/questions/687948/timeout-a-command-in-bash-without-unnecessary-delay
_timeout() { ( set +b; sleep "$1" & "${@:2}" & wait -n; r=$?; kill -9 `jobs -p`; exit $r; ) } 

_terminate() {
	local processListFile
	processListFile="$tmpSelf"/.pidlist_$(_uid)
	
	local currentPID
	
	cat "$safeTmp"/.pid >> "$processListFile" 2> /dev/null
	
	while read -r currentPID
	do
		pkill -P "$currentPID"
		kill "$currentPID"
	done < "$processListFile"
	
	rm "$processListFile"
}

_terminateMetaHostAll() {
	! ls -d -1 ./.m_*/.pid > /dev/null 2>&1 && return 0
	
	local processListFile
	processListFile="$tmpSelf"/.pidlist_$(_uid)
	
	local currentPID
	
	cat ./.m_*/.pid >> "$processListFile" 2> /dev/null
	
	while read -r currentPID
	do
		pkill -P "$currentPID"
		kill "$currentPID"
	done < "$processListFile"
	
	rm "$processListFile"
	
	! ls -d -1 ./.m_*/.pid > /dev/null 2>&1 && return 0
	sleep 0.3
	! ls -d -1 ./.m_*/.pid > /dev/null 2>&1 && return 0
	sleep 1
	! ls -d -1 ./.m_*/.pid > /dev/null 2>&1 && return 0
	sleep 3
	! ls -d -1 ./.m_*/.pid > /dev/null 2>&1 && return 0
	sleep 10
	! ls -d -1 ./.m_*/.pid > /dev/null 2>&1 && return 0
	sleep 20
	! ls -d -1 ./.m_*/.pid > /dev/null 2>&1 && return 0
	sleep 20
	! ls -d -1 ./.m_*/.pid > /dev/null 2>&1 && return 0
	sleep 20
	! ls -d -1 ./.m_*/.pid > /dev/null 2>&1 && return 0
	
	return 1
}

_terminateAll() {
	_terminateMetaHostAll
	
	local processListFile
	processListFile="$tmpSelf"/.pidlist_$(_uid)
	
	local currentPID
	
	
	cat ./.s_*/.pid >> "$processListFile" 2> /dev/null
	
	cat ./.e_*/.pid >> "$processListFile" 2> /dev/null
	cat ./.m_*/.pid >> "$processListFile" 2> /dev/null
	
	cat ./w_*/.pid >> "$processListFile" 2> /dev/null
	
	while read -r currentPID
	do
		pkill -P "$currentPID"
		kill "$currentPID"
	done < "$processListFile"
	
	rm "$processListFile"
}

_condition_lines_zero() {
	local currentLineCount
	currentLineCount=$(wc -l)
	
	[[ "$currentLineCount" == 0 ]] && return 0
	return 1
}

#Generates semi-random alphanumeric characters, default length 18.
_uid() {
	local curentLengthUID
	local currentIteration
	currentIteration=0
	
	currentLengthUID="18"
	! [[ -z "$uidLengthPrefix" ]] && ! [[ "$uidLengthPrefix" -lt "18" ]] && currentLengthUID="$uidLengthPrefix"
	! [[ -z "$1" ]] && currentLengthUID="$1"
	
	if [[ -z "$uidLengthPrefix" ]] && [[ -z "$1" ]]
	then
		# https://stackoverflow.com/questions/32484504/using-random-to-generate-a-random-string-in-bash
		# https://www.cyberciti.biz/faq/unix-linux-iterate-over-a-variable-range-of-numbers-in-bash/
		#chars=abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ
		chars=bgjktwxyz23679BGJKTVWXYZ
		#for currentIteration in {1..$currentLengthUID} ; do
		for (( currentIteration=1; currentIteration<="$currentLengthUID"; currentIteration++ )) ; do
		echo -n "${chars:RANDOM%${#chars}:1}"
		done
		echo
	else
		cat /dev/urandom 2> /dev/null | base64 2> /dev/null | tr -dc 'a-zA-Z0-9' 2> /dev/null | tr -d 'acdefhilmnopqrsuvACDEFHILMNOPQRSU14580' | head -c "$currentLengthUID" 2> /dev/null
	fi
	return 0
}

# WARNING: Reduces uniqueness, irreversible. Multiple input characters result in same output character.
_filter_random() {
	tr 'a-z' 'bgjktwxyz''bgjktwxyz''bgjktwxyz' | tr 'A-Z' 'BGJKTVWXYZ''BGJKTVWXYZ''BGJKTVWXYZ' | tr '0-9' '23679''23679''23679' | tr -dc 'bgjktwxyz23679BGJKTVWXYZ'
}

# WARNING: Reduces uniqueness, irreversible. Multiple input characters result in same output character.
# WARNING: Not recommended for short strings (ie. not recommended for '8.3' compatibility ).
_filter_hex() {
	tr 'a-z' 'bcdf''bcdf''bcdf''bcdf''bcdf''bcdf''bcdf''bcdf' | tr 'A-Z' 'BCDF''BCDF''BCDF''BCDF''BCDF''BCDF''BCDF''BCDF' | tr '0-9' '23679''23679''23679' | tr -dc 'bcdf23679BCDF'
}

_compat_stat_c_run() {
	local functionOutput
	
	functionOutput=$(stat -c "$@" 2> /dev/null)
	[[ "$?" == "0" ]] && echo "$functionOutput" && return 0
	
	#BSD
	if stat --help 2>&1 | grep '\-f ' > /dev/null 2>&1
	then
		functionOutput=$(stat -f "$@" 2> /dev/null)
		[[ "$?" == "0" ]] && echo "$functionOutput" && return 0
	fi
	
	return 1
}

_permissions_directory_checkForPath() {
	local parameterAbsoluteLocation
	parameterAbsoluteLocation=$(_getAbsoluteLocation "$1")
	
	local checkScriptAbsoluteFolder="$(_getScriptAbsoluteFolder)"
	
	[[ "$parameterAbsoluteLocation" == "$PWD" ]] && ! [[ "$parameterAbsoluteLocation" == "$checkScriptAbsoluteFolder" ]] && return 1
	
	
	
	local currentParameter
	currentParameter="$1"
	
	[[ "$scriptAbsoluteFolder" == /media/"$USER"* ]] && [[ -e /media/"$USER" ]] && currentParameter=/media/"$USER"
	[[ "$scriptAbsoluteFolder" == /mnt/"$USER"* ]] && [[ -e /mnt/"$USER" ]] && currentParameter=/mnt/"$USER"
	[[ "$scriptAbsoluteFolder" == /var/run/media/"$USER"* ]] && [[ -e /var/run/media/"$USER" ]] && currentParameter=/var/run/media/"$USER"
	[[ "$scriptAbsoluteFolder" == /run/"$USER"* ]] && [[ -e /run/"$USER" ]] && currentParameter=/run/"$USER"
	
	local permissions_readout=$(_compat_stat_c_run "%a" "$currentParameter")
	
	local permissions_user
	local permissions_group
	local permissions_other
	
	permissions_user=$(echo "$permissions_readout" | cut -c 1)
	permissions_group=$(echo "$permissions_readout" | cut -c 2)
	permissions_other=$(echo "$permissions_readout" | cut -c 3)
	
	[[ "$permissions_user" -gt "7" ]] && return 1
	[[ "$permissions_group" -gt "7" ]] && return 1
	[[ "$permissions_other" -gt "5" ]] && return 1
	
	#Above checks considered sufficient in typical cases, remainder for sake of example. Return true (safe).
	return 0
	
	local permissions_uid
	local permissions_gid
	
	permissions_uid=$(_compat_stat_c_run "%u" "$currentParameter")
	permissions_gid=$(_compat_stat_c_run "%g" "$currentParameter")
	
	#Normally these variables are available through ubiqutious bash, but this permissions check may be needed earlier in that global variables setting process.
	local permissions_host_uid
	local permissions_host_gid
	
	permissions_host_uid=$(id -u)
	permissions_host_gid=$(id -g)
	
	[[ "$permissions_uid" != "$permissions_host_uid" ]] && return 1
	[[ "$permissions_uid" != "$permissions_host_gid" ]] && return 1
	
	return 0
}

#Checks whether the repository has unsafe permissions for adding binary files to path. Used as an extra safety check by "_setupUbiquitous" before adding a hook to the user's default shell environment.
_permissions_ubiquitous_repo() {
	local parameterAbsoluteLocation
	parameterAbsoluteLocation=$(_getAbsoluteLocation "$1")
	
	[[ ! -e "$parameterAbsoluteLocation" ]] && return 0
	
	! _permissions_directory_checkForPath "$parameterAbsoluteLocation" && return 1
	
	[[ -e "$parameterAbsoluteLocation"/_bin ]] && ! _permissions_directory_checkForPath "$parameterAbsoluteLocation"/_bin && return 1
	[[ -e "$parameterAbsoluteLocation"/_bundle ]] && ! _permissions_directory_checkForPath "$parameterAbsoluteLocation"/_bundle && return 1
	
	return 0
}

_test_permissions_ubiquitous-cygwin() {
	! _if_cygwin && _stop 1
	#! _if_cygwin && _stop "$1"
	
	_if_cygwin && echo 'warn: accepted: cygwin: permissions' && return 0
}

#Checks whether currently set "$scriptBin" and similar locations are actually safe.
# WARNING Keep in mind this is necessarily run only after PATH would already have been modified, and does not guard against threats already present on the local machine.
_test_permissions_ubiquitous() {
	[[ ! -e "$scriptAbsoluteFolder" ]] && _stop 1
	
	! _permissions_directory_checkForPath "$scriptAbsoluteFolder" && _test_permissions_ubiquitous-cygwin 1
	
	[[ -e "$scriptBin" ]] && ! _permissions_directory_checkForPath "$scriptBin" && _test_permissions_ubiquitous-cygwin 1
	[[ -e "$scriptBundle" ]] && ! _permissions_directory_checkForPath "$scriptBundle" && _test_permissions_ubiquitous-cygwin 1
	
	return 0
}



#Takes "$@". Places in global array variable "globalArgs".
# WARNING Adding this globalvariable to the "structure/globalvars.sh" declaration or similar to be overridden at script launch is not recommended.
#"${globalArgs[@]}"
_gather_params() {
	export globalArgs=("${@}")
}

_self_critial() {
	_priority_critical_pid "$$"
}

_self_interactive() {
	_priority_interactive_pid "$$"
}

_self_background() {
	_priority_background_pid "$$"
}

_self_idle() {
	_priority_idle_pid "$$"
}

_self_app() {
	_priority_app_pid "$$"
}

_self_zero() {
	_priority_zero_pid "$$"
}


#Example.
_priority_critical() {
	_priority_dispatch "_priority_critical_pid"
}

_priority_critical_pid_root() {
	! _wantSudo && return 1
	
	sudo -n ionice -c 2 -n 2 -p "$1"
	! sudo -n renice -15 -p "$1" && return 1
	
	return 0
}

_priority_critical_pid() {
	[[ "$1" == "" ]] && return 1
	
	_priority_critical_pid_root "$1" && return 0
	
	ionice -c 2 -n 4 -p "$1"
	! renice 0 -p "$1" && return 1
	
	return 1
}

_priority_interactive_pid_root() {
	! _wantSudo && return 1
	
	sudo -n ionice -c 2 -n 2 -p "$1"
	! sudo -n renice -10 -p "$1" && return 1
	
	return 0
}

_priority_interactive_pid() {
	[[ "$1" == "" ]] && return 1
	
	_priority_interactive_pid_root "$1" && return 0
	
	ionice -c 2 -n 4 -p "$1"
	! renice 0 -p "$1" && return 1
	
	return 1
}

_priority_app_pid_root() {
	! _wantSudo && return 1
	
	sudo -n ionice -c 2 -n 3 -p "$1"
	! sudo -n renice -5 -p "$1" && return 1
	
	return 0
}

_priority_app_pid() {
	[[ "$1" == "" ]] && return 1
	
	_priority_app_pid_root "$1" && return 0
	
	ionice -c 2 -n 4 -p "$1"
	! renice 0 -p "$1" && return 1
	
	return 1
}

_priority_background_pid_root() {
	! _wantSudo && return 1
	
	sudo -n ionice -c 2 -n 5 -p "$1"
	! sudo -n renice +5 -p "$1" && return 1
	
	return 0
}

_priority_background_pid() {
	[[ "$1" == "" ]] && return 1
	
	if ! type ionice > /dev/null 2>&1 || ! groups | grep -E 'wheel|sudo' > /dev/null 2>&1
	then
		renice +5 -p "$1"
		return 0
	fi
	
	_priority_background_pid_root "$1" && return 0
	
	ionice -c 2 -n 5 -p "$1"
	
	renice +5 -p "$1"
}



_priority_idle_pid_root() {
	! _wantSudo && return 1
	
	sudo -n ionice -c 3 -p "$1"
	! sudo -n renice +15 -p "$1" && return 1
	
	return 0
}

_priority_idle_pid() {
	[[ "$1" == "" ]] && return 1
	
	if ! type ionice > /dev/null 2>&1 || ! groups | grep -E 'wheel|sudo' > /dev/null 2>&1
	then
		renice +15 -p "$1"
		return 0
	fi
	
	_priority_idle_pid_root "$1" && return 0
	
	#https://linux.die.net/man/1/ionice
	ionice -c 3 -p "$1"
	
	renice +15 -p "$1"
}

_priority_zero_pid_root() {
	! _wantSudo && return 1
	
	sudo -n ionice -c 2 -n 4 -p "$1"
	! sudo -n renice 0 -p "$1" && return 1
	
	return 0
}

_priority_zero_pid() {
	[[ "$1" == "" ]] && return 1
	
	_priority_zero_pid_root "$1" && return 0
	
	#https://linux.die.net/man/1/ionice
	ionice -c 2 -n 4 -p "$1"
	
	renice 0 -p "$1"
}

# WARNING: Untested.
_priority_dispatch() {
	local processListFile
	processListFile="$tmpSelf"/.pidlist_$(_uid)
	
	echo "$1" >> "$processListFile"
	pgrep -P "$1" 2>/dev/null >> "$processListFile"
	
	local currentPID
	
	while read -r currentPID
	do
		"$@" "$currentPID"
	done < "$processListFile"
	
	rm "$processListFile"
}

# WARNING: Untested.
_priority_enumerate_pid() {
	[[ "$1" == "" ]] && return 1
	
	echo "$1"
	pgrep -P "$1" 2>/dev/null
}

_priority_enumerate_pattern() {
	local processListFile
	processListFile="$tmpSelf"/.pidlist_$(_uid)
	
	echo -n >> "$processListFile"
	
	pgrep "$1" >> "$processListFile"
	
	
	local parentListFile
	parentListFile="$tmpSelf"/.pidlist_$(_uid)
	
	echo -n >> "$parentListFile"
	
	local currentPID
	
	while read -r currentPID
	do
		pgrep -P "$currentPID" 2>/dev/null > "$parentListFile"
	done < "$processListFile"
	
	cat "$processListFile"
	cat "$parentListFile"
	
	
	rm "$processListFile"
	rm "$parentListFile"
}

# DANGER: Best practice is to call as with trailing slashes and source trailing dot .
# _instance_internal /root/source/. /root/destination/
# _instance_internal "$1"/. "$actualFakeHome"/"$2"/
# DANGER: Do not silence output unless specifically required (eg. links, possibly to directories, intended not to overwrite copies).
# _instance_internal "$globalFakeHome"/. "$actualFakeHome"/ > /dev/null 2>&1
_instance_internal() {
	! [[ -e "$1" ]] && return 1
	! [[ -d "$1" ]] && return 1
	! [[ -e "$2" ]] && return 1
	! [[ -d "$2" ]] && return 1
	rsync -q -ax --exclude "/.cache" --exclude "/.git" --exclude ".git" "$@"
}

#echo -n
_safeEcho() {
	printf '%s' "$1"
	shift
	
	[[ "$@" == "" ]] && return 0
	
	local currentArg
	for currentArg in "$@"
	do
		printf '%s' " "
		printf '%s' "$currentArg"
	done
	return 0
}

#echo
_safeEcho_newline() {
	_safeEcho "$@"
	printf '\n'
}

_safeEcho_quoteAddSingle() {
	# https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_09_07.html
	while (( "$#" )); do
		_safeEcho ' '"'""$1""'"
		shift
	done
}
_safeEcho_quoteAddSingle_newline() {
	_safeEcho_quoteAddSingle "$@"
	printf '\n'
}

_safeEcho_quoteAddDouble() {
	#https://stackoverflow.com/questions/1668649/how-to-keep-quotes-in-bash-arguments
	
	local currentCommandStringPunctuated
	local currentCommandStringParameter
	for currentCommandStringParameter in "$@"; do
		currentCommandStringParameter="${currentCommandStringParameter//\\/\\\\}"
		currentCommandStringPunctuated="$currentCommandStringPunctuated \"${currentCommandStringParameter//\"/\\\"}\""
	done
	
	_safeEcho "$currentCommandStringPunctuated"
}
_safeEcho_quoteAddDouble_newline() {
	_safeEcho_quoteAddDouble "$@"
	printf '\n'
}


#Universal debugging filesystem.
#End user function.
_user_log() {
	# DANGER Do NOT create automatically, or reference any existing directory!
	! [[ -d "$HOME"/.ubcore/userlog ]] && cat - > /dev/null 2>&1 && return 0
	
	cat - >> "$HOME"/.ubcore/userlog/user.log
	
	return 0
}

_monitor_user_log() {
	! [[ -d "$HOME"/.ubcore/userlog ]] && return 1
	
	tail -f "$HOME"/.ubcore/userlog/*
}

#Universal debugging filesystem.
#"generic/ubiquitousheader.sh"
_user_log-ub() {
	# DANGER Do NOT create automatically, or reference any existing directory!
	! [[ -d "$HOME"/.ubcore/userlog ]] && cat - > /dev/null 2>&1 && return 0
	
	#Terminal session may be used - the sessionid may be set through .bashrc/.ubcorerc .
	if [[ "$sessionid" != "" ]]
	then
		cat - >> "$HOME"/.ubcore/userlog/u-"$sessionid".log
		return 0
	fi
	cat - >> "$HOME"/.ubcore/userlog/u-undef.log
	
	return 0
}

_monitor_user_log-ub() {
	! [[ -d "$HOME"/.ubcore/userlog ]] && return 1
	
	tail -f "$HOME"/.ubcore/userlog/u-*
}

#Universal debugging filesystem.
_user_log_anchor() {
	# DANGER Do NOT create automatically, or reference any existing directory!
	! [[ -d "$HOME"/.ubcore/userlog ]] && cat - > /dev/null 2>&1 && return 0
	
	#Terminal session may be used - the sessionid may be set through .bashrc/.ubcorerc .
	if [[ "$sessionid" != "" ]]
	then
		cat - >> "$HOME"/.ubcore/userlog/a-"$sessionid".log
		return 0
	fi
	cat - >> "$HOME"/.ubcore/userlog/a-undef.log
	
	return 0
}

_monitor_user_log_anchor() {
	! [[ -d "$HOME"/.ubcore/userlog ]] && return 1
	
	tail -f "$HOME"/.ubcore/userlog/a-*
}

#Universal debugging filesystem.
_user_log_template() {
	# DANGER Do NOT create automatically, or reference any existing directory!
	! [[ -d "$HOME"/.ubcore/userlog ]] && cat - > /dev/null 2>&1 && return 0
	
	#Terminal session may be used - the sessionid may be set through .bashrc/.ubcorerc .
	if [[ "$sessionid" != "" ]]
	then
		cat - >> "$HOME"/.ubcore/userlog/t-"$sessionid".log
		return 0
	fi
	cat - >> "$HOME"/.ubcore/userlog/t-undef.log
	
	return 0
}

# https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
_messageColors-common() {
	echo -e '\E[1;37m ' \''\\E[1;37m'\' white \''\\E[0m'\' ' \E[0m'
	echo -e '\E[0;30m ' \''\\E[0;30m'\' black \''\\E[0m'\' ' \E[0m'
	
	echo -e '\E[0;34m ' \''\\E[0;34m'\' blue \''\\E[0m'\' ' \E[0m'
	echo -e '\E[1;34m ' \''\\E[1;34m'\' blue_light \''\\E[0m'\' ' \E[0m'
	echo -e '\E[0;32m ' \''\\E[0;32m'\' green \''\\E[0m'\' ' \E[0m'
	echo -e '\E[1;32m ' \''\\E[1;32m'\' green_light \''\\E[0m'\' ' \E[0m'
	echo -e '\E[0;36m ' \''\\E[0;36m'\' cyan \''\\E[0m'\' ' \E[0m'
	echo -e '\E[1;36m ' \''\\E[1;36m'\' cyan_light \''\\E[0m'\' ' \E[0m'
	echo -e '\E[0;31m ' \''\\E[0;31m'\' red \''\\E[0m'\' ' \E[0m'
	echo -e '\E[1;31m ' \''\\E[1;31m'\' red_light \''\\E[0m'\' ' \E[0m'
	echo -e '\E[0;35m ' \''\\E[0;35m'\' purple \''\\E[0m'\' ' \E[0m'
	echo -e '\E[1;35m ' \''\\E[1;35m'\' purple_light \''\\E[0m'\' ' \E[0m'
	echo -e '\E[0;33m ' \''\\E[0;33m'\' brown \''\\E[0m'\' ' \E[0m'
	echo -e '\E[1;33m ' \''\\E[1;33m'\' yellow \''\\E[0m'\' ' \E[0m'
	
	echo -e '\E[0;30m ' \''\\E[0;30m'\' gray \''\\E[0m'\' ' \E[0m'
	echo -e '\E[1;37m ' \''\\E[1;37m'\' gray_light \''\\E[0m'\' ' \E[0m'
	return 0
}

# https://dev.to/ifenna__/adding-colors-to-bash-scripts-48g4
# Color		Foreground Code		Background Code
# Black			30	40
# Red			31	41
# Green			32	42
# Yellow		33	43
# Blue			34	44
# Magenta		35	45
# Cyan			36	46
# Light Gray		37	47
# Gray			90	100
# Light Red		91	101
# Light Green		92	102
# Light Yellow		93	103
# Light Blue		94	104
# Light Magenta		95	105
# Light Cyan		96	106
# White			97	107
_messageColors-extra() {
	local currentIterationA
	local currentIterationB
	
	for (( currentIterationA=30; currentIterationA<="37"; currentIterationA++ )) ; do
		echo -e '\033[0;'"$currentIterationA"'m ''\\033[0;'"$currentIterationA"'m 'message' \\033[0m'' \033[0m'
		echo -e '\033[1;'"$currentIterationA"'m ''\\033[1;'"$currentIterationA"'m 'message' \\033[0m'' \033[0m'
	done
	
	for (( currentIterationA=90; currentIterationA<="97"; currentIterationA++ )) ; do
		echo -e '\033[0;'"$currentIterationA"'m ''\\033[0;'"$currentIterationA"'m 'message' \\033[0m'' \033[0m'
		echo -e '\033[1;'"$currentIterationA"'m ''\\033[1;'"$currentIterationA"'m 'message' \\033[0m'' \033[0m'
	done
	
	
	
	currentIterationB=37
	for (( currentIterationA=40; currentIterationA<="46"; currentIterationA++ )) ; do
		echo -e '\033[0;'"$currentIterationB"';'"$currentIterationA"'m ' '\\033[0;'"$currentIterationB"';'"$currentIterationA"'m ' message ' \\033[0m' ' \033[0m'
	done
	currentIterationA=47
	currentIterationB=30
	echo -e '\033[0;'"$currentIterationB"';'"$currentIterationA"'m ' '\\033[0;'"$currentIterationB"';'"$currentIterationA"'m ' message ' \\033[0m' ' \033[0m'
	
	currentIterationB=37
	for (( currentIterationA=100; currentIterationA<="107"; currentIterationA++ )) ; do
		echo -e '\033[0;'"$currentIterationB"';'"$currentIterationA"'m ' '\\033[0;'"$currentIterationB"';'"$currentIterationA"'m ' message ' \\033[0m' ' \033[0m'
	done
}

_messageColors-all() {
	local currentIterationA
	local currentIterationB
	
	for (( currentIterationB=30; currentIterationB<="37"; currentIterationB++ )) ; do
		for (( currentIterationA=40; currentIterationA<="47"; currentIterationA++ )) ; do
			echo -e '\033[0;'"$currentIterationB"';'"$currentIterationA"'m ' '\\033[0;'"$currentIterationB"';'"$currentIterationA"'m ' message ' \\033[0m' ' \033[0m'
			echo -e '\033[1;'"$currentIterationB"';'"$currentIterationA"'m ' '\\033[0;'"$currentIterationB"';'"$currentIterationA"'m ' message ' \\033[0m' ' \033[0m'
		done
	done
	
	for (( currentIterationB=90; currentIterationB<="97"; currentIterationB++ )) ; do
		for (( currentIterationA=100; currentIterationA<="107"; currentIterationA++ )) ; do
			echo -e '\033[0;'"$currentIterationB"';'"$currentIterationA"'m ' '\\033[0;'"$currentIterationB"';'"$currentIterationA"'m ' message ' \\033[0m' ' \033[0m'
			echo -e '\033[1;'"$currentIterationB"';'"$currentIterationA"'m ' '\\033[0;'"$currentIterationB"';'"$currentIterationA"'m ' message ' \\033[0m' ' \033[0m'
		done
	done
}

_messageColors() {
	clear
	_messageColors-common "$@"
	echo
	echo '##########'
	echo
	_messageColors-extra "$@"
	echo
	echo '##########'
	echo
	_messageColors-all "$@"
}


_color_demo() {
	_messagePlain_request _color_demo
	_messagePlain_nominal _color_demo
	_messagePlain_probe _color_demo
	_messagePlain_probe_expr _color_demo
	_messagePlain_probe_var ubiquitousBashIDshort
	_messagePlain_good _color_demo
	_messagePlain_warn _color_demo
	_messagePlain_bad _color_demo
	_messagePlain_probe_cmd echo _color_demo
	_messagePlain_probe_quoteAddDouble echo _color_demo
	_messagePlain_probe_quoteAddSingle echo _color_demo
	_messageNormal _color_demo
	_messageError _color_demo
	_messageDELAYipc _color_demo
	_messageProcess _color_demo
}
_color_end() {
	( [[ "$current_scriptedIllustrator_markup" == "html" ]] || [[ "$current_scriptedIllustrator_markup" == "mediawiki" ]] ) && echo -e -n '</span>'
	[[ "$current_scriptedIllustrator_markup" == "" ]] && echo -e -n ' \E[0m'
}

_color_begin_request() {
	#b218b2
	#848484
	( [[ "$current_scriptedIllustrator_markup" == "html" ]] || [[ "$current_scriptedIllustrator_markup" == "mediawiki" ]] ) && echo -e -n '<span style="color:#b218b2;background-color:#848484;"> '
	[[ "$current_scriptedIllustrator_markup" == "" ]] && echo -e -n '\E[0;35m '
}
_color_begin_nominal() {
	#18b2b2
	#848484
	( [[ "$current_scriptedIllustrator_markup" == "html" ]] || [[ "$current_scriptedIllustrator_markup" == "mediawiki" ]] ) && echo -e -n '<span style="color:#18b2b2;background-color:#848484;"> '
	[[ "$current_scriptedIllustrator_markup" == "" ]] && echo -e -n '\E[0;36m '
}
_color_begin_probe() {
	#1818b2
	#848484
	( [[ "$current_scriptedIllustrator_markup" == "html" ]] || [[ "$current_scriptedIllustrator_markup" == "mediawiki" ]] ) && echo -e -n '<span style="color:#1818b2;background-color:#848484;"> '
	[[ "$current_scriptedIllustrator_markup" == "" ]] && echo -e -n '\E[0;34m '
}
_color_begin_probe_noindent() {
	#1818b2
	#848484
	( [[ "$current_scriptedIllustrator_markup" == "html" ]] || [[ "$current_scriptedIllustrator_markup" == "mediawiki" ]] ) && echo -e -n '<span style="color:#1818b2;background-color:#848484;">'
	[[ "$current_scriptedIllustrator_markup" == "" ]] && echo -e -n '\E[0;34m'
}
_color_begin_good() {
	#17ae17
	#848484
	( [[ "$current_scriptedIllustrator_markup" == "html" ]] || [[ "$current_scriptedIllustrator_markup" == "mediawiki" ]] ) && echo -e -n '<span style="color:#17ae17;background-color:#848484;"> '
	[[ "$current_scriptedIllustrator_markup" == "" ]] && echo -e -n '\E[0;32m '
}
_color_begin_warn() {
	#ffff54
	#848484
	( [[ "$current_scriptedIllustrator_markup" == "html" ]] || [[ "$current_scriptedIllustrator_markup" == "mediawiki" ]] ) && echo -e -n '<span style="color:#ffff54;background-color:#848484;"> '
	[[ "$current_scriptedIllustrator_markup" == "" ]] && echo -e -n '\E[1;33m '
}
_color_begin_bad() {
	#b21818
	#848484
	( [[ "$current_scriptedIllustrator_markup" == "html" ]] || [[ "$current_scriptedIllustrator_markup" == "mediawiki" ]] ) && echo -e -n '<span style="color:#b21818;background-color:#848484;"> '
	[[ "$current_scriptedIllustrator_markup" == "" ]] && echo -e -n '\E[0;31m '
}
_color_begin_Normal() {
	#54ff54
	#18b2b2
	( [[ "$current_scriptedIllustrator_markup" == "html" ]] || [[ "$current_scriptedIllustrator_markup" == "mediawiki" ]] ) && echo -e -n '<span style="color:#54ff54;background-color:#18b2b2;"> '
	[[ "$current_scriptedIllustrator_markup" == "" ]] && echo -e -n '\E[1;32;46m '
}
_color_begin_Error() {
	#ffff54
	#b21818
	( [[ "$current_scriptedIllustrator_markup" == "html" ]] || [[ "$current_scriptedIllustrator_markup" == "mediawiki" ]] ) && echo -e -n '<span style="color:#ffff54;background-color:#b21818;"> '
	[[ "$current_scriptedIllustrator_markup" == "" ]] && echo -e -n '\E[1;33;41m '
}
_color_begin_DELAYipc() {
	#ffff54
	#b2b2b2
	( [[ "$current_scriptedIllustrator_markup" == "html" ]] || [[ "$current_scriptedIllustrator_markup" == "mediawiki" ]] ) && echo -e -n '<span style="color:#ffff54;background-color:#b2b2b2;"> '
	[[ "$current_scriptedIllustrator_markup" == "" ]] && echo -e -n '\E[1;33;47m '
}



#Purple. User must do something manually to proceed. NOT to be used for dependency installation requests - use probe, bad, and fail statements for that.
_messagePlain_request() {
	_color_begin_request
	echo -n "$@"
	_color_end
	echo
	return 0
}

#Cyan. Harmless status messages.
#"generic/ubiquitousheader.sh"
_messagePlain_nominal() {
	_color_begin_nominal
	echo -n "$@"
	_color_end
	echo
	return 0
}

#Blue. Diagnostic instrumentation.
#"generic/ubiquitousheader.sh"
_messagePlain_probe() {
	_color_begin_probe
	#_color_begin_probe_noindent
	echo -n "$@"
	_color_end
	echo
	return 0
}
_messagePlain_probe_noindent() {
	#_color_begin_probe
	_color_begin_probe_noindent
	echo -n "$@"
	_color_end
	echo
	return 0
}

#Blue. Diagnostic instrumentation.
#"generic/ubiquitousheader.sh"
_messagePlain_probe_expr() {
	_color_begin_probe
	echo -e -n "$@"
	_color_end
	echo
	return 0
}

#Blue. Diagnostic instrumentation.
#"generic/ubiquitousheader.sh"
_messagePlain_probe_var() {
	_color_begin_probe
	
	echo -n "$1"'= '
	
	eval echo -e -n \$"$1"
	
	_color_end
	echo
	return 0
}
_messageVar() {
	_messagePlain_probe_var "$@"
}

#Green. Working as expected.
#"generic/ubiquitousheader.sh"
_messagePlain_good() {
	_color_begin_good
	echo -n "$@"
	_color_end
	echo
	return 0
}

#Yellow. May or may not be a problem.
#"generic/ubiquitousheader.sh"
_messagePlain_warn() {
	_color_begin_warn
	echo -n "$@"
	_color_end
	echo
	return 0
}

#Red. Will result in missing functionality, reduced performance, etc, but not necessarily program failure overall.
_messagePlain_bad() {
	_color_begin_bad
	echo -n "$@"
	_color_end
	echo
	return 0
}

#Blue. Diagnostic instrumentation.
#Prints "$@" and runs "$@".
# WARNING: Use with care.
_messagePlain_probe_cmd() {
	_color_begin_probe
	
	_safeEcho "$@"
	
	_color_end
	echo
	
	"$@"
	
	return
}
_messageCMD() {
	_messagePlain_probe_cmd "$@"
}

#Blue. Diagnostic instrumentation.
#Prints "$@" with quotes around every parameter.
_messagePlain_probe_quoteAddDouble() {
	_color_begin_probe
	
	_safeEcho_quoteAddDouble "$@"
	
	_color_end
	echo
	
	return
}
_messagePlain_probe_quoteAdd() {
	_messagePlain_probe_quoteAddDouble "$@"
}

#Blue. Diagnostic instrumentation.
#Prints "$@" with single quotes around every parameter.
_messagePlain_probe_quoteAddSingle() {
	_color_begin_probe
	
	_safeEcho_quoteAddSingle "$@"
	
	_color_end
	echo
	
	return
}

#Blue. Diagnostic instrumentation.
#Prints "$@" and runs "$@".
# WARNING: Use with care.
_messagePlain_probe_cmd_quoteAdd() {
	
	_messagePlain_probe_quoteAdd "$@"
	
	"$@"
	
	return
}
_messageCMD_quoteAdd() {
	_messagePlain_probe_cmd_quoteAdd "$@"
}

#Demarcate major steps.
_messageNormal() {
	_color_begin_Normal
	echo -n "$@"
	_color_end
	echo
	return 0
}

#Demarcate major failures.
_messageError() {
	_color_begin_Error
	echo -n "$@"
	_color_end
	echo
	return 0
}

#Demarcate need to fetch/generate dependency automatically - not a failure condition.
_messageNEED() {
	_messageNormal "NEED"
	#echo " NEED "
}

#Demarcate have dependency already, no need to fetch/generate.
_messageHAVE() {
	_messageNormal "HAVE"
	#echo " HAVE "
}

_messageWANT() {
	_messageNormal "WANT"
	#echo " WANT "
}

#Demarcate where PASS/FAIL status cannot be absolutely proven. Rarely appropriate - usual best practice is to simply progress to the next major step.
_messageDONE() {
	_messageNormal "DONE"
	#echo " DONE "
}

_messagePASS() {
	_messageNormal "PASS"
	#echo " PASS "
}

#Major failure. Program stopped.
_messageFAIL() {
	_messageError "FAIL"
	#echo " FAIL "
	_stop 1
	return 0
}

_messageWARN() {
	echo
	echo "$@"
	return 0
}

# Demarcate *any* delay performed to allow 'InterProcess-Communication' connections (perhaps including at least some network or serial port servers).
_messageDELAYipc() {
	_color_begin_DELAYipc
	echo -e -n 'delay: InterProcess-Communication'
	_color_end
	echo
}


_messageProcess() {
	local processString
	processString="$1""..."
	
	local processStringLength
	processStringLength=${#processString}
	
	local currentIteration
	currentIteration=0
	
	local padLength
	let padLength=40-"$processStringLength"
	
	[[ "$processStringLength" -gt "38" ]] && _messageNormal "$processString" && return 0
	
	_color_begin_Normal
	
	echo -n "$processString"
	
	_color_end
	
	while [[ "$currentIteration" -lt "$padLength" ]]
	do
		echo -e -n ' '
		let currentIteration="$currentIteration"+1
	done
	
	return 0
}

_mustcarry() {
	grep "$1" "$2" > /dev/null 2>&1 && return 0
	
	echo "$1" >> "$2"
	return
}

#Gets filename extension, specifically any last three characters in given string.
#"$1" == filename
_getExt() {
	echo "$1" | tr -dc 'a-zA-Z0-9.' | tr '[:upper:]' '[:lower:]' | tail -c 4
}

#Reports either the directory provided, or the directory of the file provided.
_findDir() {
	local dirIn=$(_getAbsoluteLocation "$1")
	dirInLogical=$(_realpath_L_s "$dirIn")
	
	if [[ -d "$dirInLogical" ]]
	then
		echo "$dirInLogical"
		return
	fi
	
	echo $(_getAbsoluteFolder "$dirInLogical")
	return
	
}

_discoverResource() {
	
	[[ "$scriptAbsoluteFolder" == "" ]] && return 1
	
	local testDir
	testDir="$scriptAbsoluteFolder" ; [[ -e "$testDir"/"$1" ]] && echo "$testDir"/"$1" && return 0
	testDir="$scriptAbsoluteFolder"/.. ; [[ -e "$testDir"/"$1" ]] && echo "$testDir"/"$1" && return 0
	testDir="$scriptAbsoluteFolder"/../.. ; [[ -e "$testDir"/"$1" ]] && echo "$testDir"/"$1" && return 0
	testDir="$scriptAbsoluteFolder"/../../.. ; [[ -e "$testDir"/"$1" ]] && echo "$testDir"/"$1" && return 0
	
	return 1
}

_rmlink() {
	[[ "$1" == "/dev/null" ]] && return 1
	
	#[[ -h "$1" ]] && rm -f "$1" && return 0
	[[ -h "$1" ]] && rm -f "$1" > /dev/null 2>&1
	
	! [[ -e "$1" ]] && return 0
	
	return 1
}

#Like "ln -sf", but will not proceed if target is not link and exists (ie. will not erase files).
_relink_procedure() {
	#Do not update correct symlink.
	local existingLinkTarget
	existingLinkTarget=$(readlink "$2")
	[[ "$existingLinkTarget" == "$1" ]] && return 0
	
	! [[ "$relinkRelativeUb" == "true" ]] && _rmlink "$2" && ln -s "$1" "$2" && return 0
	
	if [[ "$relinkRelativeUb" == "true" ]]
	then
		_rmlink "$2" && ln -s --relative "$1" "$2" && return 0
	fi
	
	return 1
}

_relink() {
	[[ "$2" == "/dev/null" ]] && return 1
	[[ "$relinkRelativeUb" == "true" ]] && export relinkRelativeUb=""
	_relink_procedure "$@"
}

_relink_relative() {
	export relinkRelativeUb=""
	
	[[ "$relinkRelativeUb" != "true" ]] && ln --help 2>/dev/null | grep '\-\-relative' > /dev/null 2>&1 && export relinkRelativeUb="true"
	[[ "$relinkRelativeUb" != "true" ]] && ln 2>&1 | grep '\-\-relative' > /dev/null 2>&1 && export relinkRelativeUb="true"
	[[ "$relinkRelativeUb" != "true" ]] && man ln 2>/dev/null | grep '\-\-relative' > /dev/null 2>&1 && export relinkRelativeUb="true"
	
	_relink_procedure "$@"
	export relinkRelativeUb=""
	unset relinkRelativeUb
}

#Copies files only if source/destination do match. Keeps files in a completely written state as often as possible.
_cpDiff() {
	! diff "$1" "$2" > /dev/null 2>&1 && cp "$1" "$2"
}

_test_channel_fifo() {
	_getDep mkfifo
	
	#if ! dd if=$("$scriptAbsoluteLocation" _channel_host_fifo cat /dev/zero) of=/dev/null bs=1M count=10 iflag=fullblock > /dev/null 2>&1
	if ! dd if=$("$scriptAbsoluteLocation" _channel_host_fifo cat /dev/zero) of=/dev/null bs=10000000 count=10 > /dev/null 2>&1
	then
		echo 'fail: channel: fifo'
		_stop 1
	fi
}

_test_channel() {
	_tryExec "_test_channel_fifo"
}

_set_channel() {
	export channelTmp="$scriptAbsoluteFolder""$tmpPrefix"/.c_"$sessionid"
}

_prepare_channel() {
	mkdir -p "$channelTmp"
}

_stop_channel_allow() {
	export channelStop="true"
}
_stop_channel_prohibit() {
	export channelStop="false"
}

_rm_instance_channel() {
	[[ "$channelStop" != "true" ]] && return 0
	export channelStop="false"
	
	if [[ "$channelTmp" != "" ]] && [[ "$channelTmp" == *"$sessionid"* ]] && [[ -e "$channelTmp" ]]
	then
		_safeRMR "$channelTmp"
		[[ -e "$channelTmp" ]] && sleep 0.1 && _safeRMR "$channelTmp"
		[[ -e "$channelTmp" ]] && sleep 0.3 && _safeRMR "$channelTmp"
		[[ -e "$channelTmp" ]] && sleep 1 && _safeRMR "$channelTmp"
		[[ -e "$channelTmp" ]] && sleep 3 && _safeRMR "$channelTmp"
		[[ -e "$channelTmp" ]] && sleep 3 && _safeRMR "$channelTmp"
		[[ -e "$channelTmp" ]] && sleep 3 && _safeRMR "$channelTmp"
	fi
}

_channel_fifo_example() {
	cat /dev/urandom | base64
}

_channel_fifo_sequence() {
	_stop_channel_allow
	
	"$@" 2>/dev/null > "$commandFIFO"
	
	_rm_instance_channel
}

_channel_host_fifo_sequence() {
	_stop_channel_prohibit
	_set_channel
	_prepare_channel
	
	export commandFIFO="$channelTmp"/cmdfifo
	mkfifo "$commandFIFO"
	
	echo "$commandFIFO"
	
	
	#nohup "$scriptAbsoluteLocation" --embed _channel_fifo_sequence "$@" >/dev/null 2>&1 &
	"$scriptAbsoluteLocation" --embed _channel_fifo_sequence "$@" >/dev/null 2>&1 &
	#disown -h $!
	disown -a -h -r
	disown -a -r
}

# example: dd if=$(./ubiquitous_bash.sh _channel_host_fifo _channel_fifo_example) of=/dev/null
# example: dd if=$(./ubiquitous_bash.sh _channel_host_fifo cat /dev/zero) of=/dev/null bs=1M count=10000 iflag=fullblock
_channel_host_fifo() {
	"$scriptAbsoluteLocation" _channel_host_fifo_sequence "$@"
}


#Waits for the process PID specified by first parameter to end. Useful in conjunction with $! to provide process control and/or PID files. Unlike wait command, does not require PID to be a child of the current shell.
_pauseForProcess() {
	while ps --no-headers -p $1 &> /dev/null
	do
		sleep 0.3
	done
}
alias _waitForProcess=_pauseForProcess
alias waitForProcess=_pauseForProcess

_test_daemon() {
	_getDep pkill
}

#To ensure the lowest descendents are terminated first, the file must be created in reverse order. Additionally, PID files created before a prior reboot must be discarded and ignored.
_prependDaemonPID() {
	
	#Reset locks from before prior reboot.
	_readLocked "$daemonPidFile"lk
	_readLocked "$daemonPidFile"op
	_readLocked "$daemonPidFile"cl
	
	while true
	do
		_createLocked "$daemonPidFile"op && break
		sleep 0.1
	done
	
	#Removes old PID file if not locked during current UNIX session (ie. since latest reboot).  Prevents termination of non-daemon PIDs.
	if ! _readLocked "$daemonPidFile"lk
	then
		rm -f "$daemonPidFile"
		rm -f "$daemonPidFile"t
	fi
	_createLocked "$daemonPidFile"lk
	
	[[ ! -e "$daemonPidFile" ]] && echo >> "$daemonPidFile"
	cat - "$daemonPidFile" >> "$daemonPidFile"t
	mv "$daemonPidFile"t "$daemonPidFile"
	
	rm -f "$daemonPidFile"op
}

#By default, process descendents will be terminated first. Doing so is essential to reaching sub-proesses of sub-scripts, without manual user input.
#https://stackoverflow.com/questions/34438189/bash-sleep-process-not-getting-killed
_daemonSendTERM() {
	#Terminate descendents if parent has not been able to quit.
	pkill -P "$1"
	! ps -p "$1" >/dev/null 2>&1 && return 0
	sleep 0.1
	! ps -p "$1" >/dev/null 2>&1 && return 0
	sleep 0.3
	! ps -p "$1" >/dev/null 2>&1 && return 0
	sleep 2
	! ps -p "$1" >/dev/null 2>&1 && return 0
	sleep 6
	! ps -p "$1" >/dev/null 2>&1 && return 0
	sleep 9
	
	#Kill descendents if parent has not been able to quit.
	pkill -KILL -P "$1"
	! ps -p "$1" >/dev/null 2>&1 && return 0
	sleep 0.1
	! ps -p "$1" >/dev/null 2>&1 && return 0
	sleep 0.3
	! ps -p "$1" >/dev/null 2>&1 && return 0
	sleep 2
	
	#Terminate parent if parent has not been able to quit.
	kill -TERM "$1"
	! ps -p "$1" >/dev/null 2>&1 && return 0
	sleep 0.1
	! ps -p "$1" >/dev/null 2>&1 && return 0
	sleep 0.3
	! ps -p "$1" >/dev/null 2>&1 && return 0
	sleep 2
	
	#Kill parent if parent has not been able to quit.
	kill KILL "$1"
	! ps -p "$1" >/dev/null 2>&1 && return 0
	sleep 0.1
	! ps -p "$1" >/dev/null 2>&1 && return 0
	sleep 0.3
	
	#Failure to immediately kill parent is an extremely rare, serious error.
	ps -p "$1" >/dev/null 2>&1 && return 1
	return 0
}

#No production use.
_daemonSendKILL() {
	pkill -KILL -P "$1"
	kill -KILL "$1"
}

#True if any daemon registered process is running.
_daemonAction() {
	[[ ! -e "$daemonPidFile" ]] && return 1
	
	local currentLine
	local processedLine
	local daemonStatus
	
	while IFS='' read -r currentLine || [[ -n "$currentLine" ]]; do
		processedLine=$(echo "$currentLine" | tr -dc '0-9')
		if [[ "$processedLine" != "" ]] && ps -p "$processedLine" >/dev/null 2>&1
		then
			daemonStatus="up"
			[[ "$1" == "status" ]] && return 0
			[[ "$1" == "terminate" ]] && _daemonSendTERM "$processedLine"
			[[ "$1" == "kill" ]] && _daemonSendKILL "$processedLine"
		fi
	done < "$daemonPidFile"
	
	[[ "$daemonStatus" == "up" ]] && return 0
	return 1
}

_daemonStatus() {
	_daemonAction "status"
}

#No production use.
_waitForTermination() {
	_daemonStatus && sleep 0.1
	_daemonStatus && sleep 0.3
	_daemonStatus && sleep 1
	_daemonStatus && sleep 2
}
alias _waitForDaemon=_waitForTermination

#Kills background process using PID file.
_killDaemon() {
	#Do NOT proceed if PID values may be invalid.
	! _readLocked "$daemonPidFile"lk && return 1
	
	#Do NOT proceed if daemon is starting (opening).
	_readLocked "$daemonPidFile"op && return 1
	
	! _createLocked "$daemonPidFile"cl && return 1
	
	#Do NOT proceed if daemon is starting (opening).
	_readLocked "$daemonPidFile"op && return 1
	
	_daemonAction "terminate"
	
	#Do NOT proceed to detele lock/PID files unless daemon can be confirmed down.
	_daemonStatus && return 1
	
	rm -f "$daemonPidFile" >/dev/null 2>&1
	rm -f "$daemonPidFile"lk
	rm -f "$daemonPidFile"cl
	
	return 0
}

_cmdDaemon_sequence() {
	export isDaemon=true
	
	"$@" &
	
	local currentPID="$!"
	
	#Any PID which may be part of a daemon may be appended to this file.
	echo "$currentPID" | _prependDaemonPID
	
	wait "$currentPID"
}

_cmdDaemon() {
	"$scriptAbsoluteLocation" _cmdDaemon_sequence "$@" &
	disown -a -h -r
	disown -a -r
}

#Executes self in background (ie. as daemon).
_execDaemon() {
	#_daemonStatus && return 1
	
	_cmdDaemon "$scriptAbsoluteLocation"
}

_launchDaemon() {
	_start
	
	_killDaemon
	
	
	_execDaemon
	while _daemonStatus
	do
		sleep 5
	done
	
	
	
	
	
	_stop
}

#Remote TERM signal wrapper. Verifies script is actually running at the specified PID before passing along signal to trigger an emergency stop.
#"$1" == pidFile
#"$2" == sessionid (optional for cleaning up stale systemd files)
_remoteSigTERM() {
	[[ ! -e "$1" ]] && [[ "$2" != "" ]] && _unhook_systemd_shutdown "$2"
	
	[[ ! -e "$1" ]] && return 0
	
	pidToTERM=$(cat "$1")
	
	kill -TERM "$pidToTERM"
	
	_pauseForProcess "$pidToTERM"
}

_embed_here() {
	cat << CZXWXcRMTo8EmM8i4d
#!/usr/bin/env bash

export scriptAbsoluteLocation="$scriptAbsoluteLocation"
export scriptAbsoluteFolder="$scriptAbsoluteFolder"
export sessionid="$sessionid"
. "$scriptAbsoluteLocation" --embed "\$@"
CZXWXcRMTo8EmM8i4d
}

_embed() {
	export sessionid="$1"
	"$scriptAbsoluteLocation" --embed "$@"
}

#"$@" == URL
_fetch() {
	if type axel > /dev/null 2>&1
	then
		axel "$@"
		return 0
	fi
	
	wget "$@"
	
	return 0
}

_validatePort() {
	[[ "$1" -lt "1024" ]] && return 1
	[[ "$1" -gt "65535" ]] && return 1
	
	return 0
}

_testFindPort() {
	! _wantGetDep ss
	! _wantGetDep sockstat
	
	# WARNING: Not yet relying exclusively on 'netstat' - recommend continuing to install 'nmap' for Cygwin port range detection (and also for _waitPort) .
	if uname -a | grep -i cygwin > /dev/null 2>&1
	then
		! type nmap > /dev/null 2>&1 && echo "missing socket detection: nmap" && _stop 1
		! type netstat | grep cygdrive > /dev/null 2>&1 && echo "missing socket detection: netstat" && _stop 1
		return 0
	fi
	
	! type ss > /dev/null 2>&1 && ! type sockstat > /dev/null 2>&1 && echo "missing socket detection" && _stop 1
	
	local machineLowerPort=$(cat /proc/sys/net/ipv4/ip_local_port_range 2> /dev/null | cut -f1)
	local machineUpperPort=$(cat /proc/sys/net/ipv4/ip_local_port_range 2> /dev/null | cut -f2)
	
	[[ "$machineLowerPort" == "" ]] && echo "warn: autodetect: lower_port"
	[[ "$machineUpperPort" == "" ]] && echo "warn: autodetect: upper_port"
	[[ "$machineLowerPort" == "" ]] || [[ "$machineUpperPort" == "" ]] && return 0
	
	[[ "$machineLowerPort" -lt "1024" ]] && echo "invalid lower_port" && _stop 1
	[[ "$machineLowerPort" -lt "32768" ]] && echo "warn: low lower_port"
	[[ "$machineLowerPort" -gt "32768" ]] && echo "warn: high lower_port"
	
	[[ "$machineUpperPort" -gt "65535" ]] && echo "invalid upper_port" && _stop 1
	[[ "$machineUpperPort" -gt "60999" ]] && echo "warn: high upper_port"
	[[ "$machineUpperPort" -lt "60999" ]] && echo "warn: low upper_port"
	
	local testFoundPort
	testFoundPort=$(_findPort)
	! _validatePort "$testFoundPort" && echo "invalid port discovery" && _stop 1
}

#True if port open (in use).
_checkPort_local() {
	[[ "$1" == "" ]] && return 1
	
	if type ss > /dev/null 2>&1
	then
		ss -lpn | grep ':'"$1"' ' > /dev/null 2>&1
		return $?
	fi
	
	if type sockstat > /dev/null 2>&1
	then
		sockstat -46ln | grep '\.'"$1"' ' > /dev/null 2>&1
		return $?
	fi
	
	if uname -a | grep -i cygwin > /dev/null 2>&1 && type netstat > /dev/null 2>&1 && type netstat | grep cygdrive > /dev/null 2>&1
	then
		#nmap --host-timeout 0.1 -Pn localhost -p "$1" 2> /dev/null | grep open > /dev/null 2>&1
		
		# https://www.maketecheasier.com/check-ports-in-use-windows10/
		#netstat -a | grep 'TCP\|UDP' | cut -f 1-7 -d\
		netstat -a -n -q | grep 'TCP\|UDP' | cut -f 1-8 -d\  | grep ':'"$1" > /dev/null 2>&1
		return $?
	fi
	
	if type nmap
	then
		nmap --host-timeout 0.1 -Pn localhost -p "$1" 2> /dev/null | grep open > /dev/null 2>&1
		return $?
	fi
	
	return 1
}

#Waits a reasonable time interval for port to be open (in use).
#"$1" == port
_waitPort_local() {
	local checksDone
	checksDone=0
	while ! _checkPort_local "$1" && [[ "$checksDone" -lt 72 ]]
	do
		let checksDone+=1
		sleep 0.1
	done
	
	local checksDone
	checksDone=0
	while ! _checkPort_local "$1" && [[ "$checksDone" -lt 72 ]]
	do
		let checksDone+=1
		sleep 0.3
	done
	
	local checksDone
	checksDone=0
	while ! _checkPort_local "$1" && [[ "$checksDone" -lt 72 ]]
	do
		let checksDone+=1
		sleep 1
	done
	
	return 0
}


#http://unix.stackexchange.com/questions/55913/whats-the-easiest-way-to-find-an-unused-local-port
_findPort() {
	local lower_port
	local upper_port
	
	lower_port="$1"
	upper_port="$2"
	
	#Non public ports are between 49152-65535 (2^15 + 2^14 to 2^16 - 1).
	#Convention is to assign ports 55000-65499 and 50025-53999 to specialized servers.
	#read lower_port upper_port < /proc/sys/net/ipv4/ip_local_port_range
	[[ "$lower_port" == "" ]] && lower_port=54000
	[[ "$upper_port" == "" ]] && upper_port=54999
	
	local range_port
	local rand_max
	let range_port="upper_port - lower_port"
	let rand_max="range_port / 2"
	
	local portRangeOffset
	portRangeOffset=$RANDOM
	#let "portRangeOffset %= 150"
	let "portRangeOffset %= rand_max"
	
	[[ "$opsautoGenerationMode" == "true" ]] && [[ "$lowestUsedPort" == "" ]] && export lowestUsedPort="$lower_port"
	[[ "$opsautoGenerationMode" == "true" ]] && lower_port="$lowestUsedPort"
	
	! [[ "$opsautoGenerationMode" == "true" ]] && let "lower_port += portRangeOffset"
	
	while true
	do
		for (( currentPort = lower_port ; currentPort <= upper_port ; currentPort++ )); do
			if ! _checkPort_local "$currentPort"
			then
				sleep 0.1
				if ! _checkPort_local "$currentPort"
				then
					break 2
				fi
			fi
		done
	done
	
	if [[ "$opsautoGenerationMode" == "true" ]]
	then
		local nextUsablePort
		
		let "nextUsablePort = currentPort + 1"
		export lowestUsedPort="$nextUsablePort"
		
	fi
	
	echo "$currentPort"
	
	_validatePort "$currentPort"
}

_test_waitport() {
	_getDep nmap
}

_showPort_ipv6() {
	nmap -6 --host-timeout "$netTimeout" -Pn "$1" -p "$2" 2> /dev/null
}

_showPort_ipv4() {
	nmap --host-timeout "$netTimeout" -Pn "$1" -p "$2" 2> /dev/null
}

_checkPort_ipv6() {
	if _showPort_ipv6 "$@" | grep open > /dev/null 2>&1
	then
		return 0
	fi
	return 1
}

#Checks hostname for open port.
#"$1" == hostname
#"$2" == port
_checkPort_ipv4() {
	if _showPort_ipv4 "$@" | grep open > /dev/null 2>&1
	then
		return 0
	fi
	return 1
}

_checkPort_sequence() {
	_start
	
	local currentEchoStatus
	currentEchoStatus=$(stty --file=/dev/tty -g 2>/dev/null)
	
	local currentExitStatus
	
	if ( [[ "$1" == 'localhost' ]] || [[ "$1" == '::1' ]] || [[ "$1" == '127.0.0.1' ]] )
	then
		_checkPort_ipv4 "localhost" "$2"
		return "$?"
	fi
	
	#Lack of coproc support implies old system, which implies IPv4 only.
	#if ! type coproc >/dev/null 2>&1
	#then
	#	_checkPort_ipv4 "$1" "$2"
	#	return "$?"
	#fi
	
	( ( _showPort_ipv4 "$1" "$2" ) 2> /dev/null > "$safeTmp"/_showPort_ipv4 & )
	
	( ( _showPort_ipv6 "$1" "$2" ) 2> /dev/null > "$safeTmp"/_showPort_ipv6 & )
	
	
	local currentTimer
	currentTimer=1
	while [[ "$currentTimer" -le "$netTimeout" ]]
	do
		grep -m1 'open' "$safeTmp"/_showPort_ipv4 > /dev/null 2>&1 && _stop
		grep -m1 'open' "$safeTmp"/_showPort_ipv6 > /dev/null 2>&1 && _stop
		
		! [[ $(jobs | wc -c) -gt '0' ]] && ! grep -m1 'open' "$safeTmp"/_showPort_ipv4 && grep -m1 'open' "$safeTmp"/_showPort_ipv6 > /dev/null 2>&1 && _stop 1
		
		let currentTimer="$currentTimer"+1
		sleep 1
	done
	
	
	_stop 1
}

# DANGER: Unstable, abandoned. Reference only.
# WARNING: Limited support for older systems.
#https://unix.stackexchange.com/questions/86270/how-do-you-use-the-command-coproc-in-various-shells
#http://wiki.bash-hackers.org/syntax/keywords/coproc
#http://mywiki.wooledge.org/BashFAQ/024
#[[ $COPROC_PID ]] && kill $COPROC_PID
#coproc { bash -c '(sleep 9 ; echo test) &' ; bash -c 'echo test' ;  } ; grep -m1 test <&${COPROC[0]}
#coproc { echo test ; echo x ; } ; sleep 1 ; grep -m1 test <&${COPROC[0]}
_checkPort_sequence_coproc() {
	local currentEchoStatus
	currentEchoStatus=$(stty --file=/dev/tty -g 2>/dev/null)
	
	local currentExitStatus
	
	if ( [[ "$1" == 'localhost' ]] || [[ "$1" == '::1' ]] || [[ "$1" == '127.0.0.1' ]] )
	then
		_checkPort_ipv4 "localhost" "$2"
		return "$?"
	fi
	
	#Lack of coproc support implies old system, which implies IPv4 only.
	if ! type coproc >/dev/null 2>&1
	then
		_checkPort_ipv4 "$1" "$2"
		return "$?"
	fi
	
	#coproc { sleep 30 ; echo foo ; sleep 30 ; echo bar; } ; grep -m1 foo <&${COPROC[0]}
	#[[ $COPROC_PID ]] && kill $COPROC_PID ; coproc { ((sleep 1 ; echo test) &) ; echo x ; sleep 3 ; } ; sleep 0.1 ; grep -m1 test <&${COPROC[0]}
	
	[[ "$COPROC_PID" ]] && kill "$COPROC_PID" > /dev/null 2>&1
	coproc {
		( ( _showPort_ipv4 "$1" "$2" ) & )
		
		#[sleep] Lessens unlikely occurrence of interleaved text within "open" keyword.
		#IPv6 delayed instead of IPv4 due to likelihood of additional delay by IPv6 tunneling.
		#sleep 0.1
		
		# TODO: Better characterize problems with sleep.
		# Workaround - sleep may disable 'stty echo', which may be irreversable within SSH proxy command.
		#_timeout 0.1 cat < /dev/zero > /dev/null
		if ! ping -c 2 -i 0.1 localhost > /dev/null 2>&1
		then
			ping -c 2 -i 1 localhost > /dev/null 2>&1
		fi
		
		#[sleep] Lessens unlikely occurrence of interleaved text within "open" keyword.
		#IPv6 delayed instead of IPv4 due to likelihood of additional delay by IPv6 tunneling.
		( ( _showPort_ipv6 "$1" "$2" ) & )

		#sleep 2
		ping -c 2 -i 2 localhost > /dev/null 2>&1
	}
	grep -m1 open <&"${COPROC[0]}" > /dev/null 2>&1
	currentExitStatus="$?"
	
	stty --file=/dev/tty "$currentEchoStatus" 2> /dev/null
	
	return "$currentExitStatus"
}

#Checks hostname for open port.
#"$1" == hostname
#"$2" == port
_checkPort() {
	#local currentEchoStatus
	#currentEchoStatus=$(stty --file=/dev/tty -g 2>/dev/null)
	
	#if bash -c \""$scriptAbsoluteLocation"\"\ _checkPort_sequence\ \""$1"\"\ \""$2"\" > /dev/null 2>&1
	if "$scriptAbsoluteLocation" _checkPort_sequence "$1" "$2" > /dev/null 2>&1
	then
		#stty --file=/dev/tty "$currentEchoStatus" 2> /dev/null
		return 0
	fi
	#stty --file=/dev/tty "$currentEchoStatus" 2> /dev/null
	return 1
}


#Waits a reasonable time interval for port to be open.
#"$1" == hostname
#"$2" == port
_waitPort() {
	_checkPort "$1" "$2" && return 0
	sleep 0.1
	_checkPort "$1" "$2" && return 0
	sleep 0.1
	_checkPort "$1" "$2" && return 0
	sleep 0.1
	_checkPort "$1" "$2" && return 0
	sleep 0.1
	_checkPort "$1" "$2" && return 0
	sleep 0.1
	_checkPort "$1" "$2" && return 0
	sleep 0.1
	_checkPort "$1" "$2" && return 0
	sleep 0.1
	_checkPort "$1" "$2" && return 0
	sleep 0.1
	_checkPort "$1" "$2" && return 0
	sleep 0.3
	_checkPort "$1" "$2" && return 0
	sleep 0.3
	_checkPort "$1" "$2" && return 0
	sleep 0.6
	
	local checksDone
	checksDone=0
	while ! _checkPort "$1" "$2" && [[ "$checksDone" -lt 72 ]]
	do
		let checksDone+=1
		sleep 1
	done
	
	return 0
}

#Run command and output to terminal with colorful formatting. Controlled variant of "bash -v".
_showCommand() {
	echo -e '\E[1;32;46m $ '"$1"' \E[0m'
	"$@"
}

#Validates non-empty request.
_validateRequest() {
	echo -e -n '\E[1;32;46m Validating request '"$1"'...	\E[0m'
	[[ "$1" == "" ]] && echo -e '\E[1;33;41m BLANK \E[0m' && return 1
	echo "PASS"
	return
}

#http://www.commandlinefu.com/commands/view/3584/remove-color-codes-special-characters-with-sed
_nocolor() {
	sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"
}

_noFireJail() {
	if ( [[ -L /usr/local/bin/"$1" ]] && ls -l /usr/local/bin/"$1" | grep firejail > /dev/null 2>&1 ) || ( [[ -L /usr/bin/"$1" ]] && ls -l /usr/bin/"$1" | grep firejail > /dev/null 2>&1 )
	then
		 _messagePlain_bad 'conflict: firejail: '"$1"
		 return 1
	fi
	
	return 0
}

#Copy log files to "$permaLog" or current directory (default) for analysis.
_preserveLog() {
	if [[ ! -d "$permaLog" ]]
	then
		permaLog="$PWD"
	fi
	
	cp "$logTmp"/* "$permaLog"/ > /dev/null 2>&1
}

_typeShare() {
	_typeDep "$1" && return 0
	
	[[ -e /usr/share/"$1" ]] && ! [[ -d /usr/share/"$1" ]] && return 0
	[[ -e /usr/local/share/"$1" ]] && ! [[ -d /usr/local/share/"$1" ]] && return 0
	
	[[ -d /usr/share/"$1" ]] && return 2
	[[ -d /usr/local/share/"$1" ]] && return 2
	
	[[ "$1" == '/'* ]] && [[ -e "$1"* ]] && return 3
	ls /usr/share/"$1"* > /dev/null 2>&1 && return 3
	ls /usr/local/share/"$1"* > /dev/null 2>&1 && return 3
	
	return 1
}

_typeShare_dir_wildcard() {
	local currentFunctionReturn
	_typeShare "$@"
	currentFunctionReturn="$?"
	
	[[ "$currentFunctionReturn" == '0' ]] && return 0
	[[ "$currentFunctionReturn" == '2' ]] && return 0
	[[ "$currentFunctionReturn" == '3' ]] && return 0
	return 1
}

_typeShare_dir() {
	local currentFunctionReturn
	_typeShare "$@"
	currentFunctionReturn="$?"
	
	[[ "$currentFunctionReturn" == '0' ]] && return 0
	[[ "$currentFunctionReturn" == '2' ]] && return 0
	return 1
}

_typeDep() {
	
	# WARNING: Allows specification of entire path from root. *Strongly* prefer use of subpath matching, for increased portability.
	[[ "$1" == '/'* ]] && [[ -e "$1" ]] && return 0
	
	[[ -e /lib/"$1" ]] && ! [[ -d /lib/"$1" ]] && return 0
	[[ -e /lib/x86_64-linux-gnu/"$1" ]] && ! [[ -d /lib/x86_64-linux-gnu/"$1" ]] && return 0
	[[ -e /lib64/"$1" ]] && ! [[ -d /lib64/"$1" ]] && return 0
	[[ -e /lib64/x86_64-linux-gnu/"$1" ]] && ! [[ -d /lib64/x86_64-linux-gnu/"$1" ]] && return 0
	[[ -e /usr/lib/"$1" ]] && ! [[ -d /usr/lib/"$1" ]] && return 0
	[[ -e /usr/lib/x86_64-linux-gnu/"$1" ]] && ! [[ -d /usr/lib/x86_64-linux-gnu/"$1" ]] && return 0
	[[ -e /usr/local/lib/"$1" ]] && ! [[ -d  /usr/local/lib/"$1" ]] && return 0
	[[ -e /usr/local/lib/x86_64-linux-gnu/"$1" ]] && ! [[ -d /usr/local/lib/x86_64-linux-gnu/"$1" ]] && return 0
	[[ -e /usr/include/"$1" ]] && ! [[ -d /usr/include/"$1" ]] && return 0
	[[ -e /usr/include/x86_64-linux-gnu/"$1" ]] && ! [[ -d /usr/include/x86_64-linux-gnu/"$1" ]] && return 0
	[[ -e /usr/local/include/"$1" ]] && ! [[ -d /usr/local/include/"$1" ]] && return 0
	[[ -e /usr/local/include/x86_64-linux-gnu/"$1" ]] && ! [[ -d /usr/local/include/x86_64-linux-gnu/"$1" ]] && return 0
	
	if ! type "$1" >/dev/null 2>&1
	then
		return 1
	fi
	
	return 0
}

_wantDep() {
	_typeDep "$1" && return 0
	
	# Expect already root if 'MSW/Cygwin' and obstructive popup dialog if 'sudo' is called through 'MSW/Cygwin' .
	_if_cygwin && return 1
	
	_wantSudo && sudo -n "$scriptAbsoluteLocation" _typeDep "$1" && return 0
	
	return 1
}

_mustGetDep() {
	_typeDep "$1" && return 0
	
	# Expect already root if 'MSW/Cygwin' and obstructive popup dialog if 'sudo' is called through 'MSW/Cygwin' .
	_if_cygwin && return 1
	
	_wantSudo && sudo -n "$scriptAbsoluteLocation" _typeDep "$1" && return 0
	
	echo "$1" missing
	_stop 1
}

_fetchDep_distro() {
	if [[ -e /etc/issue ]] && cat /etc/issue | grep 'Debian' > /dev/null 2>&1
	then
		_tryExecFull _fetchDep_debian "$@"
		return
	fi
	return 1
}

_wantGetDep() {
	_wantDep "$@" && return 0
	
	_fetchDep_distro "$@"
	
	_wantDep "$@" && return 0
	return 1
}

_getDep() {
	_wantDep "$@" && return 0
	
	_fetchDep_distro "$@"
	
	_mustGetDep "$@"
}

#Determines if user is root. If yes, then continue. If not, exits after printing error message.
_mustBeRoot() {
if [[ $(id -u) != 0 ]]; then 
	echo "This must be run as root!"
	exit
fi
}
alias mustBeRoot=_mustBeRoot

#Determines if sudo is usable by scripts.
_mustGetSudo() {
	# WARNING: What is otherwise considered bad practice may be accepted to reduce substantial MSW/Cygwin inconvenience .
	_if_cygwin && return 0
	
	local rootAvailable
	rootAvailable=false
	
	rootAvailable=$(sudo -n echo true)
	
	#[[ $(id -u) == 0 ]] && rootAvailable=true
	
	! [[ "$rootAvailable" == "true" ]] && exit 1
	
	return 0
}

#Determines if sudo is usable by scripts. Will not exit on failure.
_wantSudo() {
	# WARNING: What is otherwise considered bad practice may be accepted to reduce substantial MSW/Cygwin inconvenience .
	_if_cygwin && return 0
	
	local rootAvailable
	rootAvailable=false
	
	rootAvailable=$(sudo -n echo true 2> /dev/null)
	
	#[[ $(id -u) == 0 ]] && rootAvailable=true
	
	! [[ "$rootAvailable" == "true" ]] && return 1
	
	return 0
}

#Returns a UUID in the form of xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
_getUUID() {
	if [[ -e /proc/sys/kernel/random/uuid ]]
	then
		cat /proc/sys/kernel/random/uuid
		return 0
	fi
	
	
	if type -p uuidgen > /dev/null 2>&1
	then
		uuidgen
		return 0
	fi
	
	# Failure. Intentionally adds extra characters to cause any tests of uuid output to fail.
	_uid 40
	return 1
}
alias getUUID=_getUUID

_resetFakeHomeEnv_extra() {
	true
}

_resetFakeHomeEnv_nokeep() {
	! [[ "$setFakeHome" == "true" ]] && return 0
	export setFakeHome="false"
	
	export HOME="$realHome"
	
	#export realHome=""
	
	_resetFakeHomeEnv_extra
}

_resetFakeHomeEnv() {
	#[[ "$keepFakeHome" == "true" ]] && return 0
	[[ "$keepFakeHome" != "false" ]] && return 0
	
	_resetFakeHomeEnv_nokeep
} 

#####Shortcuts

# https://unix.stackexchange.com/questions/434409/make-a-bash-ps1-that-counts-streak-of-correct-commands
_visualPrompt_promptCommand() {
	[[ "$PS1_lineNumber" == "" ]] && PS1_lineNumber='0'
	#echo "$PS1_lineNumber"
	let PS1_lineNumber="$PS1_lineNumber"+1
	#export PS1_lineNumber

	PS1_lineNumberText="$PS1_lineNumber"
	if [[ "$PS1_lineNumber" == '1' ]]
	then
		# https://unix.stackexchange.com/questions/266921/is-it-possible-to-use-ansi-color-escape-codes-in-bash-here-documents
		PS1_lineNumberText=$(echo -e -n '\E[1;36m'1)
		#PS1_lineNumberText=$(echo -e -n '\E[1;36m'1)
		#PS1_lineNumberText=$(echo -e -n '\[\033[01;36m\]'1)
		#PS1_lineNumberText=$(echo -e -n '\033[01;36m'1)
	fi
}

_visualPrompt() {
	#+%H:%M:%S\ %Y-%m-%d\ Q%q
	#+%H:%M:%S\ %b\ %d,\ %y

	#Long.
	#export PS1='\[\033[01;40m\]\[\033[01;36m\]+\[\033[01;34m\]-|\[\033[01;31m\]${?}:${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u\[\033[01;32m\]@\h\[\033[01;36m\]\[\033[01;34m\])-\[\033[01;36m\]--\[\033[01;34m\]-(\[\033[01;35m\]$(date +%H:%M:%S\ .%d)\[\033[01;34m\])-\[\033[01;36m\]-|\[\033[00m\]\n\[\033[01;40m\]\[\033[01;36m\]+\[\033[01;34m\]-|\[\033[37m\][\w]\[\033[00m\]\n\[\033[01;36m\]+\[\033[01;34m\]-|\#) \[\033[36m\]>\[\033[00m\] '

	#Short.
	#export PS1='\[\033[01;40m\]\[\033[01;36m\]+\[\033[01;34m\]|\[\033[01;31m\]${?}:${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u\[\033[01;32m\]@\h\[\033[01;36m\]\[\033[01;34m\])-\[\033[01;36m\]-\[\033[01;34m\]-(\[\033[01;35m\]$(date +%H:%M:%S\ .%d)\[\033[01;34m\])\[\033[01;36m\]|\[\033[00m\]\n\[\033[01;40m\]\[\033[01;36m\]+\[\033[01;34m\]|\[\033[37m\][\w]\[\033[00m\]\n\[\033[01;36m\]+\[\033[01;34m\]|\#) \[\033[36m\]>\[\033[00m\] '
	
	#Truncated, 40 columns.
	#export PS1='\[\033[01;40m\]\[\033[01;36m\]\[\033[01;34m\]|\[\033[01;31m\]${?}:${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u\[\033[01;32m\]@\h\[\033[01;36m\]\[\033[01;34m\])\[\033[01;36m\]\[\033[01;34m\]-(\[\033[01;35m\]$(date +%H:%M:%S\.%d)\[\033[01;34m\])\[\033[01;36m\]|\[\033[00m\]\n\[\033[01;40m\]\[\033[01;36m\]\[\033[01;34m\]|\[\033[37m\][\w]\[\033[00m\]\n\[\033[01;36m\]\[\033[01;34m\]|\#) \[\033[36m\]>\[\033[00m\] '
	
	
	# https://unix.stackexchange.com/questions/434409/make-a-bash-ps1-that-counts-streak-of-correct-commands
	
	#export PROMPT_COMMAND=$(declare -f _visualPrompt_promptCommand)' ; _visualPrompt_promptCommand'
	#export PROMPT_COMMAND='_visualPrompt_promptCommand () { [[ "$PS1_lineNumber" == "" ]] && PS1_lineNumber="0"; let PS1_lineNumber="$PS1_lineNumber"+1; PS1_lineNumberText="$PS1_lineNumber"; if [[ "$PS1_lineNumber" == "1" ]]; then PS1_lineNumberText=$(echo -e -n "'"\E[1;36m"'"1"'"\E[0m"'"); fi } ; _visualPrompt_promptCommand'
	
	export -f _visualPrompt_promptCommand
	export PROMPT_COMMAND=_visualPrompt_promptCommand
	
	#export PS1='\[\033[01;40m\]\[\033[01;36m\]\[\033[01;34m\]|\[\033[01;31m\]${?}:${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u\[\033[01;32m\]@\h\[\033[01;36m\]\[\033[01;34m\])\[\033[01;36m\]\[\033[01;34m\]-(\[\033[01;35m\]$(date +%H:%M:%S\.%d)\[\033[01;34m\])\[\033[01;36m\]|\[\033[00m\]\n\[\033[01;40m\]\[\033[01;36m\]\[\033[01;34m\]|\[\033[37m\][\w]\[\033[00m\]\n\[\033[01;36m\]\[\033[01;34m\]|$PS1_lineNumberText\[\033[01;34m\]) \[\033[36m\]>\[\033[00m\] '
	
	
	#export PS1='\[\033[01;40m\]\[\033[01;36m\]\[\033[01;34m\]|\[\033[01;31m\]${?}:${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u\[\033[01;32m\]@\h\[\033[01;36m\]\[\033[01;34m\])\[\033[01;36m\]\[\033[01;34m\]-'"$prompt_cloudNetName"'(\[\033[01;35m\]$(date +%H:%M:%S\.%d)\[\033[01;34m\])\[\033[01;36m\]|\[\033[00m\]\n\[\033[01;40m\]\[\033[01;36m\]\[\033[01;34m\]|\[\033[37m\][\w]\[\033[00m\]\n\[\033[01;36m\]\[\033[01;34m\]|$PS1_lineNumberText\[\033[01;34m\]) \[\033[36m\]'""'>\[\033[00m\] '
	
	
	export PS1='\[\033[01;40m\]\[\033[01;36m\]\[\033[01;34m\]|\[\033[01;31m\]${?}:${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u\[\033[01;32m\]@\h\[\033[01;36m\]\[\033[01;34m\])\[\033[01;36m\]\[\033[01;34m\]-'"$prompt_cloudNetName"'(\[\033[01;35m\]$(date +%H:%M:%S\.%d)\[\033[01;34m\])\[\033[01;36m\]|\[\033[00m\]\n\[\033[01;40m\]\[\033[01;36m\]\[\033[01;34m\]|\[\033[37m\][\w]\[\033[00m\]\n\[\033[01;36m\]\[\033[01;34m\]|$([[ "$PS1_lineNumber" == "1" ]] && echo -e -n '"'"'\[\033[01;36m\]'"'"'$PS1_lineNumber || echo -e -n $PS1_lineNumber)\[\033[01;34m\]) \[\033[36m\]'""'>\[\033[00m\] '
}

#https://stackoverflow.com/questions/15432156/display-filename-before-matching-line-grep
_grepFileLine() {
	grep -n "$@" /dev/null
}

_findFunction() {
	#-name '*.sh'
	#-not -path "./_local/*"
	#find ./blockchain -name '*.sh' -type f -size -10000k -exec grep -n "$@" '{}' /dev/null \;
	#find ./generic -name '*.sh' -type f -size -10000k -exec grep -n "$@" '{}' /dev/null \;
	#find ./instrumentation -name '*.sh' -type f -size -10000k -exec grep -n "$@" '{}' /dev/null \;
	#find ./labels -name '*.sh' -type f -size -10000k -exec grep -n "$@" '{}' /dev/null \;
	#find ./os -name '*.sh' -type f -size -10000k -exec grep -n "$@" '{}' /dev/null \;
	#find ./shortcuts -name '*.sh' -type f -size -10000k -exec grep -n "$@" '{}' /dev/null \;
	#find . -name '*.sh' -type f -size -10000k -exec grep -n "$@" '{}' /dev/null \;
	
	find . -not -path "./_local/*" -name '*.sh' -type f -size -3000k -exec grep -n "$@" '{}' /dev/null \;
}



_octave_terse() {
	if [[ "$1" != "" ]]
	then
		_safeEcho_newline "$@" | octave --quiet --silent --no-window-system --no-gui 2>/dev/null | _octave_filter-messages
		return
	fi
	
	octave --quiet --silent --no-window-system --no-gui 2>/dev/null | _octave_filter-messages
	return
}

_octave() {
	if [[ "$1" != "" ]]
	then
		_octave_terse "$@"
		return
	fi
	
	octave --quiet --silent --no-window-system --no-gui "$@"
	return
}

# ATTENTION: EXAMPLE: echo 'solve(x == y * 2, y)' | _octave_pipe
_octave_pipe() {
	_octave_terse "$@"
	#octave --quiet --silent --no-window-system --no-gui "$@" 2>/dev/null | _octave_filter-messages
}

# ATTENTION: EXAMPLE: _octave_script 'octave_script.m'
# echo 'solve(x == y * 2, y)' > octave_script.m
_octave_script() {
	local currentFile="$1"
	shift
	
	cat "$currentFile" | _octave_terse "$@"
	
	#octave --quiet --silent --no-window-system --no-gui "$@" 2>/dev/null | _octave_filter-messages
}











_octave_filter-messages() {
	grep -v 'Symbolic pkg .*1: Python communication link active, SymPy v' | grep -v '_____' | grep -v '^$' | sed 's/^ans = //' | sed 's/^(sym) //'
	#cat
}






# solve '( y  == x * 2, x)'

_octave_solve() {
	_safeEcho_newline solve"$@" | _octave_pipe
}
_octave_nsolve() {
	_safeEcho_newline nsolve"$@" | _octave_pipe
}

if type -p octave > /dev/null 2>&1
then
	_solve() {
		_octave_solve "$@"
	}
	solve() {
		_octave_solve "$@"
	}
	nsolve() {
		_octave_nsolve "$@"
	}

	_clc() {
		_octave "$@"
	}
	clc() {
		_octave "$@"
	}
	c() {
		_octave "$@"
	}
fi






_test_devgnuoctave() {
	_wantGetDep octave
	_wantGetDep octave-cli
	
	
	_wantGetDep octave-config
	_wantGetDep mkoctfile
	
	_wantGetDep 'x86_64-linux-gnu/liboctave.so'
	_wantGetDep 'x86_64-linux-gnu/liboctinterp.so'
	
	
	_wantGetDep 'x86_64-linux-gnu/octave/site/oct/x86_64-pc-linux-gnu/libsbml5/OutputSBML.mex'
	_wantGetDep 'x86_64-linux-gnu/octave/site/oct/x86_64-pc-linux-gnu/libsbml5/TranslateSBML.mex'
	
	_wantGetDep 'x86_64-linux-gnu/qt5/plugins/cantor/backends/cantor_octavebackend.so'
	
	
	#if ! _wantGetDep dh_octave_check
	#then
		#! _typeShare 'dh-octave/install-pkg.m' && _wantGetDep dh-octave/install-pkg.m
	#fi
	
	
	
	_tryExec '_test_devgnuoctave-debian-x64'
	
	
	
	return 0
}


# ATTENTION: WARNING: Only tested with Debian Stable. May require rewrite to accommodate other distro (ie. Gentoo).
_test_devgnuoctave_wantGetDep-octavePackage-debian-x64() {
	# If not Debian, then simply accept these pacakges may not be available.
	[[ -e /etc/issue ]] && ! cat /etc/issue | grep 'Debian' > /dev/null 2>&1 && return 0
	
	# If not x64, then simply accept these pacakges may not be available.
	local hostArch
	hostArch=$(uname -m)
	if [[ "$hostArch" != "x86_64" ]]
	then
		return 0
	fi
	
	! _typeShare_dir_wildcard 'octave/packages/'"$1" && ! _typeShare_dir_wildcard 'octave/packages/'octave-"$1" && _wantGetDep octave-"$1"
	#_wantGetDep octave-"$1"
	
	return 0
}

_test_devgnuoctave-debian-x64() {
	# If not Debian, then simply accept these pacakges may not be available.
	[[ -e /etc/issue ]] && ! cat /etc/issue | grep 'Debian' > /dev/null 2>&1 && return 0
	
	
	# If not x64, then simply accept these pacakges may not be available.
	local hostArch
	hostArch=$(uname -m)
	if [[ "$hostArch" != "x86_64" ]]
	then
		return 0
	fi
	
	
	
	
	if ! _typeShare_dir_wildcard 'octave/packages/arduino' && ! _typeShare 'doc-base/octave-arduino-manual' && ! _typeShare 'info/arduino.info.gz' && ! _typeShare 'doc/octave-arduino/arduino.pdf.gz'
	then
		_wantGetDep octave-arduino
	fi
	
	
	_wantGetDep /usr/share/octave/site/m/bart/bart.m
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 bim
	
	_wantGetDep x86_64-linux-gnu/octave/site/oct/x86_64-pc-linux-gnu/biosig/mexSLOAD.mex
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 bsltl
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 cgi
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 control
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 data-smoothing
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 dataframe
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 dicom
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 divand
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 doctest
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 econometrics
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 financial
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 fits
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 fpl
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 fuzzy-logic-toolkit
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 ga-
	
	_wantGetDep x86_64-linux-gnu/octave/site/oct/x86_64-pc-linux-gnu/gdf/gdf_reader.mex
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 general
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 geometry
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 gsl
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 image
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 image-acquisition
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 instrument-control
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 interval
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 io-
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 level-set
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 linear-algebra
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 lssa
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 ltfat
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 mapping
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 miscellaneous
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 missing-functions
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 mpi-
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 msh-
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 mvn-
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 nan-
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 ncarray
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 netcdf
	
	_wantGetDep x86_64-linux-gnu/octave/site/oct/x86_64-pc-linux-gnu/nlopt/nlopt_optimize.oct
	! _typeShare 'octave/site/m/nlopt/nlopt_optimize.m' && _wantGetDep octave-nlopt
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 nurbs
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 netcdf
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 octclip
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 octproj
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 openems
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 optics
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 optim
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 optiminterp
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 parallel
	
	_wantGetDep x86_64-linux-gnu/octave/site/oct/x86_64-pc-linux-gnu/pfstools/pfsread.oct
	! _typeShare 'octave/site/m/pfstools/pfs_read_xyz.m' && _wantGetDep octave-pfstools
	
	_wantGetDep x86_64-linux-gnu/octave/site/oct/api-v52/x86_64-pc-linux-gnu/plplot_octave.oct
	! _typeShare 'plplot_octave/mesh.m' && _wantGetDep octave-plplot
	
	_wantGetDep psychtoolbox-3/PsychBasic/PsychPortAudio.mex
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 quaternion
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 queueing
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 secs1d
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 secs2d
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 secs3d
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 signal
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 sockets
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 sparsersb
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 specfun
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 splines
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 statistics
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 stk
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 strings
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 struct
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 symbolic
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 tsa
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 vibes
	
	_wantGetDep x86_64-linux-gnu/octave/site/oct/x86_64-pc-linux-gnu/vlfeat/toolbox/vl_binsearch.mex
	! _typeShare 'octave/site/m/vlfeat/toolbox/misc/vl_binsearch.m' && _wantGetDep octave-vlfeat
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 vrml
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 zenity
	
	_test_devgnuoctave_wantGetDep-octavePackage-debian-x64 zeromq
	
	
	return 0
}





_qalculate_terse() {
	# https://stackoverflow.com/questions/17998978/removing-colors-from-output
	#sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g"
	
	# https://stackoverflow.com/questions/4233159/grep-regex-whitespace-behavior
	#grep -v '^\s*$'
	
	if [[ "$1" != "" ]]
	then
		_safeEcho_newline "$@" | qalc -t | grep -v '^>\ ' | grep -v '^$' | sed 's/^  //' | grep -v '^\s*$' | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g"
		return
	fi
	
	qalc -t "$@" | grep -v '^>\ ' | grep -v '^$' | sed 's/^  //' | grep -v '^\s*$' | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g"
	return
}

# Interactive.
_qalculate() {
	if [[ "$1" != "" ]]
	then
		_qalculate_terse "$@"
		return
	fi
	
	qalc "$@"
	return
}

# ATTENTION: EXAMPLE: echo 'solve(x == y * 2, y)' | _qalculate_pipe
_qalculate_pipe() {
	_qalculate_terse "$@"
}

# ATTENTION: _qalculate_script 'qalculate_script.m'
# echo 'solve(x == y * 2, y)' > qalculate_script.m
_qalculate_script() {
	local currentFile="$1"
	shift
	
	cat "$currentFile" | _qalculate_pipe "$@"
}










_qalculate_solve() {
	_safeEcho_newline solve"$@" | _qalculate_pipe
}
_qalculate_nsolve() {
	_safeEcho_newline solve"$@" | _qalculate_pipe
}

if type -p qalc > /dev/null 2>&1
then
	_solve() {
		_qalculate_solve "$@"
	}
	solve() {
		_qalculate_solve "$@"
	}
	nsolve() {
		_qalculate_solve "$@"
	}

	_clc() {
		_qalculate "$@"
	}
	clc() {
		_qalculate "$@"
	}
	c() {
		_qalculate "$@"
	}
fi




_test_devqalculate() {
	_wantGetDep qalculate-gtk
	_wantGetDep qalculate
	
	_wantGetDep qalc
	
	! _typeShare 'texmf/tex/latex/gnuplot/gnuplot.cfg' && _wantGetDep gnuplot-data
	! _typeShare 'texmf/tex/latex/gnuplot/gnuplot.cfg' && echo 'warn: missing: gnuplot-data'
	
	#_wantGetDep gnuplot-data
	#_wantGetDep gnuplot-x11
	_wantGetDep gnuplot-qt
	
	_wantGetDep gnuplot
	
	! _typeDep qalculate-gtk && echo 'warn: missing: qalculate-gtk'
	
	return 0
}




_set_markup_terminal() {
	
	#&& [[ "$flag__NOT_shell" == "" ]] && [[ "$comment_shell_line" == "" ]]
	if [[ "$current_scriptedIllustrator_markup" == "" ]] && [[ "$current_scriptedIllustrator_markup_markdown" == "" ]] && [[ "$workaround_noInterpret_begin" == "" ]] && [[ "$workaround_noInterpret_end" == "" ]] && [[ "$workaround_comment_shell_line" == "" ]]
	then
		
		export flag__NOT_shell='scriptedIllustrator_markup_uk4uPhB663kVcygT0q'
		export comment_shell_line='#'
		
		
		_e() {
			export currentFunctionName="${FUNCNAME[0]}"
			_e-terminal "$@"
		}
		#export -f _e
		
		_e_() {
			export currentFunctionName="${FUNCNAME[0]}"
			_e_-terminal "$@"
		}
		#export -f _e_
		
		_o() {
			export currentFunctionName="${FUNCNAME[0]}"
			_o-terminal "$@"
		}
		#export -f _o
		
		_o_() {
			export currentFunctionName="${FUNCNAME[0]}"
			_o_-terminal "$@"
		}
		#export -f _o_
		
		_i() {
			export currentFunctionName="${FUNCNAME[0]}"
			_i-terminal "$@"
		}
		#export -f _i
		
		_v() {
			export currentFunctionName="${FUNCNAME[0]}"
			_v-terminal "$@"
		}
		#export -f _v
		
		_t() {
			export currentFunctionName="${FUNCNAME[0]}"
			_t-terminal "$@"
		}
		#export -f _t
		
		_r() {
			export currentFunctionName="${FUNCNAME[0]}"
			_r-terminal "$@"
		}
		#export -f _r
		
		_() {
			export currentFunctionName="${FUNCNAME[0]}"
			_h-terminal "$@"
		}
		_h() {
			export currentFunctionName="${FUNCNAME[0]}"
			_h-terminal "$@"
		}
		#export -f _
		#export -f _h
		
		
		
		_heading1() {
			export currentFunctionName="${FUNCNAME[0]}"
			_heading1-terminal "$@"
		}
		#export -f _heading1
		_heading2() {
			export currentFunctionName="${FUNCNAME[0]}"
			_heading2-terminal "$@"
		}
		#export -f _heading2
		_heading3() {
			export currentFunctionName="${FUNCNAME[0]}"
			_heading3-terminal "$@"
		}
		#export -f _heading3
		_heading4() {
			export currentFunctionName="${FUNCNAME[0]}"
			_heading4-terminal "$@"
		}
		#export -f _heading4
		_heading5() {
			export currentFunctionName="${FUNCNAME[0]}"
			_heading5-terminal "$@"
		}
		#export -f _heading5
		_heading6() {
			export currentFunctionName="${FUNCNAME[0]}"
			_heading6-terminal "$@"
		}
		#export -f _heading6
		
		_page() {
			export currentFunctionName="${FUNCNAME[0]}"
			_page-terminal "$@"
		}
		#export -f _page
		
		_paragraph_begin() {
			export currentFunctionName="${FUNCNAME[0]}"
			_paragraph_begin-terminal "$@"
		}
		#export -f _paragraph_begin
		_paragraph_end() {
			export currentFunctionName="${FUNCNAME[0]}"
			_paragraph_end-terminal "$@"
		}
		#export -f _paragraph_end
		
		
		_picture() {
			export currentFunctionName="${FUNCNAME[0]}"
			_picture-terminal "$@"
		}
		#export -f _picture
		_image() {
			export currentFunctionName="${FUNCNAME[0]}"
			_image-terminal "$@"
		}
		#export -f _image
		
		
		_cells_begin() {
			export currentFunctionName="${FUNCNAME[0]}"
			_cells_begin-terminal "$@"
		}
		#export -f _cells_begin
		_cells_end() {
			export currentFunctionName="${FUNCNAME[0]}"
			_cells_end-terminal "$@"
		}
		#export -f _cells_end
		_cells_row_begin() {
			export currentFunctionName="${FUNCNAME[0]}"
			_cells_row_begin-terminal "$@"
		}
		#export -f _cells_row_begin
		_cells_row_end() {
			export currentFunctionName="${FUNCNAME[0]}"
			_cells_row_end-terminal "$@"
		}
		#export -f _cells_row_end
		_cells_speck_begin() {
			export currentFunctionName="${FUNCNAME[0]}"
			_cells_speck_begin-terminal "$@"
		}
		#export -f _cells_speck_begin
		_cells_speck_end() {
			export currentFunctionName="${FUNCNAME[0]}"
			_cells_speck_end-terminal "$@"
		}
		#export -f _cells_speck_end
		
		
		
		
		_markup_asciidoc_disable_begin() {
			export currentFunctionName="${FUNCNAME[0]}"
			_markup_asciidoc_disable_begin-terminal "$@"
		}
		#export -f _markup_asciidoc_disable_begin
		
		_markup_asciidoc_disable_end() {
			export currentFunctionName="${FUNCNAME[0]}"
			_markup_asciidoc_disable_end-terminal "$@"
		}
		#export -f _markup_asciidoc_disable_end
		
		
		
		
		
		
		
		
		
		
		export markup_terminal_cmd_begin='\033[0;37;100m'
		export markup_terminal_cmd_end='\033[0m'
		#export markup_terminal_cmd_end=' \E[0m'
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		# Echo command with commented (shell prepending '#' ) output.
		_e-terminal() {
			#_safeEcho_quoteAddSingle "$currentFunctionName" "$@"
			#_safeEcho_newline
			
			
			#echo "$interpret__terminal_NOT_shell__begin"
			#echo -e -n "$markup_terminal_cmd_begin"
			
			_messagePlain_probe_quoteAddSingle "$@" | cat | _markup_terminal_cmd
			"$@" | _shellCommentLines | cat
			
			#echo -e -n "$markup_terminal_cmd_end"
			#echo "$interpret__terminal_NOT_shell__end"
		}
		
		_e_-terminal() {
			#_safeEcho_quoteAddSingle "$currentFunctionName" "$@"
			#_safeEcho_newline
			
			
			#echo "$interpret__terminal_NOT_shell__begin"
			#echo -e -n "$markup_terminal_cmd_begin"
			
			local current_miniSessionID=$(_uid 8)
			
			_messagePlain_probe_quoteAddSingle "$@" | cat
			
			eval "$@" > "$bootTmp"/"$current_miniSessionID"."${ubiquitousBashIDnano:0:3}"
			cat "$bootTmp"/"$current_miniSessionID"."${ubiquitousBashIDnano:0:3}" | _shellCommentLines | cat | _markup_terminal_cmd
			rm -f "$bootTmp"/"$current_miniSessionID"."${ubiquitousBashIDnano:0:3}" > /dev/null 2>&1
			
			#echo -e -n "$markup_terminal_cmd_end"
			#echo "$interpret__terminal_NOT_shell__end"
		}
		
		# Output only. Useful for '_messagePlain_probe_var', _messagePlain_request' and similar.
		_o-terminal() {
			#_safeEcho_quoteAddSingle "$currentFunctionName" "$@"
			#_safeEcho_newline
			
			
			#echo "$interpret__terminal_NOT_shell__begin"
			#echo -e -n "$markup_terminal_cmd_begin"
			#echo -e -n ' \033[0;37;100m '
			
			local current_miniSessionID=$(_uid 8)
			
			#_messagePlain_probe_quoteAddSingle "$@" | cat
			
			
			# | _shellCommentLines
			
			"$@" | _workaround_preformattedCharacters-terminal | cat | _markup_terminal_cmd
			
			#echo -e -n ' \033[0m '
			#echo -e -n "$markup_terminal_cmd_end"
			#echo "$interpret__terminal_NOT_shell__end"
		}
		
		# Output only. Useful for '_messagePlain_probe_var', _messagePlain_request' and similar.
		_o_-terminal() {
			#_safeEcho_quoteAddSingle "$currentFunctionName" "$@"
			#_safeEcho_newline
			
			
			#echo "$interpret__terminal_NOT_shell__begin"
			#echo -e -n "$markup_terminal_cmd_begin"
			
			local current_miniSessionID=$(_uid 8)
			
			#_messagePlain_probe_quoteAddSingle "$@" | cat
			
			
			# | _shellCommentLines
			
			eval "$@" > "$bootTmp"/"$current_miniSessionID"."${ubiquitousBashIDnano:0:3}"
			cat "$bootTmp"/"$current_miniSessionID"."${ubiquitousBashIDnano:0:3}" | _workaround_preformattedCharacters-terminal | cat | _markup_terminal_cmd
			rm -f "$bootTmp"/"$current_miniSessionID"."${ubiquitousBashIDnano:0:3}" > /dev/null 2>&1
			
			#echo -e -n "$markup_terminal_cmd_end"
			#echo "$interpret__terminal_NOT_shell__end"
		}
		
		# Internal. Use for variables, equation solving, etc.
		_i-terminal() {
			#_safeEcho_quoteAddSingle "$currentFunctionName" "$@"
			#_safeEcho_newline
			
			
			#echo "$interpret__terminal_NOT_shell__begin"
			##echo "$markup_terminal_cmd_begin"
			
			#_messagePlain_probe_quoteAddSingle "$@" | cat
			
			eval "$@" > /dev/null 2>&1
			
			##echo "$markup_terminal_cmd_begin"
			#echo "$interpret__terminal_NOT_shell__end"
		}
		
		# Useful to read out a variable (ie. set from 'COLLECT') as preformatted text.
		# Variable. Roughly equivalent to '_messagePlain_probe_var' , however, without any declaration of the variable name .
		# https://stackoverflow.com/questions/11386586/how-to-show-div-tag-literally-in-code-pre-tag
		# 	'You can't (in modern HTML) write markup and have it be interpreted as text.'
		_v-terminal() {
			#_safeEcho_quoteAddSingle "$currentFunctionName" "$@"
			#_safeEcho_newline
			
			
			#echo "$interpret__terminal_NOT_shell__begin"
			#echo "$markup_terminal_pre_begin"
			
			local current_miniSessionID=$(_uid 8)
			
			#_messagePlain_probe_quoteAddSingle "$@" | cat
			
			eval echo -e \$"$1" > "$bootTmp"/"$current_miniSessionID"."${ubiquitousBashIDnano:0:3}"
			cat "$bootTmp"/"$current_miniSessionID"."${ubiquitousBashIDnano:0:3}" | _fold-terminal | cat
			rm -f "$bootTmp"/"$current_miniSessionID"."${ubiquitousBashIDnano:0:3}" > /dev/null 2>&1
			
			#echo "$markup_terminal_pre_end"
			#echo "$interpret__terminal_NOT_shell__end"
		}
		
		
		
		
		
		# Show preformatted text.
		_t-terminal() {
			# No parameters (no input) is meaningless and nothing can be done with that.
			[[ "$1" == "" ]] && return 0
			
			#_t-terminal #_safeEcho_newline _t "'"
			#_t-terminal _safeEcho _t "'"
			#echo -n "$flag__NOT_shell $comment_terminal_end""$markup_terminal_pre_begin"
			
			
			local currentLine
			local currentLine_previous
			local currentIteration
			currentIteration=0
			while read -r currentLine && [[ "$currentIteration" -lt 2 ]]
			do
				if [[ "$currentIteration" == 1 ]] && _safeEcho_newline "$currentLine" | _filter__scriptedIllustrator_markup > /dev/null 2>&1 && [[ "$currentLine_previous" != "" ]] && [[ "$currentLine" != "" ]]
				then
					_safeEcho_newline
					true
				fi
				
				currentLine_previous="$currentLine"
				let currentIteration=currentIteration+1
			done <<<$(_safeEcho "$@")
			[[ "$currentIteration" == 1 ]] && [[ "$currentLine_previous" != "" ]] && _safeEcho_newline
			
			#sed 's/^mediawiki_noLineBreak --><pre.*>//'
			_safeEcho "$@" | sed 's/^mediawiki_noLineBreak --><nowiki>//' | sed 's/^mediawiki_noLineBreak --><pre style="margin-top: 0px;margin-bottom: 0px;white-space: pre-wrap;">//' | _filter__scriptedIllustrator_markup | _fold-terminal | _workaround_preformattedCharacters-terminal
			
			#echo "$markup_terminal_pre_end""$comment_terminal_begin $flag__NOT_shell"
			#_t-terminal _safeEcho_newline "'"
		}
		
		
		# Raw. Experimental. No production use.
		_r-terminal() {
			# No parameters (no input) is meaningless and nothing can be done with that.
			[[ "$1" == "" ]] && return 0
			
			#_r-terminal #_safeEcho_newline _r "'"
			_safeEcho _r "'"
			#echo -n "$flag__NOT_shell $comment_terminal_end"
			
			
			local currentLine
			local currentLine_previous
			local currentIteration
			currentIteration=0
			while read -r currentLine && [[ "$currentIteration" -lt 2 ]]
			do
				if [[ "$currentIteration" == 1 ]] && _safeEcho_newline "$currentLine" | _filter__scriptedIllustrator_markup > /dev/null 2>&1 && [[ "$currentLine_previous" != "" ]]
				then
					_safeEcho_newline
				fi
				
				currentLine_previous="$currentLine"
				let currentIteration=currentIteration+1
			done <<<$(_safeEcho "$@")
			[[ "$currentIteration" == 1 ]] && _safeEcho_newline
			
			_safeEcho "$@" | sed 's/^mediawiki_noLineBreak -->//' | _filter__scriptedIllustrator_markup | _workaround_preformattedCharacters-terminal
			
			
			#echo "$comment_terminal_begin $flag__NOT_shell"
			_safeEcho_newline "'"
		}
		
		# Hidden. Use for comments and (shell code only) spacing.
		_h-terminal() {
			true
			#_safeEcho_quoteAddSingle "$currentFunctionName" "$@"
			#_safeEcho_newline
		}
		
		
		
		
		
		
		
		_heading1-terminal() {
			#_safeEcho_quoteAddSingle "$currentFunctionName" "$@"
			#_safeEcho_newline
			
			
			#echo "$interpret__terminal_NOT_shell__begin"
			
			_safeEcho_newline '_ '"$@"' _' | cat
			
			#echo "$interpret__terminal_NOT_shell__end"
		}
		_heading2-terminal() {
			#_safeEcho_quoteAddSingle "$currentFunctionName" "$@"
			#_safeEcho_newline
			
			
			#echo "$interpret__terminal_NOT_shell__begin"
			
			_safeEcho_newline '__ '"$@"' __' | cat
			
			#echo "$interpret__terminal_NOT_shell__end"
		}
		_heading3-terminal() {
			#_safeEcho_quoteAddSingle "$currentFunctionName" "$@"
			#_safeEcho_newline
			
			
			#echo "$interpret__terminal_NOT_shell__begin"
			
			_safeEcho_newline '___ '"$@"' ___' | cat
			
			#echo "$interpret__terminal_NOT_shell__end"
		}
		_heading4-terminal() {
			#_safeEcho_quoteAddSingle "$currentFunctionName" "$@"
			#_safeEcho_newline
			
			
			#echo "$interpret__terminal_NOT_shell__begin"
			
			_safeEcho_newline '____ '"$@"' ____' | cat
			
			#echo "$interpret__terminal_NOT_shell__end"
		}
		_heading5-terminal() {
			#_safeEcho_quoteAddSingle "$currentFunctionName" "$@"
			#_safeEcho_newline
			
			
			#echo "$interpret__terminal_NOT_shell__begin"
			
			_safeEcho_newline '_____ '"$@"' _____' | cat
			
			#echo "$interpret__terminal_NOT_shell__end"
		}
		_heading6-terminal() {
			#_safeEcho_quoteAddSingle "$currentFunctionName" "$@"
			#_safeEcho_newline
			
			
			#echo "$interpret__terminal_NOT_shell__begin"
			
			_safeEcho_newline '______ '"$@"' ______' | cat
			
			#echo "$interpret__terminal_NOT_shell__end"
		}
		
		# Page break.
		#title page (experiment)
		#<div style="page-break-before: always;"> </div>
		#<p>
		#text page (experiment)
		#</p>
		_page-terminal() {
			_safeEcho_quoteAddSingle "$currentFunctionName" "$@"
			_safeEcho_newline
			
			
			#echo "$interpret__terminal_NOT_shell__begin"
			
			_safeEcho_newline 'PageBreak -H-H-H-H- PageBreak -H-H-H-H- PageBreak -H-H-H-H- PageBreak -H-H-H-H- PageBreak
		' | cat
			
			#_safeEcho_newline '<p style="page-break-after: always;">&nbsp;</p>' | cat
			#_safeEcho_newline '<p style="page-break-before: always;">&nbsp;</p>' | cat
			
			#_safeEcho_newline '<p style="page-break-after: always;">&nbsp;</p><p style="page-break-before: always;">&nbsp;</p>' | cat
			
			#_safeEcho_newline '<div style="page-break-after: always;"> </div>' | cat
			#_safeEcho_newline '<div></div>' | cat
			
			#echo "$interpret__terminal_NOT_shell__end"
		}
		
		_paragraph_begin-terminal() {
			#_safeEcho_quoteAddSingle "$currentFunctionName" "$@"
			#_safeEcho_newline
			
			
			#echo "$interpret__terminal_NOT_shell__begin"
			
			_safeEcho_newline '' | cat
			#_safeEcho_newline '<p style="margin: 0;padding: 0; border-width: 0px;">' | cat
			
			#echo "$interpret__terminal_NOT_shell__end"
		}
		_paragraph_end-terminal() {
			#_safeEcho_quoteAddSingle "$currentFunctionName" "$@"
			#_safeEcho_newline
			
			
			#echo "$interpret__terminal_NOT_shell__begin"
			
			_safeEcho_newline '' | cat
			
			#echo "$interpret__terminal_NOT_shell__end"
		}
		
		_picture-terminal() {
			local currentWidth
			currentWidth=""
			[[ "$2" != "" ]] && currentWidth="$2"
			
			local currentWidthParameter
			currentWidthParameter=""
			[[ "$currentWidth" != "" ]] && currentWidthParameter='width="'"$currentWidth"'" '
			
			_safeEcho_quoteAddSingle "$currentFunctionName" "$@"
			_safeEcho_newline
			
			
			#echo "$interpret__terminal_NOT_shell__begin"
			
			#./
			#https://www.hostpapa.com/knowledgebase/align-float-images-website/
			#_safeEcho_newline '<img '"$currentWidthParameter"'src="'"$1"'" style="float: right;margin: 0 0 0 15px;border: 5px solid transparent;">' | cat
			
			#echo "$interpret__terminal_NOT_shell__end"
		}
		_image-terminal() {
			local currentWidth
			currentWidth="96%"
			[[ "$2" != "" ]] && currentWidth="$2"
			
			local currentWidthParameter
			currentWidthParameter=""
			[[ "$currentWidth" != "" ]] && currentWidthParameter='width="'"$currentWidth"'" '
			
			_safeEcho_quoteAddSingle "$currentFunctionName" "$@"
			_safeEcho_newline
			
			
			#echo "$interpret__terminal_NOT_shell__begin"
			
			#./
			#_safeEcho_newline '<img '"$currentWidthParameter"'src="'"$1"'" style="margin: 0 0 0 15px;border: 5px solid transparent;">' | cat
			
			#echo "$interpret__terminal_NOT_shell__end"
		}
		
		
		
		_cells_begin-terminal() {
			local currentWidth
			currentWidth="0%"
			[[ "$1" != "" ]] && currentWidth="$1"
			
			local currentWidthParameter
			currentWidthParameter=""
			[[ "$currentWidth" != "" ]] && currentWidthParameter='width="'"$currentWidth"'" '
			
			_safeEcho_quoteAddSingle "$currentFunctionName" "$@"
			_safeEcho_newline
			
			
			#echo "$interpret__terminal_NOT_shell__begin"
			
			#_safeEcho_newline '<table '"$currentWidthParameter"'style="empty-cells: show; border-spacing: 0px; border: 1px solid black; margin-top: 0px; vertical-align: top;">' | cat
			
			#echo "$interpret__terminal_NOT_shell__end"
		}
		_cells_end-terminal() {
			_safeEcho_quoteAddSingle "$currentFunctionName" "$@"
			_safeEcho_newline
			
			
			#echo "$interpret__terminal_NOT_shell__begin"
			
			#_safeEcho_newline '</table>' | cat
			
			#echo "$interpret__terminal_NOT_shell__end"
		}
		_cells_row_begin-terminal() {
			_safeEcho_quoteAddSingle "$currentFunctionName" "$@"
			_safeEcho_newline
			
			
			#echo "$interpret__terminal_NOT_shell__begin"
			
			#_safeEcho_newline '<tr>' | cat
			
			#echo "$interpret__terminal_NOT_shell__end"
		}
		_cells_row_end-terminal() {
			_safeEcho_quoteAddSingle "$currentFunctionName" "$@"
			_safeEcho_newline
			
			
			#echo "$interpret__terminal_NOT_shell__begin"
			
			#_safeEcho_newline '</tr>' | cat
			
			#echo "$interpret__terminal_NOT_shell__end"
		}
		_cells_speck_begin-terminal() {
			local currentWidth
			currentWidth="0%"
			[[ "$1" != "" ]] && currentWidth="$1"
			
			local currentWidthParameter
			currentWidthParameter=""
			[[ "$currentWidth" != "" ]] && currentWidthParameter='width="'"$currentWidth"'" '
			
			
			local currentColspan
			currentColspan="1"
			[[ "$2" != "" ]] && currentColspan="$2"
			
			local currentColspanParameter
			currentColspanParameter=""
			[[ "$currentColspan" != "" ]] && currentColspanParameter='colspan="'"$currentColspan"'" '
			
			
			_safeEcho_quoteAddSingle "$currentFunctionName" "$@"
			_safeEcho_newline
			
			
			#echo "$interpret__terminal_NOT_shell__begin"
			
			#_safeEcho_newline '<td '"$currentWidthParameter"''"$currentColspanParameter"'style="border-spacing: 0px; border: 1px solid black; margin-top: 0px; vertical-align: top;">' | cat
			
			#echo "$interpret__terminal_NOT_shell__end"
		}
		_cells_speck_end-terminal() {
			_safeEcho_quoteAddSingle "$currentFunctionName" "$@"
			_safeEcho_newline
			
			
			#echo "$interpret__terminal_NOT_shell__begin"
			
			#_safeEcho_newline '</td>' | cat
			
			#echo "$interpret__terminal_NOT_shell__end"
		}
		
		
		
		_markup_asciidoc_disable_begin-terminal() {
			true
		}
		_markup_asciidoc_disable_end-terminal() {
			true
		}
		
		
		
		
		_fold-terminal() {
			#if [[ "$markup_terminal_fold" != "" ]]
			#then
				#fold -w "$markup_terminal_fold" -s
				#return
			#fi
			cat
		}
		
		
		
		_workaround_preformattedCharacters-terminal() {
			#sed 's/\&#35;/#/g'
			#sed 's/\&#35;/#/g' | sed "s/\\\x27/\&#39;/g" | sed "s/\\\047/\&#39;/g" | sed "s/%27/\&#39;/g" | sed "s/\&#39;/\&#39;/g"
			
			#sed "s/\\\x27/\&#39;/g" | sed "s/\\\047/\&#39;/g" | sed "s/%27/\&#39;/g" | sed "s/\&#39;/\&#39;/g"
			#sed "s/\\\x3c/\&lt;;/g" | sed "s/\\\060/\&lt;;/g" | sed "s/%3c/\&lt;;/g" | sed "s/\&lt;;/\&lt;;/g"
			
			#sed 's/\&#35;/#/g' | sed "s/\\\x27/\&#39;/g" | sed "s/\\\047/\&#39;/g" | sed "s/%27/\&#39;/g" | sed "s/\&#39;/\&#39;/g" | sed "s/\\\x3c/\&lt;;/g" | sed "s/\\\060/\&lt;;/g" | sed "s/%3c/\&lt;;/g" | sed "s/\&lt;;/\&lt;;/g"
			
			cat
			
			
			#| sed "s/\&#92;/\\\/"
		}
		
		
		_markup_terminal_cmd() {
			local currentString
			
			while read -r currentString
			do
				[ "$currentString" ] && printf '%b' "$markup_terminal_cmd_begin""$currentString""$markup_terminal_cmd_end"
				echo
			done
		}
	fi
	
	if [[ "$current_scriptedIllustrator_markup" == "" ]] && [[ "$current_scriptedIllustrator_markup_markdown" == "" ]] && [[ "$workaround_noInterpret_begin" == "" ]] && [[ "$workaround_noInterpret_end" == "" ]] && [[ "$workaround_comment_shell_line" == "" ]]
	then
		_shellCommentLines() {
			local currentString
			
			while read -r currentString
			do
				[ "$currentString" ] && printf '%b' "$comment_shell_line $currentString"
				echo
			done
			
			#echo -n "$comment_shell_line"' '
			##LANG=C IFS=
			#while LANG=C IFS= read -r -d '' -n 1 currentString
			#do
				#[ "$currentString" ] && printf '%b' "$currentString"
				#[[ "$currentString" == $'\n' ]] && echo -n "$comment_shell_line"' '
			#done
		}
		
		# WARNING: Affects accurate prevention of '_r' and '_t' inaccurately accumulating or removing newlines.
		_filter__scriptedIllustrator_markup() {
			# Inherently add newline if not already present.
			grep -v "$flag__NOT_shell"
			
			# Add newline if already present.
			#grep -v $(_uid) | grep -v "$flag__NOT_shell"
			
			# Do not add newline if not already present.
			#sed 's/^.*'"$flag__NOT_shell"'.*$//g'
		}
	fi
	
}
_set_markup_terminal


_set_markup_terminal_exportFunctions() {
	_set_markup_terminal "$@"
	
	#export current_scriptedIllustrator_markup='terminal'
	export current_scriptedIllustrator_markup=''
	
	export -f _e
	
	export -f _e_
	
	export -f _o
	
	export -f _o_
	
	export -f _i
	
	export -f _v
	
	export -f _t
	
	export -f _r
	
	export -f _
	export -f _h
	
	
	
	export -f _heading1
	export -f _heading2
	export -f _heading3
	export -f _heading4
	export -f _heading5
	export -f _heading6
	
	export -f _page
	
	export -f _paragraph_begin
	export -f _paragraph_end
	
	
	export -f _picture
	export -f _image
	
	
	export -f _cells_begin
	export -f _cells_end
	export -f _cells_row_begin
	export -f _cells_row_end
	export -f _cells_speck_begin
	export -f _cells_speck_end
	
	export -f _markup_asciidoc_disable_begin
	export -f _markup_asciidoc_disable_end
}

_declareFunctions_markup_terminal() {
	declare -f _set_markup_terminal
	declare -f _set_markup_terminal_exportFunctions
	
	
	# WARNING: Most functions would be declared twice, substantially increasing 'current_internal_CompressedFunctions_bytes' .
	return 0
	
	declare -f _e
	declare -f _e-terminal
	
	declare -f _e_
	declare -f _e_-terminal
	
	declare -f _o
	declare -f _o-terminal
	
	declare -f _o_
	declare -f _o_-terminal
	
	declare -f _i
	declare -f _i-terminal
	
	declare -f _v
	declare -f _v-terminal
	
	declare -f _t
	declare -f _t-terminal
	
	declare -f _r
	declare -f _r-terminal
	
	declare -f _
	declare -f _h
	declare -f _h-terminal
	
	
	
	
	
	
	declare -f _heading1
	declare -f _heading1-terminal
	declare -f _heading2
	declare -f _heading2-terminal
	declare -f _heading3
	declare -f _heading3-terminal
	declare -f _heading4
	declare -f _heading4-terminal
	declare -f _heading5
	declare -f _heading5-terminal
	declare -f _heading6
	declare -f _heading6-terminal
	
	declare -f _page
	declare -f _page-terminal
	
	declare -f _paragraph_begin
	declare -f _paragraph_begin-terminal
	declare -f _paragraph_end
	declare -f _paragraph_end-terminal
	
	declare -f _picture
	declare -f _picture-terminal
	declare -f _image
	declare -f _image-terminal
	
	declare -f _cells_begin
	declare -f _cells_begin-terminal
	declare -f _cells_end
	declare -f _cells_end-terminal
	declare -f _cells_row_begin
	declare -f _cells_row_begin-terminal
	declare -f _cells_row_end
	declare -f _cells_row_end-terminal
	declare -f _cells_speck_begin
	declare -f _cells_speck_begin-terminal
	declare -f _cells_speck_end
	declare -f _cells_speck_end-terminal
	
	
	declare -f _markup_asciidoc_disable_begin
	declare -f _markup_asciidoc_disable_begin-terminal
	declare -f _markup_asciidoc_disable_end
	declare -f _markup_asciidoc_disable_end-terminal
	
	
	declare -f _fold-terminal
	
	
	declare -f _workaround_preformattedCharacters-terminal
}


#Simulated client/server discussion testing.

_log_query() {
	[[ "$1" == "" ]] && return 1
	
	tee "$1"
	
	return 0
}

_report_query_stdout() {
	[[ "$1" == "" ]] && return 1
	
	_messagePlain_probe 'stdout: strings'
	strings "$1"
	
	_messagePlain_probe 'stdout: hex'
	xxd -p "$1" | tr -d '\n'
	echo
	
	return 0
}

# ATTENTION: Overload with "core.sh" or similar.
_prepare_query_prog() {
	true
}

_prepare_query() {
	export ub_queryclientdir="$queryTmp"/client
	export qc="$ub_queryclientdir"
	
	export ub_queryclient="$ub_queryclientdir"/script
	export qce="$ub_queryclient"
	
	export ub_queryserverdir="$queryTmp"/server
	export qs="$ub_queryserverdir"
	
	export ub_queryserver="$ub_queryserverdir"/script
	export qse="$ub_queryserver"
	
	mkdir -p "$ub_queryclientdir"
	mkdir -p "$ub_queryserverdir"
	
	! [[ -e "$ub_queryclient" ]] && cp "$scriptAbsoluteLocation" "$ub_queryclient"
	! [[ -e "$ub_queryserver" ]] && cp "$scriptAbsoluteLocation" "$ub_queryserver"
	
	_prepare_query_prog "$@"
}

_queryServer_sequence() {
	_start
	
	local currentExitStatus
	
	export queryType="server"
	"$ub_queryserver" "$@"
	currentExitStatus="$?"
	
	env > env_$(_uid)
	
	_stop "$currentExitStatus"
}
_queryServer() {
	"$scriptAbsoluteLocation" _queryServer_sequence "$@"
}
_qs() {
	_queryServer "$@"
}

_queryClient_sequence() {
	_start
	
	local currentExitStatus
	
	export queryType="client"
	"$ub_queryclient" "$@"
	currentExitStatus="$?"
	
	env > env_$(_uid)
	
	_stop "$currentExitStatus"
}
_queryClient() {
	"$scriptAbsoluteLocation" _queryClient_sequence "$@"
}
_qc() {
	_queryClient "$@"
}

_query_diag() {
	echo test | _query "$@"
	local currentExitStatus="$?"
	
	_messagePlain_nominal 'diag: tx.log'
	_report_query_stdout "$queryTmp"/tx.log
	
	_messagePlain_nominal 'diag: xc.log'
	_report_query_stdout "$queryTmp"/xc.log
	
	_messagePlain_nominal 'diag: rx.log'
	_report_query_stdout "$queryTmp"/rx.log
	
	return "$currentExitStatus"
}

# ATTENTION: Overload with "core.sh" or similar.
_query() {
	_prepare_query
	
	( cd "$qc" ; _queryClient _bin cat | _log_query "$queryTmp"/tx.log | ( cd "$qs" ; _queryServer _bin cat | _log_query "$queryTmp"/xc.log | ( cd "$qc" ; _queryClient _bin cat | _log_query "$queryTmp"/rx.log ; return "${PIPESTATUS[0]}" )))
}


#"$1" == src (file/dir)
#"$2" == dst (torrentName).torrent
#"$3" == CSV Tracker URL List (full announce URL list comma delimited) (' <url>[,<url>]* ')
#"$4" == CSV Web Seed URL List
# ./ubiquitous_bash.sh _mktorrent ./ubiquitous_bash.sh torrentName 'https://example.com/tracker,https://example1.com/tracker' 'https://example.com/ubiquitous_bash.sh,https://example1.com/ubiquitous_bash.sh'
_mktorrent_webseed() {
	if [[ "$1" == "" ]]
	then
		_messagePlain_request '"$1" == src (file/dir)'
		_messagePlain_request '"$2" == dst (torrentName).torrent'
		_messagePlain_request '"$3" == CSV Tracker URL List (full announce URL list comma delimited) ('\'' <url>[,<url>]* '\'')'
		_messagePlain_request '"$4" == CSV Web Seed URL List'
		return 1
	fi
	
	local currentSrc
	currentSrc="$1"
	local currentDst
	currentDst="$2"
	local currentTrackerCSV
	currentTrackerCSV="$3"
	local currentWebSeedCSV
	currentWebSeedCSV="$4"
	shift ; shift ; shift ; shift
	
	mktorrent -w "$currentWebSeedCSV" -a "$currentTrackerCSV" -d "$currentSrc" -n "$currentDst" "$@"
}
_mktorrent() {
	_mktorrent_webseed "$@"
}







_test_mktorrent() {
	# If not Debian, then simply accept these pacakges may not be available.
	[[ -e /etc/issue ]] && ! cat /etc/issue | grep 'Debian' > /dev/null 2>&1 && return 0
	
	_wantGetDep mktorrent
	
	#_getDep mktorrent
}







# DANGER: Of course the 'dd' command can cause severe data loss. Be careful. Maybe use 'type -p' to see function code for reference instead of calling directly.


_dd_user() {
	dd "$@" oflag=direct conv=fdatasync status=progress
}
_dd() {
	sudo -n "$scriptAbsoluteLocation" _dd_user "$@"
}

_dropCache() {
	echo 3 | sudo -n tee /proc/sys/vm/drop_caches
	sync ; echo 3 | sudo -n tee /proc/sys/vm/drop_caches
}









_test_packetDriveDevice() {
	_wantGetDep blockdev
	
	_wantGetDep dvd+rw-format
	_wantGetDep growisofs
	
	# https://www.kernel.org/doc/html/latest/cdrom/packet-writing.html
	# pktcdvd driver makes the disc appear as a regular block device with a 2KB block size
	_wantGetDep pktsetup
	
	_wantGetDep partprobe
	_wantGetDep kpartx
	
	_wantGetDep udevadm
	
	_wantGetDep realpath
	_wantGetDep dmsetup
}




_packetDriveDevice_criticalDep() {
	! sudo -n which dvd+rw-format > /dev/null && exit 1
	! which realpath > /dev/null && exit 1
	
	! sudo -n which dmsetup > /dev/null && exit 1
	
	return 0
}


_find_packetDrive() {
	! _packetDriveDevice_criticalDep && exit 1
	
	[[ -e /dev/cdrom ]] && realpath /dev/cdrom && return 0
	[[ -e /dev/cdrw ]] && realpath /dev/cdrw && return 0
	[[ -e /dev/dvd ]] && realpath /dev/dvd && return 0
	[[ -e /dev/sr0 ]] && echo /dev/sr0 && return 0
	[[ -e /dev/sr1 ]] && echo /dev/sr1 && return 0
	
	return 1
}





_check_driveDeviceFile_packetDriveDevice() {
	! [[ -e "$1" ]] && echo 'FAIL: missing: drive' && exit 1
	
	if ! sudo -n dd if="$1" of=/dev/null bs=1k count=1 > /dev/null 2>&1
	then
		echo 'FAIL: drive cannot read any removable media (may be empty)' && exit 1
	fi
	
	if findmnt "$1" > /dev/null 2>&1 || findmnt "$1"-part1 > /dev/null 2>&1  || findmnt "$1"-part2 > /dev/null 2>&1 || findmnt "$1"-part3 > /dev/null 2>&1 || findmnt "$1"1 > /dev/null 2>&1 || findmnt "$1"2 > /dev/null 2>&1 || findmnt "$1"3 > /dev/null 2>&1
	then
		echo 'FAIL: safety: detect: mountpoint' && exit 1
	fi
	
	return 0
}


_packetDriveDevice_remove_procedure() {
	sudo -n dmsetup remove /dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice? > /dev/null 2>&1
	sudo -n dmsetup remove /dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice?? > /dev/null 2>&1
	sudo -n dmsetup remove /dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice > /dev/null 2>&1
}
_packetDriveDevice_remove() {
	_packetDriveDevice_remove_procedure "$@"
	
	! [[ -e /dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice ]] && _messagePlain_good 'good: dmsetup: remove: '/dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice
	[[ -e /dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice ]] && _messagePlain_bad 'fail: dmsetup: remove: '/dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice
	
	sleep 3
	! [[ -e /dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice ]]
}

_packetDriveDevice() {
	local currentDrive
	currentDrive=$(_find_packetDrive)
	_check_driveDeviceFile_packetDriveDevice "$currentDrive"
	
	_packetDriveDevice_remove_procedure
	
	local currentDriveLinearSize
	currentDriveLinearSize=$(sudo -n blockdev --getsz "$currentDrive")
	sudo -n dmsetup create uk4uPhB663kVcygT0q_packetDriveDevice --table '0 '"$currentDriveLinearSize"' linear '"$currentDrive"' 0'
	
	sudo -n partprobe
	sudo -n kpartx -a "/dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice"
	
	ls -A -1 /dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice*
	
	[[ -e /dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice ]] && _messagePlain_good 'good: dmsetup: create: '/dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice
	! [[ -e /dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice ]] && _messagePlain_bad 'fail: dmsetup: create: '/dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice
	
	sleep 3
	[[ -e /dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice ]]
}


_packetDriveDevice_format_bdre() {
	local currentDrive
	currentDrive=$(_find_packetDrive)
	_check_driveDeviceFile_packetDriveDevice "$currentDrive"
	
	_packetDriveDevice_remove_procedure
	
	
	sudo -n dvd+rw-format "$currentDrive" -force -ssa=default
	
	# Apparently resets back to 'ssa=default' anyway.
	#sudo -n dvd+rw-format "$currentDrive" -force=full
	#sudo -n dvd+rw-format "$currentDrive" -force=full -blank=full
	
	#sudo -n dvd+rw-format "$currentDrive" -force -ssa=none
	
	sleep 20
	return
}
_packetDriveDevice_format() {
	_packetDriveDevice_format_bdre "$@"
}





# Intended to number sectors at regular intervals in unpartitioned space, especially to simplify realignment of corrupted partitioned optical disc.
# Do NOT write to filesystems.
# Prefer 1/2^5MiB (0.03125MiB) (2^15byte) (32768byte) intervals .
#  Good compressibility, one number per 16 2048b sectors, one number per 64 512b sectors, at least one number per 34816b=17*2048b track, thirty-two numbers per MiB .
#_pattern_recovery_write /dev/disk/by-id/usb-FUJITSU_MC?3?30??-?_????????????-0\:0
_pattern_recovery_write() {
	local currentBlockSize
	currentBlockSize="$3"
	[[ "$currentBlockSize" == "" ]] && currentBlockSize=32768
	
	local currentSequenceFillBytes
	let currentSequenceFillBytes=currentBlockSize-16
	
	local currentTotal
	currentTotal="$2"
	[[ "$currentTotal" == "" ]] && currentTotal=1000000000001111
	
	seq --separator="$(local currentIteration; while [[ "$currentIteration" -lt "$currentSequenceFillBytes" ]]; do echo -n 20 ; let currentIteration=currentIteration+1; done | xxd -r -p)" --equal-width 0 1 1000000000001111 | tr -d '\n' | sudo -n dd of="$1" count="$currentTotal" bs=1M iflag=fullblock oflag=direct conv=fdatasync status=progress
	sudo -n dd if="$1" bs="$currentBlockSize" skip=0 count=1 2>/dev/null | head --bytes=16 | tr -dc '0-9 '
	echo
	sudo -n dd if="$1" bs="$currentBlockSize" skip=1 count=1 2>/dev/null | head --bytes=16 | tr -dc '0-9 '
	echo
	echo
	
	_pattern_recovery_last "$1" "$2" "$3"
}
#_pattern_recovery_skip /dev/disk/by-id/usb-FUJITSU_MC?3?30??-?_????????????-0\:0 18000
_pattern_recovery_skip() {
	local currentBlockSize
	currentBlockSize="$3"
	[[ "$currentBlockSize" == "" ]] && currentBlockSize=32768
	
	sudo -n dd if="$1" bs="$currentBlockSize" skip="$2" count=1 2>/dev/null | head --bytes=16 | tr -dc '0-9 '
	echo
}
#_pattern_recovery_last /dev/disk/by-id/usb-FUJITSU_MC?3?30??-?_????????????-0\:0
_pattern_recovery_last() {
	local currentBlockSize
	currentBlockSize="$3"
	[[ "$currentBlockSize" == "" ]] && currentBlockSize=32768
	
	local currentLastByte
	currentLastByte=$(! sudo -n blockdev --getsize64 "$1" 2>/dev/null)
	[[ "$currentLastByte" == "" ]] && return 0
	
	local currentLastBlock
	
	
	currentLastBlock=$(bc <<< "$currentLastByte / $currentBlockSize")
	echo "$currentLastBlock"'= '
	sudo -n dd if="$1" bs="$currentBlockSize" skip="$currentLastBlock" count=1 2>/dev/null | head --bytes=16 | tr -dc '0-9 '
	echo
	echo 'wc -c $(... '"$currentLastBlock"')= '$(sudo -n dd if="$1" bs="$currentBlockSize" skip="$currentLastBlock" count=1 2>/dev/null | wc -c)
	echo
	
	currentLastBlock=$(bc <<< "$currentLastByte / $currentBlockSize - 1")
	echo "$currentLastBlock"'= '
	sudo -n dd if="$1" bs="$currentBlockSize" skip="$currentLastBlock" count=1 2>/dev/null | head --bytes=16 | tr -dc '0-9 '
	echo
	echo 'wc -c $(... '"$currentLastBlock"')= '$(sudo -n dd if="$1" bs="$currentBlockSize" skip="$currentLastBlock" count=1 2>/dev/null | wc -c)
	echo
}


#_pattern_recovery_write-32768 /dev/disk/by-id/usb-FUJITSU_MC?3?30??-?_????????????-0\:0
_pattern_recovery_write-32768() {
	_pattern_recovery_write "$1" "$2" 32768
}
#_pattern_recovery_skip-32768 /dev/disk/by-id/usb-FUJITSU_MC?3?30??-?_????????????-0\:0 18000
_pattern_recovery_skip-32768() {
	_pattern_recovery_skip "$1" "$2" 32768
}
#_pattern_recovery_last-32768 /dev/disk/by-id/usb-FUJITSU_MC?3?30??-?_????????????-0\:0
_pattern_recovery_last-32768() {
	_pattern_recovery_last "$1" "$2" 32768
}


# CAUTION: Strongly discouraged!
#_pattern_recovery_write-65536 /dev/disk/by-id/usb-FUJITSU_MC?3?30??-?_????????????-0\:0
_pattern_recovery_write-65536() {
	_pattern_recovery_write "$1" "$2" 65536
}
#_pattern_recovery_skip-65536 /dev/disk/by-id/usb-FUJITSU_MC?3?30??-?_????????????-0\:0 9000
_pattern_recovery_skip-65536() {
	_pattern_recovery_skip "$1" "$2" 65536
}
#_pattern_recovery_last-65536 /dev/disk/by-id/usb-FUJITSU_MC?3?30??-?_????????????-0\:0
_pattern_recovery_last-65536() {
	_pattern_recovery_last "$1" "$2" 65536
}









# CAUTION: Strongly discouraged!
# No production use.
# While this works, it may not be very efficient, possibly due to the apparent 'entire track' writing behavior of at least some optical discs - with 65536 being close to the size of a track this will rewrite much of the entire disc. Usually it is desirable to fill the disc completely anyway for compressibility.
#_pattern_recovery_write_sparse_65536 /dev/disk/by-id/usb-FUJITSU_MC?3?30??-?_????????????-0\:0
# _pattern_recovery_write_sparse_65536() {
# 	local currentNumber
# 	local currentLimit
# 	local currentBlockPosition
# 	currentLimit=1000000000001111
# 	#currentLimit=0000000000000100
# 	seq --equal-width 0 1 "$currentLimit" | while read -r currentNumber
# 	do
# 		currentBlockPosition="$currentNumber" #65536
# 		currentBlockPosition=$(bc <<< "$currentNumber * 4096") #bs=16
# 		if ! echo -n "$currentNumber" | sudo -n dd of="$1" bs=16 seek="$currentBlockPosition" 2>/dev/null
# 		then
# 			break
# 		fi
# 		[[ $(bc <<< "$currentNumber % 50") == 0 ]] && echo "$currentNumber" 2>&1
# 	done
# 	echo
# 	sudo -n dd if="$1" bs=65536 skip=0 count=1 2>/dev/null | head --bytes=16 | tr -dc '0-9 '
# 	echo
# 	sudo -n dd if="$1" bs=65536 skip=1 count=1 2>/dev/null | head --bytes=16 | tr -dc '0-9 '
# 	echo
# }



# WARNING: Must equal 65536 .
#seq --separator="$(for n in {1..65520}; do echo -n 20 ; done | xxd -r -p)" --equal-width 0 1 0000000000000001 | tr -d '\n' | head --bytes="-16" | wc -c





# ATTENTION: Override with 'ops.sh' , 'core.sh' , or similar.
_setupUbiquitous_accessories_here-gnuoctave() {
	cat << CZXWXcRMTo8EmM8i4d

%# https://stackoverflow.com/questions/8260619/how-can-i-suppress-the-output-of-a-command-in-octave
%# oldpager = PAGER('/dev/null');
%# oldpso = page_screen_output(1);
%# oldpoi = page_output_immediately(1);


format long g;


deci = 10^-1;
centi = 10^-2;
milli = 10^-3;
micro = 10^-6;
nano =-10^-9;
pico = 10^-12;
femto = 10^-15;
atto = 10^-18;

kilo = 10^3;
mega = kilo * 10^3;
giga = mega * 10^3;
tera = giga * 10^3;


bit = 1;
byte = bit * 8;

kilobit = kilo * bit;
megabit = mega * bit;
gigabit = giga * bit;
terabit = tera * bit;

kb = kilobit;
Kb = kilobit;
Mb = megabit;
Gb = gigabit;
Tb = terabit;

kilobyte = kilobit * byte;
megabyte = megabit * byte;
gigabyte = gigabit * byte;
terabyte = terabit * byte;

kB = kilobyte;
KB = kilobyte;
MB = megabyte;
GB = gigabyte;
TB = terabyte;


kibi = 1024;
mebi = kibi * 1024;
gibi = mebi * 1024;
tebi = gibi * 1024;

kibibit = kibi * bit;
mebibit = mebi * bit;
gibibit = gibi * bit;
tebibit = tebi * bit;

Kib = kibibit;
Mib = mebibit;
Gib = gibibit;
Tib = tebibit;

kibibyte = kibi * byte;
mebibyte = mebi * byte;
gibibyte = gibi * byte;
tebibyte = tebi * byte;

KiB = kibibyte;
MiB = mebibyte;
GiB = gibibyte;
TiB = tebibyte;



meter = 1;

kilometer = kilo * meter;
megameter = mega * meter;
Megameter = megameter;

decimeter = deci * meter;
centimeter = centi * meter;
millimeter = milli * meter;
micrometer = micro * meter;
nanometer = nano * meter;
picometer = pico * meter;
femtometer = femto * meter;
attometer = atto * meter;



%# 1 * lightsecond ~= 300 * Mega * meter
lightsecond = 299792458 * meter;
lightSecond = lightsecond;

lightyear = lightsecond * 365 * 24 * 3600;
lightYear = lightyear;



hertz = 1;

kilohertz = kilo * hertz;
megahertz = mega * hertz;
gigahertz = giga * hertz;
terahertz = tera * hertz;

kHz = kilohertz;
KHz = kilohertz;
MHz = megahertz;
GHz = gigahertz;
THz = terahertz;



unix("true");
system("true");

cd;

%# Equivalent to Ctrl-L . 
%# https://stackoverflow.com/questions/11269571/how-to-clear-the-command-line-in-octave
clc;


%# PAGER(oldpager);
%# page_screen_output(oldpso);
%# page_output_immediately(oldpoi);

CZXWXcRMTo8EmM8i4d


	! _if_cygwin && cat << CZXWXcRMTo8EmM8i4d

pkg load symbolic;

syms a b c d e f g h i j k l m n o p q r s t u v w x y z;


%# https://octave.sourceforge.io/symbolic/overview.html
nsolve = @vpasolve;

CZXWXcRMTo8EmM8i4d

}


_setupUbiquitous_accessories_here-gnuoctave_hook() {
	cat << CZXWXcRMTo8EmM8i4d

%# oldpager = PAGER('/dev/null');
%# oldpso = page_screen_output(1);
%# oldpoi = page_output_immediately(1);

%# ubcore
run("$ubcore_accessoriesFile_gnuoctave_ubhome");

%# PAGER(oldpager);
%# page_screen_output(oldpso);
%# page_output_immediately(oldpoi);

CZXWXcRMTo8EmM8i4d
}




_setupUbiquitous_accessories_here-cloud_bin() {
	cat << CZXWXcRMTo8EmM8i4d

if [[ "$PATH" != *'.ebcli-virtual-env/executables'* ]] && [[ -e "$HOME"/.ebcli-virtual-env/executables ]]
then
	# WARNING: Must interpret "$HOME" as is at this point and NOT after any "$HOME" override.
	export PATH="$HOME"/.ebcli-virtual-env/executables:"$PATH"
fi


if [[ "$PATH" != *'.gcloud/google-cloud-sdk'* ]] && [[ -e "$HOME"/.gcloud/google-cloud-sdk/completion.bash.inc ]] && [[ -e "$HOME"/.gcloud/google-cloud-sdk/path.bash.inc ]]
then
	. "$HOME"/.gcloud/google-cloud-sdk/completion.bash.inc
	. "$HOME"/.gcloud/google-cloud-sdk/path.bash.inc
fi

CZXWXcRMTo8EmM8i4d
}





_setupUbiquitous_accessories_here-python() {
	
	_generate_lean-lib-python_here "$@"
	
} 

_setupUbiquitous_accessories_here-python_hook() {
	cat << CZXWXcRMTo8EmM8i4d

# ATTENTION: Without either 'exec(exec(open()))' or 'execfile()' , 'from ubcorerc_pythonrc import *' must take effect!
# If 'exec(exec(open()))' is substituted for 'from ubcorerc_pythonrc import *' then copying home directory files independent of '.ubcore' 
import os
if os.path.exists("$ubcore_accessoriesFile_python"):
	import sys
	import os
	# https://stackoverflow.com/questions/2349991/how-to-import-other-python-files
	sys.path.append(os.path.abspath("$ubcoreDir_accessories/python"))
	from ubcorerc_pythonrc import *





import sys
# https://stackoverflow.com/questions/436198/what-is-an-alternative-to-execfile-in-python-3
if sys.hexversion > 0x03000000:
	exec('exec(open( "$ubcore_accessoriesFile_python_ubhome" ).read() )')
else:
	execfile("$ubcore_accessoriesFile_python_ubhome")




CZXWXcRMTo8EmM8i4d
}



_setupUbiquitous_accessories_here-python_bashrc() {
	cat << CZXWXcRMTo8EmM8i4d

# Interactive bash shell will default to calling 'python3' while scripts invoking '#! /usr/bin/env python' or similar may still be given 'python2' equivalent.
alias python=python3

export PYTHONSTARTUP="$HOME"/.pythonrc

CZXWXcRMTo8EmM8i4d
}























_setupUbiquitous_accessories-gnuoctave() {
	_messagePlain_nominal 'init: _setupUbiquitous_accessories-gnuoctave'
	
	mkdir -p "$ubcoreDir_accessories"/gnuoctave
	
	export ubcore_accessoriesFile_gnuoctave="$ubcoreDir_accessories"/gnuoctave/ubcorerc.m
	export ubcore_accessoriesFile_gnuoctave_ubhome="$ubHome"/.ubcorerc-gnuoctave.m
	
	rm -f "$ubcore_accessoriesFile_gnuoctave"
	rm -f "$ubcore_accessoriesFile_gnuoctave_ubhome"
	ln -s "$ubcore_accessoriesFile_gnuoctave_ubhome" "$ubcore_accessoriesFile_gnuoctave"
	
	_setupUbiquitous_accessories_here-gnuoctave > "$ubcore_accessoriesFile_gnuoctave_ubhome"
	
	
	if ! grep ubcore "$ubHome"/.octaverc > /dev/null 2>&1 && _messagePlain_probe 'octaverc'
	then
		# https://www.mathworks.com/matlabcentral/answers/194868-what-about-the-character
		#echo '%# ubcore' >> "$ubHome"/.octaverc
		#_safeEcho_newline run'("'"$ubcore_accessoriesFile_gnuoctave_ubhome"'")' >> "$ubHome"/.octaverc
		_setupUbiquitous_accessories_here-gnuoctave_hook >> "$ubHome"/.octaverc
	fi
	
	return 0
}


_setupUbiquitous_accessories_bashrc-cloud_bin() {
	
	_setupUbiquitous_accessories_here-cloud_bin
	
	echo 'true'
	
	return 0
}



_setupUbiquitous_accessories-python() {
	_messagePlain_nominal 'init: _setupUbiquitous_accessories-python'
	
	mkdir -p "$ubcoreDir_accessories"/python
	
	export ubcore_accessoriesFile_python="$ubcoreDir_accessories"/python/ubcorerc_pythonrc.py
	export ubcore_accessoriesFile_python_ubhome="$ubHome"/.ubcorerc_pythonrc.py
	
	rm -f "$ubcore_accessoriesFile_python"
	rm -f "$ubcore_accessoriesFile_python_ubhome"
	ln -s "$ubcore_accessoriesFile_python_ubhome" "$ubcore_accessoriesFile_python"
	
	_setupUbiquitous_accessories_here-python > "$ubcore_accessoriesFile_python_ubhome"
	
	
	if ! grep ubcore "$ubHome"/.pythonrc > /dev/null 2>&1 && _messagePlain_probe 'pythonrc'
	then
		# https://www.mathworks.com/matlabcentral/answers/194868-what-about-the-character
		#echo '%# ubcore' >> "$ubHome"/.pythonrc
		#_safeEcho_newline run'("'"$ubcore_accessoriesFile_python_ubhome"'")' >> "$ubHome"/.pythonrc
		_setupUbiquitous_accessories_here-python_hook >> "$ubHome"/.pythonrc
	fi
	
	return 0
}



_setupUbiquitous_accessories() {
	
	_setupUbiquitous_accessories-gnuoctave "$@"
	
	_setupUbiquitous_accessories-python "$@"
	
	return 0
}

_setupUbiquitous_accessories_bashrc() {
	#_messagePlain_nominal 'init: _setupUbiquitous_accessories_bashrc'
	
	_setupUbiquitous_accessories_bashrc-cloud_bin "$@"
	
	_setupUbiquitous_accessories_here-python_bashrc "$@"
}


_setupUbiquitous_accessories_requests() {
	
	# EXAMPLE .
	#_messagePlain_request 'request: request'
	
	return 0
}






_setupUbiquitous_here() {
	! uname -a | grep -i cygwin > /dev/null 2>&1 && cat << CZXWXcRMTo8EmM8i4d

if type sudo > /dev/null 2>&1 && groups | grep -E 'wheel|sudo' > /dev/null 2>&1 && ! uname -a | grep -i cygwin > /dev/null 2>&1
then
	# Greater or equal, '_priority_critical_pid_root' .
	sudo -n renice -n -15 -p \$\$ > /dev/null 2>&1
	sudo -n ionice -c 2 -n 2 -p \$\$ > /dev/null 2>&1
fi

# ^
# Ensures admin user shell startup, including Ubiquitous Bash, is relatively quick under heavy system load.
# Near-realtime priority may be acceptable, due to reliability of relevant Ubiquitous Bash functions.
# WARNING: Do NOT prioritize highly enough to interfere with embedded hard realtime processes.

CZXWXcRMTo8EmM8i4d


	# WARNING: What is otherwise considered bad practice may be accepted to reduce substantial MSW/Cygwin inconvenience .
	_if_cygwin && cat << CZXWXcRMTo8EmM8i4d

[[ -e '/cygdrive' ]] && uname -a | grep -i cygwin > /dev/null 2>&1 && echo -n '.'

[[ "\$profileScriptLocation" == "" ]] && export profileScriptLocation_new='true'

CZXWXcRMTo8EmM8i4d


	cat << CZXWXcRMTo8EmM8i4d
PS1_lineNumber=""


# WARNING: Importing complete 'ubiquitous_bash.sh' may cause other scripts to call functions inappropriate for their needs during "_test" and "_setup" .
# This may be acceptable if the user has already run "_setup" from the imported script .
#export profileScriptLocation="$ubcoreUBdir"/ubiquitous_bash.sh
export profileScriptLocation="$ubcoreUBdir"/ubcore.sh
#export profileScriptLocation="$ubcoreUBdir"/lean.sh
export profileScriptFolder="$ubcoreUBdir"
[[ "\$scriptAbsoluteLocation" != "" ]] && . "\$scriptAbsoluteLocation" --parent _importShortcuts
[[ "\$scriptAbsoluteLocation" == "" ]] && . "\$profileScriptLocation" --profile _importShortcuts


# Returns priority to normal.
# Greater or equal, '_priority_app_pid_root' .
#ionice -c 2 -n 3 -p \$\$
#renice -n -5 -p \$\$ > /dev/null 2>&1

# Returns priority to normal.
# Greater or equal, '_priority_app_pid' .
ionice -c 2 -n 4 -p \$\$
renice -n 0 -p \$\$ > /dev/null 2>&1

[[ -e "$ubcoreDir"/cloudrc ]] && . "$ubcoreDir"/cloudrc

true

CZXWXcRMTo8EmM8i4d


	# WARNING: What is otherwise considered bad practice may be accepted to reduce substantial MSW/Cygwin inconvenience .
	_if_cygwin && cat << CZXWXcRMTo8EmM8i4d

if [[ -e '/cygdrive' ]] && uname -a | grep -i cygwin > /dev/null 2>&1
then
	#echo -n '.'
	#clear
	
	# https://stackoverflow.com/questions/238073/how-to-add-a-progress-bar-to-a-shell-script
	echo -e -n '.\r'
	
	if [[ "\$profileScriptLocation_new" == 'true' ]]
	then
		export profileScriptLocation_new=''
		unset profileScriptLocation_new
		
		sleep 0.1
		echo '.'
		sleep 0.1
		echo '.'
		sleep 0.1
		clear
	fi
fi

true

CZXWXcRMTo8EmM8i4d

}

_configureLocal() {
	_configureFile "$1" "_local"
}

_configureFile() {
	cp "$scriptAbsoluteFolder"/"$1" "$scriptAbsoluteFolder"/"$2"
}

_configureOps() {
	echo "$@" >> "$scriptAbsoluteFolder"/ops
}

_resetOps() {
	rm "$scriptAbsoluteFolder"/ops
}

_importShortcuts() {
	_tryExec "_resetFakeHomeEnv"
	
	if ! [[ "$PATH" == *":""$HOME""/bin"* ]] && ! [[ "$PATH" == "$HOME""/bin"* ]] && [[ -e "$HOME"/bin ]] && [[ -d "$HOME"/bin ]]
	then
		export PATH="$PATH":"$HOME"/bin
	fi
	
	_tryExec "_visualPrompt"
	
	_tryExec "_scopePrompt"
	
	return 0
}

_gitPull_ubiquitous() {
	git pull
}

_gitClone_ubiquitous() {
	git clone --depth 1 git@github.com:mirage335/ubiquitous_bash.git
}

_selfCloneUbiquitous() {
	"$scriptBin"/.ubrgbin.sh _ubrgbin_cpA "$scriptBin" "$ubcoreUBdir"/ > /dev/null 2>&1
	cp -a "$scriptAbsoluteLocation" "$ubcoreUBdir"/lean.sh
	cp -a "$scriptAbsoluteLocation" "$ubcoreUBdir"/ubcore.sh
	cp -a "$scriptAbsoluteFolder"/lean.sh "$ubcoreUBdir"/lean.sh > /dev/null 2>&1
	cp -a "$scriptAbsoluteFolder"/lean.sh "$ubcoreUBdir"/ubcore.sh > /dev/null 2>&1
	cp -a "$scriptAbsoluteFolder"/ubcore.sh "$ubcoreUBdir"/ubcore.sh > /dev/null 2>&1
	cp -a "$scriptAbsoluteLocation" "$ubcoreUBdir"/ubiquitous_bash.sh
	
	cp -a "$scriptAbsoluteFolder"/lean.py "$ubcoreUBdir"/lean.py > /dev/null 2>&1
}

_installUbiquitous() {
	local localFunctionEntryPWD
	localFunctionEntryPWD="$PWD"
	
	cd "$ubcoreDir"
	
	cd "$ubcoreUBdir"
	_messagePlain_nominal 'attempt: git pull'
	if [[ "$nonet" != "true" ]] && type git > /dev/null 2>&1
	then
		
		local ub_gitPullStatus
		git pull
		ub_gitPullStatus="$?"
		[[ "$ub_gitPullStatus" != 0 ]] && git pull && ub_gitPullStatus="$?"
		! cd "$localFunctionEntryPWD" && return 1
		
		[[ "$ub_gitPullStatus" == "0" ]] && _messagePlain_good 'pass: git pull' && cd "$localFunctionEntryPWD" && return 0
	fi
	_messagePlain_warn 'fail: git pull'
	
	cd "$ubcoreDir"
	_messagePlain_nominal 'attempt: git clone'
	[[ "$nonet" != "true" ]] && type git > /dev/null 2>&1 && [[ ! -e ".git" ]] && [[ ! -e "$ubcoreUBdir"/.git ]] && _gitClone_ubiquitous && _messagePlain_good 'pass: git clone' && return 0
	[[ "$nonet" != "true" ]] && type git > /dev/null 2>&1 && [[ ! -e ".git" ]] && [[ ! -e "$ubcoreUBdir"/.git ]] && _gitClone_ubiquitous && _messagePlain_good 'pass: git clone' && return 0
	_messagePlain_warn 'fail: git clone'
	
	cd "$ubcoreUBdir"
	_messagePlain_nominal 'attempt: self git pull'
	# WARNING: Not attempted if 'nonet' has been set 'true', due to possible conflicts with scripts intending only to copy one file (ie. by SSH transfer).
	if [[ "$nonet" != "true" ]] && type git > /dev/null 2>&1 && [[ -e "$scriptAbsoluteFolder"/.git ]] && [[ -e "$scriptAbsoluteFolder"/.git ]]
	then
		
		local ub_gitPullStatus
		#git reset --hard
		[[ -e "$scriptAbsoluteFolder"/lean.sh ]] && rm -f "$ubcoreUBdir"/lean.sh > /dev/null 2>&1
		[[ -e "$scriptAbsoluteFolder"/ubcore.sh ]] && rm -f "$ubcoreUBdir"/ubcore.sh > /dev/null 2>&1
		[[ -e "$scriptAbsoluteFolder"/ubiquitous_bash.sh ]] && rm -f "$ubcoreUBdir"/ubiquitous_bash.sh > /dev/null 2>&1
		[[ -e "$scriptAbsoluteFolder"/lean_compressed.sh ]] && rm -f "$ubcoreUBdir"/lean_compressed.sh > /dev/null 2>&1
		[[ -e "$scriptAbsoluteFolder"/core_compressed.sh ]] && rm -f "$ubcoreUBdir"/core_compressed.sh > /dev/null 2>&1
		[[ -e "$scriptAbsoluteFolder"/ubcore_compressed.sh ]] && rm -f "$ubcoreUBdir"/ubcore_compressed.sh > /dev/null 2>&1
		[[ -e "$scriptAbsoluteFolder"/ubiquitous_bash_compressed.sh ]] && rm -f "$ubcoreUBdir"/ubiquitous_bash_compressed.sh > /dev/null 2>&1
		[[ -e "$scriptAbsoluteFolder"/lean.py ]] && rm -f "$ubcoreUBdir"/lean.py > /dev/null 2>&1
		git reset --hard
		git pull "$scriptAbsoluteFolder"
		ub_gitPullStatus="$?"
		! cd "$localFunctionEntryPWD" && return 1
		
		[[ "$ub_gitPullStatus" == "0" ]] && _messagePlain_good 'pass: self git pull' && cd "$localFunctionEntryPWD" && return 0
	fi
	_messagePlain_warn 'fail: self git pull'
	
	cd "$ubcoreDir"
	_messagePlain_nominal 'attempt: self clone'
	[[ -e ".git" ]] && _messagePlain_bad 'fail: self clone' && return 1
	_selfCloneUbiquitous && return 0
	_messagePlain_bad 'fail: self clone' && return 1
	
	return 0
	
	cd "$localFunctionEntryPWD"
}




_setupUbiquitous() {
	_messageNormal "init: setupUbiquitous"
	
	_if_cygwin && _setup_ubiquitousBash_cygwin_procedure
	
	
	local ubHome
	ubHome="$HOME"
	[[ "$1" != "" ]] && ubHome="$1"
	
	export ubcoreDir="$ubHome"/.ubcore
	export ubcoreFile="$ubcoreDir"/.ubcorerc
	
	export ubcoreDir_accessories="$ubHome"/.ubcore/accessories
	
	
	# WARNING: Despite the name, do NOT point this to 'ubcore.sh' or similar. Full set of functions are expected from this file by some use cases!
	export ubcoreUBdir="$ubcoreDir"/ubiquitous_bash
	export ubcoreUBfile="$ubcoreDir"/ubiquitous_bash/ubiquitous_bash.sh
	
	_messagePlain_probe 'ubHome= '"$ubHome"
	_messagePlain_probe 'ubcoreDir= '"$ubcoreDir"
	_messagePlain_probe 'ubcoreFile= '"$ubcoreFile"
	
	_messagePlain_probe 'ubcoreUBdir= '"$ubcoreUBdir"
	_messagePlain_probe 'ubcoreUBfile= '"$ubcoreUBfile"
	
	mkdir -p "$ubcoreUBdir"
	! [[ -e "$ubcoreUBdir" ]] && _messagePlain_bad 'missing: ubcoreUBdir= '"$ubcoreUBdir" && _messageFAIL && return 1
	
	mkdir -p "$ubcoreDir_accessories"
	! [[ -e "$ubcoreDir_accessories" ]] && _messagePlain_bad 'missing: ubcoreUBdir_accessories= '"$ubcoreDir_accessories" && _messageFAIL && return 1
	
	
	_messageNormal "install: setupUbiquitous"
	! _installUbiquitous && _messageFAIL && return 1
	! [[ -e "$ubcoreUBfile" ]] && _messagePlain_bad 'missing: ubcoreUBfile= '"$ubcoreUBfile" && _messageFAIL && return 1
	
	
	_messageNormal "hook: setupUbiquitous"
	if ! _permissions_ubiquitous_repo "$ubcoreUBdir" && _messagePlain_bad 'permissions: ubcoreUBdir = '"$ubcoreUBdir"
	then
		if ! _if_cygwin
		then
			_messageFAIL
			return 1
		else
			echo 'warn: accepted: cygwin: permissions'
		fi
	fi
	
	mkdir -p "$ubHome"/bin/
	ln -sf "$ubcoreUBfile" "$ubHome"/bin/ubiquitous_bash.sh
	ln -sf "$ubcoreUBfile" "$ubHome"/bin/_winehere
	ln -sf "$ubcoreUBfile" "$ubHome"/bin/_winecfghere
	
	_setupUbiquitous_here > "$ubcoreFile"
	_setupUbiquitous_accessories_bashrc >> "$ubcoreFile"
	! [[ -e "$ubcoreFile" ]] && _messagePlain_bad 'missing: ubcoreFile= '"$ubcoreFile" && _messageFAIL && return 1
	
	
	! grep ubcore "$ubHome"/.bashrc > /dev/null 2>&1 && _messagePlain_probe "$ubcoreFile"' >> '"$ubHome"/.bashrc && echo ". ""$ubcoreFile" >> "$ubHome"/.bashrc
	! grep ubcore "$ubHome"/.bashrc > /dev/null 2>&1 && _messagePlain_bad 'missing: bashrc hook' && _messageFAIL && return 1
	
	
	
	
	_messageNormal "install: setupUbiquitous_accessories"
	
	_setupUbiquitous_accessories "$@"
	
	
	_messageNormal "request: setupUbiquitous_accessories , setupUbiquitous"
	
	_setupUbiquitous_accessories_requests "$@"
	
	if ! _if_cygwin
	then
		# WARNING: End user file association. Do NOT call within scripts.
		# WARNING: Necessarily relies on a 'deprecated' 'field code' with the 'Exec key' of a 'Desktop Entry' file association.
		# https://specifications.freedesktop.org/desktop-entry-spec/desktop-entry-spec-latest.html
		_messagePlain_request 'association: *.bat'
		echo 'konsole --workdir %d -e /bin/bash %f (open in graphical terminal emulator from file manager) (preferred)'
		echo "bash ('Advanced Options -> Run in terminal')"
	fi
	
	_messagePlain_request "Now import new functionality into current shell if not in current shell."
	_messagePlain_request ". "'"'"$scriptAbsoluteLocation"'"' --profile _importShortcuts
	
	sleep 3
	return 0
}

_setupUbiquitous_nonet() {
	local oldNoNet
	oldNoNet="$nonet"
	export nonet="true"
	_setupUbiquitous "$@"
	[[ "$oldNoNet" != "true" ]] && export nonet="$oldNoNet"
}

_upgradeUbiquitous() {
	_setupUbiquitous
}

_resetUbiquitous_sequence() {
	_start scriptLocal_mkdir_disable
	
	[[ ! -e "$HOME"/.bashrc ]] && return 0
	cp "$HOME"/.bashrc "$HOME"/.bashrc.bak
	cp "$HOME"/.bashrc "$safeTmp"/.bashrc
	grep -v 'ubcore' "$safeTmp"/.bashrc > "$safeTmp"/.bashrc.tmp
	mv "$safeTmp"/.bashrc.tmp "$HOME"/.bashrc
	
	[[ ! -e "$HOME"/.ubcore ]] && return 0
	rm "$HOME"/.ubcorerc
	
	_stop
}

_resetUbiquitous() {
	"$scriptAbsoluteLocation" _resetUbiquitous_sequence
}

_refresh_anchors_ubiquitous() {
	#cp -a "$scriptAbsoluteFolder"/_anchor "$scriptAbsoluteFolder"/_ubide
	
	cp -a "$scriptAbsoluteFolder"/_anchor "$scriptAbsoluteFolder"/_ubdb
	
	cp -a "$scriptAbsoluteFolder"/_anchor "$scriptAbsoluteFolder"/_test
	cp -a "$scriptAbsoluteFolder"/_anchor "$scriptAbsoluteFolder"/_true
	cp -a "$scriptAbsoluteFolder"/_anchor "$scriptAbsoluteFolder"/_false
	
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_test.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_true.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_false.bat
	
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_bin.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_bash.bat
	
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_setup_ubcp.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_setup_ubiquitousBash_cygwin.bat
	
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_setupUbiquitous.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_setupUbiquitous_nonet.bat
	
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_demand_broadcastPipe_page.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_terminate_broadcastPipe_page.bat
	
	
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_packetDriveDevice.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_packetDriveDevice_remove.bat
}


_refresh_anchors_cautossh() {
	cp -a "$scriptAbsoluteFolder"/_anchor "$scriptAbsoluteFolder"/_test
	cp -a "$scriptAbsoluteFolder"/_anchor "$scriptAbsoluteFolder"/_setup
	cp -a "$scriptAbsoluteFolder"/_anchor "$scriptAbsoluteFolder"/_bash
	cp -a "$scriptAbsoluteFolder"/_anchor "$scriptAbsoluteFolder"/_bin
	cp -a "$scriptAbsoluteFolder"/_anchor "$scriptAbsoluteFolder"/_grsync
	
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_test.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_setup.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_bash.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_bin.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_grsync.bat
}


# EXAMPLE ONLY.
# _refresh_anchors() {
# 	cp -a "$scriptAbsoluteFolder"/_anchor "$scriptAbsoluteFolder"/_true
# }


# CAUTION: Anchor scripts MUST include code to ignore '--' suffix specific software name convention!
# CAUTION: ONLY intended to be used either with generic software, or anchors following '--' suffix specific software name convention!
# WARNING: DO NOT enable in "core.sh". Intended to be enabled by "_local/ops.sh".
# ATTENTION: Set "$ub_anchor_specificSoftwareName" or similar in "ops.sh".
# ATTENTION: Set ub_anchor_user='true' or similar in "ops.sh".
#export ub_anchor_specificSoftwareName='experimental'
#export ub_anchor_user="true"
_set_refresh_anchors_specific() {
	export ub_anchor_suffix=
	export ub_anchor_suffix
	
	[[ "$ub_anchor_specificSoftwareName" == "" ]] && return 0
	
	export ub_anchor_suffix='--'"$ub_anchor_specificSoftwareName"
	
	return 0
}

_refresh_anchors_specific_single_procedure() {
	[[ "$ub_anchor_specificSoftwareName" == "" ]] && return 1
	
	_set_refresh_anchors_specific
	
	cp -a "$scriptAbsoluteFolder"/_anchor "$scriptAbsoluteFolder"/"$1""$ub_anchor_suffix"
	
	return 0
}
# Assumes user has included "$HOME"/bin in their "$PATH".
_refresh_anchors_user_single_procedure() {
	[[ "$ub_anchor_user" != 'true' ]] && return 1
	
	_set_refresh_anchors_specific
	! mkdir -p "$HOME"/bin && return 1
	
	
	# WARNING: Default to replacement. Rare case considered acceptable for several reasons.
	# Negligible damage potential - all replaced files are symlinks or anchors.
	# Limited to specifically named anchor symlinks, defined in "_associate_anchors_request", typically overloaded with 'core.sh' or similar.
	# Usually requested 'manually' through "_setup" or "_anchor", even if called through a multi-installation request.
	# Incorrectly calling a moved, uninstalled, or otherwise incorrect previous version, of linked software, is anticipated to be a more commonly impose greater risk.
	#ln -s "$scriptAbsoluteFolder"/"$1""$ub_anchor_suffix" "$HOME"/bin/ > /dev/null 2>&1
	ln -sf "$scriptAbsoluteFolder"/"$1""$ub_anchor_suffix" "$HOME"/bin/
	
	return 0
}

# ATTENTION: Overload with 'core.sh' or similar.
# # EXAMPLE ONLY.
# _refresh_anchors_specific() {
# 	_refresh_anchors_specific_single_procedure _true
# }
# # EXAMPLE ONLY.
# _refresh_anchors_user() {
# 	_refresh_anchors_user_single_procedure _true
# }


# ATTENTION: Overload with 'core'sh' or similar.
# _associate_anchors_request() {
# 	if type "_refresh_anchors_user" > /dev/null 2>&1
# 	then
# 		_tryExec "_refresh_anchors_user"
# 		#return
# 	fi
# 	
# 	_messagePlain_request 'association: dir'
# 	echo _scope_konsole"$ub_anchor_suffix"
# 	
# 	_messagePlain_request 'association: dir'
# 	echo _scope_designer_designeride"$ub_anchor_suffix"
# 	
# 	_messagePlain_request 'association: dir, *.ino'
# 	echo _designer_generate"$ub_anchor_suffix"
# }



# ATTENTION: Overload with 'core.sh' or similar.
# WARNING: May become default behavior.
_anchor_autoupgrade() {
	local currentScriptBaseName
	currentScriptBaseName=$(basename $scriptAbsoluteLocation)
	[[ "$currentScriptBaseName" != "ubiquitous_bash.sh" ]] && return 1
	
	[[ "$ub_anchor_autoupgrade" != 'true' ]] && return 0
	
	_findUbiquitous
	
	[[ -e "$ubiquitousLibDir"/_anchor ]] && cp -a "$ubiquitousLibDir"/_anchor "$scriptAbsoluteFolder"/_anchor
}

_anchor_configure() {
	export ubAnchorTemplateCurrent="$scriptAbsoluteFolder"/_anchor
	[[ "$1" != "" ]] && export ubAnchorTemplateCurrent="$1"
	
	! [[ -e "$ubAnchorTemplateCurrent" ]] && return 1
	
	#https://superuser.com/questions/450868/what-is-the-simplest-scriptable-way-to-check-whether-a-shell-variable-is-exporte
	! [ "$(bash -c 'echo ${objectName}')" ] && return 1
	
	
	rm -f "$scriptAbsoluteFolder"/_anchor.tmp "$scriptAbsoluteFolder"/_anchor.tmp1 "$scriptAbsoluteFolder"/_anchor.tmp2 > /dev/null 2>&1
	cp "$ubAnchorTemplateCurrent" "$scriptAbsoluteFolder"/_anchor.tmp
	cp "$ubAnchorTemplateCurrent" "$scriptAbsoluteFolder"/_anchor.tmp1
	cp "$ubAnchorTemplateCurrent" "$scriptAbsoluteFolder"/_anchor.tmp2
	
	cat "$scriptAbsoluteFolder"/_anchor.tmp  | sed 's/^export anchorSourceDir\=.*$/export anchorSourceDir\=\"'"$objectName"'\"/g' > "$scriptAbsoluteFolder"/_anchor.tmp1
	#perl -p -e 's/export anchorSourceDir=.*/export anchorSourceDir="$ENV{objectName}"/g' "$scriptAbsoluteFolder"/_anchor.tmp > "$scriptAbsoluteFolder"/_anchor.tmp1
	
	cat "$scriptAbsoluteFolder"/_anchor.tmp1 | sed 's/^SET \"MSWanchorSourceDir\=.*$/SET \"MSWanchorSourceDir\='"$objectName"'\"/g' > "$scriptAbsoluteFolder"/_anchor.tmp2
	#perl -p -e 's/SET "MSWanchorSourceDir=.*/SET "MSWanchorSourceDir=$ENV{objectName}"/g' "$scriptAbsoluteFolder"/_anchor.tmp1 > "$scriptAbsoluteFolder"/_anchor.tmp2
	
	local currentScriptBaseName
	currentScriptBaseName=$(basename $scriptAbsoluteLocation)
	
	# ATTENTION: Configure with 'ops.sh' , 'core.sh' , or similar.
	if [[ "$scriptAbsoluteLocation" == *"cautossh" ]] || [[ "$scriptAbsoluteLocation" != *"ubiquitous_bash.sh" ]]
	then
		cat "$scriptAbsoluteFolder"/_anchor.tmp2  | sed 's/^export anchorSource\=.*$/export anchorSource\=\"'"$currentScriptBaseName"'\"/g' > "$scriptAbsoluteFolder"/_anchor.tmp3
		#perl -p -e 's/export anchorSource=.*/export anchorSource="cautossh"/g' "$scriptAbsoluteFolder"/_anchor.tmp2 > "$scriptAbsoluteFolder"/_anchor.tmp3
		
		cat "$scriptAbsoluteFolder"/_anchor.tmp3 | sed 's/^SET \"MSWanchorSource\=.*$/SET \"MSWanchorSource\='"$currentScriptBaseName"'\"/g' > "$scriptAbsoluteFolder"/_anchor.tmp4
		#perl -p -e 's/SET "MSWanchorSource=.*/SET "MSWanchorSource=cautossh"/g' "$scriptAbsoluteFolder"/_anchor.tmp3 > "$scriptAbsoluteFolder"/_anchor.tmp4
	else
		cat "$scriptAbsoluteFolder"/_anchor.tmp2 > "$scriptAbsoluteFolder"/_anchor.tmp4
	fi
	
	mv "$scriptAbsoluteFolder"/_anchor.tmp4 "$ubAnchorTemplateCurrent"
	chmod u+x "$ubAnchorTemplateCurrent"
	rm -f "$scriptAbsoluteFolder"/_anchor.tmp "$scriptAbsoluteFolder"/_anchor.tmp1 "$scriptAbsoluteFolder"/_anchor.tmp2 "$scriptAbsoluteFolder"/_anchor.tmp3 "$scriptAbsoluteFolder"/_anchor.tmp4 > /dev/null 2>&1
}


_anchor() {
	_anchor_autoupgrade
	
	_anchor_configure
	_anchor_configure "$scriptAbsoluteFolder"/_anchor.bat
	
	! [[ -e "$scriptAbsoluteFolder"/_anchor ]] && ! [[ -e "$scriptAbsoluteFolder"/_anchor.bat ]] && return 1
	
	[[ "$scriptAbsoluteFolder" == *"ubiquitous_bash" ]] && _refresh_anchors_ubiquitous
	
	if type "_refresh_anchors_cautossh" > /dev/null 2>&1 && [[ "$scriptAbsoluteLocation" == *"cautossh" ]]
	then
		_tryExec "_refresh_anchors_cautossh"
		#return
	fi
	
	
	if type "_refresh_anchors" > /dev/null 2>&1
	then
		_tryExec "_refresh_anchors"
		#return
	fi
	
	# CAUTION: Anchor scripts MUST include code to ignore '--' suffix specific software name convention!
	# WARNING: DO NOT enable in "core.sh". Intended to be enabled by "_local/ops.sh".
	if type "_refresh_anchors_specific" > /dev/null 2>&1
	then
		_tryExec "_refresh_anchors_specific"
		#return
	fi
	
	# CAUTION: ONLY intended to be used either with generic software, or anchors following '--' suffix specific software name convention!
	# WARNING: DO NOT enable in "core.sh". Intended to be enabled by "_local/ops.sh".
	if type "_refresh_anchors_user" > /dev/null 2>&1
	then
		_tryExec "_refresh_anchors_user"
		#return
	fi
	
	# WARNING: Calls _refresh_anchors_user . Same variables required to enable, intended to be set by "_local/ops.sh".
	#if type "_associate_anchors_request" > /dev/null 2>&1
	#then
		#_tryExec "_associate_anchors_request"
		##return
	#fi
	
	
	
	return 0
}




_setup_renice() {
	_messageNormal '_setup_renice'
	
	if [[ "$scriptAbsoluteFolder" == *'ubiquitous_bash' ]] && [[ "$1" != '--force' ]]
	then
		_messagePlain_bad 'bad: generic ubiquitous_bash installation detected'
		_messageFAIL
		_stop 1
	fi
	
	
	_messagePlain_nominal '_setup_renice: hook: ubcore'
	local ubHome
	ubHome="$HOME"
	export ubcoreDir="$ubHome"/.ubcore
	export ubcoreFile="$ubcoreDir"/.ubcorerc
	
	if ! [[ -e "$ubcoreFile" ]]
	then
		_messagePlain_warn 'fail: hook: missing: .ubcorerc'
		return 1
	fi
	
	if grep 'token_ub_renice' "$ubcoreFile" > /dev/null 2>&1
	then
		_messagePlain_good 'good: hook: present: .ubcorerc'
		return 0
	fi
	
	#echo '# token_ub_renice' >> "$ubcoreFile"
	cat << CZXWXcRMTo8EmM8i4d >> "$ubcoreFile"

# token_ub_renice
if [[ "\$__overrideRecursionGuard_make" != 'true' ]] && [[ "\$__overrideKeepPriority_make" != 'true' ]] && type type > /dev/null 2>&1 && type -p make > /dev/null 2>&1
then
	__overrideRecursionGuard_make='true'
	__override_make=$(type -p make 2>/dev/null)
	make() {
		#Greater or equal, _priority_idle_pid
		
 		ionice -c 2 -n 5 -p \$\$ > /dev/null 2>&1
		renice -n 3 -p \$\$ > /dev/null 2>&1
		
		"\$__override_make" "\$@"
	}
fi

CZXWXcRMTo8EmM8i4d
	
	if grep 'token_ub_renice' "$ubcoreFile" > /dev/null 2>&1
	then
		_messagePlain_good 'good: hook: present: .ubcorerc'
		#return 0
	else
		_messagePlain_bad 'fail: hook: missing: token: .ubcorerc'
		_messageFAIL
		return 1
	fi
	
	
	
	_messagePlain_nominal '_setup_renice: hook: cron'
	echo '@reboot '"$scriptAbsoluteLocation"' _unix_renice_execDaemon' | crontab -
	
	#echo '*/7 * * * * '"$scriptAbsoluteLocation"' _unix_renice'
	#echo '*/1 * * * * '"$scriptAbsoluteLocation"' _unix_renice_app'
}

# WARNING: Recommend, using an independent installation (ie. not '~/core/infrastructure/ubiquitous_bash').
_unix_renice_execDaemon() {
	_cmdDaemon "$scriptAbsoluteLocation" _unix_renice_repeat
}

_unix_renice_daemon() {
	_priority_idle_pid "$$" > /dev/null 2>&1
	
	_start
	
	_killDaemon
	
	
	_unix_renice_execDaemon
	while _daemonStatus
	do
		sleep 5
	done
	
	_stop
}

_unix_renice_repeat() {
	# sleep 0.7
	_unix_renice_app
	_unix_renice
	
	sleep 3
	_unix_renice_app
	_unix_renice
	
	sleep 9
	_unix_renice_app
	_unix_renice
	
	sleep 27
	_unix_renice_app
	_unix_renice
	
	sleep 27
	_unix_renice_app
	_unix_renice
	
	local currentIteration
	while true
	do
		currentIteration=0
		while [[ "$currentIteration" -lt "4" ]]
		do
			sleep 120
			[[ "$matchingEMBEDDED" != 'false' ]] && sleep 120
			_unix_renice_app > /dev/null 2>&1
			let currentIteration="$currentIteration"+1
		done
		
		_unix_renice
	done
}

_unix_renice() {
	_priority_idle_pid "$$" > /dev/null 2>&1
	
	_unix_renice_critical > /dev/null 2>&1
	_unix_renice_interactive > /dev/null 2>&1
	_unix_renice_app > /dev/null 2>&1
	_unix_renice_idle > /dev/null 2>&1
}

_unix_renice_critical() {
	local processListFile
	processListFile="$tmpSelf"/.pidlist_$(_uid)
	
	_priority_enumerate_pattern "^ksysguard$" >> "$processListFile"
	_priority_enumerate_pattern "^ksysguardd$" >> "$processListFile"
	_priority_enumerate_pattern "^top$" >> "$processListFile"
	_priority_enumerate_pattern "^iotop$" >> "$processListFile"
	_priority_enumerate_pattern "^latencytop$" >> "$processListFile"
	
	_priority_enumerate_pattern "^Xorg$" >> "$processListFile"
	_priority_enumerate_pattern "^modeset$" >> "$processListFile"
	
	_priority_enumerate_pattern "^smbd$" >> "$processListFile"
	_priority_enumerate_pattern "^nmbd$" >> "$processListFile"
	
	_priority_enumerate_pattern "^ssh$" >> "$processListFile"
	_priority_enumerate_pattern "^sshd$" >> "$processListFile"
	_priority_enumerate_pattern "^ssh-agent$" >> "$processListFile"
	
	_priority_enumerate_pattern "^sshfs$" >> "$processListFile"
	
	_priority_enumerate_pattern "^socat$" >> "$processListFile"
	
	#_priority_enumerate_pattern "^cron$" >> "$processListFile"
	
	local currentPID
	
	while read -r currentPID
	do
		_priority_critical_pid "$currentPID"
	done < "$processListFile"
	
	rm "$processListFile"
}

_unix_renice_interactive() {
	local processListFile
	processListFile="$tmpSelf"/.pidlist_$(_uid)
	
	_priority_enumerate_pattern "^kwin$" >> "$processListFile"
	_priority_enumerate_pattern "^pager$" >> "$processListFile"
	
	_priority_enumerate_pattern "^pulseaudio$" >> "$processListFile"
	
	_priority_enumerate_pattern "^synergy$" >> "$processListFile"
	_priority_enumerate_pattern "^synergys$" >> "$processListFile"
	
	_priority_enumerate_pattern "^kactivitymanagerd$" >> "$processListFile"
	
	_priority_enumerate_pattern "^dbus" >> "$processListFile"
	
	local currentPID
	
	while read -r currentPID
	do
		_priority_interactive_pid "$currentPID"
	done < "$processListFile"
	
	rm "$processListFile"
}

_unix_renice_app() {
	local processListFile
	processListFile="$tmpSelf"/.pidlist_$(_uid)
	
	_priority_enumerate_pattern "^plasmashell$" >> "$processListFile"
	
	_priority_enumerate_pattern "^audacious$" >> "$processListFile"
	_priority_enumerate_pattern "^vlc$" >> "$processListFile"
	
	_priority_enumerate_pattern "^firefox$" >> "$processListFile"
	
	_priority_enumerate_pattern "^dolphin$" >> "$processListFile"
	
	_priority_enumerate_pattern "^kwrite$" >> "$processListFile"
	
	_priority_enumerate_pattern "^konsole$" >> "$processListFile"
	
	
	_priority_enumerate_pattern "^okular$" >> "$processListFile"
	
	_priority_enumerate_pattern "^xournal$" >> "$processListFile"
	
	_priority_enumerate_pattern "^soffice.bin$" >> "$processListFile"
	
	
	_priority_enumerate_pattern "^pavucontrol$" >> "$processListFile"
	
	local currentPID
	
	while read -r currentPID
	do
		_priority_app_pid "$currentPID"
	done < "$processListFile"
	
	rm "$processListFile"
}

_unix_renice_idle() {
	local processListFile
	processListFile="$tmpSelf"/.pidlist_$(_uid)
	
	_priority_enumerate_pattern "^packagekitd$" >> "$processListFile"
	
	_priority_enumerate_pattern "^apt-config$" >> "$processListFile"
	
	#_priority_enumerate_pattern "^ModemManager$" >> "$processListFile"
	
	#_priority_enumerate_pattern "^sddm$" >> "$processListFile"
	
	#_priority_enumerate_pattern "^lpqd$" >> "$processListFile"
	#_priority_enumerate_pattern "^cupsd$" >> "$processListFile"
	#_priority_enumerate_pattern "^cups-browsed$" >> "$processListFile"
	
	_priority_enumerate_pattern "^akonadi" >> "$processListFile"
	_priority_enumerate_pattern "^akonadi_indexing_agent$" >> "$processListFile"
	
	#_priority_enumerate_pattern "^kdeconnectd$" >> "$processListFile"
	#_priority_enumerate_pattern "^kacceessibleapp$" >> "$processListFile"
	#_priority_enumerate_pattern "^kglobalaccel5$" >> "$processListFile"
	
	#_priority_enumerate_pattern "^kded4$" >> "$processListFile"
	#_priority_enumerate_pattern "^ksmserver$" >> "$processListFile"
	
	_priority_enumerate_pattern "^sleep$" >> "$processListFile"
	
	_priority_enumerate_pattern "^exim4$" >> "$processListFile"
	_priority_enumerate_pattern "^apache2$" >> "$processListFile"
	_priority_enumerate_pattern "^mysqld$" >> "$processListFile"
	_priority_enumerate_pattern "^ntpd$" >> "$processListFile"
	#_priority_enumerate_pattern "^avahi-daemon$" >> "$processListFile"
	
	
	# WARNING: Probably unnecessary and counterproductive. May risk halting important compile jobs.
	#_priority_enumerate_pattern "^cc1$" >> "$processListFile"
	#_priority_enumerate_pattern "^cc1plus$" >> "$processListFile"
	
	
	local currentPID
	
	while read -r currentPID
	do
		_priority_idle_pid "$currentPID"
	done < "$processListFile"
	
	rm "$processListFile"
}



# WARNING: End user function. Do NOT call within scripts.
# No production use.
# DANGER: Removes all 'service' files with the correct number of characters. In practice, no non-temporary service is known to meet this criteria.
_systemd_cleanup() {
	# DANGER: Obsolete, more likely to cause unintended deletion. Will be disabled eventually.
	sudo -n rm -f /etc/systemd/system/??????????????????.service
	
	# WARNING: Relies on a >72char filename.
	sudo -n rm -f /etc/systemd/system/????????????????????????????????????????????????????????????????????????.service
}

#####Basic Variable Management

#Reset prefixes.
export tmpPrefix=""
export tmpSelf=""

# ATTENTION: CAUTION: Should only be used by a single unusual Cygwin override. Must be reset if used for any other purpose.
#export descriptiveSelf=""

#####Global variables.
#Fixed unique identifier for ubiquitous bash created global resources, such as bootdisc images to be automaticaly mounted by guests. Should NEVER be changed.
export ubiquitiousBashIDnano=uk4u
export ubiquitiousBashIDshort="$ubiquitiousBashIDnano"PhB6
export ubiquitiousBashID="$ubiquitiousBashIDshort"63kVcygT0q
export ubiquitousBashIDnano=uk4u
export ubiquitousBashIDshort="$ubiquitousBashIDnano"PhB6
export ubiquitousBashID="$ubiquitousBashIDshort"63kVcygT0q

##Parameters
#"--shell", ""
#"--profile"
#"--parent", "--return", "--devenv"
#"--call", "--script" "--bypass"
if [[ "$ub_import_param" == "--profile" ]]
then
	ub_import=true
	export scriptAbsoluteLocation="$profileScriptLocation"
	export scriptAbsoluteFolder="$profileScriptFolder"
	export sessionid=$(_uid)
	_messagePlain_probe_expr 'profile: scriptAbsoluteLocation= '"$scriptAbsoluteLocation"'\n ''profile: scriptAbsoluteFolder= '"$scriptAbsoluteFolder"'\n ''profile: sessionid= '"$sessionid" | _user_log-ub
elif ( [[ "$ub_import_param" == "--parent" ]] || [[ "$ub_import_param" == "--embed" ]] || [[ "$ub_import_param" == "--return" ]] || [[ "$ub_import_param" == "--devenv" ]] ) && [[ "$scriptAbsoluteLocation" != "" ]] && [[ "$scriptAbsoluteFolder" != "" ]] && [[ "$sessionid" != "" ]]
then
	ub_import=true
	true #Do not override.
	_messagePlain_probe_expr 'parent: scriptAbsoluteLocation= '"$scriptAbsoluteLocation"'\n ''parent: scriptAbsoluteFolder= '"$scriptAbsoluteFolder"'\n ''parent: sessionid= '"$sessionid" | _user_log-ub
elif [[ "$ub_import_param" == "--call" ]] || [[ "$ub_import_param" == "--script" ]] || [[ "$ub_import_param" == "--bypass" ]] || [[ "$ub_import_param" == "--shell" ]] || [[ "$ub_import_param" == "--compressed" ]] || ( [[ "$ub_import" == "true" ]] && [[ "$ub_import_param" == "" ]] )
then
	ub_import=true
	export scriptAbsoluteLocation="$importScriptLocation"
	export scriptAbsoluteFolder="$importScriptFolder"
	export sessionid=$(_uid)
	_messagePlain_probe_expr 'call: scriptAbsoluteLocation= '"$scriptAbsoluteLocation"'\n ''call: scriptAbsoluteFolder= '"$scriptAbsoluteFolder"'\n ''call: sessionid= '"$sessionid" | _user_log-ub
elif [[ "$ub_import" != "true" ]]	#"--shell", ""
then
	export scriptAbsoluteLocation=$(_getScriptAbsoluteLocation)
	export scriptAbsoluteFolder=$(_getScriptAbsoluteFolder)
	export sessionid=$(_uid)
	_messagePlain_probe_expr 'default: scriptAbsoluteLocation= '"$scriptAbsoluteLocation"'\n ''default: scriptAbsoluteFolder= '"$scriptAbsoluteFolder"'\n ''default: sessionid= '"$sessionid" | _user_log-ub
else	#FAIL, implies [[ "$ub_import" == "true" ]]
	_messagePlain_bad 'import: fall: fail' | _user_log-ub
	return 1 >/dev/null 2>&1
	exit 1
fi
[[ "$importScriptLocation" != "" ]] && export importScriptLocation=
[[ "$importScriptFolder" != "" ]] && export importScriptFolder=

[[ ! -e "$scriptAbsoluteLocation" ]] && _messagePlain_bad 'missing: scriptAbsoluteLocation= '"$scriptAbsoluteLocation" | _user_log-ub && exit 1
[[ "$sessionid" == "" ]] && _messagePlain_bad 'missing: sessionid' | _user_log-ub && exit 1

#Current directory for preservation.
export outerPWD=$(_getAbsoluteLocation "$PWD")

export initPWD="$PWD"
intInitPWD="$PWD"


# DANGER: CAUTION: Undefined removal of (at least temporary) directories may be possible. Do NOT use without thorough consideration!
# Only known use is setting the temporary directory of a subsequent background process through "$scriptAbsoluteLocation" .
# EXAMPLE: _interactive_pipe() { ... }
if [[ "$ub_force_sessionid" != "" ]]
then
	sessionid="$ub_force_sessionid"
	[[ "$ub_force_sessionid_repeat" != 'true' ]] && export ub_force_sessionid=""
fi


_get_ub_globalVars_sessionDerived() {

export lowsessionid=$(echo -n "$sessionid" | tr A-Z a-z )

# ATTENTION: CAUTION: Unusual Cygwin override to accommodate MSW network drive ( at least when provided by '_userVBox' ) !
if [[ "$scriptAbsoluteFolder" == '/cygdrive/'* ]] && [[ -e /cygdrive ]] && uname -a | grep -i cygwin > /dev/null 2>&1 && [[ "$scriptAbsoluteFolder" != '/cygdrive/c'* ]] && [[ "$scriptAbsoluteFolder" != '/cygdrive/C'* ]]
then
	if [[ "$tmpSelf" == "" ]]
	then
		
		export tmpMSW=$( cd "$LOCALAPPDATA" 2>/dev/null ; pwd )"/Temp"
		[[ ! -e "$tmpMSW" ]] && export tmpMSW=$( cd "$LOCALAPPDATA" 2>/dev/null ; pwd )"/faketemp"
		
		if [[ "$tmpMSW" != "" ]]
		then
			export descriptiveSelf="$sessionid"
			type md5sum > /dev/null 2>&1 && [[ "$scriptAbsoluteLocation" != '/bin/'* ]] && [[ "$scriptAbsoluteLocation" != '/usr/'* ]] && export descriptiveSelf=$(_getScriptAbsoluteLocation | md5sum | head -c 2)$(echo "$sessionid" | head -c 16)
			export tmpSelf="$tmpMSW"/"$descriptiveSelf"
			
			[[ "$descriptiveSelf" == "" ]] && export tmpSelf="$tmpMSW"/"$sessionid"
			true
		fi
		
		( [[ "$tmpSelf" == "" ]] || [[ "$tmpMSW" == "" ]] ) && export tmpSelf=/tmp/"$sessionid"
		true
		
	fi
fi


# CAUTION: 'Proper' UNIX platforms are expected to use "$scriptAbsoluteFolder" as "$tmpSelf" . Only by necessity may these variables be different.
# CAUTION: If not blank, '$tmpSelf' must include first 16 digits of "$sessionid". Failure to do so may cause 'rmdir' collisions and prevent '_safeRMR' from allowing appropriate removal.
# Virtualization and OS image modification functions in particular are not guaranteed to have been otherwise tested.
[[ "$tmpSelf" == "" ]] && export tmpSelf="$scriptAbsoluteFolder"

#Temporary directories.
export safeTmp="$tmpSelf""$tmpPrefix"/w_"$sessionid"
export scopeTmp="$tmpSelf""$tmpPrefix"/s_"$sessionid"
export queryTmp="$tmpSelf""$tmpPrefix"/q_"$sessionid"
export logTmp="$safeTmp"/log
#Solely for misbehaved applications called upon.
export shortTmp=/tmp/w_"$sessionid"
[[ "$tmpMSW" != "" ]] && export shortTmp="$tmpMSW"/w_"$sessionid"

}
_get_ub_globalVars_sessionDerived "$@"






export scriptBin="$scriptAbsoluteFolder"/_bin
export scriptBundle="$scriptAbsoluteFolder"/_bundle
export scriptLib="$scriptAbsoluteFolder"/_lib
#For trivial installations and virtualized guests. Exclusively intended to support _setupUbiquitous and _drop* hooks.
[[ ! -e "$scriptBin" ]] && export scriptBin="$scriptAbsoluteFolder"
[[ ! -e "$scriptBundle" ]] && export scriptBundle="$scriptAbsoluteFolder"
[[ ! -e "$scriptLib" ]] && export scriptLib="$scriptAbsoluteFolder"


# WARNING: Standard relied upon by other standalone scripts (eg. MSW compatible _anchor.bat )
export scriptLocal="$scriptAbsoluteFolder"/_local

#For system installations (exclusively intended to support _setupUbiquitous and _drop* hooks).
if [[ "$scriptAbsoluteLocation" == "/usr/local/bin"* ]] || [[ "$scriptAbsoluteLocation" == "/usr/bin"* ]]
then
	[[ "$scriptAbsoluteLocation" == "/usr/bin"* ]] && export scriptBin="/usr/share/ubcore/bin"
	[[ "$scriptAbsoluteLocation" == "/usr/local/bin"* ]] && export scriptBin="/usr/local/share/ubcore/bin"
	
	if [[ -d "$HOME" ]]
	then
		export scriptLocal="$HOME"/".ubcore"/_sys
	fi
fi

#Essentially temporary tokens which may need to be reused. 
export scriptTokens="$scriptLocal"/.tokens

#Reboot Detection Token Storage
# WARNING WIP. Not tested on all platforms. Requires a directory to be tmp/ram fs mounted. Worst case result is to preserve tokens across reboots.
# WARNING: Does NOT work on Cygwin, files written to either '/tmp' or '/dev/shm' are persistent.
#Fail-Safe
export bootTmp="$scriptLocal"
#Typical BSD
[[ -d /tmp ]] && export bootTmp='/tmp'
#Typical Linux
[[ -d /dev/shm ]] && export bootTmp='/dev/shm'
#Typical MSW - WARNING: Persistent!
[[ "$tmpMSW" != "" ]] && export bootTmp="$tmpMSW"

#Specialized temporary directories.

#MetaEngine/Engine Tmp Defaults (example, no production use)
#export metaTmp="$tmpSelf""$tmpPrefix"/.m_"$sessionid"
#export engineTmp="$tmpSelf""$tmpPrefix"/.e_"$sessionid"

# WARNING: Only one user per (virtual) machine. Requires _prepare_abstract . Not default.
# DANGER: Mandatory strict directory 8.3 compliance for this variable! Long subdirectory/filenames permitted thereafter.
# DANGER: Permitting multi-user access to this directory may cause unexpected behavior, including inconsitent file ownership.
#Consistent absolute path abstraction.
export abstractfs_root=/tmp/"$ubiquitousBashIDnano"
( [[ "$bootTmp" == '/dev/shm' ]] || [[ "$bootTmp" == '/tmp' ]] || [[ "$tmpMSW" != "" ]] ) && export abstractfs_root="$bootTmp"/"$ubiquitousBashIDnano"
export abstractfs_lock="$bootTmp"/"$ubiquitousBashID"/afslock

# Unusually, safeTmpSSH must not be interpreted by client, and therefore is single quoted.
# TODO Test safeTmpSSH variants including spaces in path.
export safeTmpSSH='~/.sshtmp/.s_'"$sessionid"

#Process control.
export pidFile="$safeTmp"/.pid
#Invalid do-not-match default.
export uPID="cwrxuk6wqzbzV6p8kPS8J4APYGX"

export daemonPidFile="$scriptLocal"/.bgpid

#export varStore="$scriptAbsoluteFolder"/var

export vncPasswdFile="$safeTmp"/.vncpasswd

#Network Defaults
[[ "$netTimeout" == "" ]] && export netTimeout=18

export AUTOSSH_FIRST_POLL=45
export AUTOSSH_POLL=45
#export AUTOSSH_GATETIME=0
export AUTOSSH_GATETIME=15

#export AUTOSSH_PORT=0

#export AUTOSSH_DEBUG=1
#export AUTOSSH_LOGLEVEL=7

#Monolithic shared files.
export lock_pathlock="$scriptLocal"/l_path
#Used to make locking operations atomic as possible.
export lock_quicktmp="$scriptLocal"/l_qt
export lock_emergency="$scriptLocal"/l_em
export lock_open="$scriptLocal"/l_o
export lock_opening="$scriptLocal"/l_opening
export lock_closed="$scriptLocal"/l_closed
export lock_closing="$scriptLocal"/l_closing
export lock_instance="$scriptLocal"/l_instance
export lock_instancing="$scriptLocal"/l_instancing

#Specialized lock files. Recommend five character or less suffix. Not all of these may yet be implemented.
export specialLocks
specialLocks=""

export lock_open_image="$lock_open"-img
specialLocks+=("$lock_open_image")

export lock_loop_image="$lock_open"-loop
specialLocks+=("$lock_loop_image")

export lock_open_chroot="$lock_open"-chrt
specialLocks+=("$lock_open_chroot")
export lock_open_docker="$lock_open"-dock
specialLocks+=("$lock_open_docker")
export lock_open_vbox="$lock_open"-vbox
specialLocks+=("$lock_open_vbox")
export lock_open_qemu="$lock_open"-qemu
specialLocks+=("$lock_open_qemu")

export specialLock=""
export specialLocks

export ubVirtImageLocal="true"

#Monolithic shared log files.
export importLog="$scriptLocal"/import.log

#Resource directories.
#export guidanceDir="$scriptAbsoluteFolder"/guidance

#Object Dir
export objectDir="$scriptAbsoluteFolder"

#Object Name
export objectName=$(basename "$objectDir")

#Modify PATH to include own directories.
if ! [[ "$PATH" == *":""$scriptAbsoluteFolder"* ]] && ! [[ "$PATH" == "$scriptAbsoluteFolder"* ]]
then
	export PATH="$PATH":"$scriptAbsoluteFolder":"$scriptBin":"$scriptBundle"
fi

export permaLog="$scriptLocal"

export HOST_USER_ID=$(id -u)
export HOST_GROUP_ID=$(id -g)

export globalArcDir="$scriptLocal"/a
export globalArcFS="$globalArcDir"/fs
export globalArcTmp="$globalArcDir"/tmp

export globalBuildDir="$scriptLocal"/b
export globalBuildFS="$globalBuildDir"/fs
export globalBuildTmp="$globalBuildDir"/tmp


export ub_anchor_specificSoftwareName=""
export ub_anchor_specificSoftwareName

export ub_anchor_user=""
export ub_anchor_user

export ub_anchor_autoupgrade=""
export ub_anchor_autoupgrade




# ATTENTION: Override with 'ops.sh' , 'disk.sh' , or similar !

export flipKey_headerKeyFile="$scriptLocal"/c-h-flipKey
export flipKey_removable='false'
export flipKey_physical='false'
export flipKey_headerKeySize=1800000000
export flipKey_containerSize=12000000000

#if [[ "$flipKey_mount" != *"temp" ]] && [[ "$flipKey_mount" != *"Temp" ]] && [[ "$flipKey_mount" != *"tmp" ]] && [[ "$flipKey_mount" != *"Tmp" ]] && [[ "$flipKey_mount" != "$flipKey_mount_temp" ]] && [[ "$flipKey_functions_fsTemp" == "" ]]
#then
#	export flipKey_mount="$scriptLocal"/fs
#fi
#[[ "$flipKey_mount" != "$scriptLocal"* ]] && export flipKey_mount="$scriptLocal"/fs
export flipKey_mount="$scriptLocal"/fs

# Rarely used.
export flipKey_mount_temp="$scriptLocal"/../../../fs_temp

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


export flipKey_filesystem_alternate=""
export flipKey_badblocks='false'


# ATTENTION: Do not set. Automatically set by '_token_mount' and similar.
#export flipKey_headerKeyFile="$scriptLocal"/token/keys/"$flipKey_token_keyID"/c-h-flipKey


# DANGER: Disables much overwriting.
# All known 'packet' discs (ie. BD-RE, DVD+RW, CD-RW) may have low rewrite tolerance under some conditions (ie. DVD-RAM).
export flipKey_packetDisc_exhaustible='false'











_queue_descriptiveSelf() {
	[[ ! -e "$scriptAbsoluteFolder" ]] && exit 1
	[[ ! -d "$scriptAbsoluteFolder" ]] && exit 1
	
	if type -p md5sum > /dev/null 2>&1
	then
		_safeEcho "$scriptAbsoluteFolder" | md5sum | head -c 18
		return 0
	fi
	if type -p sha512sum > /dev/null 2>&1
	then
		_safeEcho "$scriptAbsoluteFolder" | sha512sum | head -c 18
		return 0
	fi
	
	
	_stop 1
}

_prepare_demand_dir_queue() {
	mkdir -p "$scriptLocal"/_queue
}

# ATTENTION: Override with 'ops' or similar.
_demand_dir_broadcastPipe_page() {
	_prepare_demand_dir_queue "$@"
	
	local currentDescriptiveSelf
	currentDescriptiveSelf=$(_queue_descriptiveSelf)
	[[ "$currentDescriptiveSelf" == "" ]] && _stop 1
	
	local currentLink
	currentLink="$scriptLocal"/_queue/broadcastPipe_page_lnk
	
	local currentValue
	currentValue="$scriptLocal"/_queue/broadcastPipe_page_dir
	
	if [[ "$1" != "" ]]
	then
		mkdir -p "$currentValue"
		_safeEcho "$currentValue"
		return 0
	fi
	
	if [[ -e '/dev/shm' ]] && ! _if_cygwin && type -p mount > /dev/null 2>&1 && mount | grep '/dev/shm' > /dev/null 2>&1
	then
		currentValue=/dev/shm/queue_"$currentDescriptiveSelf"/_local/_queue/broadcastPipe_page_dir
		mkdir -p "$currentValue"
		_relink "$currentValue" "$currentLink" > /dev/null 2>&1
		_safeEcho "$currentValue"
		return 0
	fi
	
	mkdir -p "$currentValue"
	_relink "$currentValue" "$currentLink" > /dev/null 2>&1
	_safeEcho "$currentValue"
	
	return 0
}


_rm_dir_broadcastPipe_page() {
	local currentDescriptiveSelf
	currentDescriptiveSelf=$(_queue_descriptiveSelf)
	[[ "$currentDescriptiveSelf" == "" ]] && _stop 1
	
	rm -f "$scriptLocal"/_queue/broadcastPipe_page_lnk > /dev/null 2>&1
	
	rmdir "$scriptLocal"/_queue/broadcastPipe_page_dir > /dev/null 2>&1
	rmdir "$scriptLocal"/_queue > /dev/null 2>&1
	
	rmdir /dev/shm/queue_"$currentDescriptiveSelf"/_local/_queue/broadcastPipe_page_dir/inputBufferDir > /dev/null 2>&1
	rmdir /dev/shm/queue_"$currentDescriptiveSelf"/_local/_queue/broadcastPipe_page_dir/outputBufferDir > /dev/null 2>&1
	rmdir /dev/shm/queue_"$currentDescriptiveSelf"/_local/_queue/broadcastPipe_page_dir > /dev/null 2>&1
	
	rmdir /dev/shm/queue_"$currentDescriptiveSelf"/_local/_queue > /dev/null 2>&1
	rmdir /dev/shm/queue_"$currentDescriptiveSelf"/_local > /dev/null 2>&1
	rmdir /dev/shm/queue_"$currentDescriptiveSelf" > /dev/null 2>&1
	
	return 0
}





# ATTENTION: Override with 'ops' or similar.
_demand_dir_broadcastPipe_aggregatorStatic() {
	_prepare_demand_dir_queue "$@"
	
	local currentDescriptiveSelf
	currentDescriptiveSelf=$(_queue_descriptiveSelf)
	[[ "$currentDescriptiveSelf" == "" ]] && _stop 1
	
	local currentLink
	currentLink="$scriptLocal"/_queue/broadcastPipe_aggregatorStatic_lnk
	
	local currentValue
	currentValue="$scriptLocal"/_queue/broadcastPipe_aggregatorStatic_dir
	
	if [[ "$1" != "" ]]
	then
		mkdir -p "$currentValue"
		_safeEcho "$currentValue"
		return 0
	fi
	
	# Pipe/Socket backends (eg. 'aggregatorStatic' , 'aggregatorDynamic' ) should NOT be expected to benefit from 'shared memory'.
	#if [[ -e '/dev/shm' ]] && ! _if_cygwin && type -p mount > /dev/null 2>&1 && mount | grep '/dev/shm' > /dev/null 2>&1
	#then
		#currentValue=/dev/shm/queue_"$currentDescriptiveSelf"/_local/_queue/broadcastPipe_aggregatorStatic_dir
		#mkdir -p "$currentValue"
		#_relink "$currentValue" "$currentLink" > /dev/null 2>&1
		#_safeEcho "$currentValue"
		#return 0
	#fi
	
	# ATTENTION: CAUTION: Unusual Cygwin override to accommodate MSW network drive ( at least when provided by '_userVBox' ) !
	# DANGER: Assumption: If possibility of script running from network drive excluded, "$tmpMSW" == "" .
	if _if_cygwin && [[ "$scriptAbsoluteFolder" == '/cygdrive/'* ]] && [[ -e /cygdrive ]] && uname -a | grep -i cygwin > /dev/null 2>&1 && [[ "$scriptAbsoluteFolder" != '/cygdrive/c'* ]] && [[ "$scriptAbsoluteFolder" != '/cygdrive/C'* ]] && [[ "$tmpMSW" != "" ]] && [[ "$LOCALAPPDATA" != "" ]] && [[ -e "$LOCALAPPDATA" ]] && [[ -d "$LOCALAPPDATA" ]]
	then
		currentValue="$tmpMSW"/queue_"$currentDescriptiveSelf"/_local/_queue/broadcastPipe_aggregatorStatic_dir
		mkdir -p "$currentValue"
		
		#_relink "$currentValue" "$currentLink" > /dev/null 2>&1
		rm -f "$currentLink" > /dev/null 2>&1
		_safeEcho "$currentValue" > "$currentLink"
		
		_safeEcho "$currentValue"
		return 0
	fi
	
	mkdir -p "$currentValue"
	_relink "$currentValue" "$currentLink" > /dev/null 2>&1
	_safeEcho "$currentValue"
	
	return 0
}


_rm_dir_broadcastPipe_aggregatorStatic() {
	local currentDescriptiveSelf
	currentDescriptiveSelf=$(_queue_descriptiveSelf)
	[[ "$currentDescriptiveSelf" == "" ]] && _stop 1
	
	rm -f "$scriptLocal"/_queue/broadcastPipe_aggregatorStatic_lnk > /dev/null 2>&1
	
	rmdir "$scriptLocal"/_queue/broadcastPipe_aggregatorStatic_dir > /dev/null 2>&1
	rmdir "$scriptLocal"/_queue > /dev/null 2>&1
	
	rmdir /dev/shm/queue_"$currentDescriptiveSelf"/_local/_queue/broadcastPipe_aggregatorStatic_dir/inputBufferDir > /dev/null 2>&1
	rmdir /dev/shm/queue_"$currentDescriptiveSelf"/_local/_queue/broadcastPipe_aggregatorStatic_dir/outputBufferDir > /dev/null 2>&1
	rmdir /dev/shm/queue_"$currentDescriptiveSelf"/_local/_queue/broadcastPipe_aggregatorStatic_dir > /dev/null 2>&1
	
	rmdir /dev/shm/queue_"$currentDescriptiveSelf"/_local/_queue > /dev/null 2>&1
	rmdir /dev/shm/queue_"$currentDescriptiveSelf"/_local > /dev/null 2>&1
	rmdir /dev/shm/queue_"$currentDescriptiveSelf" > /dev/null 2>&1
	
	return 0
}




_demand_socket_broadcastPipe_page_unixAddress() {
	_prepare_demand_dir_queue "$@"
	
	local currentDescriptiveSelf
	currentDescriptiveSelf=$(_queue_descriptiveSelf)
	[[ "$currentDescriptiveSelf" == "" ]] && _stop 1
	
	local currentLink
	currentLink="$scriptLocal"/_queue/broadcastPipe_page_socketUNIX_lnk
	
	local currentValue
	currentValue="$scriptLocal"/_queue/broadcastPipe_page_socketUNIX_dir
	
	if [[ "$1" != "" ]]
	then
		mkdir -p "$currentValue"
		_safeEcho "$currentValue"/unix.sock
		return 0
	fi
	
	# Pipe/Socket backends (eg. 'aggregatorStatic' , 'aggregatorDynamic' ) should NOT be expected to benefit from 'shared memory'.
	#if [[ -e '/dev/shm' ]] && ! _if_cygwin && type -p mount > /dev/null 2>&1 && mount | grep '/dev/shm' > /dev/null 2>&1
	#then
	#	currentValue=/dev/shm/queue_"$currentDescriptiveSelf"/_local/_queue/broadcastPipe_page_socketUNIX_dir
	#	mkdir -p "$currentValue"
	#	_relink "$currentValue" "$currentLink" > /dev/null 2>&1
	#	_safeEcho "$currentValue"/unix.sock
	#	return 0
	#fi
	
	# WARNING: At best, no benefit is expected from using a 'unix domain socket' through Cygwin .
	# https://stackoverflow.com/questions/23086038/what-mechanism-is-used-by-msys-cygwin-to-emulate-unix-domain-sockets
	# ATTENTION: CAUTION: Unusual Cygwin override to accommodate MSW network drive ( at least when provided by '_userVBox' ) !
	# DANGER: Assumption: If possibility of script running from network drive excluded, "$tmpMSW" == "" .
	#if _if_cygwin && [[ "$scriptAbsoluteFolder" == '/cygdrive/'* ]] && [[ -e /cygdrive ]] && uname -a | grep -i cygwin > /dev/null 2>&1 && [[ "$scriptAbsoluteFolder" != '/cygdrive/c'* ]] && [[ "$scriptAbsoluteFolder" != '/cygdrive/C'* ]] && [[ "$tmpMSW" != "" ]] && [[ "$LOCALAPPDATA" != "" ]] && [[ -e "$LOCALAPPDATA" ]] && [[ -d "$LOCALAPPDATA" ]]
	#then
		#currentValue="$tmpMSW"/queue_"$currentDescriptiveSelf"/_local/_queue/broadcastPipe_page_socketUNIX_dir
		#mkdir -p "$currentValue"
		
		##_relink "$currentValue" "$currentLink" > /dev/null 2>&1
		#rm -f "$currentLink" > /dev/null 2>&1
		#_safeEcho "$currentValue" > "$currentLink"
		
		#_safeEcho "$currentValue"/unix.sock
		#return 0
	#fi
	
	# WARNING: UNIX domain socket apparently requires short address.
	# 'E unix socket address 111 characters long, max length is 108'
	if [[ -e '/tmp' ]]
	then
		#currentValue=/tmp/queue_"$currentDescriptiveSelf"/_local/_queue/broadcastPipe_page_socketUNIX_dir
		currentValue=/tmp/que_skt_"$currentDescriptiveSelf"/bP_p_sktU_d
		mkdir -p "$currentValue"
		
		#_relink "$currentValue" "$currentLink" > /dev/null 2>&1
		rm -f "$currentLink" > /dev/null 2>&1
		_safeEcho "$currentValue" > "$currentLink"
		
		_safeEcho "$currentValue"/unix.sock
		return 0
	fi
	
	
	mkdir -p "$currentValue"
	_relink "$currentValue" "$currentLink" > /dev/null 2>&1
	_safeEcho "$currentValue"/unix.sock
	
	return 0
}


_rm_socket_broadcastPipe_page_unixAddress() {
	local currentDescriptiveSelf
	currentDescriptiveSelf=$(_queue_descriptiveSelf)
	[[ "$currentDescriptiveSelf" == "" ]] && _stop 1
	
	rm -f "$scriptLocal"/_queue/broadcastPipe_aggregatorStatic_lnk > /dev/null 2>&1
	
	
	
	
	rm -f "$scriptLocal"/_queue/broadcastPipe_aggregatorStatic_dir/unix.sock > /dev/null 2>&1
	
	rmdir "$scriptLocal"/_queue/broadcastPipe_aggregatorStatic_dir > /dev/null 2>&1
	rmdir "$scriptLocal"/_queue > /dev/null 2>&1
	
	
	
	rm -f rmdir /dev/shm/queue_"$currentDescriptiveSelf"/_local/_queue/broadcastPipe_aggregatorStatic_dir/unix.sock > /dev/null 2>&1
	
	rmdir /dev/shm/queue_"$currentDescriptiveSelf"/_local/_queue/broadcastPipe_aggregatorStatic_dir > /dev/null 2>&1
	
	rmdir /dev/shm/queue_"$currentDescriptiveSelf"/_local/_queue > /dev/null 2>&1
	rmdir /dev/shm/queue_"$currentDescriptiveSelf"/_local > /dev/null 2>&1
	rmdir /dev/shm/queue_"$currentDescriptiveSelf" > /dev/null 2>&1
	
	
	
	rm -f "$tmpMSW"/queue_"$currentDescriptiveSelf"/_local/_queue/broadcastPipe_page_socketUNIX_dir/unix.sock > /dev/null 2>&1
	
	rmdir "$tmpMSW"/queue_"$currentDescriptiveSelf"/_local/_queue/broadcastPipe_page_socketUNIX_dir > /dev/null 2>&1
	
	rmdir "$tmpMSW"/queue_"$currentDescriptiveSelf"/_local/_queue/broadcastPipe_page_socketUNIX_dir > /dev/null 2>&1
	rmdir "$tmpMSW"/queue_"$currentDescriptiveSelf"/_local/_queue > /dev/null 2>&1
	rmdir "$tmpMSW"/queue_"$currentDescriptiveSelf"/_local > /dev/null 2>&1
	
	
	
	rm -f /tmp/que_skt_"$currentDescriptiveSelf"/bP_p_sktU_d/unix.sock > /dev/null 2>&1
	rmdir /tmp/que_skt_"$currentDescriptiveSelf"/bP_p_sktU_d > /dev/null 2>&1
	rmdir /tmp/que_skt_"$currentDescriptiveSelf" > /dev/null 2>&1
	
	
	return 0
}













_demand_socket_broadcastPipe_aggregatorStatic_unixAddress() {
	_prepare_demand_dir_queue "$@"
	
	local currentDescriptiveSelf
	currentDescriptiveSelf=$(_queue_descriptiveSelf)
	[[ "$currentDescriptiveSelf" == "" ]] && _stop 1
	
	local currentLink
	currentLink="$scriptLocal"/_queue/broadcastPipe_aggregatorStatic_socketUNIX_lnk
	
	local currentValue
	currentValue="$scriptLocal"/_queue/broadcastPipe_aggregatorStatic_socketUNIX_dir
	
	if [[ "$1" != "" ]]
	then
		mkdir -p "$currentValue"
		_safeEcho "$currentValue"/unix.sock
		return 0
	fi
	
	# Pipe/Socket backends (eg. 'aggregatorStatic' , 'aggregatorDynamic' ) should NOT be expected to benefit from 'shared memory'.
	#if [[ -e '/dev/shm' ]] && ! _if_cygwin && type -p mount > /dev/null 2>&1 && mount | grep '/dev/shm' > /dev/null 2>&1
	#then
	#	currentValue=/dev/shm/queue_"$currentDescriptiveSelf"/_local/_queue/broadcastPipe_aggregatorStatic_socketUNIX_dir
	#	mkdir -p "$currentValue"
	#	_relink "$currentValue" "$currentLink" > /dev/null 2>&1
	#	_safeEcho "$currentValue"/unix.sock
	#	return 0
	#fi
	
	# WARNING: At best, no benefit is expected from using a 'unix domain socket' through Cygwin .
	# https://stackoverflow.com/questions/23086038/what-mechanism-is-used-by-msys-cygwin-to-emulate-unix-domain-sockets
	# ATTENTION: CAUTION: Unusual Cygwin override to accommodate MSW network drive ( at least when provided by '_userVBox' ) !
	# DANGER: Assumption: If possibility of script running from network drive excluded, "$tmpMSW" == "" .
	#if _if_cygwin && [[ "$scriptAbsoluteFolder" == '/cygdrive/'* ]] && [[ -e /cygdrive ]] && uname -a | grep -i cygwin > /dev/null 2>&1 && [[ "$scriptAbsoluteFolder" != '/cygdrive/c'* ]] && [[ "$scriptAbsoluteFolder" != '/cygdrive/C'* ]] && [[ "$tmpMSW" != "" ]] && [[ "$LOCALAPPDATA" != "" ]] && [[ -e "$LOCALAPPDATA" ]] && [[ -d "$LOCALAPPDATA" ]]
	#then
		#currentValue="$tmpMSW"/queue_"$currentDescriptiveSelf"/_local/_queue/broadcastPipe_aggregatorStatic_socketUNIX_dir
		#mkdir -p "$currentValue"
		
		##_relink "$currentValue" "$currentLink" > /dev/null 2>&1
		#rm -f "$currentLink" > /dev/null 2>&1
		#_safeEcho "$currentValue" > "$currentLink"
		
		#_safeEcho "$currentValue"/unix.sock
		#return 0
	#fi
	
	# WARNING: UNIX domain socket apparently requires short address.
	# 'E unix socket address 111 characters long, max length is 108'
	if [[ -e '/tmp' ]]
	then
		#currentValue=/tmp/queue_"$currentDescriptiveSelf"/_local/_queue/broadcastPipe_aggregatorStatic_socketUNIX_dir
		currentValue=/tmp/que_skt_"$currentDescriptiveSelf"/bP_aS_sktU_d
		mkdir -p "$currentValue"
		
		#_relink "$currentValue" "$currentLink" > /dev/null 2>&1
		rm -f "$currentLink" > /dev/null 2>&1
		_safeEcho "$currentValue" > "$currentLink"
		
		_safeEcho "$currentValue"/unix.sock
		return 0
	fi
	
	
	mkdir -p "$currentValue"
	_relink "$currentValue" "$currentLink" > /dev/null 2>&1
	_safeEcho "$currentValue"/unix.sock
	
	return 0
}


_rm_socket_broadcastPipe_aggregatorStatic_unixAddress() {
	local currentDescriptiveSelf
	currentDescriptiveSelf=$(_queue_descriptiveSelf)
	[[ "$currentDescriptiveSelf" == "" ]] && _stop 1
	
	rm -f "$scriptLocal"/_queue/broadcastPipe_aggregatorStatic_lnk > /dev/null 2>&1
	
	
	
	
	rm -f "$scriptLocal"/_queue/broadcastPipe_aggregatorStatic_dir/unix.sock > /dev/null 2>&1
	
	rmdir "$scriptLocal"/_queue/broadcastPipe_aggregatorStatic_dir > /dev/null 2>&1
	rmdir "$scriptLocal"/_queue > /dev/null 2>&1
	
	
	
	rm -f rmdir /dev/shm/queue_"$currentDescriptiveSelf"/_local/_queue/broadcastPipe_aggregatorStatic_dir/unix.sock > /dev/null 2>&1
	
	rmdir /dev/shm/queue_"$currentDescriptiveSelf"/_local/_queue/broadcastPipe_aggregatorStatic_dir > /dev/null 2>&1
	
	rmdir /dev/shm/queue_"$currentDescriptiveSelf"/_local/_queue > /dev/null 2>&1
	rmdir /dev/shm/queue_"$currentDescriptiveSelf"/_local > /dev/null 2>&1
	rmdir /dev/shm/queue_"$currentDescriptiveSelf" > /dev/null 2>&1
	
	
	
	rm -f "$tmpMSW"/queue_"$currentDescriptiveSelf"/_local/_queue/broadcastPipe_aggregatorStatic_socketUNIX_dir/unix.sock > /dev/null 2>&1
	
	rmdir "$tmpMSW"/queue_"$currentDescriptiveSelf"/_local/_queue/broadcastPipe_aggregatorStatic_socketUNIX_dir > /dev/null 2>&1
	
	rmdir "$tmpMSW"/queue_"$currentDescriptiveSelf"/_local/_queue/broadcastPipe_aggregatorStatic_socketUNIX_dir > /dev/null 2>&1
	rmdir "$tmpMSW"/queue_"$currentDescriptiveSelf"/_local/_queue > /dev/null 2>&1
	rmdir "$tmpMSW"/queue_"$currentDescriptiveSelf"/_local > /dev/null 2>&1
	
	
	
	rm -f /tmp/que_skt_"$currentDescriptiveSelf"/bP_aS_sktU_d/unix.sock > /dev/null 2>&1
	rmdir /tmp/que_skt_"$currentDescriptiveSelf"/bP_aS_sktU_d > /dev/null 2>&1
	rmdir /tmp/que_skt_"$currentDescriptiveSelf" > /dev/null 2>&1
	
	
	return 0
}




















_default_page_write_maxTime() {
	local currentValue
	currentValue=725
	_if_cygwin && currentValue=4475
	echo "$currentValue"
}

_default_page_write_maxBytes() {
	local currentValue
	currentValue=86400
	#_if_cygwin && currentValue=864000
	echo "$currentValue"
}



_default_page_read_maxTime() {
	local currentValue
	currentValue=100
	_if_cygwin && currentValue=575
	echo "$currentValue"
}





_broadcastPipe_page_read_maxTime() {
	local currentValue
	currentValue=100
	_if_cygwin && currentValue=975
	echo "$currentValue"
}















# ATTENTION: Only the test procedures are disabled if the 'queue' dependency is not declared. Due to the lengthy timing required to reliabily test the inherently unpredictability of any InterProcess-Communication with non-dedicated non-realtime software.
unset _test_queue
unset _test_selfTime
unset _test_bashTime
unset _test_filemtime
unset _test_timeoutRead
#unset _timetest
unset _test_broadcastPipe_page
unset _test_broadcastPipe_aggregatorStatic






# "$1" == inputBufferDir
# "$2" == inputFilesPrefix
# "$3" == maxTime (approximately how many milliseconds buffer should be checked for new data)
# "$4" == maxBytes (IGNORED)
# "$ub_force_limit_page_rate"
#	'' == Write new pages as fast as buffers fill up. Readers may miss some pages. (Default. Strongly recommended.)
#	'true' == Write only one page per "$maxTime" interval. WARNING: Writes may backlog indefinitely, breaking real-time messaging. (IGNORED by '_page_read')
#	'false' == Write and read new pages continiously. WARNING: Read processes will consume 100% CPU. Readers may still miss some pages, although reads may happen faster than writes.
_page_read() {
	local inputBufferDir="$1"
	local inputFilesPrefix="$2"
	local service_inputBufferDir
	if [[ "$inputBufferDir" == "" ]] || [[ "$inputBufferDir" == "" ]]
	then
		local current_demand_dir
		current_demand_dir=$(_demand_dir_broadcastPipe_page "$1")
		[[ "$current_demand_dir" == "" ]] && _stop 1
		
		inputBufferDir="$current_demand_dir"/outputBufferDir
		! mkdir -p "$inputBufferDir" && return 1
		
		service_inputBufferDir="$current_demand_dir"/inputBufferDir
		
		[[ "$inputFilesPrefix" == "" ]] && inputFilesPrefix='out-'
	fi
	
	
	! mkdir -p "$inputBufferDir" && return 1
	! [[ -e "$inputBufferDir" ]] && return 1
	! [[ -d "$inputBufferDir" ]] && return 1
	
	local currentMaxTime
	currentMaxTime="$3"
	# 6/60Hz == 100ms , loop time ~ 35ms
	# 0.1s desired minimum sleep
	#[[ "$currentMaxTime" == "" ]] && currentMaxTime=175
	[[ "$currentMaxTime" == "" ]] && currentMaxTime=$(_default_page_read_maxTime)
	
	local currentMaxTime_seconds
	currentMaxTime_seconds=$(bc <<< "$currentMaxTime * 0.001")
	
	
	local measureTickA
	local measureTickB
	
	while true
	do
		if [[ "$service_inputBufferDir" != "" ]]
		then
			#[[ ! -d "$service_inputBufferDir" ]] && return 0
			[[ -e "$service_inputBufferDir"/terminate ]] && return 0
		fi
		
		[[ "$ub_force_limit_page_rate" != 'false' ]] && sleep "$currentMaxTime_seconds"
		
		[[ -e "$inputBufferDir"/"$inputFilesPrefix"tick ]] && measureTickA=$(head -n 1 "$inputBufferDir"/"$inputFilesPrefix"tick 2>/dev/null)
		[[ "$measureTickA" != '0' ]] && [[ "$measureTickA" != '1' ]] && [[ "$measureTickA" != '2' ]] && continue
		
		[[ "$measureTickB" == '' ]] && measureTickB='doNotMatch'
		[[ "$measureTickA" == "$measureTickB" ]] && continue
		
		cat "$inputBufferDir"/"$inputFilesPrefix""$measureTickA" 2>/dev/null
		
		measureTickB="$measureTickA"
	done
}





# "$1" == "$inputTickFile"
# "$2" == "$inputFilesPrefix"
# "$3" == "sessionid" (optional)
_page_read_single() {
	local inputTickFile="$1"
	local inputFilesPrefix="$2"
	local currentSession="$3"
	if [[ "$inputTickFile" == "" ]] && [[ "$inputFilesPrefix" == "" ]]
	then
		local current_demand_dir
		current_demand_dir=$(_demand_dir_broadcastPipe_page "$1")
		[[ "$current_demand_dir" == "" ]] && _stop 1
		
		inputTickFile="$current_demand_dir"/outputBufferDir/out-tick
		
		[[ "$currentSession" == "" ]] && currentSession="single"
		[[ "$currentSession" == "" ]] && currentSession="false"
	fi
	[[ "$currentSession" == "" ]] && currentSession="$sessionid"
	
	
	measureTickA=$(head -n 1 "$inputTickFile" 2>/dev/null)
	[[ "$measureTickA" != '0' ]] && [[ "$measureTickA" != '1' ]] && [[ "$measureTickA" != '2' ]] && return 0
	
	if [[ "$currentSession" != 'false' ]]
	then
		measureTickB=$(head -n 1  "$inputTickFile"-prev-"$currentSession" 2>/dev/null)
		
		[[ "$measureTickB" == '' ]] && measureTickB='doNotMatch'
		[[ "$measureTickA" == "$measureTickB" ]] && return 0
	fi
	
	currentExitStatus='0'
	
	cat ${inputTickFile/-tick/}-"$measureTickA" 2>/dev/null
	[[ "$?" != '0' ]] && currentExitStatus='1'
	
	if [[ "$currentSession" != 'false' ]]
	then
		cp "$inputTickFile" "$inputTickFile"-prev-"$currentSession" 2>/dev/null
		[[ "$?" != '0' ]] && currentExitStatus='1'
	fi
	
	if [[ "$currentExitStatus" != '0' ]]
	then
		rm -f "$inputTickFile" > /dev/null 2>&1
		return "$currentExitStatus"
	fi
	
	return 0
}




# Intended to be called by users and programs which are only able to call one other program which must accept both standard input/output connections.
# Specifically intended to be compatible with 'socat' .
# "$1" == inputBufferDir (inverted - typically output of broadcastPipe)
# "$2" == outputBufferDir (inverted - typically input of broadcastPipe)
# "$4" == inputFilesPrefix
# "$4" == outputFilesPrefix
_page_converse() {
	local inputBufferDir="$1"
	local outputBufferDir="$2"
	if [[ "$inputBufferDir" == "" ]] || [[ "$outputBufferDir" == "" ]]
	then
		local current_demand_dir
		current_demand_dir=$(_demand_dir_broadcastPipe_page "$1")
		[[ "$current_demand_dir" == "" ]] && _stop 1
		
		inputBufferDir="$current_demand_dir"/outputBufferDir
		outputBufferDir="$current_demand_dir"/inputBufferDir
	fi
	
	local inputFilesPrefix="$3"
	[[ "$inputFilesPrefix" == "" ]] && inputFilesPrefix='out-'
	
	local outputFilesPrefix="$4"
	#[[ "$outputFilesPrefix" == "" ]] && outputFilesPrefix='converse-'
	#[[ "$outputFilesPrefix" == "" ]] && outputFilesPrefix=$(_uid 14)'-'
	[[ "$outputFilesPrefix" == "" ]] && outputFilesPrefix=$(_uid 18)'-'
	
	
	# DANGER: Without this hook, temporary buffers may persist indefinitely!
	export current_page_write_sessionid="$sessionid"
	export current_broadcastPipe_inputBufferDir="$inputBufferDir"
	export current_broadcastPipe_outputBufferDir="$outputBufferDir"
	export current_broadcastPipe_outputFilesPrefix="$outputFilesPrefix"
	_stop_queue_page() {
		rm -f "$current_broadcastPipe_outputBufferDir"/t_"$current_page_write_sessionid" > /dev/null 2>&1
		rm -f "$current_broadcastPipe_outputBufferDir"/"$current_broadcastPipe_outputFilesPrefix"-tick > /dev/null 2>&1
		_sleep_spinlock
		rm -f "$current_broadcastPipe_outputBufferDir"/"$current_broadcastPipe_outputFilesPrefix"-tick > /dev/null 2>&1
		rm -f "$current_broadcastPipe_outputBufferDir"/"$current_broadcastPipe_outputFilesPrefix"* > /dev/null 2>&1
	}
	export ub_nohook_current_page_write_stop_queue_page='true'
	
	#echo "$current_broadcastPipe_outputBufferDir"/"$current_broadcastPipe_outputFilesPrefix"
	
	_page_read "$inputBufferDir" "$inputFilesPrefix" &
	_page_write "$outputBufferDir" "$outputFilesPrefix"
}



_reset_page_write() {
	rm -f "$1"/temp > /dev/null 2>&1
	rm -f "$1"/"$2"tick > /dev/null 2>&1
	rm -f "$1"/"$2"0 > /dev/null 2>&1
	rm -f "$1"/"$2"1 > /dev/null 2>&1
	rm -f "$1"/"$2"2 > /dev/null 2>&1
}

# "$1" == outputBufferDir
# "$2" == outputFilesPrefix
# "$3" == maxTime (approximately how many milliseconds new data should be allowed to 'remain' in the buffer before writing out a new tick)
# "$4" == maxBytes (how many bytes should be allowed to 'accumulate' in the buffer before writing out a new tick) (MAY BE IGNORED)
# "$ub_force_limit_page_rate"
#	'' == Write new pages as fast as buffers fill up. Readers may miss some pages. (Default. Strongly recommended.)
#	'true' == Write only one page per "$maxTime" interval. WARNING: Writes may backlog indefinitely, breaking real-time messaging.
#	'false' == Write and read new pages continiously. WARNING: Read processes will consume 100% CPU. Readers may still miss some pages, although reads may happen faster than writes. (IGNORED by '_page_write')
_page_write() {
	local outputBufferDir="$1"
	local outputFilesPrefix="$2"
	if [[ "$outputBufferDir" == "" ]] || [[ "$outputFilesPrefix" == "" ]]
	then
		local current_demand_dir
		current_demand_dir=$(_demand_dir_broadcastPipe_page "$1")
		[[ "$current_demand_dir" == "" ]] && _stop 1
		
		outputBufferDir="$current_demand_dir"/inputBufferDir
		! mkdir -p "$outputBufferDir" && return 1
		
		[[ "$outputFilesPrefix" == "" ]] && outputFilesPrefix='stream-'
	fi
	
	
	! mkdir -p "$outputBufferDir" && return 1
	! [[ -e "$outputBufferDir" ]] && return 1
	! [[ -d "$outputBufferDir" ]] && return 1
	
	if [[ "$ub_nohook_current_page_write_stop_queue_page" != 'true' ]] && ! [[ -e "$safeTmp" ]]
	then
		export current_page_write_outputBufferDir="$outputBufferDir"
		export current_page_write_sessionid="$sessionid"
		_stop_queue_page() {
			rm -f "$current_page_write_outputBufferDir"/t_"$current_page_write_sessionid" > /dev/null 2>&1
		}
	fi
	
	
	# https://stackoverflow.com/questions/13889659/read-a-file-by-bytes-in-bash
	# https://www.cyberciti.biz/faq/linux-unix-read-one-character-atatime-while-loop/
		# 'The way using `read -r -n1` for reading every character is wrong, it can't handle multi-byte characters.'
	#echo test | while IFS= read -r -n2 car;do [ "$car" ] && echo -n "$car" || echo ; sleep 1 ; done
	
	# Inaccurate. Tests with random data ('/dev/urandom') seem to show errors.
# 	local currentString
# 	export IFS=
# 	export LANG=C
# 	export LC_ALL=C
# 	#LANG=C IFS= read -r -d '' -n 1 currentString
# 	while read -r -d '' -n 1 currentString
# 	do
# 		#[ "$currentString" ] && echo -n "$currentString" || echo
# 		[ "$currentString" ] && printf '%b' "$currentString" || echo
# 	done
	
# 	# Accurate, albeit extremely slow.
# 	while head --bytes=1
# 	do
# 		true
# 	done
	
	
	local currentMaxTime
	local currentMaxBytes
	currentMaxTime="$3"
	currentMaxBytes="$4"
	
	
	[[ "$currentMaxTime" == "" ]] && currentMaxTime=$(_default_page_write_maxTime)
	[[ "$currentMaxBytes" == "" ]] && currentMaxBytes=$(_default_page_write_maxBytes)
	
	local currentMaxTime_seconds
	currentMaxTime_seconds=$(bc <<< "$currentMaxTime * 0.001")
	
	
	
	local measureDateA
	local measureDateB
	local measureDateDifference
	
	measureDateA=$(date +%s%N | cut -b1-13)
	
	local currentTick
	currentTick=
	[[ -e "$outputBufferDir"/"$outputFilesPrefix"tick ]] && currentTick=$(head -c 1 "$outputBufferDir"/"$outputFilesPrefix"tick)
	( [[ "$currentTick" == '0' ]] || [[ "$currentTick" == '1' ]] || [[ "$currentTick" == '2' ]] ) && let currentTick="$currentTick"+1
	[[ "$currentTick" != '0' ]] && [[ "$currentTick" != '1' ]] && [[ "$currentTick" != '2' ]] && [[ "$currentTick" != '3' ]] && currentTick='0'
	[[ "$currentTick" -ge '3' ]] && currentTick=0
	local currentTempSize
	currentTempSize='0'
	rm -f "$outputBufferDir"/t_"$sessionid" > /dev/null 2>&1
	rm -f "$outputBufferDir"/"$outputFilesPrefix"tick > /dev/null 2>&1
	rm -f "$outputBufferDir"/"$outputFilesPrefix"0 > /dev/null 2>&1
	rm -f "$outputBufferDir"/"$outputFilesPrefix"1 > /dev/null 2>&1
	rm -f "$outputBufferDir"/"$outputFilesPrefix"2 > /dev/null 2>&1
	#while _timeout "$currentMaxTime_seconds" head --bytes="$currentMaxBytes" 2>/dev/null >> "$outputBufferDir"/t_"$sessionid"
	#while _timeout "$currentMaxTime_seconds" cat 2>/dev/null >> "$outputBufferDir"/t_"$sessionid"
	#while "$scriptAbsoluteLocation" _bin cat | _timeout "$currentMaxTime_seconds" dd bs="$currentMaxBytes" count=1 2>/dev/null >> "$outputBufferDir"/t_"$sessionid"
	#while _timeout "$currentMaxTime_seconds" ( ! dd bs="$currentMaxBytes" count=1 2>/dev/null >> "$outputBufferDir"/t_"$sessionid" && rm -f "$outputBufferDir"/t_"$sessionid" > /dev/null 2>&1 )
	#while cat 2>/dev/null >> "$outputBufferDir"/t_"$sessionid"
	#while _timeout "$currentMaxTime_seconds" head --bytes="2" 2>/dev/null >> "$outputBufferDir"/t_"$sessionid"
	#while _timeout "$currentMaxTime_seconds" dd bs="$currentMaxBytes" count=1 2>/dev/null >> "$outputBufferDir"/t_"$sessionid"
	
	#while cat 2>/dev/null >> "$outputBufferDir"/t_"$sessionid"
	while _timeout "$currentMaxTime_seconds" dd bs="$currentMaxBytes" count=1 2>/dev/null >> "$outputBufferDir"/t_"$sessionid"
	do
		#[[ ! -d "$outputBufferDir" ]] && return 0
		[[ -e "$outputBufferDir"/terminate ]] && return 0
		
		#true | cat "$outputBufferDir"/t_"$sessionid" > /dev/tty
		measureDateB=$(true | date +%s%N | cut -b1-13)
		measureDateDifference=$(bc <<< "$measureDateB - $measureDateA")
		
		currentTempSize='0'
		[[ -s "$outputBufferDir"/t_"$sessionid" ]] && currentTempSize=$(true | stat -c%s "$outputBufferDir"/t_"$sessionid" 2>/dev/null)
		[[ "$currentTempSize" == "" ]] && currentTempSize='0'
		#[[ -s "$outputBufferDir"/t_"$sessionid" ]] && true | stat -c%s "$outputBufferDir"/t_"$sessionid" > /dev/tty
		#[[ "$rewrite" == 'true' ]] && [[ -s "$outputBufferDir"/t_"$sessionid" ]] && true | stat -c%s "$outputBufferDir"/t_"$sessionid" > /dev/tty
		
		#[[ "$currentTempSize" -gt "0" ]] && true | echo "$measureDateDifference" "$currentMaxTime" > /dev/tty
		if [[ "$currentTempSize" -gt "0" ]] && ( [[ "$measureDateDifference" -ge "$currentMaxTime" ]] || [[ "$currentTempSize" -ge "$currentMaxBytes" ]] )
		then
			# ATTENTION: Optional 'page rate' limiting.
			# If buffer was completely filled, then ' _timeout "$currentMaxTime_seconds" ' may not have completed. A delay may ensure '_page_read' has enough time to notice a tick, before new pages are written.
			# No production use. Expected to be set only for benchmarking, diagnostics, etc.
			# WARNING: Beware this is bad for real-time messaging. Much better to discard some flood data.
			[[ "$ub_force_limit_page_rate" == 'true' ]] && [[ "$currentTempSize" -ge "$currentMaxBytes" ]] && sleep "$currentMaxTime_seconds"
			
			#rm -f "$outputBufferDir"/"$outputFilesPrefix""$currentTick" > /dev/null 2>&1
			true | mv "$outputBufferDir"/t_"$sessionid" "$outputBufferDir"/"$outputFilesPrefix""$currentTick"
			true | echo -n "$currentTick" > "$outputBufferDir"/"$outputFilesPrefix"tick-temp
			true | mv "$outputBufferDir"/"$outputFilesPrefix"tick-temp "$outputBufferDir"/"$outputFilesPrefix"tick
			
			measureDateA=$(true | date +%s%N | cut -b1-13)
			#echo "$currentTick" > /dev/tty
			let currentTick="$currentTick"+1
		fi
		
		[[ "$currentTick" -ge '3' ]] && currentTick=0
	done
	
	return 0
}




# "$1" == outputBufferDir
# "$2" == outputFilesPrefix
# "$3" == maxTime (approximately how many milliseconds new data should be allowed to 'remain' in the buffer before writing out a new tick)
# DANGER: Any changes may unexpectedly break '_broadcastPipe' ! Takes standard input from 'script' run by 'find' 'exec' .
_page_write_single() {
	local outputBufferDir="$1"
	local outputFilesPrefix="$2"
	if [[ "$outputBufferDir" == "" ]] || [[ "$outputFilesPrefix" == "" ]]
	then
		local current_demand_dir
		current_demand_dir=$(_demand_dir_broadcastPipe_page "$1")
		[[ "$current_demand_dir" == "" ]] && _stop 1
		
		outputBufferDir="$current_demand_dir"/inputBufferDir
		! mkdir -p "$outputBufferDir" && return 1
		
		[[ "$outputFilesPrefix" == "" ]] && outputFilesPrefix='single-'
	fi
	
	local currentTmpUID
	currentTmpUID=$(_uid)
	cat 2>/dev/null >> "$outputBufferDir"/t_"$currentTmpUID"
	
	
	if ! [[ -s "$outputBufferDir"/t_"$currentTmpUID" ]] || ! _moveconfirm "$outputBufferDir"/t_"$currentTmpUID" "$outputBufferDir"/temp 2>/dev/null
	then
		rm -f "$outputBufferDir"/t_"$currentTmpUID" > /dev/null 2>&1
		return 1
	fi
	
	local currentTick
	currentTick=
	[[ -e "$outputBufferDir"/"$outputFilesPrefix"tick ]] && currentTick=$(head -c 1 "$outputBufferDir"/"$outputFilesPrefix"tick)
	( [[ "$currentTick" == '0' ]] || [[ "$currentTick" == '1' ]] || [[ "$currentTick" == '2' ]] ) && let currentTick="$currentTick"+1
	[[ "$currentTick" != '0' ]] && [[ "$currentTick" != '1' ]] && [[ "$currentTick" != '2' ]] && [[ "$currentTick" != '3' ]] && currentTick='0'
	[[ "$currentTick" -ge '3' ]] && currentTick=0
	
	mv "$outputBufferDir"/temp "$outputBufferDir"/"$outputFilesPrefix""$currentTick"
	echo -n "$currentTick" > "$outputBufferDir"/"$outputFilesPrefix"tick-temp
	mv "$outputBufferDir"/"$outputFilesPrefix"tick-temp "$outputBufferDir"/"$outputFilesPrefix"tick
	
	
	#rm -f "$outputBufferDir"/temp > /dev/null 2>&1
	#rm -f "$outputBufferDir"/"$outputFilesPrefix"tick-temp > /dev/null 2>&1
	return 0
}

_here_broadcastPipe_page_read_single() {
	cat << CZXWXcRMTo8EmM8i4d
#!/usr/bin/env bash

CZXWXcRMTo8EmM8i4d
	
	declare -f _page_read_single
	declare -f _broadcastPipe_page_read_single
	
	cat << CZXWXcRMTo8EmM8i4d
_broadcastPipe_page_read_single "\$@"

CZXWXcRMTo8EmM8i4d

}




# "$1" == inputBufferDir
# "$2" == outputBufferDir
# "$3" == maxTime (approximately how many milliseconds buffer should be checked for new data)
# "$4" == maxBytes (how many bytes should be allowed to 'accumulate' in the buffer before writing out a new tick) (MAY BE IGNORED)
# "$5" == maxTime (approximately how many milliseconds new data should be allowed to 'remain' in the buffer before writing out a new tick) (MAY BE IGNORED)
_broadcastPipe_page_write() {
	#true | _reset_page_write "$2" "out-" "$5" "$4"
	
	#export rewrite=true
	# DANGER: Continiously piping through '_page_write' may be inherently less reliable than '_page_write_single' .
	#_page_write "$2" "out-" "$5" "$4"
	
	_page_write_single "$2" "out-" "$5" "$4"
	
}


_broadcastPipe_page_read_single() {
	_page_read_single "$@"
}


# ATTENTION: Override with 'ops' or similar.
_rm_broadcastPipe_page() {
	
	#[[ -e "$1" ]] && [[ "$1" != "" ]] && rm -f "$1"/* > /dev/null 2>&1
	[[ -e "$1" ]] && [[ "$1" != "" ]] && find "$1" -mindepth 1 -maxdepth 1 -type f ! -name 'terminate' -delete > /dev/null 2>&1
	[[ -e "$2" ]] && [[ "$2" != "" ]] && rm -f "$2"/* > /dev/null 2>&1
	
	[[ -e "$1" ]] && [[ "$1" != "" ]] && rm -f "$1"/*-tick-prev* > /dev/null 2>&1
	
	
	return 0
}




# Reduce environment to perhaps improve performance.
_env_broadcastPipe_page() {
	env -i HOME="$HOME" TERM="${TERM}" SHELL="${SHELL}" PATH="${PATH}" PWD="$PWD" scriptAbsoluteLocation="$scriptAbsoluteLocation" scriptAbsoluteFolder="$scriptAbsoluteFolder" sessionid="$sessionid" LD_PRELOAD="$LD_PRELOAD" USER="$USER" ub_force_limit_page_rate="$ub_force_limit_page_rate" "$@"
}


# WARNING: May delete all existing files (to 'clear the buffers').
# WARNING: Must be running before any desired data is written to buffer - existing buffers are always discarded.
# "$1" == inputBufferDir
# "$2" == outputBufferDir
# "$3" == maxTime (approximately how many milliseconds buffer should be checked for new data) (MAY ALSO PARTIALLY OR FULLY DISPLACE VALUE OF "$5")
# "$4" == maxBytes (how many bytes should be allowed to 'accumulate' in the buffer before writing out a new tick) (MAY BE IGNORED)
# "$5" == maxTime (approximately how many milliseconds new data should be allowed to 'remain' in the buffer before writing out a new tick) (MAY BE IGNORED)
_broadcastPipe_page_read() {
	_start
	
	[[ "$1" == "" ]] && _stop 1
	[[ "$1" == "/" ]] && _stop 1
	[[ "$2" == "/" ]] && _stop 1
	
	local current_demand_dir
	current_demand_dir=$(_demand_dir_broadcastPipe_page "$1")
	
	local currentMaxTime
	currentMaxTime="$3"
	[[ "$currentMaxTime" == "" ]] && currentMaxTime="$(_broadcastPipe_page_read_maxTime)"
	
	local currentMaxTime_seconds
	currentMaxTime_seconds=$(bc <<< "$currentMaxTime * 0.001")
	
	# May perhaps take effect when SIGTERM is received directly (eg. when SIGTERM may be sent to all processes) .
	export current_broadcastPipe_inputBufferDir="$1"
	export current_broadcastPipe_outputBufferDir="$2"
	export current_broadcastPipe_current_demand_dir="$current_demand_dir"
	_stop_queue_page() {
		#_terminate_broadcastPipe_page "$current_broadcastPipe_inputBufferDir" 2> /dev/null
		_terminate_broadcastPipe_page_fast "$current_broadcastPipe_inputBufferDir" 2> /dev/null
		sleep 1
		_rm_broadcastPipe_page "$current_broadcastPipe_inputBufferDir" "$current_broadcastPipe_outputBufferDir"
		[[ "$current_broadcastPipe_inputBufferDir" == "$current_broadcastPipe_current_demand_dir"* ]] && [[ "$current_broadcastPipe_current_demand_dir" != "" ]] && _rm_dir_broadcastPipe_page
		
		_sleep_spinlock
		rm -f "$current_broadcastPipe_inputBufferDir"/reset > /dev/null 2>&1
		rm -f "$current_broadcastPipe_inputBufferDir"/terminate > /dev/null 2>&1
		[[ "$current_broadcastPipe_inputBufferDir" == "$current_broadcastPipe_current_demand_dir"* ]] && [[ "$current_broadcastPipe_current_demand_dir" != "" ]] && _rm_dir_broadcastPipe_page
	}
	
	rm -f "$1"/reset > /dev/null 2>&1
	rm -f "$1"/terminate > /dev/null 2>&1
	#_rm_broadcastPipe_page "$@"
	
	_here_broadcastPipe_page_read_single "$@" > "$safeTmp"/broadcastPipe_page_read.sh
	chmod u+x "$safeTmp"/broadcastPipe_page_read.sh
	
	echo > "$1"/listen
	
	while [[ ! -e "$1"/terminate ]]
	do
		# WARNING: Although sequential throughput may be important in some cases, a 'pair of wires' is fundamentally not a parallel device. Simultaneous writing to aggregator should only occur during (usually undesirable) collisions. Nevertheless, processing these collisions out of order is entirely reasonable.
		# WARNING: Imposing limits on the number of inputs (eg. due to command line argument length limitations), below a few thousand, is strongly discouraged.
		# https://serverfault.com/questions/193319/a-better-unix-find-with-parallel-processing
		_env_broadcastPipe_page find "$1" -mindepth 1 -maxdepth 1 -mmin -0.4 -type f -name '*-tick' -exec "$safeTmp"/broadcastPipe_page_read.sh '{}' \; 2> /dev/null | _broadcastPipe_page_write "" "$2" "$3" "$4" "$5" 2>/dev/null
		
		# DANGER: Allowing this bus to run without any idle time may result in an immediately overwhelming processor load, if find loop is allowed to 'fork' new processes.
		[[ "$ub_force_limit_page_rate" != 'false' ]] && sleep "$currentMaxTime_seconds"
		#sleep "$currentMaxTime_seconds"
	done
	
	# WARNING: Since only one program may successfully remove a single file, that mechanism should allow only one 'broadcastPipe' process to remain in the unlikely case multiple were somehow started.
	[[ -e "$1"/terminate ]] && [[ -e "$1"/reset ]] && rm "$1"/reset > /dev/null 2>&1 && _broadcastPipe_page_read "$@"
	rm -f "$1"/reset > /dev/null 2>&1
	
	_rm_broadcastPipe_page "$@"
	rm -f "$1"/terminate > /dev/null 2>&1
	[[ "$1" == "$current_demand_dir"* ]] && [[ "$current_demand_dir" != "" ]] && _rm_dir_broadcastPipe_page
	
	_sleep_spinlock
	rm -f "$1"/terminate > /dev/null 2>&1
	[[ "$1" == "$current_demand_dir"* ]] && [[ "$current_demand_dir" != "" ]] && _rm_dir_broadcastPipe_page
	
	_stop
}








_here_rmloop_broadcastPipe_page() {
	_here_header_bash_or_dash "$@"
	
	declare -f _rmloop_broadcastPipe_page
	
	cat << CZXWXcRMTo8EmM8i4d
_rmloop_broadcastPipe_page "\$@"

CZXWXcRMTo8EmM8i4d

}


_rmloop_broadcastPipe_page() {
	while true
	do
		rm -f "$1"/rmloop > /dev/null 2>&1
		
		#sleep 1
		sleep 0.1
	done
	
}


_safePath_demand_broadcastPipe_page() {
	if [[ "$1" == "$scriptLocal"* ]] && ! _if_cygwin
	then
		return 0
	fi
	if [[ "$1" == '/dev/shm/'* ]] && ! _if_cygwin
	then
		return 0
	fi
	
	
	! _safePath "$1" && _stop 1
	return 0
}

# WARNING: Deletes all existing files (to 'clear the buffers').
# "$1" == inputBufferDir
# "$2" == outputBufferDir
# "$3" == maxTime (approximately how many milliseconds new data should be allowed to 'remain' in the buffer before writing out a new tick)
# "$4" == maxBytes (how many bytes should be allowed to 'accumulate' in the buffer before writing out a new tick)
_demand_broadcastPipe_page_sequence() {
	_start
	
	! mkdir -p "$1" && _stop 1
	! mkdir -p "$2" && _stop 1
	[[ "$1" == "" ]] && _stop 1
	[[ "$1" == "/" ]] && _stop 1
	[[ "$2" == "/" ]] && _stop 1
	if ! _safePath_demand_broadcastPipe_page "$@"
	then
		_terminate_broadcastPipe_page "$1"
		_stop 1
	fi
	
	_here_rmloop_broadcastPipe_page "$@" > "$safeTmp"/_rmloop_broadcastPipe_page
	chmod u+x "$safeTmp"/_rmloop_broadcastPipe_page
	
	echo > "$1"/rmloop
	
	
	_sleep_spinlock
	
	
	! [[ -e "$1"/rmloop ]] && return 0
	! mv "$1"/rmloop "$1"/rmloop.rm > /dev/null 2>&1 && return 0
	if ! rm "$1"/rmloop.rm > /dev/null 2>&1
	then
		rm -f "$1"/rmloop.rm > /dev/null 2>&1
		return 0
	fi
	
	
	_rm_broadcastPipe_page "$@"
	"$safeTmp"/_rmloop_broadcastPipe_page "$@" &
	#"$scriptAbsoluteLocation" _rmloop_broadcastPipe_page "$@" &
	
	
	#"$scriptAbsoluteLocation" _broadcastPipe_page_read "$@" | _broadcastPipe_page_write "$@"
	"$scriptAbsoluteLocation" _broadcastPipe_page_read "$@"
	
	# May not be necessary. Theoretically redundant.
	local currentStopJobs
	currentStopJobs=$(jobs -p -r 2> /dev/null)
	[[ "$currentStopJobs" != "" ]] && kill "$currentStopJobs" > /dev/null 2>&1
	
	
	_sleep_spinlock
	rm -f "$1"/terminate > /dev/null 2>&1
	[[ "$1" == "$current_demand_dir"* ]] && [[ "$current_demand_dir" != "" ]] && _rm_dir_broadcastPipe_page
	
	_stop
}

_demand_broadcastPipe_page() {
	local inputBufferDir="$1"
	local outputBufferDir="$2"
	shift
	shift
	
	if [[ "$inputBufferDir" == "" ]] || [[ "$outputBufferDir" == "" ]]
	then
		local current_demand_dir
		current_demand_dir=$(_demand_dir_broadcastPipe_page "$1")
		[[ "$current_demand_dir" == "" ]] && _stop 1
		
		inputBufferDir="$current_demand_dir"/inputBufferDir
		outputBufferDir="$current_demand_dir"/outputBufferDir
	elif [[ -e "$safeTmp" ]]
	then
		# DANGER: Without this hook, temporary "$safeTmp" directories may persist indefinitely!
		# Only hook '_stop_queue_page' if called from within another 'sequence' (to cause termination of service when that 'sequence' terminates for any reason).
		export current_broadcastPipe_inputBufferDir="$inputBufferDir"
		export current_broadcastPipe_outputBufferDir="$outputBufferDir"
		_stop_queue_page() {
			_terminate_broadcastPipe_page "$current_broadcastPipe_inputBufferDir" 2> /dev/null
			#_terminate_broadcastPipe_page_fast "$current_broadcastPipe_inputBufferDir" 2> /dev/null
			#sleep 1
			_rm_broadcastPipe_page "$current_broadcastPipe_inputBufferDir" "$current_broadcastPipe_outputBufferDir"
			[[ "$inputBufferDir" == "$current_demand_dir"* ]] && [[ "$current_demand_dir" != "" ]] && _rm_dir_broadcastPipe_page
		}
	fi
	
	
	"$scriptAbsoluteLocation" _demand_broadcastPipe_page_sequence "$inputBufferDir" "$outputBufferDir" "$@" &
	while [[ -e "$inputBufferDir"/rmloop ]]
	do
		sleep 0.1
	done
	[[ ! -e "$inputBufferDir"/listen ]] && _sleep_spinlock
	[[ ! -e "$inputBufferDir"/listen ]] && _sleep_spinlock
	[[ ! -e "$inputBufferDir"/listen ]] && return 1
	
	[[ "$ub_force_limit_page_rate" == 'true' ]] && _sleep_spinlock
	#[[ "$ub_force_limit_page_rate" == 'false' ]] && _sleep_spinlock
	
	disown -a -h -r
	disown -a -r
	
	return 0
}


_terminate_broadcastPipe_page_fast() {
	local inputBufferDir="$1"
	
	if [[ "$inputBufferDir" == "" ]]
	then
		local current_demand_dir
		current_demand_dir=$(_demand_dir_broadcastPipe_page "$1")
		[[ "$current_demand_dir" == "" ]] && _stop 1
		
		inputBufferDir="$current_demand_dir"/inputBufferDir
	fi
	
	[[ "$inputBufferDir" == "" ]] && return 1
	[[ "$inputBufferDir" == "/" ]] && return 1
	[[ ! -e "$inputBufferDir" ]] && return 1
	
	echo > "$inputBufferDir"/terminate
}

_terminate_broadcastPipe_page() {
	local inputBufferDir="$1"
	
	if [[ "$inputBufferDir" == "" ]]
	then
		local current_demand_dir
		current_demand_dir=$(_demand_dir_broadcastPipe_page "$1")
		[[ "$current_demand_dir" == "" ]] && _stop 1
		
		inputBufferDir="$current_demand_dir"/inputBufferDir
	fi
	
	mkdir -p "$inputBufferDir"
	
	_terminate_broadcastPipe_page_fast "$@"
	_sleep_spinlock
	
	rm -f "$inputBufferDir"/terminate > /dev/null 2>&1
	[[ "$inputBufferDir" == "$current_demand_dir"* ]] && [[ "$current_demand_dir" != "" ]] && _rm_dir_broadcastPipe_page
	
	_sleep_spinlock
	
	return 0
}

# WARNING: No production use. Intended for end-user (interactive) only.
# WARNING: Untested.
# One possible benefit - a reset should happen much more quickly than a '_terminate ..." "_demand ..." cycle due to lack of spinlock sleep.
_reset_broadcastPipe_page() {
	local inputBufferDir="$1"
	
	if [[ "$inputBufferDir" == "" ]]
	then
		local current_demand_dir
		current_demand_dir=$(_demand_dir_broadcastPipe_page "$1")
		[[ "$current_demand_dir" == "" ]] && _stop 1
		
		inputBufferDir="$current_demand_dir"/inputBufferDir
	fi
	
	mkdir -p "$inputBufferDir"
	
	[[ "$inputBufferDir" == "" ]] && return 1
	[[ "$inputBufferDir" == "/" ]] && return 1
	[[ ! -e "$inputBufferDir" ]] && return 1
	
	echo > "$inputBufferDir"/reset
	echo > "$inputBufferDir"/terminate
}


# Under ideal conditions, small quantities of data may be continiously copied completely or identically (<10M).
#./ubiquitous_bash.sh _page_read ./outputBufferDir 'testfill-' "175" > ./rewrite
#cat ./testfill | pv | ./ubiquitous_bash.sh _page_write ./outputBufferDir 'testfill-' "725" "86400"
_benchmark_page() {
	_start
	
	export ub_force_limit_page_rate='false'
	local current_Write_MaxBytes=864000
	
	
	#dd if=/dev/urandom of="$safeTmp"/testfill bs=1k count=2048 > /dev/null 2>&1
	dd if=/dev/urandom of="$safeTmp"/testfill bs=1M count=4 > /dev/null 2>&1
	
	
	#>&2 echo "read"
	#_messagePlain_probe "$scriptAbsoluteLocation" _page_read "$safeTmp"/outputBufferDir 'testfill-' "$current_Read_MaxTime" \> "$safeTmp"/rewrite
	"$scriptAbsoluteLocation" _page_read "$safeTmp"/outputBufferDir 'testfill-' "$current_Read_MaxTime" > "$safeTmp"/rewrite &
	sleep 1
	
	#>&2 echo "write"
	#_messagePlain_probe _timeout 150 cat "$safeTmp"/testfill \| pv \| _timeout 15 "$scriptAbsoluteLocation" _page_write "$safeTmp"/outputBufferDir 'testfill-' "$current_Write_MaxTime" "$current_Write_MaxBytes"
	_timeout 150 cat "$safeTmp"/testfill | pv | _timeout 30 "$scriptAbsoluteLocation" _page_write "$safeTmp"/outputBufferDir 'testfill-' "$current_Write_MaxTime" "$current_Write_MaxBytes"
	
	(
	cd "$safeTmp"
	du -sh ./testfill ./rewrite
	md5sum ./testfill ./rewrite
	)
	
	_stop
}



# Modify as required for MSW/Cygwin compatibility.
_aggregator_fifo() {
	mkfifo "$@"
}



# "$1" == inputBufferDir
# "$2" == inputFilesPrefix (MUST adhere to strictly blank or 18 alphanumeric characters!)
_aggregator_read_procedure() {
	local inputBufferDir="$1"
	local inputFilesPrefix="$2"
	local service_inputBufferDir
	#if [[ "$inputBufferDir" == "" ]] || [[ "$inputBufferDir" == "" ]]
	if [[ "$inputBufferDir" == "" ]]
	then
		local current_demand_dir
		current_demand_dir=$(_demand_dir_broadcastPipe_aggregatorStatic "$1")
		[[ "$current_demand_dir" == "" ]] && _stop 1
		
		inputBufferDir="$current_demand_dir"/outputBufferDir
		! mkdir -p "$inputBufferDir" && return 1
		
		service_inputBufferDir="$current_demand_dir"/inputBufferDir
		
		#[[ "$inputFilesPrefix" == "" ]] && inputFilesPrefix='out-'
	fi
	
	[[ "$inputFilesPrefix" == "" ]] && inputFilesPrefix=$(_uid 18)
	
	
	! mkdir -p "$inputBufferDir" && return 1
	! [[ -e "$inputBufferDir" ]] && return 1
	! [[ -d "$inputBufferDir" ]] && return 1
	
	
	
	
	local currentFifo
	currentFifo="$inputBufferDir"/"$inputFilesPrefix"
	_aggregator_fifo "$currentFifo"
	
	
	#if ! [[ -e "$safeTmp" ]]
	#then
		if [[ "$ub_nohook_current_aggregator_write_stop_queue_aggregator" != 'true' ]]
		then
			export current_aggregator_read_fifo="$currentFifo"
			_stop_queue_aggregator() {
				rm -f "$current_aggregator_read_fifo" > /dev/null 2>&1
			}
		fi
	#fi
	
	# WARNING: Removal of FIFO may not occur while not connected to both input and output. Apparently 'trap' does not work here.
	# WARNING: May be incompatible with '_timeout' .
	cat "$currentFifo"
	
	rm -f "$currentFifo" > /dev/null 2>&1
	
	return 0
}



_aggregator_read_sequence() {
	_start
	
	_aggregator_read_procedure "$@"
	
	_stop
}

_aggregator_read() {
	"$scriptAbsoluteLocation" _aggregator_read_sequence "$@"
}


# "$1" == inputBufferDir (inverted, client input, service output)
# "$2" == outputBufferDir (OPTIONAL. inverted)
_aggregatorStatic_read() {
	if ! _aggregatorStatic_delayIPC_EmptyOrWaitOrReset "$2" "$1"
	then
		return 1
	fi
	_aggregator_read_procedure "$1"
	#"$scriptAbsoluteLocation" _aggregator_read_sequence "$2"
	#"$scriptAbsoluteLocation" _aggregator_read_sequence "$@"
}





_aggregator_delayIPC_isEmpty() {
	# Although this may seem inefficient, the alternatives of calling external programs, filling variables, or setting 'shopt', may also be undesirable.
	# https://www.cyberciti.biz/faq/linux-unix-shell-check-if-directory-empty/
	currentIsEmptyOut='true'
	for currentFile in "$1"/??????????????????
	do
		[[ "$currentFile" != *'??????????????????' ]] && currentIsEmptyOut='false' && break
	done
	
	[[ "$currentIsEmptyOut" == 'true' ]] && return 0
	return 1
}

_aggregator_delayIPC_isReset() {
	#&& [[ ! -e "$1"/reset ]] && [[ ! -e "$1"/terminate ]] && [[ ! -e "$1"/rmloop ]]
	# && ! _aggregator_delayIPC_isEmpty "$2"
	#[[ ! -e "$1"/attempt ]]
	
	if [[ -e "$1"/vaccancy ]] && _aggregator_delayIPC_isEmpty "$1" && _aggregator_delayIPC_isEmpty "$2"
	then
		return 0
	fi
	return 1
}


# May allow a new set of 'connections' to replace an existing (presumably broken) set of 'connections'.
# May require >>24seconds delay to allow previous (invalid) 'delay: Inter-Process Communications' to expire.
# WARNING: May not be compatible with '_skip_broadcastPipe_aggregatorStatic' .
# "$1" == inputBufferDir
# "$2" == outputBufferDir
# ATTENTION: EXAMPLE
#./lean.sh _aggregatorStatic_delayIPC_EmptyOrWaitOrReset && echo done && ./lean.sh _aggregator_write
#/lean.sh _aggregatorStatic_delayIPC_EmptyOrWaitOrReset && echo done && ./lean.sh _aggregator_read
_aggregator_delayIPC_EmptyOrWaitOrReset() {
	local inputBufferDir="$1"
	local outputBufferDir="$2"
	
	if [[ "$inputBufferDir" == "" ]] || [[ "$outputBufferDir" == "" ]]
	then
		local current_demand_dir
		current_demand_dir=$(_demand_dir_broadcastPipe_aggregator_delayIPC_EmptyOrWaitOrReset "$1")
		[[ "$current_demand_dir" == "" ]] && _stop 1
		
		# Not inverted. After all, this function will typically be called by other functions, and so uses the service convention.
		inputBufferDir="$current_demand_dir"/inputBufferDir
		outputBufferDir="$current_demand_dir"/outputBufferDir
	fi
	
	
	local currentIterations
	
	local currentFile
	local currentIsEmptyBuffer
	
	
	
	# DANGER: CAUTION: Relies on several relatively marginal assumptions regarding '_broadcastPipe_aggregatorStatic_read_procedure' algorithm and OS/kernel latency.
	
	
	# Expect 18seconds total sleep after all iterations and one attempt.
	currentIterations='0'
	currentAttempts='0'
	while [[ "$currentIterations" -lt 6 ]] && [[ "$currentAttempts" -lt 3 ]] && ! _aggregator_delayIPC_isReset "$inputBufferDir" "$outputBufferDir"
	do
		sleep 3
		let currentIterations="$currentIterations"+1
		
		if ! [[ "$currentIterations" -lt 6 ]]
		then
			if ! _aggregator_delayIPC_isReset "$inputBufferDir" "$outputBufferDir"
			then
				echo > "$inputBufferDir"/attempt.tmp
				_moveconfirm "$inputBufferDir"/attempt.tmp "$inputBufferDir"/attempt && _reset_broadcastPipe_aggregatorStatic "$inputBufferDir"
			fi
			#sleep 3
			currentIterations='0'
			let currentAttempts="$currentAttempts"+1
		fi
	done
	! _aggregator_delayIPC_isReset "$inputBufferDir" "$outputBufferDir" && return 1
	
	# WARNING: Delay must be <<24seconds .
	# Must be long enough to allow all waiting clients to 'see' the 'vaccancy' and 'empty' conditions, but not long enough to overrun the 'vaccancy' delay.
	# Delaying an entire '_sleep_spinlock' cycle may be undesirable in practice. Multiple clients will be connecting simultaneously, and external (or 'user') latencies may be much more likely than an extreme ~7seconds spinlock event from the kernel.
	#sleep 3
	#sleep 5
	sleep 7
	#_sleep_spinlock
	
	#if _aggregator_delayIPC_isReset "$inputBufferDir" "$outputBufferDir"
	#then
		rm -f "$inputBufferDir"/attempt.tmp > /dev/null 2>&1
		rm -f "$inputBufferDir"/attempt > /dev/null 2>&1
	#fi
	
	return 0
}

_aggregatorStatic_delayIPC_EmptyOrWaitOrReset() {
	_demand_dir_broadcastPipe_aggregator_delayIPC_EmptyOrWaitOrReset() {
		_demand_dir_broadcastPipe_aggregatorStatic "$@"
	}
	if ! true | _aggregator_delayIPC_EmptyOrWaitOrReset "$@"
	then
		return 1
	fi
	return 0
}





# Intended to be called by users and programs which are only able to call one other program which must accept both standard input/output connections.
# Specifically intended to be compatible with 'socat' .
# "$1" == inputBufferDir (inverted - typically output of broadcastPipe)
# "$2" == outputBufferDir (inverted - typically input of broadcastPipe)
# "$4" == inputFilesPrefix (MUST adhere to strictly blank or 18 alphanumeric characters!)
# "$4" == outputFilesPrefix (MUST adhere to strictly blank or 18 alphanumeric characters!)
_aggregator_converse_procedure() {
	local inputBufferDir="$1"
	local outputBufferDir="$2"
	if [[ "$inputBufferDir" == "" ]] || [[ "$outputBufferDir" == "" ]]
	then
		local current_demand_dir
		current_demand_dir=$(_demand_dir_broadcastPipe_aggregator_converse "$1")
		[[ "$current_demand_dir" == "" ]] && _stop 1
		
		inputBufferDir="$current_demand_dir"/outputBufferDir
		outputBufferDir="$current_demand_dir"/inputBufferDir
	fi
	
	local inputFilesPrefix="$3"
	[[ "$inputFilesPrefix" == "" ]] && inputFilesPrefix=$(_uid 18)
	
	local outputFilesPrefix="$4"
	[[ "$outputFilesPrefix" == "" ]] && outputFilesPrefix=$(_uid 18)
	
	# DANGER: Without this hook, temporary buffers may persist indefinitely!
	# CAUTION: Reset may be necessitated - testing suggests this hook does not work.
	export current_broadcastPipe_inputBufferDir="$inputBufferDir"
	export current_broadcastPipe_outputBufferDir="$outputBufferDir"
	export current_broadcastPipe_inputFilesPrefix="$inputFilesPrefix"
	export current_broadcastPipe_outputFilesPrefix="$outputFilesPrefix"
	_stop_queue_aggregator() {
		rm -f "$current_broadcastPipe_inputBufferDir"/"$current_broadcastPipe_inputFilesPrefix" > /dev/null 2>&1
		rm -f "$current_broadcastPipe_outputBufferDir"/"$current_broadcastPipe_outputFilesPrefix" > /dev/null 2>&1
		_sleep_spinlock
		rm -f "$current_broadcastPipe_inputBufferDir"/"$current_broadcastPipe_inputFilesPrefix" > /dev/null 2>&1
		rm -f "$current_broadcastPipe_outputBufferDir"/"$current_broadcastPipe_outputFilesPrefix" > /dev/null 2>&1
	}
	export ub_nohook_current_aggregator_write_stop_queue_aggregator='true'
	
	#echo "$current_broadcastPipe_outputBufferDir"/"$current_broadcastPipe_outputFilesPrefix"
	
	_aggregator_read_procedure "$inputBufferDir" "$inputFilesPrefix" &
	_aggregator_write_procedure "$outputBufferDir" "$outputFilesPrefix"
}

_aggregatorStatic_converse_noEmptyOrWaitOrReset() {
	_demand_dir_broadcastPipe_aggregator_converse() {
		_demand_dir_broadcastPipe_aggregatorStatic "$@"
	}
	_aggregator_converse_procedure "$@" 2> /dev/null
}

_aggregatorStatic_converse_EmptyOrWaitOrReset() {
	if ! _aggregatorStatic_delayIPC_EmptyOrWaitOrReset "$2" "$1" 2> /dev/null
	then
		return 1
	fi
	_aggregatorStatic_converse_noEmptyOrWaitOrReset "$@" 2> /dev/null
}

_aggregatorStatic_converse() {
	_aggregatorStatic_converse_EmptyOrWaitOrReset "$@" 2> /dev/null
}


# "$1" == outputBufferDir
# "$2" == outputFilesPrefix (MUST adhere to strictly blank or 18 alphanumeric characters!)
_aggregator_write_procedure() {
	local outputBufferDir="$1"
	local outputFilesPrefix="$2"
	#if [[ "$outputBufferDir" == "" ]] || [[ "$outputFilesPrefix" == "" ]]
	if [[ "$outputBufferDir" == "" ]]
	then
		local current_demand_dir
		current_demand_dir=$(_demand_dir_broadcastPipe_aggregatorStatic "$1")
		[[ "$current_demand_dir" == "" ]] && _stop 1
		
		outputBufferDir="$current_demand_dir"/inputBufferDir
		! mkdir -p "$outputBufferDir" && return 1
		
		#[[ "$outputFilesPrefix" == "" ]] && outputFilesPrefix='stream-'
	fi
	
	[[ "$outputFilesPrefix" == "" ]] && outputFilesPrefix=$(_uid 18)
	
	
	! mkdir -p "$outputBufferDir" && return 1
	! [[ -e "$outputBufferDir" ]] && return 1
	! [[ -d "$outputBufferDir" ]] && return 1
	
	
	
	
	local currentFifo
	currentFifo="$outputBufferDir"/"$outputFilesPrefix"
	_aggregator_fifo "$currentFifo"
	
	#if ! [[ -e "$safeTmp" ]]
	#then
		if [[ "$ub_nohook_current_aggregator_write_stop_queue_aggregator" != 'true' ]]
		then
			export current_aggregator_write_fifo="$currentFifo"
			_stop_queue_aggregator() {
				rm -f "$current_aggregator_write_fifo" > /dev/null 2>&1
			}
		fi
	#fi
	
	# WARNING: Removal of FIFO may not occur while not connected to both input and output. Apparently 'trap' does not work here.
	# WARNING: May be incompatible with '_timeout' .
	cat > "$currentFifo"
	
	rm -f "$currentFifo" > /dev/null 2>&1
	
	return 0
}



_aggregator_write_sequence() {
	_start
	
	_aggregator_write_procedure "$@" 2> /dev/null
	
	_stop
}

_aggregator_write() {
	"$scriptAbsoluteLocation" _aggregator_write_sequence "$@" 2> /dev/null
}


# "$1" == outputBufferDir (inverted, client output, service input)
# "$2" == inputBufferDir (OPTIONAL. inverted)
_aggregatorStatic_write() {
	if ! _aggregatorStatic_delayIPC_EmptyOrWaitOrReset "$1" "$2"
	then
		return 1
	fi
	_aggregator_write_procedure "$1" 2> /dev/null
	#"$scriptAbsoluteLocation" _aggregator_write_sequence "$1" 2> /dev/null
	#"$scriptAbsoluteLocation" _aggregator_write_sequence "$@" 2> /dev/null
}





# ATTENTION: Override with 'ops' or similar.
_rm_broadcastPipe_aggregatorStatic() {
	! _safePath_demand_broadcastPipe_aggregatorStatic "$1" && return 1
	! _safePath_demand_broadcastPipe_aggregatorStatic "$2" && return 1
	
	#[[ -e "$1" ]] && [[ "$1" != "" ]] && rm -f "$1"/* > /dev/null 2>&1
	[[ -e "$1" ]] && [[ "$1" != "" ]] && find "$1" -mindepth 1 -maxdepth 1 \( -type f -o -type p -o -type l \) ! -name 'terminate' ! -name 'reset' ! -name 'attempt' -delete > /dev/null 2>&1
	[[ -e "$2" ]] && [[ "$2" != "" ]] && rm -f "$2"/* > /dev/null 2>&1
	
	
	return 0
}

# ATTENTION: Override with 'ops' or similar.
_rm_broadcastPipe_aggregatorStatic_keepListen() {
	! _safePath_demand_broadcastPipe_aggregatorStatic "$1" && return 1
	! _safePath_demand_broadcastPipe_aggregatorStatic "$2" && return 1
	
	#[[ -e "$1" ]] && [[ "$1" != "" ]] && rm -f "$1"/* > /dev/null 2>&1
	[[ -e "$1" ]] && [[ "$1" != "" ]] && find "$1" -mindepth 1 -maxdepth 1 \( -type f -o -type p -o -type l \) ! -name 'terminate' ! -name 'listen' ! -name 'attempt' -delete > /dev/null 2>&1
	[[ -e "$2" ]] && [[ "$2" != "" ]] && rm -f "$2"/* > /dev/null 2>&1
	
	
	return 0
}



_jobs_terminate_aggregatorStatic_procedure() {
	currentStopJobs=$(jobs -p -r 2> /dev/null)
	# WARNING: Although usually bad practice, it is useful for the spaces between PIDs to be interpreted in this case.
	# DANGER: Apparently, it is possible for some not running background jobs to be included in the PID list.
	[[ "$currentStopJobs" != "" ]] && kill $currentStopJobs > /dev/null 2>&1
	kill "$1" > /dev/null 2>&1
	
	currentIterations='0'
	while [[ $(jobs -p -r) != "" ]] && [[ "$currentIterations" -lt '3' ]]
	do
		sleep 0.6
		let currentIterations="$currentIterations"+1
	done
	currentStopJobs=$(jobs -p -r 2> /dev/null)
	kill -KILL $currentStopJobs > /dev/null 2>&1
	kill -KILL "$1" > /dev/null 2>&1
	
	currentIterations='0'
	while [[ $(jobs -p -r) != "" ]] && [[ "$currentIterations" -lt '16' ]]
	do
		sleep 1
		let currentIterations="$currentIterations"+1
	done
}



_broadcastPipe_aggregatorStatic_read_procedure() {
	_messageNormal 'init: _broadcastPipe_aggregatorStatic_read_procedure'
	[[ "$1" == "" ]] && _stop 1
	[[ "$1" == "/" ]] && _stop 1
	[[ "$2" == "/" ]] && _stop 1
	
	local current_demand_dir
	current_demand_dir=$(_demand_dir_broadcastPipe_aggregatorStatic "$1")
	
	# May perhaps take effect when SIGTERM is received directly (eg. when SIGTERM may be sent to all processes) .
	export current_broadcastPipe_inputBufferDir="$1"
	export current_broadcastPipe_outputBufferDir="$2"
	export current_broadcastPipe_current_demand_dir="$current_demand_dir"
	_stop_queue_aggregatorStatic() {
		#_terminate_broadcastPipe_aggregatorStatic "$current_broadcastPipe_inputBufferDir" 2> /dev/null
		_terminate_broadcastPipe_fast "$current_broadcastPipe_inputBufferDir" 2> /dev/null
		sleep 1
		_rm_broadcastPipe_aggregatorStatic "$current_broadcastPipe_inputBufferDir" "$current_broadcastPipe_outputBufferDir"
		[[ "$current_broadcastPipe_inputBufferDir" == "$current_broadcastPipe_current_demand_dir"* ]] && [[ "$current_broadcastPipe_current_demand_dir" != "" ]] && _rm_dir_broadcastPipe_aggregatorStatic
		
		_sleep_spinlock
		rm -f "$current_broadcastPipe_inputBufferDir"/reset > /dev/null 2>&1
		rm -f "$current_broadcastPipe_inputBufferDir"/terminate > /dev/null 2>&1
		[[ "$current_broadcastPipe_inputBufferDir" == "$current_broadcastPipe_current_demand_dir"* ]] && [[ "$current_broadcastPipe_current_demand_dir" != "" ]] && _rm_dir_broadcastPipe_aggregatorStatic
	}
	
	
	local currentTerminate='false'
	
	while [[ ! -e "$1"/terminate ]] && [[ -d "$1" ]] && [[ "$currentTerminate" == 'false' ]]
	do
		
		
		
		local currentIterations
		
		
		_rm_broadcastPipe_aggregatorStatic "$@"
		rm -f "$1"/reset > /dev/null 2>&1
		rm -f "$1"/terminate > /dev/null 2>&1
		
		echo > "$1"/listen
		echo > "$1"/vaccancy
		echo > "$2"/vaccancy
		
		local currentInputBufferCount='0'
		local currentInputBufferCount_prev='0'
		local currentOutputBufferCount='0'
		local currentOutputBufferCount_prev='0'
		
		local currentFile
		
		
		local currentStopJobs
		
		local currentIsEmptyOut
		
		local currentPID
		
		local noJobsTwice
		
		_messagePlain_nominal ' 0 : reached loop'
		_messagePlain_probe "$1"
		_messagePlain_probe "$2"
		while [[ ! -e "$1"/terminate ]] && [[ -d "$1" ]]
		do
			_messagePlain_nominal ' 1 : loop'
			
			#rm -f "$1"/skip > /dev/null 2>&1
			
			currentInputBufferCount_prev="$currentInputBufferCount"
			currentOutputBufferCount_prev="$currentOutputBufferCount"
			#[[ $(jobs -p -r) != "" ]] && 
			while [[ "$currentInputBufferCount" == "$currentInputBufferCount_prev" ]] && [[ "$currentOutputBufferCount" == "$currentOutputBufferCount_prev" ]] && [[ ! -e "$1"/terminate ]] && [[ -d "$1" ]]
			do
				_messagePlain_nominal ' 2 : wait for change'
				
				currentInputBufferCount=0
				for currentFile in "$1"/??????????????????
				do
					_messagePlain_nominal '11 : count: currentInputBufferCount= '"$currentInputBufferCount"
					[[ "$currentFile" != *'??????????????????' ]] && let currentInputBufferCount="$currentInputBufferCount"+1
				done
				
				currentOutputBufferCount=0
				for currentFile in "$2"/??????????????????
				do
					_messagePlain_nominal '11 : count: currentOutputBufferCount= '"$currentOutputBufferCount"
					[[ "$currentFile" != *'??????????????????' ]] && let currentOutputBufferCount="$currentOutputBufferCount"+1
				done
				
				_messagePlain_probe_var currentInputBufferCount_prev
				_messagePlain_probe_var currentOutputBufferCount_prev
				_messagePlain_probe_var currentInputBufferCount
				_messagePlain_probe_var currentOutputBufferCount
				
				if ( [[ "$currentInputBufferCount" -gt 0 ]] || [[ "$currentOutputBufferCount" -gt 0 ]] ) && [[ $(jobs -p -r) == "" ]] && [[ "$currentInputBufferCount" == "$currentInputBufferCount_prev" ]] && [[ "$currentOutputBufferCount" == "$currentOutputBufferCount_prev" ]] && [[ "$noJobsTwice" == 'true' ]]
				then
					_messagePlain_warn 'obscure: 2.1: change: no jobs 2x: remove: unused pipe files'
					_rm_broadcastPipe_aggregatorStatic_keepListen "$@"
					#rm -f "$1"/skip > /dev/null 2>&1
					noJobsTwice='false'
				elif ( [[ "$currentInputBufferCount" -gt 0 ]] || [[ "$currentOutputBufferCount" -gt 0 ]] ) && [[ $(jobs -p -r) == "" ]] && [[ "$currentInputBufferCount" == "$currentInputBufferCount_prev" ]] && [[ "$currentOutputBufferCount" == "$currentOutputBufferCount_prev" ]] && [[ "$noJobsTwice" != 'true' ]]
				then
					_messagePlain_warn 'obscure: 2.1: change: no jobs 1x: set: noJobsTwice'
					noJobsTwice='true'
				fi
				
				
				# DANGER: Delay time > ~24seconds may result in unused/blocking FIFO pipes remaining (additional delay in remainder of loop is tolerable).
				# Iterations >1 may reduce CPU consumption with Cygwin/MSW , assuming file exists check is reasonably efficient.
				currentIterations='0'
				while [[ "$currentIterations" -lt '3' ]] && [[ "$currentInputBufferCount" == "$currentInputBufferCount_prev" ]] && [[ "$currentOutputBufferCount" == "$currentOutputBufferCount_prev" ]] && [[ ! -e "$1"/terminate ]] && [[ -d "$1" ]]
				do
					# If pipes are already connected, maybe delay a while longer to reduce CPU consumption.
					if [[ $(jobs -p -r) != "" ]]
					then
						_messagePlain_nominal '12 : idle: jobs: long delay'
						sleep 6
					fi
					
					# If pipes are not already connected, maybe delay a less, to improve interactivity.
					if [[ $(jobs -p -r) == "" ]]
					then
						# DANGER: CAUTION: Any 'sleep' > 3seconds (9seconds total) may break '_aggregator_delayIPC_'... .
						_messagePlain_nominal '12 : idle: no jobs: short delay'
						sleep 3
					fi
					
					let currentIterations="$currentIterations"+1
				done
			done
			#_messagePlain_warn 'obscure:  3 : done: loop: detected: new pipe files: complicated procedure: suspected failability'
			_messagePlain_good ' 3 : done: loop: detected: new pipe files'
			
			
			# ATTENTION: delay: InterProcess-Communication
			# CAUTION: Before reducing the delay (24 seconds recommended), consider that remote/peripherial may have latencies independent of any OS 'kernel', 'real-time' or otherwise!
			echo -e '\E[1;33;47m ''13 : delay: InterProcess-Communication: 24 seconds'' \E[0m'
			currentIterations='0'
			while [[ "$currentIterations" -lt 4 ]] && [[ ! -e "$1"/skip ]] && [[ ! -e "$1"/terminate ]] && [[ -d "$1" ]] && [[ "$currentOutputBufferCount" -gt 0 ]]
			#( [[ "$currentInputBufferCount" -gt 0 ]] || [[ "$currentOutputBufferCount" -gt 0 ]] )
			do
				if [[ "$currentIterations" == '0' ]]
				then
					echo > "$1"/vaccancy
					echo > "$2"/vaccancy
				fi
				
				#_messageDELAYipc
				_messagePlain_probe '13 : delay: InterProcess-Communication: 6 second iteration'
				#_messagePlain_probe '13 : delay: InterProcess-Communication: 6 second iteration: 24 seconds'
				#_messagePlain_nominal '13 : delay: InterProcess-Communication: 6 second iteration: 24 seconds'
				#echo -e '\E[1;33;47m ''13 : delay: InterProcess-Communication: 6 second iteration: 24 seconds'' \E[0m'
				sleep 6
				let currentIterations="$currentIterations"+1
			done
			if [[ ! -e "$1"/terminate ]] && [[ -d "$1" ]] && [[ "$currentOutputBufferCount" -gt 0 ]]
			then
				rm -f "$1"/vaccancy
				rm -f "$2"/vaccancy
				rm -f "$1"/attempt
				rm -f "$2"/attempt
			fi
			rm "$1"/skip > /dev/null 2>&1 && _messagePlain_good 'good: skip'
			rm -f "$1"/skip > /dev/null 2>&1
			
			currentInputBufferCount=0
			for currentFile in "$1"/??????????????????
			do
				_messagePlain_nominal '14 : count: currentInputBufferCount= '"$currentInputBufferCount"
				[[ "$currentFile" != *'??????????????????' ]] && let currentInputBufferCount="$currentInputBufferCount"+1
			done
			
			currentOutputBufferCount=0
			for currentFile in "$2"/??????????????????
			do
				_messagePlain_nominal '15 : count: currentOutputBufferCount= '"$currentOutputBufferCount"
				[[ "$currentFile" != *'??????????????????' ]] && let currentOutputBufferCount="$currentOutputBufferCount"+1
			done
			
			
			# https://stackoverflow.com/questions/25906020/are-pid-files-still-flawed-when-doing-it-right/25933330
			# https://stackoverflow.com/questions/360201/how-do-i-kill-background-processes-jobs-when-my-shell-script-exits
			
			_messagePlain_nominal ' 4 : _jobs_terminate_aggregatorStatic_procedure'
			_jobs_terminate_aggregatorStatic_procedure "$currentPID"
			
			_messagePlain_nominal ' 5 : detect: currentIsEmptyOut'
			#currentIsEmptyOut='false'
			# Although this may seem inefficient, the alternatives of calling external programs, filling variables, or setting 'shopt', may also be undesirable.
			# https://www.cyberciti.biz/faq/linux-unix-shell-check-if-directory-empty/
			currentIsEmptyOut='true'
			for currentFile in "$2"/??????????????????
			do
				if [[ "$currentFile" != *'??????????????????' ]]
				then
					_messagePlain_good '16 : detected: output pipe file'
					currentIsEmptyOut='false'
					break
				fi
			done
			_messagePlain_nominal ' 6 : decision'
			_messagePlain_probe_var currentInputBufferCount
			_messagePlain_probe_var currentOutputBufferCount
			[[ ! -e "$1"/terminate ]] && _messagePlain_probe ' 7.1: flag: missing: terminate'
			[[ -d "$1" ]] && _messagePlain_probe ' 7.2: detect: present: input directory'
			[[ "$currentIsEmptyOut" == 'false' ]] && _messagePlain_good ' 7.3: flag: detect: output pipe files'
			if [[ ! -e "$1"/terminate ]] && [[ -d "$1" ]] && [[ "$currentIsEmptyOut" == 'false' ]] && [[ "$currentInputBufferCount" -gt 0 ]] && [[ "$currentOutputBufferCount" -gt 0 ]]
			then
				_messagePlain_nominal ' 7 : ##### connect pipes #####'
				#https://unix.stackexchange.com/questions/139490/continuous-reading-from-named-pipe-cat-or-tail-f
				#https://stackoverflow.com/questions/11185771/bash-script-to-iterate-files-in-directory-and-pattern-match-filenames
				(
				for currentFile in "$1"/??????????????????
				do
					[[ "$currentFile" != *'??????????????????' ]] && cat "$currentFile" 2>/dev/null &
				done
				) | tee "$2"/?????????????????? > /dev/null 2>&1 &
				currentPID="$!"
				
				#rm -f "$1"/skip > /dev/null 2>&1
			fi
			
			_messagePlain_nominal ' 8 : repeat'
			
			# WARNING: Some processes within the subshell (ie. 'sleep' ) may allow the subshell to terminate rather than maintain a 'jobs' PID.
			_messagePlain_probe 'jobs: '$(jobs -p -r)
		done
		
		_messagePlain_nominal ' 9 : ##### terminate or reset #####'
		
		_jobs_terminate_aggregatorStatic_procedure "$currentPID"
		
		
		# WARNING: Since only one program may successfully remove a single file, that mechanism should allow only one 'broadcastPipe' process to remain in the unlikely case multiple were somehow started.
		currentTerminate='true'
		[[ -e "$1"/terminate ]] && [[ -e "$1"/reset ]] && rm "$1"/reset > /dev/null 2>&1 && rm "$1"/terminate > /dev/null 2>&1 && rm -f "$1"/listen > /dev/null 2>&1 && currentTerminate='false'
		rm -f "$1"/reset > /dev/null 2>&1
		
		# Recursive reset. Abandoned due to possibility of practical 'limit of recursion' with "bash" shell (and presumably similar as well) .
		# https://rosettacode.org/wiki/Find_limit_of_recursion
		# 'The Bash reference manual says No limit is placed on the number of recursive calls, nonetheless a segmentation fault occurs at 13777 (Bash v3.2.19 on 32bit GNU/Linux) '
		#[[ -e "$1"/terminate ]] && [[ -e "$1"/reset ]] && rm "$1"/reset > /dev/null 2>&1 && _broadcastPipe_aggregatorStatic_read_procedure "$@"
		#rm -f "$1"/reset > /dev/null 2>&1
		
	done
	
	
	rm -f "$1"/reset > /dev/null 2>&1
	rm -f "$1"/terminate > /dev/null 2>&1
	
	_rm_broadcastPipe_aggregatorStatic "$@"
	rm -f "$1"/reset > /dev/null 2>&1
	rm -f "$1"/terminate > /dev/null 2>&1
	[[ "$1" == "$current_demand_dir"* ]] && [[ "$current_demand_dir" != "" ]] && _rm_dir_broadcastPipe_aggregatorStatic
	
	_sleep_spinlock
	rm -f "$1"/terminate > /dev/null 2>&1
	[[ "$1" == "$current_demand_dir"* ]] && [[ "$current_demand_dir" != "" ]] && _rm_dir_broadcastPipe_aggregatorStatic
	
	return 0
}



# WARNING: Any unconnected pipe will block all pipes.
# WARNING: Any disconnection or new pipe will cause 'reset' of all pipes.
# "$1" == inputBufferDir
# "$2" == outputBufferDir
_broadcastPipe_aggregatorStatic_read() {
	_start
	
	_broadcastPipe_aggregatorStatic_read_procedure "$@"
	
	_stop
}










_here_rmloop_broadcastPipe_aggregatorStatic() {
	_here_header_bash_or_dash "$@"
	
	declare -f _rmloop_broadcastPipe_aggregatorStatic
	
	cat << CZXWXcRMTo8EmM8i4d
_rmloop_broadcastPipe_aggregatorStatic "\$@"

CZXWXcRMTo8EmM8i4d

}


_rmloop_broadcastPipe_aggregatorStatic() {
	while true
	do
		rm -f "$1"/rmloop > /dev/null 2>&1
		
		#sleep 1
		sleep 0.1
	done
	
}


_safePath_demand_broadcastPipe_aggregatorStatic() {
	if [[ "$1" == "$scriptLocal"* ]] && ! _if_cygwin
	then
		return 0
	fi
	if [[ "$1" == '/dev/shm/'* ]] && ! _if_cygwin
	then
		return 0
	fi
	
	
	! _safePath "$1" && _stop 1
	return 0
}

# WARNING: Deletes all existing files (to 'clear the buffers').
# "$1" == inputBufferDir
# "$2" == outputBufferDir
_demand_broadcastPipe_aggregatorStatic_sequence() {
	_start
	
	! mkdir -p "$1" && _stop 1
	! mkdir -p "$2" && _stop 1
	[[ "$1" == "" ]] && _stop 1
	[[ "$1" == "/" ]] && _stop 1
	[[ "$2" == "/" ]] && _stop 1
	if ! _safePath_demand_broadcastPipe_aggregatorStatic "$@"
	then
		_terminate_broadcastPipe_aggregatorStatic "$1"
		_stop 1
	fi
	
	_here_rmloop_broadcastPipe_aggregatorStatic "$@" > "$safeTmp"/_rmloop_broadcastPipe_aggregatorStatic
	chmod u+x "$safeTmp"/_rmloop_broadcastPipe_aggregatorStatic
	
	echo > "$1"/rmloop
	
	
	_sleep_spinlock
	
	
	! [[ -e "$1"/rmloop ]] && return 0
	! mv "$1"/rmloop "$1"/rmloop.rm > /dev/null 2>&1 && return 0
	if ! rm "$1"/rmloop.rm > /dev/null 2>&1
	then
		rm -f "$1"/rmloop.rm > /dev/null 2>&1
		return 0
	fi
	
	
	_rm_broadcastPipe_aggregatorStatic "$@"
	"$safeTmp"/_rmloop_broadcastPipe_aggregatorStatic "$@" &
	#"$scriptAbsoluteLocation" _rmloop_broadcastPipe_aggregatorStatic "$@" &
	
	
	#"$scriptAbsoluteLocation" _broadcastPipe_aggregatorStatic_read "$@" | _broadcastPipe_aggregatorStatic_write "$@"
	"$scriptAbsoluteLocation" _broadcastPipe_aggregatorStatic_read "$@"
	
	# May not be necessary. Theoretically redundant.
	local currentStopJobs
	currentStopJobs=$(jobs -p -r 2> /dev/null)
	[[ "$currentStopJobs" != "" ]] && kill "$currentStopJobs" > /dev/null 2>&1
	
	
	_sleep_spinlock
	rm -f "$1"/terminate > /dev/null 2>&1
	[[ "$1" == "$current_demand_dir"* ]] && [[ "$current_demand_dir" != "" ]] && _rm_dir_broadcastPipe_aggregatorStatic
	
	_stop
}

_demand_broadcastPipe_aggregatorStatic() {
	local inputBufferDir="$1"
	local outputBufferDir="$2"
	shift
	shift
	
	if [[ "$inputBufferDir" == "" ]] || [[ "$outputBufferDir" == "" ]]
	then
		local current_demand_dir
		current_demand_dir=$(_demand_dir_broadcastPipe_aggregatorStatic "$1")
		[[ "$current_demand_dir" == "" ]] && _stop 1
		
		inputBufferDir="$current_demand_dir"/inputBufferDir
		outputBufferDir="$current_demand_dir"/outputBufferDir
	elif [[ -e "$safeTmp" ]]
	then
		# DANGER: Without this hook, temporary "$safeTmp" directories may persist indefinitely!
		# Only hook '_stop_queue_aggregatorStatic' if called from within another 'sequence' (to cause termination of service when that 'sequence' terminates for any reason).
		export current_broadcastPipe_inputBufferDir="$inputBufferDir"
		export current_broadcastPipe_outputBufferDir="$outputBufferDir"
		_stop_queue_aggregatorStatic() {
			_terminate_broadcastPipe_aggregatorStatic "$current_broadcastPipe_inputBufferDir" 2> /dev/null
			#_terminate_broadcastPipe_fast "$current_broadcastPipe_inputBufferDir" 2> /dev/null
			#sleep 1
			_rm_broadcastPipe_aggregatorStatic "$current_broadcastPipe_inputBufferDir" "$current_broadcastPipe_outputBufferDir"
			[[ "$inputBufferDir" == "$current_demand_dir"* ]] && [[ "$current_demand_dir" != "" ]] && _rm_dir_broadcastPipe_aggregatorStatic
		}
	fi
	
	
	"$scriptAbsoluteLocation" _demand_broadcastPipe_aggregatorStatic_sequence "$inputBufferDir" "$outputBufferDir" "$@" &
	while [[ -e "$inputBufferDir"/rmloop ]]
	do
		sleep 0.1
	done
	[[ ! -e "$inputBufferDir"/listen ]] && _sleep_spinlock
	[[ ! -e "$inputBufferDir"/listen ]] && _sleep_spinlock
	[[ ! -e "$inputBufferDir"/listen ]] && return 1
	
	[[ "$ub_force_limit_aggregatorStatic_rate" == 'true' ]] && _sleep_spinlock
	#[[ "$ub_force_limit_aggregatorStatic_rate" == 'false' ]] && _sleep_spinlock
	
	disown -a -h -r
	disown -a -r
	
	return 0
}


_terminate_broadcastPipe_aggregatorStatic_fast() {
	local inputBufferDir="$1"
	
	if [[ "$inputBufferDir" == "" ]]
	then
		local current_demand_dir
		current_demand_dir=$(_demand_dir_broadcastPipe_aggregatorStatic "$1")
		[[ "$current_demand_dir" == "" ]] && _stop 1
		
		inputBufferDir="$current_demand_dir"/inputBufferDir
	fi
	
	[[ "$inputBufferDir" == "" ]] && return 1
	[[ "$inputBufferDir" == "/" ]] && return 1
	[[ ! -e "$inputBufferDir" ]] && return 1
	
	echo > "$inputBufferDir"/terminate
}

_terminate_broadcastPipe_aggregatorStatic() {
	local inputBufferDir="$1"
	
	if [[ "$inputBufferDir" == "" ]]
	then
		local current_demand_dir
		current_demand_dir=$(_demand_dir_broadcastPipe_aggregatorStatic "$1")
		[[ "$current_demand_dir" == "" ]] && _stop 1
		
		inputBufferDir="$current_demand_dir"/inputBufferDir
	fi
	
	mkdir -p "$inputBufferDir"
	
	_terminate_broadcastPipe_aggregatorStatic_fast "$@"
	_sleep_spinlock
	
	rm -f "$inputBufferDir"/terminate > /dev/null 2>&1
	[[ "$inputBufferDir" == "$current_demand_dir"* ]] && [[ "$current_demand_dir" != "" ]] && _rm_dir_broadcastPipe_aggregatorStatic
	
	_sleep_spinlock
	
	return 0
}


_reset_broadcastPipe_aggregatorStatic() {
	local inputBufferDir="$1"
	
	if [[ "$inputBufferDir" == "" ]]
	then
		local current_demand_dir
		current_demand_dir=$(_demand_dir_broadcastPipe_aggregatorStatic "$1")
		[[ "$current_demand_dir" == "" ]] && _stop 1
		
		inputBufferDir="$current_demand_dir"/inputBufferDir
	fi
	
	mkdir -p "$inputBufferDir"
	
	[[ "$inputBufferDir" == "" ]] && return 1
	[[ "$inputBufferDir" == "/" ]] && return 1
	[[ ! -e "$inputBufferDir" ]] && return 1
	
	echo > "$inputBufferDir"/reset
	echo > "$inputBufferDir"/terminate
}


_skip_broadcastPipe_aggregatorStatic() {
	local inputBufferDir="$1"
	
	if [[ "$inputBufferDir" == "" ]]
	then
		local current_demand_dir
		current_demand_dir=$(_demand_dir_broadcastPipe_aggregatorStatic "$1")
		[[ "$current_demand_dir" == "" ]] && _stop 1
		
		inputBufferDir="$current_demand_dir"/inputBufferDir
	fi
	
	mkdir -p "$inputBufferDir"
	
	[[ "$inputBufferDir" == "" ]] && return 1
	[[ "$inputBufferDir" == "/" ]] && return 1
	[[ ! -e "$inputBufferDir" ]] && return 1
	
	echo > "$inputBufferDir"/skip
}




# ATTENTION: Override with 'ops' or similar.
# Lock (if at all) the socket, not the buffers.
# Ports 6391 or alternatively 24671 preferred for one-per-machine IPC service with high-latency no-reset (ie. 'tripleBuffer' ) backend.
# Consider the limited availability of TCP/UDP port numbers not occupied by some other known purpose.
# TCP server intended for compatibility with platforms (ie. MSW/Cygwin) which may not have sufficient performance or flexibility to read/write (ie. 'tripleBuffer' ) backend directly.
# https://blog.travismclarke.com/post/socat-tutorial/
# https://fub2.github.io/powerful-socat/
# https://jdimpson.livejournal.com/tag/socat
# https://stackoverflow.com/questions/57299019/make-socat-open-port-only-on-localhost-interface
_page_socket_tcp_server() {
	_messagePlain_nominal '_page_socket_tcp_server: init: _demand_broadcastPipe_page'
	_demand_broadcastPipe_page
	
	_messagePlain_nominal '_page_socket_tcp_server: socat'
	#socat TCP-LISTEN:6391,reuseaddr,pf=ip4,fork,bind=127.0.0.1 EXEC:"$scriptAbsoluteLocation"' '"_page_converse"
	#socat TCP-LISTEN:6391,reuseaddr,pf=ip4,fork,bind=127.0.0.1 SYSTEM:'echo $HOME; ls -la'
	#socat TCP-LISTEN:6391,reuseaddr,pf=ip4,fork,bind=127.0.0.1 SYSTEM:\'\""$scriptAbsoluteLocation"\"\'' _page_converse'
	socat TCP-LISTEN:6391,reuseaddr,pf=ip4,fork,bind=127.0.0.1 EXEC:\'\""$scriptAbsoluteLocation"\"\'' _page_converse'
	
	#_messagePlain_nominal '_page_socket_tcp_server: _terminate_broadcastPipe_page'
	#_terminate_broadcastPipe_page
}

_page_socket_tcp_client() {
	socat TCP:localhost:6391 -
}









# ATTENTION: Override with 'ops' or similar.
# Lock (if at all) the socket, not the buffers.
# Ports 6391 or alternatively 24671 preferred for one-per-machine IPC service with high-latency no-reset (ie. 'tripleBuffer' ) backend.
# Consider the limited availability of TCP/UDP port numbers not occupied by some other known purpose.
# TCP server intended for compatibility with platforms (ie. MSW/Cygwin) which may not have sufficient performance or flexibility to read/write (ie. 'tripleBuffer' ) backend directly.
# 'UNIX domain socket' server not specifically intended for any known purpose and not necessarily recommended for any purpose.
# https://blog.travismclarke.com/post/socat-tutorial/
# https://fub2.github.io/powerful-socat/
# https://jdimpson.livejournal.com/tag/socat
# https://stackoverflow.com/questions/57299019/make-socat-open-port-only-on-localhost-interface
# https://en.wikipedia.org/wiki/Unix_domain_socket
_page_socket_unix_server() {
	_messagePlain_nominal '_page_socket_unix_server: _init'
	
	local current_unixAddress
	current_unixAddress=$(_demand_socket_broadcastPipe_page_unixAddress)
	
	export current_broadcastPipe_address="$current_unixAddress"
	export current_broadcastPipe_dir=$(dirname "$current_unixAddress" 2> /dev/null)
	[[ ! -e "$current_broadcastPipe_dir" ]] && return 1
	[[ ! -d "$current_broadcastPipe_dir" ]] && return 1
	_stop_queue_page() {
		rm -f "$current_broadcastPipe_address" > /dev/null 2>&1
		#rmdir "$current_broadcastPipe_dir" > /dev/null 2>&1
		#_sleep_spinlock
		rm -f "$current_broadcastPipe_address" > /dev/null 2>&1
		rmdir "$current_broadcastPipe_dir" > /dev/null 2>&1
		_rm_socket_broadcastPipe_page_unixAddress
	}
	
	
	_messagePlain_nominal '_page_socket_unix_server: _demand_broadcastPipe_page'
	_demand_broadcastPipe_page
	
	_messagePlain_nominal '_page_socket_unix_server: socat'
	#socat TCP-LISTEN:6391,reuseaddr,pf=ip4,fork,bind=127.0.0.1 EXEC:"$scriptAbsoluteLocation"' '"_page_converse"
	#socat TCP-LISTEN:6391,reuseaddr,pf=ip4,fork,bind=127.0.0.1 SYSTEM:'echo $HOME; ls -la'
	#socat TCP-LISTEN:6391,reuseaddr,pf=ip4,fork,bind=127.0.0.1 SYSTEM:\'\""$scriptAbsoluteLocation"\"\'' _page_converse'
	#socat TCP-LISTEN:6391,reuseaddr,pf=ip4,fork,bind=127.0.0.1 EXEC:\'\""$scriptAbsoluteLocation"\"\'' _page_converse'
	
	socat UNIX-LISTEN:"$current_broadcastPipe_dir"/unix.sock,fork EXEC:\'\""$scriptAbsoluteLocation"\"\'' _page_converse'
	
	
	#_messagePlain_nominal '_page_socket_unix_server: _terminate_broadcastPipe_page'
	#_terminate_broadcastPipe_page
	
	return 0
}

_page_socket_unix_client() {
	local current_unixAddress
	current_unixAddress=$(_demand_socket_broadcastPipe_page_unixAddress)
	
	#socat TCP:localhost:6391 -
	socat UNIX-CONNECT:"$current_unixAddress" -
	
	return 0
}










# ATTENTION: Override with 'ops' or similar.
# Lock (if at all) the socket, not the buffers.
# Ports 6392 or alternatively 24672 preferred for one-per-machine IPC service with low-latency frequent-reset (ie. 'aggregatorStatic' ) backend.
# Consider the limited availability of TCP/UDP port numbers not occupied by some other known purpose.
# TCP server intended for compatibility with platforms (ie. MSW/Cygwin) which may not have sufficient performance or flexibility to frequent-reset (ie. 'aggregatorStatic' ) backend directly.
# https://blog.travismclarke.com/post/socat-tutorial/
# https://fub2.github.io/powerful-socat/
# https://jdimpson.livejournal.com/tag/socat
# https://stackoverflow.com/questions/57299019/make-socat-open-port-only-on-localhost-interface
_aggregatorStatic_socket_tcp_server() {
	_messagePlain_nominal '_aggregatorStatic_socket_tcp_server: init: _demand_broadcastPipe_aggregatorStatic'
	_demand_broadcastPipe_aggregatorStatic
	
	_messagePlain_nominal '_aggregatorStatic_socket_tcp_server: socat'
	socat TCP-LISTEN:6392,reuseaddr,pf=ip4,fork,bind=127.0.0.1 EXEC:\'\""$scriptAbsoluteLocation"\"\'' _aggregatorStatic_converse'
	
	#_messagePlain_nominal '_aggregatorStatic_socket_tcp_server: _terminate_broadcastPipe_aggregatorStatic'
	#_terminate_broadcastPipe_aggregatorStatic
}

_aggregatorStatic_socket_tcp_client() {
	socat TCP:localhost:6392 -
}









# ATTENTION: Override with 'ops' or similar.
# Lock (if at all) the socket, not the buffers.
# Ports 6392 or alternatively 24672 preferred for one-per-machine IPC service with low-latency frequent-reset (ie. 'aggregatorStatic' ) backend.
# Consider the limited availability of TCP/UDP port numbers not occupied by some other known purpose.
# TCP server intended for compatibility with platforms (ie. MSW/Cygwin) which may not have sufficient performance or flexibility to frequent-reset (ie. # 'UNIX domain socket' server not specifically intended for any known purpose and not necessarily recommended for any purpose.
# https://blog.travismclarke.com/post/socat-tutorial/
# https://fub2.github.io/powerful-socat/
# https://jdimpson.livejournal.com/tag/socat
# https://stackoverflow.com/questions/57299019/make-socat-open-port-only-on-localhost-interface
# https://en.wikipedia.org/wiki/Unix_domain_socket
_aggregatorStatic_socket_unix_server() {
	_messagePlain_nominal '_aggregatorStatic_socket_unix_server: _init'
	
	local current_unixAddress
	current_unixAddress=$(_demand_socket_broadcastPipe_aggregatorStatic_unixAddress)
	
	export current_broadcastPipe_address="$current_unixAddress"
	export current_broadcastPipe_dir=$(dirname "$current_unixAddress" 2> /dev/null)
	[[ ! -e "$current_broadcastPipe_dir" ]] && return 1
	[[ ! -d "$current_broadcastPipe_dir" ]] && return 1
	_stop_queue_aggregatorStatic() {
		rm -f "$current_broadcastPipe_address" > /dev/null 2>&1
		#rmdir "$current_broadcastPipe_dir" > /dev/null 2>&1
		#_sleep_spinlock
		rm -f "$current_broadcastPipe_address" > /dev/null 2>&1
		rmdir "$current_broadcastPipe_dir" > /dev/null 2>&1
		_rm_socket_broadcastPipe_aggregatorStatic_unixAddress
	}
	
	
	_messagePlain_nominal '_aggregatorStatic_socket_unix_server: _demand_broadcastPipe_aggregatorStatic'
	_demand_broadcastPipe_aggregatorStatic
	
	_messagePlain_nominal '_aggregatorStatic_socket_unix_server: socat'
	socat UNIX-LISTEN:"$current_broadcastPipe_dir"/unix.sock,fork EXEC:\'\""$scriptAbsoluteLocation"\"\'' _aggregatorStatic_converse'
	
	
	#_messagePlain_nominal '_aggregatorStatic_socket_unix_server: _terminate_broadcastPipe_aggregatorStatic'
	#_terminate_broadcastPipe_aggregatorStatic
	
	return 0
}

_aggregatorStatic_socket_unix_client() {
	local current_unixAddress
	current_unixAddress=$(_demand_socket_broadcastPipe_aggregatorStatic_unixAddress)
	
	socat UNIX-CONNECT:"$current_unixAddress" -
	
	return 0
}











# Create Read Update Delete
# "$scriptLocal"/ops-ubdb.sh

# Reads a file or directory.
# Writes a file.


_db_list_var() {
	( set -o posix ; set )
	return
	
	#if type -p printenv > /dev/null 2>&1
	#then
		#printenv "$@"
		#return
	#elif type -p env > /dev/null 2>&1
	#then
		#env "$@"
		#return
	#fi
	#return 1
}

_db_filter_characters() {
	tr -d '(){}<>$:;&|#?!@%^*,`\t\\'
}

# "$1" == grepPattern
_db_filter_identifier() {
	grep '^ubdb_'"$ubiquitousBashID"'_'"$1" | _db_filter_characters
}

_db_reinit() {
	# https://stackoverflow.com/questions/13823706/capture-multiline-output-as-array-in-bash
	local currentVarList
	currentVarList=($(_db_list_var | cut -f1 -d\= | _db_filter_identifier "$1"))
	
	#local currentLine
	#_db_list_var | cut -f1 -d\= | _db_filter_identifier "$1" | while IFS='' read -r currentLine || [[ -n "$currentLine" ]]; do
		#_messagePlain_probe_var "$currentLine"
		
		
		#_messagePlain_probe_cmd declare -x -g "$currentLine"=''
		
		#eval export "$currentLine"=''
		#eval unset "$currentLine"
		
		#_messagePlain_probe_var "$currentLine"
		
		
		
		
	#done | _db_filter_characters
	
	currentVarList+=("$currentLine")
	for currentLine in "${currentVarList[@]}"
	do
		if ! [[ "$currentLine" == "" ]] && ! [[ "$currentLine" == "\$" ]]
		then
			#_messagePlain_probe "$currentLine"
			
			#_messagePlain_probe_var "$currentLine"
			
			declare -x -g "$currentLine"=''
			eval export "$currentLine"=''
			eval unset "$currentLine"
			
			#_messagePlain_probe_var "$currentLine"
		fi
	done
	
}


# Internal use intended - called by '_db_write' .
_demand_db() {
	local current_db="$scriptLocal"/ops-db.sh
	[[ "$ub_db_file" != "" ]] && current_db="$ub_db_file"
	
	! [[ -e "$current_db" ]] && echo -e -n '' >> "$current_db"
	
	# NOT VALID. Create directories (and files within) directly using mkdir/echo .
	[[ -d "$current_db" ]] && return 1
	
	
	
	! [[ -e "$current_db" ]] && return 1
	return 0
}




_db_importSource() {
	# https://stackoverflow.com/questions/28783509/override-a-builtin-command-with-an-alias
	
	declare() {
		builtin declare -g "$@"
	}
	
	
	# https://unix.stackexchange.com/questions/160256/can-you-source-a-here-document
	source <( cat "$1" | _db_filter_characters )
	#. "$1"
	
	unset -f declare > /dev/null 2>&1
	
	return 0
}




_db_source() {
	local current_db="$scriptLocal"/ops-db.sh
	[[ "$ub_db_file" != "" ]] && current_db="$ub_db_file"
	! [[ -e "$current_db" ]] && return 1
	
	if [[ -d "$current_db" ]]
	then
		# Not yet implemented.
		return 1
	else
		_db_importSource "$current_db"
	fi
}

# "$1" == grepPattern
# "$ub_db_file"
_db_enumerate() {
	local currentLine
	#local processedLine
	#local currentVarName
	#local processedVarName
	
	local currentLineValue
	
	_db_list_var | cut -f1 -d\= | _db_filter_identifier "$1" | while IFS='' read -r currentLine || [[ -n "$currentLine" ]]; do
		currentLineValue=$(eval _safeEcho "\$"$currentLine"")
		[[ "$currentLineValue" == "" ]] && continue
		
		#processedLine=$(declare -p "$currentLine")
		
		# ATTENTION: OPTIONAL - always export variables (recommended)
		# 'declare -x' apparently causes value of variable to be dropped
		export "$currentLine"
		#declare -x "$currentLine"
		
		declare -p "$currentLine"
	done | _db_filter_characters
}





_db_read() {
	_db_reinit
	_db_source
	#_db_enumerate ""
}


_db_show() {
	_db_read
	_db_enumerate "$1"
}



_db_write_sequence() {
	_start
	
	local current_db="$scriptLocal"/ops-db.sh
	[[ "$ub_db_file" != "" ]] && current_db="$ub_db_file"
	#! [[ -e "$current_db" ]] && return 1
	
	# INVALID.
	[[ -d "$current_db" ]] && return 1
	
	
	local currentEmptyUID=$(_uid)
	
	echo -e -n '' >> "$current_db"."$currentEmptyUID"
	if ! _moveconfirm "$current_db"."$currentEmptyUID" "$current_db".lock
	then
		! rm "$current_db"."$currentEmptyUID" > /dev/null 2>&1 && _stop 255
		rm -f "$current_db"."$currentEmptyUID" > /dev/null 2>&1
		_stop 1
	fi
	
	# Read in a list of variables.
	_demand_db
	_db_read
	_db_importSource "$1"
	
	_db_enumerate | cat - > "$safeTmp"/db_input_replacement_tmp
	
	! _moveconfirm "$current_db" "$current_db".obsolete && _stop 1
	! _moveconfirm "$safeTmp"/db_input_replacement_tmp "$current_db" && _stop 1
	! rm "$current_db".obsolete && _stop 255
	! rm "$current_db".lock > /dev/null 2>&1 && _stop 255
	
	_stop 0
}


# "$1" == db_input_file (recommended: "$safeTmp"/db_input )
_db_write() {
	# More than 50 repeats/recursions is extremely unreasonable under expected loads.
	[[ "$ub_db_write_currentRecursive" -gt 50 ]] && return 1
	[[ "$ub_db_write_currentRecursive" == "" ]] && export ub_db_write_currentRecursive='0'
	
	
	if ! "$scriptAbsoluteLocation" _db_write_sequence "$1"
	then
		let ub_db_write_currentRecursive="$ub_db_write_currentRecursive"+1
		local currentDelay
		local currentDelayTenths
		let currentDelay="$RANDOM"%3
		let currentDelayTenths="$RANDOM"%10
		#echo "$currentDelay"."$currentDelayTenths"
		sleep "$currentDelay"."$currentDelayTenths"
		
		_db_write "$@"
		
		return 0
	fi
	
	return 0
}


_db_rm() {
	local current_db="$scriptLocal"/ops-db.sh
	[[ "$ub_db_file" != "" ]] && current_db="$ub_db_file"
	! [[ -e "$current_db" ]] && return 1
	
	if [[ -d "$current_db" ]]
	then
		# NOT VALID. Remove directories (and files within) directly using rmdir/_safeRMR/rm .
		return 1
	else
		rm -f "$current_db" > /dev/null 2>&1
		[[ -e "$current_db" ]] && return 1
		return 0
	fi
	return 1
}









_interactive_pipe_procedure() {
	[[ ! -e "$1" ]] && return 1
	[[ ! -d "$1" ]] && return 1
	
	local currentExitStatus=1
	
	_aggregator_fifo "$1"/p0
	_aggregator_fifo "$1"/p1
	_aggregator_fifo "$1"/p2
	
	
	bash -s -l -i 0<"$1"/p0 1>"$1"/p1 2>"$1"/p2
	currentExitStatus="$?"
	
	
	rm -f "$1"/p0 > /dev/null 2>&1
	rm -f "$1"/p1 > /dev/null 2>&1
	rm -f "$1"/p2 > /dev/null 2>&1
	rmdir "$1" > /dev/null 2>&1
	
	return "$currentExitStatus"
}

_interactive_pipe_sequence() {
	local currentPipeUID=$(_uid)
	[[ "$ub_force_interactive_pipe_id" != "" ]] && currentPipeUID="$ub_force_interactive_pipe_id"
	local currentPipeDir="$safeTmp"/interactive_pipe_"$currentPipeUID"
	#[[ "$ub_force_interactive_pipe_id" != "" ]] && currentPipeDir="$currentSub_safeTmp"/interactive_pipe_"$currentPipeUID"
	_safeEcho_newline "$currentPipeDir"
	
	_start
	
	[[ ! -e "$safeTmp" ]] && return 1
	[[ ! -d "$safeTmp" ]] && return 1
	mkdir -p "$currentPipeDir"
	[[ ! -e "$currentPipeDir" ]] && return 1
	[[ ! -d "$currentPipeDir" ]] && return 1
	
	_interactive_pipe_procedure "$currentPipeDir"
	
	_stop
}

# CAUTION: Requires calling 'sequence' not to run "_stop" until terminal is no longer needed.
# WARNING: Untested.
_demand_interactive_pipe_procedure() {
	true | "$scriptAbsoluteLocation" --devenv _interactive_pipe_sequence "$currentPipeDir" &
	
	disown -h "$!"
	
	sleep 7
}

# Intended to allow lower-latency access to internal commands, as well as their responses, such as through a 'physical' 'terminal emulator' . Especially including access to other 'queue' InterProcess-Communication procedures, and to procedures which communicate through such a bus.
# In practice, this approach has limitations.
# An error message will be displayed if the pipes are connected to after the 'parent' process has exited .
# Keyboard interactive programs (eg. vim) are unusable.
# Much 'noise' is present, likely requiring specialized text parsing of commands and responses, as would be expected of a more elaborate protocol.
_demand_interactive_pipe() {
	true | "$scriptAbsoluteLocation" _interactive_pipe_sequence &
	
	disown -h "$!"
	
	sleep 7
}


# ./ubiquitous_bash.sh _interactive_client_pipe ./w_*/interactive_pipe_??????????????????
_interactive_client_pipe() {
	[[ ! -e "$1"/p0 ]] && return 1
	[[ ! -e "$1"/p1 ]] && return 1
	#[[ ! -e "$1"/p2 ]] && return 1
	cat "$1"/p1 & [[ -e "$1"/p2 ]] && cat "$1"/p2 >&2 & cat > "$1"/p0
}


_interactive_pipe_konsole() {
	# Force 'known' sessionid and safeTmp of next "$scriptAbsoluteLocation" .
	export ub_force_sessionid=$(_uid)
	export ub_force_interactive_pipe_id=$(_uid)
	local currentSub_safeTmp=$(
		export sessionid="$ub_force_sessionid"
		_get_ub_globalVars_sessionDerived
		_safeEcho "$safeTmp"
	)
	
	local currentPipeUID=$(_uid)
	[[ "$ub_force_interactive_pipe_id" != "" ]] && currentPipeUID="$ub_force_interactive_pipe_id"
	local currentPipeDir="$safeTmp"/interactive_pipe_"$currentPipeUID"
	[[ "$ub_force_interactive_pipe_id" != "" ]] && currentPipeDir="$currentSub_safeTmp"/interactive_pipe_"$currentPipeUID"
	_safeEcho_newline "$currentPipeDir" > /dev/null 2>&1
	
	
	# demand ...
	_demand_interactive_pipe > /dev/null 2>&1
	
	
	# Connect to known pipe location.
	set +m
	konsole -e "$scriptAbsoluteLocation" _interactive_client_pipe "$currentPipeDir" > /dev/null 2>&1
	#sleep 7
	set -m
}








# TODO: An implementation using 'tmux' or 'GNU Screen' may be more capable.


_test_interactive_tmux() {
	_getDep tmux
}

_test_interactive_screen() {
	_getDep screen
}











#####Local Environment Management (Resources)

#_prepare_prog() {
#	true
#}

_extra() {
	true
}

_prepare_abstract() {
	! mkdir -p "$abstractfs_root" && exit 1
	chmod 0700 "$abstractfs_root" > /dev/null 2>&1
	! chmod 700 "$abstractfs_root" && exit 1
	
	if _if_cygwin
	then
		if ! chown "$USER":None "$abstractfs_root" > /dev/null 2>&1
		then
			! chown "$USER" "$abstractfs_root" && exit 1
		fi
	else
		if ! chown "$USER":"$USER" "$abstractfs_root" > /dev/null 2>&1
		then
			! /sbin/chown "$USER" "$abstractfs_root" && exit 1
		fi
	fi
	
	
	
	
	! mkdir -p "$abstractfs_lock" && exit 1
	chmod 0700 "$abstractfs_lock" > /dev/null 2>&1
	! chmod 700 "$abstractfs_lock" && exit 1
	
	if _if_cygwin
	then
		if ! chown "$USER":None "$abstractfs_lock" > /dev/null 2>&1
		then
			! chown "$USER" "$abstractfs_lock" && exit 1
		fi
	else
		if ! chown "$USER":"$USER" "$abstractfs_lock" > /dev/null 2>&1
		then
			! /sbin/chown "$USER" "$abstractfs_lock" && exit 1
		fi
	fi
}

_prepare() {
	
	! mkdir -p "$safeTmp" && exit 1
	
	! mkdir -p "$shortTmp" && exit 1
	
	! mkdir -p "$logTmp" && exit 1
	
	[[ "$*" != *scriptLocal_mkdir_disable* ]] && ! mkdir -p "$scriptLocal" && exit 1
	
	! mkdir -p "$bootTmp" && exit 1
	
	# WARNING: No production use. Not guaranteed to be machine readable.
	[[ "$tmpSelf" != "$scriptAbsoluteFolder" ]] && echo "$tmpSelf" 2> /dev/null > "$scriptAbsoluteFolder"/__d_$(echo "$sessionid" | head -c 16)
	
	#_prepare_abstract
	
	_extra
	_tryExec "_prepare_prog"
}

#####Local Environment Management (Instancing)

#_start_prog() {
#	true
#}

# ATTENTION: Consider carefully, override with "ops".
# WARNING: Unfortunate, but apparently necessary, workaround for script termintaing while "sleep" or similar run under background.
_start_stty_echo() {
	#true
	
	#stty echo --file=/dev/tty > /dev/null 2>&1
	
	export ubFoundEchoStatus=$(stty --file=/dev/tty -g 2>/dev/null)
}

_start() {
	_start_stty_echo
	
	_prepare "$@"
	
	#touch "$varStore"
	#. "$varStore"
	
	echo $$ > "$safeTmp"/.pid
	echo "$sessionid" > "$safeTmp"/.sessionid
	_embed_here > "$safeTmp"/.embed.sh
	chmod 755 "$safeTmp"/.embed.sh
	
	_tryExec "_start_prog"
}

#_saveVar_prog() {
#	true
#}

_saveVar() {
	true
	#declare -p varName > "$varStore"
	
	_tryExec "_saveVar_prog"
}

#_stop_prog() {
#	true
#}

# ATTENTION: Consider carefully, override with "ops".
# WARNING: Unfortunate, but apparently necessary, workaround for script termintaing while "sleep" or similar run under background.
_stop_stty_echo() {
	#true
	
	#stty echo --file=/dev/tty > /dev/null 2>&1
	
	[[ "$ubFoundEchoStatus" != "" ]] && stty --file=/dev/tty "$ubFoundEchoStatus" 2> /dev/null
}

# DANGER: Use of "_stop" must NOT require successful "_start". Do NOT include actions which would not be safe if "_start" was not used or unsuccessful.
_stop() {
	_stop_stty_echo
	
	_tryExec "_stop_prog"
	
	_tryExec "_stop_queue_page"
	_tryExec "_stop_queue_aggregatorStatic"
	
	_preserveLog
	
	#Kill process responsible for initiating session. Not expected to be used normally, but an important fallback.
	local ub_stop_pid
	if [[ -e "$safeTmp"/.pid ]]
	then
		ub_stop_pid=$(cat "$safeTmp"/.pid 2> /dev/null)
		if [[ $$ != "$ub_stop_pid" ]]
		then
			pkill -P "$ub_stop_pid" > /dev/null 2>&1
			kill "$ub_stop_pid" > /dev/null 2>&1
		fi
	fi
	#Redundant, as this usually resides in "$safeTmp".
	rm -f "$pidFile" > /dev/null 2>&1
	
	
	# https://stackoverflow.com/questions/25906020/are-pid-files-still-flawed-when-doing-it-right/25933330
	# https://stackoverflow.com/questions/360201/how-do-i-kill-background-processes-jobs-when-my-shell-script-exits
	local currentStopJobs
	currentStopJobs=$(jobs -p -r 2> /dev/null)
	# WARNING: Although usually bad practice, it is useful for the spaces between PIDs to be interpreted in this case.
	# DANGER: Apparently, it is possible for some not running background jobs to be included in the PID list.
	[[ "$currentStopJobs" != "" ]] && kill $currentStopJobs > /dev/null 2>&1
	
	
	if [[ -e "$scopeTmp" ]] && [[ -e "$scopeTmp"/.pid ]] && [[ "$$" == $(cat "$scopeTmp"/.pid 2>/dev/null) ]]
	then
		#Symlink, or nonexistent.
		rm -f "$ub_scope" > /dev/null 2>&1
		#Only created if needed by scope.
		[[ -e "$scopeTmp" ]] && _safeRMR "$scopeTmp"
	fi
	
	#Only created if needed by query.
	[[ -e "$queryTmp" ]] && _safeRMR "$queryTmp"
	
	#Only created if needed by engine.
	[[ -e "$engineTmp" ]] && _safeRMR "$engineTmp"
	
	_tryExec _rm_instance_metaengine
	_tryExec _rm_instance_channel
	
	_safeRMR "$shortTmp"
	_safeRMR "$safeTmp"
	
	[[ -e "$safeTmp" ]] && sleep 0.1 && _safeRMR "$safeTmp"
	[[ -e "$safeTmp" ]] && sleep 0.3 && _safeRMR "$safeTmp"
	[[ -e "$safeTmp" ]] && sleep 1 && _safeRMR "$safeTmp"
	[[ -e "$safeTmp" ]] && sleep 3 && _safeRMR "$safeTmp"
	[[ -e "$safeTmp" ]] && sleep 3 && _safeRMR "$safeTmp"
	[[ -e "$safeTmp" ]] && sleep 3 && _safeRMR "$safeTmp"
	
	_tryExec _rm_instance_fakeHome
	
	#Optionally always try to remove any systemd shutdown hook.
	#_tryExec _unhook_systemd_shutdown
	
	[[ "$tmpSelf" != "$scriptAbsoluteFolder" ]] && [[ "$tmpSelf" != "/" ]] && [[ -e "$tmpSelf" ]] && rmdir "$tmpSelf" > /dev/null 2>&1
	rm -f "$scriptAbsoluteFolder"/__d_$(echo "$sessionid" | head -c 16) > /dev/null 2>&1
	
	_stop_stty_echo
	if [[ "$1" != "" ]]
	then
		exit "$1"
	else
		exit 0
	fi
}

#Do not overload this unless you know why you need it instead of _stop_prog.
#_stop_emergency_prog() {
#	true
#}

#Called upon SIGTERM or similar signal.
_stop_emergency() {
	[[ "$noEmergency" == true ]] && _stop "$1"
	
	export EMERGENCYSHUTDOWN=true
	
	#Not yet using _tryExec since this function would typically result from user intervention, or system shutdown, both emergency situations in which an error message would be ignored if not useful. Higher priority is guaranteeing execution if needed and available.
	_tryExec "_closeChRoot_emergency"
	
	#Daemon uses a separate instance, and will not be affected by previous actions, possibly even if running in the foreground.
	#jobs -p >> "$daemonPidFile" #Could derrange the correct order of descendent job termination.
	_tryExec _killDaemon
	
	_tryExec _stop_virtLocal
	
	_tryExec "_stop_emergency_prog"
	
	_stop "$1"
	
}

_waitFile() {
	
	[[ -e "$1" ]] && sleep 1
	[[ -e "$1" ]] && sleep 9
	[[ -e "$1" ]] && sleep 27
	[[ -e "$1" ]] && sleep 81
	[[ -e "$1" ]] && _return 1
	
	return 0
}

#Wrapper. If lock file is present, waits for unlocking operation to complete successfully, then reports status.
#"$1" == checkFile
#"$@" == wait command and parameters
_waitFileCommands() {
	local waitCheckFile
	waitCheckFile="$1"
	shift
	
	if [[ -e "$waitCheckFile" ]]
	then
		local waitFileCommandStatus
		
		"$@"
		
		waitFileCommandStatus="$?"
		
		if [[ "$waitFileCommandStatus" != "0" ]]
		then
			return "$waitFileCommandStatus"
		fi
		
		[[ -e "$waitCheckFile" ]] && return 1
		
	fi
	
	return 0
}

#$1 == command to execute if scriptLocal path has changed, typically remove another lock file
_pathLocked() {
	[[ ! -e "$lock_pathlock" ]] && echo "k3riC28hQRLnjgkwjI" > "$lock_pathlock"
	[[ ! -e "$lock_pathlock" ]] && return 1
	
	local lockedPath
	lockedPath=$(cat "$lock_pathlock")
	
	if [[ "$lockedPath" != "$scriptLocal" ]]
	then
		rm -f "$lock_pathlock" > /dev/null 2>&1
		[[ -e "$lock_pathlock" ]] && return 1
		
		echo "$scriptLocal" > "$lock_pathlock"
		[[ ! -e "$lock_pathlock" ]] && return 1
		
		if [[ "$1" != "" ]]
		then
			"$@"
			[[ "$?" != "0" ]] && return 1
		fi
		
	fi
	
	return 0
}

_readLocked() {
	mkdir -p "$bootTmp"
	
	local rebootToken
	rebootToken=$(cat "$1" 2> /dev/null)
	
	#Remove miscellaneous files if appropriate.
	if [[ -d "$bootTmp" ]] && ! [[ -e "$bootTmp"/"$rebootToken" ]]
	then
		rm -f "$scriptLocal"/*.log && rm -f "$scriptLocal"/imagedev && rm -f "$scriptLocal"/WARNING
		
		[[ -e "$lock_quicktmp" ]] && sleep 0.1 && [[ -e "$lock_quicktmp" ]] && rm -f "$lock_quicktmp"
	fi
	
	! [[ -e "$1" ]] && return 1
	##Lock file exists.
	
	if [[ -d "$bootTmp" ]]
	then
		if ! [[ -e "$bootTmp"/"$rebootToken" ]]
		then
			##Lock file obsolete.
			
			#Remove old lock.
			rm -f "$1" > /dev/null 2>&1
			return 1
		fi
		
		##Lock file and token exists.
		return 0
	fi
	
	##Lock file exists, token cannot be found.
	return 0
	
	
	
}

#Using _readLocked before any _createLocked operation is strongly recommended to remove any lock from prior UNIX session (ie. before latest reboot).
_createLocked() {
	[[ "$uDEBUG" == true ]] && caller 0 >> "$scriptLocal"/lock.log
	[[ "$uDEBUG" == true ]] && echo -e '\t'"$sessionid"'\t'"$1" >> "$scriptLocal"/lock.log
	
	mkdir -p "$bootTmp"
	
	! [[ -e "$bootTmp"/"$sessionid" ]] && echo > "$bootTmp"/"$sessionid"
	
	# WARNING Recommend setting this to a permanent value when testing critical subsystems, such as with _userChRoot related operations.
	local lockUID="$(_uid)"
	
	echo "$sessionid" > "$lock_quicktmp"_"$lockUID"
	
	mv -n "$lock_quicktmp"_"$lockUID" "$1" > /dev/null 2>&1
	
	if [[ -e "$lock_quicktmp"_"$lockUID" ]]
	then
		[[ "$uDEBUG" == true ]] && echo -e '\t'FAIL >> "$scriptLocal"/lock.log
		rm -f "$lock_quicktmp"_"$lockUID" > /dev/null 2>&1
		return 1
	fi
	
	rm -f "$lock_quicktmp"_"$lockUID" > /dev/null 2>&1
	return 0
}

_resetLocks() {
	
	_readLocked "$lock_open"
	_readLocked "$lock_opening"
	_readLocked "$lock_closed"
	_readLocked "$lock_closing"
	_readLocked "$lock_instance"
	_readLocked "$lock_instancing"
	
}

_checkSpecialLocks() {
	local localSpecialLock
	
	localSpecialLock="$specialLock"
	[[ "$1" != "" ]] && localSpecialLock="$1"
	
	local currentLock
	
	for currentLock in "${specialLocks[@]}"
	do
		[[ "$currentLock" == "$localSpecialLock" ]] && continue
		_readLocked "$currentLock" && return 0
	done
	
	return 1
}

#Wrapper. Operates lock file for mounting shared resources (eg. persistent virtual machine image). Avoid if possible.
#"$1" == waitOpen function && shift
#"$@" == wrapped function and parameters
#"$specialLock" == additional lockfile to write
_open_sequence() {
	if _readLocked "$lock_open"
	then
		_checkSpecialLocks && return 1
		return 0
	fi
	
	_readLocked "$lock_closing" && return 1
	
	if _readLocked "$lock_opening"
	then
		if _waitFileCommands "$lock_opening" "$1"
		then
			_readLocked "$lock_open" || return 1
			return 0
		else
			return 1
		fi
	fi
	
	_createLocked "$lock_opening" || return 1
	
	shift
	
	echo "LOCKED" > "$scriptLocal"/WARNING
	
	"$@"
	
	if [[ "$?" == "0" ]]
	then
		_createLocked "$lock_open" || return 1
		
		if [[ "$specialLock" != "" ]]
		then
			_createLocked "$specialLock" || return 1
		fi
		
		rm -f "$lock_opening"
		return 0
	fi
	
	return 1
}

_open() {
	local returnStatus
	
	_open_sequence "$@"
	returnStatus="$?"
	
	export specialLock
	specialLock=""
	export specialLock
	
	return "$returnStatus"
}

#Wrapper. Operates lock file for shared resources (eg. persistent virtual machine image). Avoid if possible.
#"$1" == <"--force"> && shift
#"$1" == waitClose function && shift
#"$@" == wrapped function and parameters
#"$specialLock" == additional lockfile to remove
_close_sequence() {
	local closeForceEnable
	closeForceEnable=false
	
	if [[ "$1" == "--force" ]]
	then
		closeForceEnable=true
		shift
	fi
	
	if ! _readLocked "$lock_open" && [[ "$closeForceEnable" != "true" ]]
	then
		return 0
	fi
	
	if [[ "$specialLock" != "" ]] && [[ -e "$specialLock" ]] && ! _readLocked "$specialLock" && [[ "$closeForceEnable" != "true" ]]
	then
		return 1
	fi
	
	_checkSpecialLocks && return 1
	
	if _readLocked "$lock_closing" && [[ "$closeForceEnable" != "true" ]]
	then
		if _waitFileCommands "$lock_closing" "$1"
		then
			return 0
		else
			return 1
		fi
	fi
	
	if [[ "$closeForceEnable" != "true" ]]
	then
		_createLocked "$lock_closing" || return 1
	fi
	! _readLocked "$lock_closing" && _createLocked "$lock_closing"
	
	shift
	
	"$@"
	
	if [[ "$?" == "0" ]]
	then
		#rm -f "$lock_open" || return 1
		rm -f "$lock_open"
		[[ -e "$lock_open" ]] && return 1
		
		if [[ "$specialLock" != "" ]] && [[ -e "$specialLock" ]]
		then
			#rm -f "$specialLock" || return 1
			rm -f "$specialLock"
			[[ -e "$specialLock" ]] && return 1
		fi
		
		rm -f "$lock_closing"
		rm -f "$scriptLocal"/WARNING
		return 0
	fi
	
	return 1
}

_close() {
	local returnStatus
	
	_close_sequence "$@"
	returnStatus="$?"
	
	export specialLock
	specialLock=""
	export specialLock
	
	return "$returnStatus"
}

#"$1" == variable name to preserve
#shift
#"$1" == variable data to preserve
#shift
#"$@" == function to prepare other variables
_preserveVar() {
	local varNameToPreserve
	varNameToPreserve="$1"
	shift
	
	local varDataToPreserve
	varDataToPreserve="$1"
	shift
	
	"$@"
	
	[[ "$varNameToPreserve" == "" ]] && return
	[[ "$varDataToPreserve" == "" ]] && return
	
	export "$varNameToPreserve"="$varDataToPreserve"
	
	return
}


#####Installation

_installation_nonet_default() {
	if [[ "$nonet" != 'false' ]]
	then
		[[ "$scriptAbsoluteFolder" == /media/"$USER"* ]] && [[ -e /media/"$USER" ]] && export nonet='true'
		[[ "$scriptAbsoluteFolder" == /mnt/"$USER"* ]] && [[ -e /mnt/"$USER" ]] && export nonet='true'
		[[ "$scriptAbsoluteFolder" == /var/run/media/"$USER"* ]] && [[ -e /var/run/media/"$USER" ]] && export nonet='true'
		[[ "$scriptAbsoluteFolder" == /run/"$USER"* ]] && [[ -e /run/"$USER" ]] && currentParameter=/run/"$USER" && export nonet='true'
		[[ "$scriptAbsoluteFolder" == "/cygdrive"* ]] && [[ -e /cygdrive ]] && export nonet='true'
	fi
	
	return 0
}

_vector_line_cksum() {
	[[ $(echo test | env CMD_ENV=xpg4 cksum | cut -f1 -d\  | tr -dc '0-9') != '935282863' ]] && echo 'broken cksum' && _messageFAIL && _stop 1
	
	[[ $(echo -e '1\n2\n3\n4\n5\n6\n7\n8\n9\n0' | tail -n +2 | env CMD_ENV=xpg4 cksum | cut -f1 -d\  | tr -dc '0-9') != '2409981071' ]] && _messageFAIL && _stop 1
	[[ $(echo -e '1\n2\n3\n4\n5\n6\n7\n8\n9\n0' | tail -n +2 | wc -l | cut -f1 -d\  | tr -dc '0-9') != '9' ]] && _messageFAIL && _stop 1
	
	[[ $(echo -e '1\n2\n3\n4\n5\n6\n7\n8\n9\n0' | tail -n 2 | env CMD_ENV=xpg4 cksum | cut -f1 -d\  | tr -dc '0-9') != '763220757' ]] && _messageFAIL && _stop 1
	[[ $(echo -e '1\n2\n3\n4\n5\n6\n7\n8\n9\n0' | tail -n 2 | wc -l | cut -f1 -d\  | tr -dc '0-9') != '2' ]] && _messageFAIL && _stop 1
	
	[[ $(echo -e '1\n2\n3\n4\n5\n6\n7\n8\n9\n0' | head -n 2 | env CMD_ENV=xpg4 cksum | cut -f1 -d\  | tr -dc '0-9') != '1864731933' ]] && _messageFAIL && _stop 1
	[[ $(echo -e '1\n2\n3\n4\n5\n6\n7\n8\n9\n0' | head -n 2 | wc -l | cut -f1 -d\  | tr -dc '0-9') != '2' ]] && _messageFAIL && _stop 1
	
	[[ $(echo -e '1\n2\n3\n4\n5\n6\n7\n8\n9\n0' | head -n -2 | env CMD_ENV=xpg4 cksum | cut -f1 -d\  | tr -dc '0-9') != '3336706933' ]] && _messageFAIL && _stop 1
	[[ $(echo -e '1\n2\n3\n4\n5\n6\n7\n8\n9\n0' | head -n -2 | wc -l | cut -f1 -d\  | tr -dc '0-9') != '8' ]] && _messageFAIL && _stop 1
	
	return 0
}

_vector() {
	_tryExec "_vector_line_cksum"
	
	
	_tryExec "_vector_virtUser"
}




#Verifies the timeout and sleep commands work properly, with subsecond specifications.
_timetest() {
	local iterations
	local dateA
	local dateB
	local dateDelta
	
	local nsDateA
	local nsDateB
	local nsDateDelta
	
	iterations=0
	#while false && [[ "$iterations" -lt 3 ]]
	while [[ "$iterations" -lt 3 ]]
	do
		dateA=$(date +%s)
		nsDateA=$(date +%s%N)
		
		sleep 0.1
		sleep 0.1
		sleep 0.1
		sleep 0.1
		sleep 0.1
		sleep 0.1
		
		_timeout 0.1 sleep 10
		_timeout 0.1 sleep 10
		_timeout 0.1 sleep 10
		_timeout 0.1 sleep 10
		_timeout 0.1 sleep 10
		_timeout 0.1 sleep 10
		
		dateB=$(date +%s)
		nsDateB=$(date +%s%N)
		
		dateDelta=$(bc <<< "$dateB - $dateA")
		nsDateDelta=$(bc <<< "$nsDateB - $nsDateA")
		
		if [[ "$dateDelta" -lt "1" ]]
		then
			_messageFAIL
			_stop 1
		fi
		
		if [[ "$dateDelta" -gt "5" ]]
		then
			_messageFAIL
			_stop 1
		fi
		
		if [[ $(echo -e -n "$nsDateDelta" | wc -c) != '10' ]]
		then
			_messageFAIL
			_stop 1
		fi
		
		if [[ "$nsDateDelta" -lt '1000000000' ]]
		then
			_messageFAIL
			_stop 1
		fi
		
		if [[ $(echo -e -n "$nsDateDelta" | cut -b1-4) -lt 1000 ]]
		then
			_messageFAIL
			_stop 1
		fi
		
		if [[ $(echo -e -n "$nsDateDelta" | cut -b1-8) -gt '50000000' ]]
		then
			_messageFAIL
			_stop 1
		fi
		
		if [[ $(echo -e -n "$nsDateDelta" | cut -b1-4) -gt 5000 ]]
		then
			_messageFAIL
			_stop 1
		fi
		
		
		
		
		
		dateA=$(date +%s)
		nsDateA=$(date +%s%N)
		
		sleep 0.123
		sleep 0.123
		sleep 0.123
		sleep 0.123
		sleep 0.123
		sleep 0.123
		
		_timeout 0.123 sleep 10
		_timeout 0.123 sleep 10
		_timeout 0.123 sleep 10
		_timeout 0.123 sleep 10
		_timeout 0.123 sleep 10
		_timeout 0.123 sleep 10
		
		dateB=$(date +%s)
		nsDateB=$(date +%s%N)
		
		dateDelta=$(bc <<< "$dateB - $dateA")
		nsDateDelta=$(bc <<< "$nsDateB - $nsDateA")
		
		if [[ "$dateDelta" -lt "1" ]]
		then
			_messageFAIL
			_stop 1
		fi
		
		if [[ "$dateDelta" -gt "5" ]]
		then
			_messageFAIL
			_stop 1
		fi
		
		if [[ $(echo -e -n "$nsDateDelta" | wc -c) != '10' ]]
		then
			_messageFAIL
			_stop 1
		fi
		
		if [[ "$nsDateDelta" -lt '1000000000' ]]
		then
			_messageFAIL
			_stop 1
		fi
		
		if [[ $(echo -e -n "$nsDateDelta" | cut -b1-4) -lt 1000 ]]
		then
			_messageFAIL
			_stop 1
		fi
		
		if [[ $(echo -e -n "$nsDateDelta" | cut -b1-8) -gt '50000000' ]]
		then
			_messageFAIL
			_stop 1
		fi
		
		if [[ $(echo -e -n "$nsDateDelta" | cut -b1-4) -gt 5000 ]]
		then
			_messageFAIL
			_stop 1
		fi
		
		
		
		
		dateA=$(date +%s)
		nsDateA=$(date +%s%N)
		
		sleep .123
		sleep .123
		sleep .123
		sleep .123
		sleep .123
		sleep .123
		
		_timeout .123 sleep 10
		_timeout .123 sleep 10
		_timeout .123 sleep 10
		_timeout .123 sleep 10
		_timeout .123 sleep 10
		_timeout .123 sleep 10
		
		dateB=$(date +%s)
		nsDateB=$(date +%s%N)
		
		dateDelta=$(bc <<< "$dateB - $dateA")
		nsDateDelta=$(bc <<< "$nsDateB - $nsDateA")
		
		if [[ "$dateDelta" -lt "1" ]]
		then
			_messageFAIL
			_stop 1
		fi
		
		if [[ "$dateDelta" -gt "5" ]]
		then
			_messageFAIL
			_stop 1
		fi
		
		if [[ $(echo -e -n "$nsDateDelta" | wc -c) != '10' ]]
		then
			_messageFAIL
			_stop 1
		fi
		
		if [[ "$nsDateDelta" -lt '1000000000' ]]
		then
			_messageFAIL
			_stop 1
		fi
		
		if [[ $(echo -e -n "$nsDateDelta" | cut -b1-4) -lt 1000 ]]
		then
			_messageFAIL
			_stop 1
		fi
		
		if [[ $(echo -e -n "$nsDateDelta" | cut -b1-8) -gt '50000000' ]]
		then
			_messageFAIL
			_stop 1
		fi
		
		if [[ $(echo -e -n "$nsDateDelta" | cut -b1-4) -gt 5000 ]]
		then
			_messageFAIL
			_stop 1
		fi
		
		
		
		
		let iterations="$iterations + 1"
	done
	
	
	local nsDateC
	local nsDateD
	local nsDateDeltaA
	local nsDateDeltaB
	local msIterations
	
	if uname -a | grep -i 'cygwin' > /dev/null 2>&1
	then
		nsDateA=$(date +%s%N)
		for msIterations in {1..100}
		do
			sleep 0.011
		done
		nsDateB=$(date +%s%N)
		
		#nsDateC=$(date +%s%N)
		nsDateC="$nsDateB"
		for msIterations in {1..100}
		do
			sleep 0.091
		done
		nsDateD=$(date +%s%N)
		
		nsDateDeltaA=$(bc <<< "$nsDateB - $nsDateA")
		nsDateDeltaB=$(bc <<< "$nsDateD - $nsDateC")
		nsDateDelta=$(bc <<< "$nsDateDeltaB - $nsDateDeltaA")
		
		#echo "$nsDateDelta"
		
		
		
		if [[ $(echo -e -n "$nsDateDelta" | cut -b1-8) -lt '10000000' ]]
		then
			_messageFAIL
			_stop 1
		fi
		if [[ $(echo -e -n "$nsDateDelta" | cut -b1-8) -gt '640000000' ]]
		then
			_messageFAIL
			_stop 1
		fi
		
		if [[ $(echo -e -n "$nsDateDelta" | cut -b1-4) -lt '1000' ]]
		then
			_messageFAIL
			_stop 1
		fi
		if [[ $(echo -e -n "$nsDateDelta" | cut -b1-4) -gt '64000' ]]
		then
			_messageFAIL
			_stop 1
		fi
	else
		nsDateA=$(date +%s%N)
		for msIterations in {1..100}
		do
			sleep 0.001
		done
		nsDateB=$(date +%s%N)
		
		#nsDateC=$(date +%s%N)
		nsDateC="$nsDateB"
		for msIterations in {1..100}
		do
			sleep 0.009
		done
		nsDateD=$(date +%s%N)
		
		nsDateDeltaA=$(bc <<< "$nsDateB - $nsDateA")
		nsDateDeltaB=$(bc <<< "$nsDateD - $nsDateC")
		nsDateDelta=$(bc <<< "$nsDateDeltaB - $nsDateDeltaA")
		
		#echo "$nsDateDelta"
		
		
		
		if [[ $(echo -e -n "$nsDateDelta" | cut -b1-8) -lt '10000000' ]]
		then
			_messageFAIL
			_stop 1
		fi
		if [[ $(echo -e -n "$nsDateDelta" | cut -b1-8) -gt '640000000' ]]
		then
			_messageFAIL
			_stop 1
		fi
		
		if [[ $(echo -e -n "$nsDateDelta" | cut -b1-4) -lt '1000' ]]
		then
			_messageFAIL
			_stop 1
		fi
		if [[ $(echo -e -n "$nsDateDelta" | cut -b1-4) -gt '64000' ]]
		then
			_messageFAIL
			_stop 1
		fi
	fi
	
	
	
	
	_messagePASS
	return 0
}


_testarglength() {
	local testArgLength
	
	! testArgLength=$(getconf ARG_MAX) && _messageFAIL && _stop 1
	
	
	# Typical UNIX.
	if [[ "$testArgLength" -lt 131071 ]]
	then
		# Typical Cygwin. Marginal result at best.
		[[ "$testArgLength" -ge 32000 ]] && uname -a | grep -i 'cygwin' > /dev/null 2>&1 && _messagePASS && return 0
		
		_messageFAIL && _stop 1
	fi
	
	_messagePASS
}



_variableLocalTestA_procedure() {
	local currentLocalA
	currentLocalA='false'
	[[ "$currentGlobalA" != 'true' ]] && _stop 1
	[[ "$currentLocalA" == '' ]] && _stop 1
	[[ "$currentLocalA" != 'false' ]] && _stop 1
	
	local currentLocalB
	currentLocalB='true'
	
	currentNotLocalA='true'
	
	
	return 0
}

_variableLocalTestB_procedure() {
	[[ "$currentGlobalA" != 'true' ]] && return 1
	[[ "$currentLocalA" != '' ]] && return 1
	[[ "$currentLocalA" == 'true' ]] && return 1
	
	return 0
}

_variableLocalTestC_procedure() {
	[[ "$currentGlobalA" != '' ]] && _stop 1
	[[ "$currentGlobalA" == 'true' ]] && _stop 1
	
	return 0
}

_variableLocalTest_sequence() {
	_start scriptLocal_mkdir_disable
	
	variableLocalTest_currentSubFunction() {
		if ! [[ "$currentSubFunctionTest" == "true" ]] || ! [[ $(echo "$currentSubFunctionTest") == "true" ]]
		then
			_stop 1
			return 1
		fi
		return 0
	}
	local currentSubFunctionTest
	currentSubFunctionTest='true'
	! variableLocalTest_currentSubFunction && _stop 1
	
	
	local currentSubshellTest1=$(
		echo x
	)
	[[ "$currentSubshellTest1" != 'x' ]] && _stop 1
	
	local currentSubshellTest2
	currentSubshellTest2=$(
		echo x
	)
	[[ "$currentSubshellTest2" != 'x' ]] && _stop 1
	
	
	echo $(
		echo 1
		echo 2
	) | grep '1 2' > /dev/null || _stop 1
	
	! echo $(
		echo 1
		echo 2
	) | grep '1 2' > /dev/null && _stop 1
	
	
	export currentGlobalA='true'
	
	local currentLocalA
	currentLocalA='true'
	
	( export currentSubshellTestA='true' )
	[[ ! -z "$currentSubshellTestA" ]] && _stop 1
	[[ "$currentSubshellTestA" != "" ]] && _stop 1
	[[ "$currentSubshellTestA" != '' ]] && _stop 1
	[[ "$currentSubshellTestA" == 'true' ]] && _stop 1
	
	( currentSubshellTestB='true' )
	[[ "$currentSubshellTestB" != "" ]] && _stop 1
	[[ "$currentSubshellTestB" == 'true' ]] && _stop 1
	
	( local currentSubshellTestC='true' )
	[[ "$currentSubshellTestC" != "" ]] && _stop 1
	[[ "$currentSubshellTestC" == 'true' ]] && _stop 1
	
	! ( echo true ) | grep 'true' > /dev/null && _stop 1
	! ( echo "$currentGlobalA" ) | grep 'true' > /dev/null && _stop 1
	! ( echo "$currentLocalA" ) | grep 'true' > /dev/null && _stop 1
	( echo "$currentLocalB" ) | grep 'true' > /dev/null && _stop 1
	
	[[ "$currentLocalA" != 'true' ]] && _stop 1
	! _variableLocalTestA_procedure && _stop 1
	[[ "$currentLocalA" != 'true' ]] && _stop 1
	[[ "$currentLocalB" != '' ]] && _stop 1
	[[ "$currentLocalB" == 'true' ]] && _stop 1
	[[ "$currentNotLocalA" != 'true' ]] && _stop 1
	
	_variableLocalTestB_procedure && _stop 1
	! "$scriptAbsoluteLocation" _variableLocalTestB_procedure && _stop 1
	
	local currentGlobalA
	! _variableLocalTestC_procedure && _stop 1
	
	export currentGlobalB='false'
	local currentGlobalB='true'
	[[ "$currentGlobalB" != 'true' ]] && _stop 1
	
	local currentLocalB='true'
	! ( echo "$currentLocalB" ) | grep 'true' > /dev/null && _stop 1
	[[ "$currentLocalB" != 'true' ]] && _stop 1
	
	local currentLocalC='true'
	[[ "$currentLocalC" != 'true' ]] && _stop 1
	
	! env -i  HOME="$HOME" TERM="${TERM}" SHELL="${SHELL}" PATH="${PATH}" PWD="$PWD" scriptAbsoluteLocation="$scriptAbsoluteLocation" scriptAbsoluteFolder="$scriptAbsoluteFolder" sessionid="$sessionid" LD_PRELOAD="$LD_PRELOAD" USER="$USER" "bash" -c '[[ "$sessionid" != "" ]]' && _stop 1
	env -i  HOME="$HOME" TERM="${TERM}" SHELL="${SHELL}" PATH="${PATH}" PWD="$PWD" scriptAbsoluteLocation="$scriptAbsoluteLocation" scriptAbsoluteFolder="$scriptAbsoluteFolder" sessionid="" LD_PRELOAD="$LD_PRELOAD" USER="$USER" "bash" -c '[[ "$sessionid" != "" ]]' && _stop 1
	env -i HOME="$HOME" TERM="${TERM}" SHELL="${SHELL}" PATH="${PATH}" PWD="$PWD" scriptAbsoluteLocation="$scriptAbsoluteLocation" scriptAbsoluteFolder="$scriptAbsoluteFolder" LD_PRELOAD="$LD_PRELOAD" USER="$USER" "bash" -c '[[ "$sessionid" != "" ]]' && _stop 1
	
	local currentBashBinLocation
	currentBashBinLocation=$(type -p bash)
	[[ "$sessionid" == '' ]] &&  _stop 1
	! env -i sessionid="$sessionid" "$currentBashBinLocation" -c '[[ "$sessionid" != "" ]]' && _stop 1
	env -i sessionid="" "$currentBashBinLocation" -c '[[ "$sessionid" != "" ]]' && _stop 1
	env -i "$currentBashBinLocation" -c '[[ "$sessionid" != "" ]]' && _stop 1
	
	
	
	local currentVariableFunctionText
	
	export UB_TEST_VARIABLE_FUNCTION_COMMAND='_variableFunction_variableLocalTest() { echo true; }'' ; _variableFunction_variableLocalTest'
	currentVariableFunctionText=$(bash -c "$UB_TEST_VARIABLE_FUNCTION_COMMAND")
	#currentVariableFunctionText=$($UB_TEST_VARIABLE_FUNCTION_COMMAND)
	[[ "$currentVariableFunctionText" != "true" ]] && _messageFAIL && _stop 1
	export UB_TEST_VARIABLE_FUNCTION_COMMAND=
	unset UB_TEST_VARIABLE_FUNCTION_COMMAND
	
	_exportFunction_variableLocalTest() {
		echo true
	}
	currentVariableFunctionText=$(bash -c '_exportFunction_variableLocalTest' 2>/dev/null)
	[[ "$currentVariableFunctionText" != "" ]] && _messageFAIL && _stop 1
	export -f _exportFunction_variableLocalTest
	currentVariableFunctionText=$(bash -c '_exportFunction_variableLocalTest' 2>/dev/null)
	[[ "$currentVariableFunctionText" != "true" ]] && _messageFAIL && _stop 1
	unset _exportFunction_variableLocalTest
	
	
	_currentFunctionDefinitionTest() { echo false; }
	true && _currentFunctionDefinitionTest() { echo true; }
	false && _currentFunctionDefinitionTest() { echo false; }
	[[ $(_currentFunctionDefinitionTest) != "true" ]] && _messageFAIL && _stop 1
	unset _currentFunctionDefinitionTest
	
	_stop
}


_variableLocalTest() {
	if "$scriptAbsoluteLocation" _variableLocalTest_sequence "$@"
	then
		return 0
	fi
	return 1
}


_uid_test() {
	local current_uid_1
	local current_uid_2
	local current_uid_3
	
	current_uid_1=$(_uid)
	current_uid_2=$(_uid)
	current_uid_3_char=$(_uid 8 | wc -c)
	
	if [[ "$current_uid_1" == "" ]]
	then
		_messageFAIL
		_stop 1
	fi
	
	if [[ "$current_uid_2" == "" ]]
	then
		_messageFAIL
		_stop 1
	fi
	
	if [[ "$current_uid_1" == "$current_uid_2" ]]
	then
		_messageFAIL
		_stop 1
	fi
	
	if [[ "$current_uid_3_char" != "8" ]]
	then
		_messageFAIL
		_stop 1
	fi
	
	return 0
}


# Creating a function from within a function may be relied upon for some overrides.
# Enumerating a function's text with 'declare -f' may be relied upon by some 'here document' functions.
_define_function_test() {
	local current_uid_1
	current_uid_1=$(_uid)
	
	local current_uid_2
	current_uid_2=$(_uid)
	
	# https://stackoverflow.com/questions/7145337/bash-how-do-i-create-function-from-variable
	eval "__$current_uid_1() { __$current_uid_2() { echo $ubiquitousBashID; }; }"
	
	if [[ $(declare -f __$current_uid_1 | wc -c) -lt 50 ]]
	then
		_messageFAIL
		_stop 1
	fi
	
	if [[ $(declare -f __$current_uid_2 | wc -c) -gt 0 ]]
	then
		_messageFAIL
		_stop 1
	fi
	
	__$current_uid_1
	
	if [[ $(declare -f __$current_uid_2 | wc -c) -lt 15 ]]
	then
		_messageFAIL
		_stop 1
	fi
	
	# https://superuser.com/questions/154332/how-do-i-unset-or-get-rid-of-a-bash-function
	unset -f __$current_uid_2
	
	if [[ $(declare -f __$current_uid_2 | wc -c) -gt 0 ]]
	then
		_messageFAIL
		_stop 1
	fi
	
	if [[ $(declare -f __$current_uid_1 | wc -c) -lt 50 ]]
	then
		_messageFAIL
		_stop 1
	fi
	
	unset -f __$current_uid_1
	
	if [[ $(declare -f __$current_uid_1 | wc -c) -gt 0 ]]
	then
		_messageFAIL
		_stop 1
	fi
	
	
	return 0
}

#_test_prog() {
#	true
#}

_test_embed_procedure-embed() {
	#echo $ub_import
	#echo $ub_import_param
	
	[[ "$ub_import" != 'true' ]] && return 1
	[[ "$ub_import" == '' ]] && return 1
	[[ "$ub_import_param" != '--embed' ]] && return 1
	
	#_stop 0
	#return 0
	true
}

_test_embed_sequence() {
	_start scriptLocal_mkdir_disable
	
	#echo $ub_import
	#echo $ub_import_param
	
	# CAUTION: Profoundly unexpected to have called '_test' or similar functions after importing into a current shell in any way.
	if ( [[ "$current_internal_CompressedScript" == "" ]] && [[ "$current_internal_CompressedScript_cksum" == "" ]] && [[ "$current_internal_CompressedScript_bytes" == "" ]] ) || ( ( [[ "$ub_import_param" != "--embed" ]] ) && [[ "$ub_import_param" != "--bypass" ]] && [[ "$ub_import_param" != "--call" ]] && [[ "$ub_import_param" != "--script" ]] && [[ "$ub_import_param" != "--compressed" ]] )
	then
		[[ "$ub_import" == 'true' ]] && _messageFAIL && _stop 1
		[[ "$ub_import" != '' ]] && _messageFAIL && _stop 1
		[[ "$ub_import_param" != '' ]] && _messageFAIL && _stop 1
	fi
	
	! "$safeTmp"/.embed.sh _true && _stop 1
	
	"$safeTmp"/.embed.sh _false && _stop 1
	
	! "$safeTmp"/.embed.sh _test_embed_procedure-embed && _stop 1
	
	! . "$safeTmp"/.embed.sh _test_embed_procedure-embed && _stop 1
	
	_stop
}

_test_embed() {
	"$scriptAbsoluteLocation" _test_embed_sequence "$@"
}

_test_parallelFifo_procedure() {
	mkfifo "$safeTmp"/parallel_fifo
	cat "$safeTmp"/parallel_fifo > "$safeTmp"/parallel_fifo_out &
	
	local currentIterationsA
	currentIterationsA=0
	local currentIterationsB
	currentIterationsB=0
	
	while [[ "$currentIterationsA" -lt "2" ]]
	do
		echo a
		sleep 1
		let currentIterationsA="$currentIterationsA"" + 1"
	done | cat > "$safeTmp"/parallel_fifo &
	
	sleep 0.4
	
	while [[ "$currentIterationsB" -lt "2" ]]
	do
		echo b
		sleep 1
		let currentIterationsB="$currentIterationsB"" + 1"
	done | cat > "$safeTmp"/parallel_fifo
	
	sleep 1
	sleep 7
	
	
	#echo $(cat "$safeTmp"/parallel_fifo_out | tr -dc 'a-zA-Z0-9' 2> /dev/null)
	
	# WARNING: Strongly discouraged! Strict test highly dependent on unpredictable InterProcess-Communication timing requiring >7s latency margins at each 'step'!
	if _if_cygwin
	then
		[[ $(cat "$safeTmp"/parallel_fifo_out | tr -dc 'a-zA-Z0-9' 2> /dev/null) != "abab" ]] && _messageFAIL && return 1
	fi
	
	[[ $(cat "$safeTmp"/parallel_fifo_out | tr -dc 'a-zA-Z0-9' | wc -c) != "4" ]] && _messageFAIL && return 1
	
	
	rm -f "$safeTmp"/parallel_fifo
	rm -f "$safeTmp"/parallel_fifo_out
}

# No production use.
_test_parallelFifo_sequence() {
	_start scriptLocal_mkdir_disable
	
	_test_parallelFifo_procedure "$@"
	
	_stop
}

_test_sanity() {
	if (exit 0)
	then
		true
	else
		_messageFAIL && return 1
	fi
	if ! (exit 0)
	then
		_messageFAIL && return 1
	fi
	if (exit 1)
	then
		_messageFAIL && return 1
	fi
	if (exit 2)
	then
		_messageFAIL && return 1
	fi
	if (exit 3)
	then
		_messageFAIL && return 1
	fi
	if (exit 126)
	then
		_messageFAIL && return 1
	fi
	if (exit 127)
	then
		_messageFAIL && return 1
	fi
	if (exit 128)
	then
		_messageFAIL && return 1
	fi
	if (exit 129)
	then
		_messageFAIL && return 1
	fi
	if (exit 130)
	then
		_messageFAIL && return 1
	fi
	if (exit 131)
	then
		_messageFAIL && return 1
	fi
	if (exit 132)
	then
		_messageFAIL && return 1
	fi
	if (exit 255)
	then
		_messageFAIL && return 1
	fi
	
	local currentSubReturnStatus
	(exit 0)
	currentSubReturnStatus="$?"
	[[ "$currentSubReturnStatus" != '0' ]] && _messageFAIL && return 1
	(exit 1)
	currentSubReturnStatus="$?"
	[[ "$currentSubReturnStatus" != '1' ]] && _messageFAIL && return 1
	(exit 2)
	currentSubReturnStatus="$?"
	[[ "$currentSubReturnStatus" != '2' ]] && _messageFAIL && return 1
	(exit 3)
	currentSubReturnStatus="$?"
	[[ "$currentSubReturnStatus" != '3' ]] && _messageFAIL && return 1
	
	
	# Do NOT allow 'rm' to be a shell function alias to 'rm -i' or similar.
	[[ $(type -p rm) == "" ]] && _messageFAIL && return 1
	
	#! [[ -2147483648 -lt 2147483647 ]] && _messageFAIL && return 1
	#! [[ -2000000000 -lt 2000000000 ]] && _messageFAIL && return 1
	
	! [[ -1234567890 -le -1234567890 ]] && _messageFAIL && return 1
	! [[ 1234567890 -le 1234567890 ]] && _messageFAIL && return 1
	! [[ -1234567890 -lt 1234567890 ]] && _messageFAIL && return 1
	! [[ -1234567890 -ge -1234567890 ]] && _messageFAIL && return 1
	! [[ 1234567890 -ge 1234567890 ]] && _messageFAIL && return 1
	! [[ 1234567890 -gt -1234567890 ]] && _messageFAIL && return 1
	! [[ -1234567890 -lt -0 ]] && _messageFAIL && return 1
	! [[ -1234567890 -lt 0 ]] && _messageFAIL && return 1
	! [[ 0 -lt 1234567890 ]] && _messageFAIL && return 1
	! [[ -0 -gt -1234567890 ]] && _messageFAIL && return 1
	! [[ 0 -gt -1234567890 ]] && _messageFAIL && return 1
	! [[ 0 -gt -1234567890 ]] && _messageFAIL && return 1
	
	! [[ -900000000 -le -900000000 ]] && _messageFAIL && return 1
	! [[ 900000000 -le 900000000 ]] && _messageFAIL && return 1
	! [[ -900000000 -lt 900000000 ]] && _messageFAIL && return 1
	! [[ -900000000 -ge -900000000 ]] && _messageFAIL && return 1
	! [[ 900000000 -ge 900000000 ]] && _messageFAIL && return 1
	! [[ 900000000 -gt -900000000 ]] && _messageFAIL && return 1
	! [[ -900000000 -lt -0 ]] && _messageFAIL && return 1
	! [[ -900000000 -lt 0 ]] && _messageFAIL && return 1
	! [[ 0 -lt 900000000 ]] && _messageFAIL && return 1
	! [[ -0 -gt -900000000 ]] && _messageFAIL && return 1
	! [[ 0 -gt -900000000 ]] && _messageFAIL && return 1
	! [[ 0 -gt -900000000 ]] && _messageFAIL && return 1
	! [[ 0 -le -0 ]] && _messageFAIL && return 1
	! [[ -0 -le 0 ]] && _messageFAIL && return 1
	! [[ 0 -ge -0 ]] && _messageFAIL && return 1
	! [[ -0 -ge 0 ]] && _messageFAIL && return 1
	
	
	
	! "$scriptAbsoluteLocation" _true && _messageFAIL && return 1
	"$scriptAbsoluteLocation" _false && _messageFAIL && return 1
	
	# CAUTION: Profoundly unexpected to have called '_test' or similar functions after importing into a current shell in any way.
	if ( [[ "$current_internal_CompressedScript" == "" ]] && [[ "$current_internal_CompressedScript_cksum" == "" ]] && [[ "$current_internal_CompressedScript_bytes" == "" ]] ) || ( ( [[ "$ub_import_param" != "--embed" ]] ) && [[ "$ub_import_param" != "--bypass" ]] && [[ "$ub_import_param" != "--call" ]] && [[ "$ub_import_param" != "--script" ]] && [[ "$ub_import_param" != "--compressed" ]] )
	then
		[[ "$ub_import" == 'true' ]] && _messageFAIL && _stop 1
		[[ "$ub_import" != '' ]] && _messageFAIL && _stop 1
		[[ "$ub_import_param" != '' ]] && _messageFAIL && _stop 1
	fi
	
	local santiySessionID_length
	santiySessionID_length=$(echo -n "$sessionid" | wc -c | tr -dc '0-9')
	
	[[ "$santiySessionID_length" -lt "18" ]] && _messageFAIL && return 1
	[[ "$uidLengthPrefix" != "" ]] && [[ "$santiySessionID_length" -lt "$uidLengthPrefix" ]] && _messageFAIL && return 1
	
	[[ -e "$safeTmp" ]] && _messageFAIL && return 1
	
	_start scriptLocal_mkdir_disable
	
	
	[[ ! -e "$safeTmp" ]] && _messageFAIL && return 1
	
	[[ $( cd "$safeTmp" 2>/dev/null ; ls *doNotMatch* 2>/dev/null | wc -c) != "0" ]] && _messageFAIL && return 1
	[[ $( cd "$safeTmp" 2>/dev/null ; ls -A *doNotMatch* 2>/dev/null | wc -c) != "0" ]] && _messageFAIL && return 1
	
	echo -e -n >> "$safeTmp"/empty
	[[ ! -e "$safeTmp"/empty ]] && _messageFAIL && return 1
	[[ $(cat "$safeTmp"/empty | wc -c) != '0' ]] && _messageFAIL && return 1
	
	[[ $( cd "$safeTmp" 2>/dev/null ; ls *empty* 2>/dev/null | wc -c) == "0" ]] && _messageFAIL && return 1
	[[ $( cd "$safeTmp" 2>/dev/null ; ls -A *empty* 2>/dev/null | wc -c) == "0" ]] && _messageFAIL && return 1
	
	rm -f "$safeTmp"/empty > /dev/null 2>&1
	
	
	! _test_moveconfirm_procedure && _messageFAIL && return 1
	
	
	local currentTestUID=$(_uid 245)
	mkdir -p "$safeTmp"/"$currentTestUID"
	echo > "$safeTmp"/"$currentTestUID"/"$currentTestUID"
	
	[[ ! -e "$safeTmp"/"$currentTestUID"/"$currentTestUID" ]] && _messageFAIL && return 1
	
	rm -f "$safeTmp"/"$currentTestUID"/"$currentTestUID"
	rmdir "$safeTmp"/"$currentTestUID"
	
	[[ -e "$safeTmp"/"$currentTestUID" ]] && _messageFAIL && return 1
	
	echo 'true' > "$safeTmp"/shouldNotOverwrite
	mv "$safeTmp"/doesNotExist "$safeTmp"/shouldNotOverwrite > /dev/null 2>&1 && _messageFAIL && return 1
	echo > "$safeTmp"/replacement
	mv -n "$safeTmp"/replacement "$safeTmp"/shouldNotOverwrite > /dev/null 2>&1
	[[ $(cat "$safeTmp"/shouldNotOverwrite) != "true" ]] && _messageFAIL && return 1
	rm -f "$safeTmp"/replacement > /dev/null 2>&1
	rm -f "$safeTmp"/shouldNotOverwrite > /dev/null 2>&1
	
	
	_uid_test
	
	[[ $(_getUUID | wc -c) != '37' ]] && _messageFAIL && return 1
	
	[[ $(_getUUID | cut -f1 -d\- | wc -c) != '9' ]] &&  _messageFAIL && return 1
	
	
	! env | grep 'PATH' > /dev/null 2>&1 && _messageFAIL && return 1
	! printenv | grep 'PATH' > /dev/null 2>&1 && _messageFAIL && return 1
	
	
	_define_function_test
	
	! _variableLocalTest && _messageFAIL && return 1
	
	
	
	mkdir -p "$safeTmp"/maydeletethisfolder
	[[ ! -d "$safeTmp"/maydeletethisfolder ]] && return 1
	echo > "$safeTmp"/maydeletethisfolder/maydeletethisfile
	[[ ! -e "$safeTmp"/maydeletethisfolder/maydeletethisfile ]] && return 1
	_safeRMR "$safeTmp"/maydeletethisfolder
	[[ -e "$safeTmp"/maydeletethisfolder/maydeletethisfile ]] && return 1
	[[ -e "$safeTmp"/maydeletethisfolder ]] && return 1
	
	
	
	# WARNING: Not tested by default, due to lack of use except where faults are tolerable, and slim possibility of useful embedded systems not able to pass.
	#! echo \$123 | grep -E '^\$[0-9]|^\.[0-9]' > /dev/null 2>&1 && _messageFAIL && return 1
	#! echo \.123 | grep -E '^\$[0-9]|^\.[0-9]' > /dev/null 2>&1 && _messageFAIL && return 1
	#echo 123 | grep -E '^\$[0-9]|^\.[0-9]' > /dev/null 2>&1 && _messageFAIL && return 1
	
	
	local currentJobsList
	currentJobsList=$(jobs -p -r)
	
	[[ "$currentJobsList" != "" ]] && return 1
	
	sleep 7 &
	currentJobsList=$(jobs -p -r)
	[[ "$currentJobsList" == "" ]] && return 1
	
	wait
	currentJobsList=$(jobs -p -r)
	[[ "$currentJobsList" != "" ]] && return 1
	
	
	
	
	if ! _test_embed
	then
		_messageFAIL && _stop 1
		#! uname -a | grep -i cygwin > /dev/null 2>&1 && _messageFAIL && _stop 1
		#echo 'warn: broken (cygwin): _test_embed - cygwin detected'
	fi
	
	
	
	
	_getDep flock
	
	( flock 200; echo > "$safeTmp"/ready ; sleep 3 ) 200>"$safeTmp"/flock &
	sleep 1
	if ( flock 200; ! [[ -e "$safeTmp"/ready ]] ) 200>"$safeTmp"/flock
	then
		! uname -a | grep -i cygwin > /dev/null 2>&1 && _messageFAIL && _stop 1
		echo 'warn: broken (cygwin): flock - cygwin may not be able to use flock through MSW network drive'
		return 1
	fi
	rm -f "$safeTmp"/flock > /dev/null 2>&1
	rm -f "$safeTmp"/ready > /dev/null 2>&1
	
	ln -s /dev/null "$safeTmp"/working
	ln -s /dev/null/broken "$safeTmp"/broken
	if ! [[ -h "$safeTmp"/broken ]] || ! [[ -h "$safeTmp"/working ]] || [[ -e "$safeTmp"/broken ]] || ! [[ -e "$safeTmp"/working ]]
	then
		! uname -a | grep -i cygwin > /dev/null 2>&1 && _messageFAIL && _stop 1
		echo 'warn: broken (cygwin): flock - cygwin may not be able to use flock through MSW network drive'
		return 1
	fi
	rm -f "$safeTmp"/working
	rm -f "$safeTmp"/broken
	
	
	
	_tryExec _test_parallelFifo_procedure
	
	
	return 0
}



_test-shell() {
	_installation_nonet_default
	
	# ATTENTION: As part of sanity test, "$safeTmp" must not exist until '_start scriptLocal_mkdir_disable' is called from within '_test_sanity' .
	#_start scriptLocal_mkdir_disable
	_messageNormal "Sanity..."
	_test_sanity && _messagePASS
	
	
	
	_messageNormal "Permissions..."
	! _test_permissions_ubiquitous && _messageFAIL
	_messagePASS
	
	#Environment generated by ubiquitous bash is typically 10000 characters.
	#echo -n -e '\E[1;32;46m Argument length...	\E[0m'
	_messageNormal 'Argument length...'
	_testarglength
	
	_messageNormal "Absolute pathfinding..."
	#if ! uname -a | grep -i cygwin > /dev/null 2>&1
	#then
		_tryExec "_test_getAbsoluteLocation"
	#fi
	_messagePASS
	
}

_test() {
	_test-shell "$@"
	_installation_nonet_default
	
	if type _timetest > /dev/null 2>&1
	then
		echo -n -e '\E[1;32;46m Timing...		\E[0m'
		echo
		
		# DANGER: Even under MSW/Cygwin, should ONLY fail IF extremely slow storage is attached.
		if type _test_selfTime > /dev/null 2>&1
		then
			echo -e '\E[0;36m Timing: _test_selfTime \E[0m'
			if ! _test_selfTime
			then
				if _if_cygwin
				then
					echo 'warn: accepted: cygwin: _test_selfTime broken'
				else
					echo '_test_selfTime broken'
					_stop 1
				fi
			fi
		fi
		
		if type _test_bashTime > /dev/null 2>&1
		then
			echo -e '\E[0;36m Timing: _test_bashTime \E[0m'
			! _test_bashTime && echo '_test_selfTime broken' && _stop 1
		fi
		
		if type _test_filemtime > /dev/null 2>&1
		then
			echo -e '\E[0;36m Timing: _test_filemtime \E[0m'
			! _test_filemtime && echo '_test_selfTime broken' && _stop 1
		fi
		
		if type _test_timeoutRead > /dev/null 2>&1
		then
			echo -e '\E[0;36m Timing: _test_timeoutRead \E[0m'
			! _test_timeoutRead && echo '_test_timeoutRead broken' && _stop 1
		fi
		
		echo -e '\E[0;36m Timing: _timetest \E[0m'
		! _timetest && echo '_timetest broken' && _stop 1
	fi
	
	
	_messageNormal "Dependency checking..."
	
	## Check dependencies
	
	# WARNING: Although '#!/usr/bin/env bash' is used as header when possible, some high-speed 'heredoc' scripts may instead rely on '#!/bin/bash' or '#!/bin/dash' to ensure performance. For these important use cases, the typical '/bin/bash' and '/bin/dash' binary locations are required.
	_getDep /bin/bash
	! [[ -e /bin/bash ]] && echo '/bin/bash missing' && _stop 1
	! [[ -x /bin/bash ]] && echo '/bin/bash nonexecutable' && _stop 1
	_getDep /bin/dash
	! [[ -e /bin/dash ]] && echo '/bin/dash missing' && _stop 1
	! [[ -x /bin/dash ]] && echo '/bin/dash nonexecutable' && _stop 1
	
	#"generic/filesystem"/permissions.sh
	_checkDep stat
	
	_getDep cksum
	
	_getDep wget
	_getDep grep
	_getDep fgrep
	_getDep sed
	_getDep awk
	_getDep cut
	_getDep head
	_getDep tail
	
	_getDep seq
	
	_getDep wc
	
	_getDep fold
	
	
	! _compat_realpath && ! _wantGetDep realpath && echo 'realpath missing'
	_getDep readlink
	_getDep dirname
	_getDep basename
	
	_getDep sleep
	_getDep wait
	_getDep kill
	_getDep jobs
	_getDep ps
	_getDep exit
	
	_getDep env
	_getDep printenv
	_getDep bash
	_getDep echo
	_getDep cat
	_getDep tac
	_getDep type
	_getDep mkdir
	_getDep trap
	_getDep return
	_getDep set
	
	# WARNING: Deprecated. Migrate to 'type -p' instead when possible.
	# WARNING: No known production use.
	#https://unix.stackexchange.com/questions/85249/why-not-use-which-what-to-use-then
	_getDep which
	
	_getDep printf
	
	_getDep stat
	_getDep touch
	
	_getDep dd
	_wantGetDep blockdev
	
	_getDep rm
	
	_getDep find
	_getDep ln
	_getDep ls
	
	_getDep id
	
	_getDep test
	
	_getDep true
	_getDep false
	
	_getDep diff
	
	_getDep uuidgen
	
	_getDep bc
	_getDep xxd
	_getDep od
	
	_getDep yes
	
	_test_readlink_f
	
	_tryExec "_test_package"
	
	_tryExec "_test_daemon"
	
	_tryExec "_testFindPort"
	_tryExec "_test_waitport"
	
	_tryExec "_testProxySSH"
	
	_tryExec "_testAutoSSH"
	
	_tryExec "_testTor"
	
	_tryExec "_testProxyRouter"
	
	#_tryExec "_test_build"
	
	_tryExec "_testGosu"
	
	_tryExec "_testMountChecks"
	_tryExec "_testBindMountManager"
	_tryExec "_testDistro"
	_tryExec "_test_fetchDebian"
	
	_tryExec "_test_image"
	_tryExec "_test_transferimage"
	
	_tryExec "_testCreatePartition"
	_tryExec "_testCreateFS"
	
	_tryExec "_test_mkboot"
	
	_tryExec "_test_abstractfs"
	_tryExec "_test_fakehome"
	_tryExec "_testChRoot"
	_tryExec "_testQEMU"
	_tryExec "_testQEMU_x64-x64"
	_tryExec "_testQEMU_x64-raspi"
	_tryExec "_testQEMU_raspi-raspi"
	_tryExec "_testVBox"
	
	_tryExec "_test_vboxconvert"
	
	_tryExec "_test_dosbox"
	
	_tryExec "_testWINE"
	
	_tryExec "_test_docker"
	
	_tryExec "_test_docker_mkimage"
	
	_tryExec "_testVirtBootdisc"
	
	_tryExec "_testExtra"
	
	_tryExec "_testGit"
	
	_tryExec "_test_bup"
	
	_tryExec "_testX11"
	
	_tryExec "_test_virtLocal_X11"
	
	_tryExec "_test_search"
	
	_tryExec "_test_packetDriveDevice"
	_tryExec "_test_gparted"
	
	_tryExec "_test_synergy"
	
	
	_tryExec "_test_devqalculate"
	_tryExec "_test_devgnuoctave"
	
	
	
	_tryExec "_test_devatom"
	_tryExec "_test_devemacs"
	_tryExec "_test_deveclipse"
	
	
	_tryExec "_test_h1060p"
	
	
	_tryExec "_test_ethereum"
	_tryExec "_test_ethereum_parity"
	
	
	
	_tryExec "_test_mktorrent"
	
	
	_tryExec "_test_cloud"
	
	_tryExec "_test_rclone"
	_tryExec "_test_terraform"
	
	
	_tryExec "_test_vagrant_build"
	
	
	
	_tryExec "_test_kernelConfig"
	
	
	_tryExec "_test_clog"
	
	_tryExec "_test_metaengine"
	
	_tryExec "_test_channel"
	
	! [[ -e /dev/urandom ]] && echo /dev/urandom missing && _stop 1
	[[ $(_timeout 3 cat /dev/urandom 2> /dev/null | _timeout 3 base64 2> /dev/null | _timeout 3 tr -dc 'a-zA-Z0-9' 2> /dev/null | _timeout 3 head -c 18 2> /dev/null) == "" ]] && echo /dev/urandom fail && _stop 1
	
	_messagePASS
	
	if type _test_queue > /dev/null 2>&1
	then
		_messageNormal "Queue..."
		
		_tryExec '_test_queue'
		
		# DANGER: Even under MSW/Cygwin, should ONLY fail IF extremely slow storage is attached.
		echo -e '\E[0;36m Queue: _test_broadcastPipe_page \E[0m'
		if ! _test_broadcastPipe_page
		then
			if _if_cygwin
			then
				echo 'warn: accepted: cygwin: _test_broadcastPipe_page broken'
			else
				echo '_test_broadcastPipe_page broken'
				_stop 1
			fi
		fi
		
		# DANGER: Even under MSW/Cygwin, should ONLY fail IF extremely slow storage is attached.
		echo -e '\E[0;36m Queue: _test_broadcastPipe_aggregatorStatic \E[0m'
		if ! _test_broadcastPipe_aggregatorStatic
		then
			if _if_cygwin
			then
				#echo 'warn: accepted: cygwin: _test_broadcastPipe_aggregatorStatic broken'
				echo '_test_broadcastPipe_aggregatorStatic broken'
				_stop 1
			else
				echo '_test_broadcastPipe_aggregatorStatic broken'
				_stop 1
			fi
		fi
		
		_messagePASS
	fi
	
	_messageNormal 'Vector...'
	_vector
	_messagePASS
	
	_tryExec "_test_prog"
	
	
	_stop
}

#_testBuilt_prog() {
#	true
#}

_testBuilt() {
	_start scriptLocal_mkdir_disable
	
	_messageProcess "Binary checking"
	
	_tryExec "_testBuiltIdle"
	_tryExec "_testBuiltGosu"	#Note, requires sudo, not necessary for docker .
	
	_tryExec "_test_ethereum_built"
	_tryExec "_test_ethereum_parity_built"
	
	_tryExec "_testBuiltChRoot"
	_tryExec "_testBuiltQEMU"
	
	_tryExec "_testBuiltExtra"
	
	_tryExec "_testBuilt_prog"
	
	_messagePASS
	
	_stop
}

#Creates symlink in "$HOME"/bin, to the executable at "$1", named according to its residing directory and file name.
_setupCommand() {
	mkdir -p "$HOME"/bin
	! [[ -e "$HOME"/bin ]] && return 1
	
	local clientScriptLocation
	clientScriptLocation=$(_getAbsoluteLocation "$1")
	
	local clientScriptFolder
	clientScriptFolder=$(_getAbsoluteFolder "$1")
	
	local commandName
	commandName=$(basename "$1")
	
	local clientName
	clientName=$(basename "$clientScriptFolder")
	
	_relink_relative "$clientScriptLocation" "$HOME"/bin/"$commandName""-""$clientName"
	
	
}

_setupCommand_meta() {
	mkdir -p "$HOME"/bin
	! [[ -e "$HOME"/bin ]] && return 1
	
	local clientScriptLocation
	clientScriptLocation=$(_getAbsoluteLocation "$1")
	
	local clientScriptFolder
	clientScriptFolder=$(_getAbsoluteFolder "$1")
	
	local clientScriptFolderResidence
	clientScriptFolderResidence=$(_getAbsoluteFolder "$clientScriptFolder")
	
	local commandName
	commandName=$(basename "$1")
	
	local clientName
	clientName=$(basename "$clientScriptFolderResidence")
	
	_relink_relative "$clientScriptLocation" "$HOME"/bin/"$commandName""-""$clientName"
	
	
}

_find_setupCommands() {
	find -L "$scriptAbsoluteFolder" -not \( -path \*_arc\* -prune \) -not \( -path \*__disk\* -prune \) -not \( -path \*/_local/h/\* -prune \) -not \( -path \*/_local/fs/\* -prune \) -not \( -path \*/_local/ubcp/\* -prune \) "$@"
}

#Consider placing files like ' _vnc-machine-"$netName" ' in an "_index" folder for automatic installation.
_setupCommands() {
	#_find_setupCommands -name '_command' -exec "$scriptAbsoluteLocation" _setupCommand '{}' \;
	
	_tryExec "_setup_ssh_commands"
	_tryExec "_setup_command_commands"
}

#_setup_pre() {
#	true
#}

#_setup_prog() {
#	true
#}


_setup_anchor() {
	if ! _if_cygwin && [[ "$objectName" == "ubiquitous_bash" ]]
	then
		# WARNING: End user file association. Do NOT call within scripts.
		# WARNING: Necessarily relies on a 'deprecated' 'field code' with the 'Exec key' of a 'Desktop Entry' file association.
		# https://specifications.freedesktop.org/desktop-entry-spec/desktop-entry-spec-latest.html
		_messagePlain_request 'association: *.bat'
		echo 'konsole --workdir %d -e /bin/bash %f (open in graphical terminal emulator from file manager)'
		echo 'bash'
	fi
	
	if type "_associate_anchors_request" > /dev/null 2>&1
	then
		_tryExec "_associate_anchors_request"
		return
	fi
}

_setup() {
	_installation_nonet_default
	
	_start scriptLocal_mkdir_disable
	
	"$scriptAbsoluteLocation" _test || _stop 1
	
	#Only attempt build procedures if their functions have been defined from "build.sh" . Pure shell script projects (eg. CoreAutoSSH), and projects using only statically compiled binaries, need NOT include such procedures.
	local buildSupported
	type _build > /dev/null 2>&1 && type _test_build > /dev/null 2>&1 && buildSupported="true"
	
	[[ "$buildSupported" == "true" ]] && ! "$scriptAbsoluteLocation" _test_build && _stop 1
	
	if ! "$scriptAbsoluteLocation" _testBuilt
	then
		! [[ "$buildSupported" == "true" ]] && _stop 1
		[[ "$buildSupported" == "true" ]] && ! "$scriptAbsoluteLocation" _build "$@" && _stop 1
		! "$scriptAbsoluteLocation" _testBuilt && _stop 1
	fi
	
	_setupCommands
	
	_tryExec "_setup_pre"
	
	_tryExec "_setup_ssh"
	
	_tryExec "_setup_prog"
	
	_setup_anchor
	
	_stop
}

# DANGER: Especially not expected to modify system program behavior (eg. not to modify "$HOME"/.ssh ).
# WARNING: Strictly expected to not modify anyting outside the script directory.
_setup_local() {
	export ub_setup_local='true'
	
	_setup
}

_test_package() {
	_getDep tar
	_getDep gzip
	
	_getDep xz
}

_package_prog() {
	true
}


_package_ubcp_copy_copy() {
	#cp -a "$1" "$2"
	if [[ "$ubPackage_enable_ubcp" != 'true' ]]
	then
		rsync -av --progress --exclude "/ubcp/conemu" --exclude "/ubcp/cygwin" --exclude "/ubcp/package_ubcp-cygwinOnly.tar.gz" --exclude "/ubcp/package_ubcp-cygwinOnly.tar.xz" "$1" "$2"
	else
		rsync -av --progress --exclude "/ubcp/package_ubcp-cygwinOnly.tar.gz" --exclude "/ubcp/package_ubcp-cygwinOnly.tar.xz" "$1" "$2"
	fi
	
	
	rm -f "$safeTmp"/package/_local/package_ubcp-cygwinOnly.tar.gz
	rm -f "$safeTmp"/package/_local/ubcp/package_ubcp-cygwinOnly.tar.gz
	
	return 0
}

_package_ubcp_copy() {
	mkdir -p "$safeTmp"/package/_local
	
	if [[ -e "$scriptLocal"/ubcp ]]
	then
		_package_ubcp_copy_copy "$scriptLocal"/ubcp "$safeTmp"/package/_local/
		return 0
	fi
	if [[ -e "$scriptLib"/ubcp ]]
	then
		_package_ubcp_copy_copy "$scriptLib"/ubcp "$safeTmp"/package/_local/
		rm -f "$safeTmp"/package/_local/ubcp/package_ubcp-cygwinOnly.tar.gz
		return 0
	fi
	if [[ -e "$scriptAbsoluteFolder"/ubcp ]]
	then
		_package_ubcp_copy_copy "$scriptAbsoluteFolder"/ubcp "$safeTmp"/package/_local/
		rm -f "$safeTmp"/package/_local/ubcp/package_ubcp-cygwinOnly.tar.gz
		return 0
	fi
	
	
	if [[ -e "$scriptLib"/ubiquitous_bash/_local/ubcp ]]
	then
		_package_ubcp_copy_copy "$scriptLib"/ubiquitous_bash/_local/ubcp "$safeTmp"/package/_local/
		rm -f "$safeTmp"/package/_local/ubcp/package_ubcp-cygwinOnly.tar.gz
		return 0
	fi
	if [[ -e "$scriptLib"/ubiquitous_bash/_lib/ubcp ]]
	then
		_package_ubcp_copy_copy "$scriptLib"/ubiquitous_bash/_lib/ubcp "$safeTmp"/package/_local/
		rm -f "$safeTmp"/package/_local/ubcp/package_ubcp-cygwinOnly.tar.gz
		return 0
	fi
	if [[ -e "$scriptLib"/ubiquitous_bash/ubcp ]]
	then
		_package_ubcp_copy_copy "$scriptLib"/ubiquitous_bash/ubcp "$safeTmp"/package/_local/
		rm -f "$safeTmp"/package/_local/ubcp/package_ubcp-cygwinOnly.tar.gz
		return 0
	fi
	
	
	cd "$outerPWD"
	_stop 1
}

# ATTENTION: Override with 'ops' or similar ONLY if necessary.
_package_subdir() {
	#return 0
	
	# ATTENTION: Error message about 'cannot move' ... 'subdirectory of itself' ... is normal .
	mkdir -p "$safeTmp"/package/"$objectName"_tmp/
	( shopt -s dotglob ; mv "$safeTmp"/package/* "$safeTmp"/package/"$objectName"_tmp/ )
	mv "$safeTmp"/package/"$objectName"_tmp "$safeTmp"/package/"$objectName"
}

# WARNING Must define "_package_license" function in ops to include license files in package!
_package_procedure() {
	_start scriptLocal_mkdir_disable
	mkdir -p "$safeTmp"/package
	
	# WARNING: Largely due to presence of '.gitignore' files in 'ubcp' .
	export safeToDeleteGit="true"
	
	_package_prog
	
	_tryExec "_package_license"
	
	_tryExec "_package_cautossh"
	
	#cp -a "$scriptAbsoluteFolder"/.git "$safeTmp"/package/ > /dev/null 2>&1
	cp "$scriptAbsoluteFolder"/.gitignore "$safeTmp"/package/ > /dev/null 2>&1
	cp "$scriptAbsoluteFolder"/.gitmodules "$safeTmp"/package/ > /dev/null 2>&1
	
	cp "$scriptAbsoluteFolder"/COPYING "$safeTmp"/package/ > /dev/null 2>&1
	cp "$scriptAbsoluteFolder"/COPYING* "$safeTmp"/package/ > /dev/null 2>&1
	
	cp "$scriptAbsoluteFolder"/gpl.txt "$safeTmp"/package/ > /dev/null 2>&1
	cp "$scriptAbsoluteFolder"/gpl-*.txt "$safeTmp"/package/ > /dev/null 2>&1
	cp "$scriptAbsoluteFolder"/gpl-3.0.txt "$safeTmp"/package/ > /dev/null 2>&1
	
	cp "$scriptAbsoluteFolder"/agpl.txt "$safeTmp"/package/ > /dev/null 2>&1
	cp "$scriptAbsoluteFolder"/agpl-*.txt "$safeTmp"/package/ > /dev/null 2>&1
	cp "$scriptAbsoluteFolder"/agpl-3.0.txt "$safeTmp"/package/ > /dev/null 2>&1
	
	cp "$scriptAbsoluteFolder"/license.txt "$safeTmp"/package/ > /dev/null 2>&1
	cp "$scriptAbsoluteFolder"/license*.txt "$safeTmp"/package/ > /dev/null 2>&1
	
	#scriptBasename=$(basename "$scriptAbsoluteLocation")
	#cp -a "$scriptAbsoluteLocation" "$safeTmp"/package/"$scriptBasename"
	cp -a "$scriptAbsoluteLocation" "$safeTmp"/package/
	cp -a "$scriptAbsoluteFolder"/ops "$safeTmp"/package/
	cp -a "$scriptAbsoluteFolder"/ops.sh "$safeTmp"/package/
	
	cp "$scriptAbsoluteFolder"/_* "$safeTmp"/package/
	cp "$scriptAbsoluteFolder"/*.sh "$safeTmp"/package/
	cp "$scriptAbsoluteFolder"/*.py "$safeTmp"/package/
	
	cp -a "$scriptLocal"/ops "$safeTmp"/package/
	cp -a "$scriptLocal"/ops.sh "$safeTmp"/package/
	
	#cp -a "$scriptAbsoluteFolder"/_bin "$safeTmp"
	#cp -a "$scriptAbsoluteFolder"/_config "$safeTmp"
	#cp -a "$scriptAbsoluteFolder"/_prog "$safeTmp"
	
	#cp -a "$scriptAbsoluteFolder"/_local "$safeTmp"/package/
	
	cp -a "$scriptAbsoluteFolder"/README.md "$safeTmp"/package/
	cp -a "$scriptAbsoluteFolder"/USAGE.html "$safeTmp"/package/
	
	cp -a "$scriptAbsoluteFolder"/README.sh "$safeTmp"/package/
	cp -a "$scriptAbsoluteFolder"/README.html "$safeTmp"/package/
	cp -a "$scriptAbsoluteFolder"/README.pdf "$safeTmp"/package/
	cp -a "$scriptAbsoluteFolder"/README.md "$safeTmp"/package/
	
	
	cp -a "$scriptAbsoluteFolder"/_config "$safeTmp"/package/
	
	
	cp -a "$scriptAbsoluteFolder"/_bin "$safeTmp"/package/
	
	
	cp "$scriptAbsoluteFolder"/fork "$safeTmp"/package/
	
	
	rm -f "$safeTmp"/package/devtask* > /dev/null 2>&1
	rm -f "$safeTmp"/package/__d_* > /dev/null 2>&1
	rm -f "$safeTmp"/package/_d_* > /dev/null 2>&1
	
	
	#if [[ "$ubPackage_enable_ubcp" == 'true' ]]
	#then
		#_package_ubcp_copy "$@"
	#fi
	
	_package_ubcp_copy "$@"
	if [[ "$ubPackage_enable_ubcp" != 'true' ]]
	then
		_safeRMR "$safeTmp"/package/_local/ubcp/conemu
		_safeRMR "$safeTmp"/package/_local/ubcp/cygwin
	fi
	
	cd "$safeTmp"/package/
	_package_subdir
	
	#! [[ "$ubPackage_enable_ubcp" == 'true' ]] && env GZIP=-9 tar -czvf "$scriptAbsoluteFolder"/package.tar.gz .
	! [[ "$ubPackage_enable_ubcp" == 'true' ]] && env XZ_OPT=-e9 tar -cJvf "$scriptAbsoluteFolder"/package.tar.xz .
	#[[ "$ubPackage_enable_ubcp" == 'true' ]] && env GZIP=-9 tar -czvf "$scriptAbsoluteFolder"/package_ubcp.tar.gz .
	#[[ "$ubPackage_enable_ubcp" == 'true' ]] && env XZ_OPT=-e9 tar -cJvf "$scriptAbsoluteFolder"/package_ubcp.tar.xz .
	[[ "$ubPackage_enable_ubcp" == 'true' ]] && env XZ_OPT=-5 tar -cJvf "$scriptAbsoluteFolder"/package_ubcp.tar.xz .
	
	if [[ "$ubPackage_enable_ubcp" == 'true' ]]
	then
		_messagePlain_request 'request: review contents of _local/ubcp/cygwin/home and similar directories'
	fi
	
	cd "$outerPWD"
	_stop
}

_package() {
	export ubPackage_enable_ubcp='false'
	"$scriptAbsoluteLocation" _package_procedure "$@"
	
	export ubPackage_enable_ubcp='true'
	"$scriptAbsoluteLocation" _package_procedure "$@"
}







#Especially crucial mathematical tests. Ensures correct operation of dependencies needed by especially critical functions.
_vectors_system_sequence() {
	_start
	
	_stop
}

_vectors_system() {
	if "$scriptAbsoluteLocation" _vectors_system_sequence "$@"
	then
		return 0
	fi
	_messageFAIL
	_stop 1
}


_vectors_crypto() {
	_messageNormal "Vectors (system)..."
	
	_tryExec "_vectors_system"
	
	_messagePASS
	
	
	_messageNormal "Vectors (crypto)..."
	
	_tryExec "_vector_rand-flipKey"
	_tryExec "_vector_openssl-flipKey"
	
	_tryExec "_vector_veracrypt"
	
	_messagePASS
	
	return 0
}

_test_prog() {
	_messageNormal "Sanity..."
	
	_messagePASS
	
	_messageNormal "Program..."
	
	_getDep python3
	
	if ! _wantGetDep mkfs.nilfs2
	then
		echo 'warn: missing: mkfs.nilfs2'
	fi
	
	if ! _wantGetDep mkfs.btrfs
	then
		echo 'warn: missing: mkfs.btrfs'
	fi
	
	if ! _wantGetDep blkdiscard
	then
		echo 'warn: missing: blkdiscard'
	fi
	
	_tryExec '_test_sweep'
	
	_tryExec "_test_rand-flipKey"
	
	_tryExec '_test_veracrypt'
	
	
	if ! _wantGetDep sg_format
	then
		true
		#echo 'warn: missing: sg_format'
	fi
	
	if ! _wantGetDep kpartx
	then
		true
		#echo 'warn: missing: kpartx'
	fi
	
	_wantGetDep mkudffs
	_wantGetDep dvd+rw-format
	_wantGetDep growisofs
	_wantGetDep udevadm
	
	_wantGetDep gdisk
	_wantGetDep sgdisk
	_wantGetDep blkid
	_wantGetDep partprobe
	_wantGetDep blkdiscard
	
	
	_messagePASS
	
	_tryExec "_vectors_crypto"
}

_setup_prog() {
	if type _setup_entropy > /dev/null 2>&1
	then
		_setup_entropy
	fi
}

#_setup_anchor() {
	#if type "_associat_messagePlain_request 'association: dir'e_anchors_request" > /dev/null 2>&1
	#then
		#_tryExec "_associate_anchors_request"
		#return
	#fi
#}



_package_prog_full() {
	cp "$scriptAbsoluteFolder"/flipKey "$safeTmp"/package
	
	
	#chmod u+x "$scriptAbsoluteFolder"/discManager
	#"$scriptAbsoluteFolder"/discManager _noAttachment > "$safeTmp"/package/discManager
	
	mkdir -p "$safeTmp"/package/_local/
	cp -a "$scriptAbsoluteFolder"/_local/disk.sh "$safeTmp"/package/_local/
	
	mkdir -p "$safeTmp"/package/_lib/_setups/distribution
	cp -a "$scriptAbsoluteFolder"/_lib/_setups/distribution "$safeTmp"/package/_lib/_setups
	cp -a "$scriptAbsoluteFolder"/_lib/_setups/distribution/*.deb "$safeTmp"/package/_lib/_setups/distribution/
	
	mkdir -p "$safeTmp"/package/_lib/_setups/veracrypt
	#cp -a "$scriptAbsoluteFolder"/_lib/_setups/veracrypt "$safeTmp"/package/_lib/_setups
	cp -a "$scriptAbsoluteFolder"/_lib/_setups/veracrypt/*.deb "$safeTmp"/package/_lib/_setups/veracrypt/
	
	# WARNING: Significantly increases package size .
	mkdir -p "$safeTmp"/package/_lib/_setups/heavy/veracrypt
	#cp -a "$scriptAbsoluteFolder"/_lib/_setups/heavy/veracrypt/*.exe "$safeTmp"/package/_lib/_setups/heavy/veracrypt/
	#cp -a "$scriptAbsoluteFolder"/_lib/_setups/heavy/veracrypt/*.dmg "$safeTmp"/package/_lib/_setups/heavy/veracrypt/
	
	
	cp -a "$scriptAbsoluteFolder"/_prog "$safeTmp"/package/
}
_package_prog() {
	_package_prog_full "$@"
}


_package_attachAttachment_sequence() {
	"$scriptAbsoluteLocation" _package_rmAttachment_sequence "$@"
	
	_start
	local functionEntryPWD
	functionEntryPWD="$PWD"
	
	cd "$safeTmp"
	
	
	cp "$scriptAbsoluteFolder"/package.tar.xz "$safeTmp"/
	
	cp "$scriptAbsoluteFolder"/discManager-src.sh "$safeTmp"/
	chmod u+x "$safeTmp"/discManager-src.sh
	"$safeTmp"/discManager-src.sh _attachAttachment
	mv "$safeTmp"/discManager-src.sh "$safeTmp"/discManager
	mv "$safeTmp"/discManager "$scriptAbsoluteFolder"/discManager
	
	
	cd "$functionEntryPWD"
	_stop
}

_package_rmAttachment_sequence() {
	_start
	local functionEntryPWD
	functionEntryPWD="$PWD"
	
	cd "$safeTmp"
	
	
	cp "$scriptAbsoluteFolder"/discManager-src.sh "$safeTmp"/
	chmod u+x "$safeTmp"/discManager-src.sh
	
	"$safeTmp"/discManager-src.sh _rmAttachment
	cp "$safeTmp"/discManager-src.sh "$scriptAbsoluteFolder"/discManager-src.sh
	chmod u+x "$scriptAbsoluteFolder"/discManager-src.sh
	
	
	
	
	
	cd "$functionEntryPWD"
	_stop
}


_package_kit_sequence() {
	#export ubPackage_enable_ubcp='false'
	#"$scriptAbsoluteLocation" _package_procedure "$@"
	
	_start
	
	cp "$scriptAbsoluteFolder"/package.tar.xz "$safeTmp"/
	xz -d "$safeTmp"/package.tar.xz
	
	tar --delete --file="$safeTmp"/package.tar ./"$objectName"/ops.sh
	tar --delete --file="$safeTmp"/package.tar ./"$objectName"/_local/disk.sh
	tar --delete --file="$safeTmp"/package.tar ./"$objectName"/_config
	
	cat "$safeTmp"/package.tar | xz -e9 -c - > "$safeTmp"/package_kit.tar.xz
	
	mv "$safeTmp"/package_kit.tar.xz "$scriptAbsoluteFolder"/package_kit.tar.xz
	
	_stop
}
_package() {
	"$scriptAbsoluteLocation" _package_rmAttachment_sequence "$@"
	rm "$scriptAbsoluteFolder"/discManager
	
	
	export ubPackage_enable_ubcp='false'
	"$scriptAbsoluteLocation" _package_procedure "$@"
	
	#export ubPackage_enable_ubcp='true'
	#"$scriptAbsoluteLocation" _package_procedure "$@"
	
	
	
	"$scriptAbsoluteLocation" _package_attachAttachment_sequence "$@"
	
	
	"$scriptAbsoluteLocation" _package_kit_sequence "$@"
	
	#mv "$scriptAbsoluteFolder"/package.tar.xz "$scriptAbsoluteFolder"/package_full.tar.xz
	#rm -f "$scriptAbsoluteFolder"/package_full.tar.xz > /dev/null 2>&1
}



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
	
	if [[ "$flipKey_headerKeyFile" == "/dev/"* ]]
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





#####Program

#Typically launches an application - ie. through virtualized container.
_launch() {
	false
	#"$@"
}

#Typically gathers command/variable scripts from other (ie. yaml) file types (ie. AppImage recipes).
_collect() {
	false
}

#Typical program entry point, absent any instancing support.
_enter() {
	_launch "$@"
}

#Typical program entry point.
_main() {
	_start
	
	_collect
	
	_enter "$@"
	
	_stop
}


_disk_declare() {
	_disk_default
	
	#_disc_bd25
	
	#_disk_usbStick128GB
	
	#_disk_zip250
	#_disk_zip100
	
	
	
	
	
	# NOTICE: Unusual. You will know if you need these.
	# (Do NOT set otherwise).
	
	# DANGER: Assumes only one Zip drive.
	#_disk_zip250_keyPartition
	#_disk_zip100_keyPartition
	
	#_disk_experimental
	#_disk_experimental_token
	
	#export flipKey_filesystem="NTFS"
	
	#export flipKey_mount="$scriptLocal"/../../fs
}






# ###
# ATTENTION: Do NOT configure beyond this point unless you thoroughly understand the basics of practical cryptography and the risks 'flipKey' is intended to reduce.
# ###


# Usually only for software development.
_disk_experimental() {
	_disk_common
	
	_touch_experimental
	
	export flipKey_headerKeyFile="$scriptLocal"/c-h-flipKey
	
	export flipKey_removable='true'
	export flipKey_physical='false'
	export flipKey_headerKeySize=3500000
	export flipKey_containerSize=80000000
	
	export flipKey_pattern_bs=3500000
	export flipKey_pattern_count=3
}

_disk_experimental_token() {
	_disk_experimental
	
	export flipKey_headerKeySize=3500000
	export flipKey_tokenID=UUID-UUID-UUID-UUID-UUID
	export flipKey_token_keyID=123456789012345678901234
}

# 'USB3 Flash Stick' 128GB 400MBs
_disk_128GB_400MBs() {
	_disk_common
	
	export flipKey_headerKeyFile="$scriptLocal"/c-h-flipKey
	export flipKey_removable='true'
	export flipKey_physical='false'
	export flipKey_headerKeySize=6000000000
	export flipKey_containerSize=112000000000
}
_disk_usbStick128GB() {
	_disk_128GB_400MBs "$@"
}

# Compatibility intended with both SSD/HDD storage, copy to BD-R(E), and backup by '_packetDisc_permanent'.
# Smaller containerSize should also be compatible.
_disc_bd25() {
	_disk_common
	
	#export flipKey_packetDisc_exhaustible=true
	
	export flipKey_headerKeyFile="$scriptLocal"/c-h-flipKey
	export flipKey_removable='true'
	export flipKey_physical='false'
	export flipKey_headerKeySize=150000000
	export flipKey_containerSize=23671095033
}
# WARNING: Untested.
_disc_bd128() {
	_disc_bd25
	
	export flipKey_headerKeySize=150000000
	export flipKey_containerSize=112000000000
}
_disc_dvdram() {
	_disc_bd25
	
	export flipKey_headerKeySize=150000000
	export flipKey_containerSize=4000000000
	
	# At least compatible with backup by '_packetDisc_permanent' in 'iso_single' mode, including redundant key, if not sufficiently small for compatibility with 'ntfs', etc.
	# DVD seems to have the unique property of 'hybrid' images created by 'iso_single' mode being copyable by MSW, allowing in principle strictly 'writeOnce' 'read only' fully compatible with MSW, even on 'rewritable' disc.
	#export flipKey_containerSize=4300000000
}


# 'Zip Superfloppy' 250MB 1MBs
_disk_250MB_1MBs() {
	_disk_common
	
	export flipKey_headerKeyFile="$scriptLocal"/c-h-flipKey
	export flipKey_removable='true'
	export flipKey_physical='true'
	export flipKey_headerKeySize=5000000
	export flipKey_containerSize=165000000
	#export flipKey_containerSize=125000000
	
	export flipKey_pattern_bs=10000000
	export flipKey_pattern_count=15
}
_disk_zip250() {
	_disk_250MB_1MBs "$@"
}


# 'Zip Superfloppy' 100MB 1MBs (albeit maybe 0.5MBs with Zip250 drive)
_disk_100MB_1MBs() {
	_disk_common
	
	export flipKey_headerKeyFile="$scriptLocal"/c-h-flipKey
	export flipKey_removable='true'
	export flipKey_physical='true'
	export flipKey_headerKeySize=5000000
	export flipKey_containerSize=50000000
	
	export flipKey_pattern_bs=10000000
	export flipKey_pattern_count=5
}
_disk_zip100() {
	_disk_100MB_1MBs "$@"
}


# 'Zip Superfloppy' with Partition 2 >=4MB for Key Storage
_disk_zip250_keyPartition() {
	_disk_250MB_1MBs
	
	# DANGER: Assumes only one Zip drive.
	export flipKey_headerKeySize=10000000
	export flipKey_headerKeyFile=$(ls -A -1 /dev/disk/by-id/usb*IOMEGA*ZIP_250*-part2 2>/dev/null | head -n 1)
	
	export flipKey_filesystem="ext4"
	#export flipKey_filesystem="btrfs"
}

# 'Zip Superfloppy' with Partition 2 >=4MB for Key Storage
_disk_zip100_keyPartition() {
	_disk_100MB_1MBs
	
	# DANGER: Assumes only one Zip drive.
	export flipKey_headerKeySize=10000000
	export flipKey_headerKeyFile=$(ls -A -1 /dev/disk/by-id/usb*IOMEGA*ZIP_250*-part2 2>/dev/null | head -n 1)
	
	export flipKey_filesystem="ext4"
}



_disc_mo128() {
	_disk_common
	
	export flipKey_headerKeyFile="$scriptLocal"/c-h-flipKey
	export flipKey_removable='true'
	export flipKey_physical='true'
	export flipKey_headerKeySize=1500000
	export flipKey_containerSize=50000000
	#export flipKey_containerSize=125000000
	
	export flipKey_pattern_bs=10000000
	export flipKey_pattern_count=2
	
	export flipKey_badblocks='true'
}
_disc_mo230() {
	_disc_mo128
	
	export flipKey_headerKeySize=1500000
	export flipKey_containerSize=100000000
	export flipKey_pattern_count=6
}
_disc_mo640() {
	_disc_mo230
	
	export flipKey_containerSize=400000000
	export flipKey_pattern_count=30
}
_disc_mo1300() {
	_disc_mo230
	
	export flipKey_containerSize=1000000000
	export flipKey_pattern_count=60
}
_disc_mo2300() {
	_disc_mo230
	
	export flipKey_containerSize=2000000000
	export flipKey_pattern_count=140
}


_disc_mo128_keyPartition() {
	_disc_mo128
	_disc_mo_keyPartition
	
	# WARNING: Magneto-Optical 128MB discs are perhaps untested and strongly discouraged, as being the smallest capacity raises the possibility of being the earliest discs with unscrutinized reliability. Insufficient space for an 'nilfs2' filesystem may also be a disadvantage.
	export flipKey_filesystem="ext4"
}
_disc_mo230_keyPartition() {
	_disc_mo230
	_disc_mo_keyPartition
}
_disc_mo640_keyPartition() {
	_disc_mo640
	_disc_mo_keyPartition
}
_disc_mo1300_keyPartition() {
	_disc_mo1300
	_disc_mo_keyPartition
}
_disc_mo2300_keyPartition() {
	_disc_mo2300
	_disc_mo_keyPartition
}


_disc_mo_keyPartition() {
	# DANGER: Assumes only one MO drive.
	export flipKey_headerKeySize=1500000
	export flipKey_headerKeyFile=$(ls -A -1 /dev/disk/by-id/usb-FUJITSU_MC?3?30??-?_????????????-0\:0-part2 2>/dev/null | head -n 1)
	
	#export flipKey_filesystem="ext4"
	#export flipKey_filesystem="btrfs"
	
	# https://en.wikipedia.org/wiki/Magneto-optical_drive
	# 'default, magneto-optical drives verify information after writing it to the disc'
	# ATTENTION: Once written to Magneto-Optical disc, data is stable. A snapshotting log filesystem (ie. nilfs2) can take advantage of the stability of written data on Magneto-Optical disc, by ensuring the most recently written consistent state is available, and attempting to temporarily keep earlier states as well.
	#export flipKey_filesystem="nilfs2"
	
	# ATTENTION: Garbage collection of 'nilfs' may be extreme in some cases, possibly indefinite, perhaps due to large files or insufficient empty space. If text files are perhaps not the sole use of the disc, 'btrfs-mix' may improve writing reliability, at the disadvantage of not having continious snapshotting (at least from some btrfs implementations).
	# https://www.reddit.com/r/btrfs/comments/o9ah4k/corruption_errors_on_single_disk_partition/
	# https://www.unixsheikh.com/articles/battle-testing-zfs-btrfs-and-mdadm-dm.html#btrfs-data-corruption-during-file-transfer
	# https://superuser.com/questions/1263600/questions-about-btrfs-data-corruption-and-snapshots
	#  Apparently seems a snapshot will preserve not merely the file but the blocks occupied by that file despite any corruption. Should allow recovery of a dusty disc by cleaning if shapshots have been used reasonably or if files have not been deleted/overwritten.
	#ls /dev/disk/by-id/usb-FUJITSU_MC?3?30??-?_????????????-0:0-part3
	#dd if=/dev/disk/by-id/usb-FUJITSU_MC?3?30??-?_????????????-0:0-part3 of=./preserve skip=100000 count=1 bs=1k
	#dd if=./preserve of=/dev/disk/by-id/usb-FUJITSU_MC?3?30??-?_????????????-0:0-part3 seek=100000 count=1 bs=1k
	#dd if=/dev/urandom of=/dev/disk/by-id/usb-FUJITSU_MC?3?30??-?_????????????-0:0-part3 seek=100000 count=1 bs=1k
	export flipKey_filesystem="btrfs-mix"
}




# WARNING: Microdrives may not be reliable. A thermal failure mode seems highly possible. Especially, reading/writing a full disk of data may be unsafe, or inopportune power cycling may cause internal processor damage (similar to sdcard).
_disk_u2500() {
	_disk_common
	
	export flipKey_headerKeyFile="$scriptLocal"/c-h-flipKey
	export flipKey_removable='true'
	export flipKey_physical='true'
	export flipKey_headerKeySize=20000000
	export flipKey_containerSize=1500000000
	
	export flipKey_pattern_bs=100000000
	export flipKey_pattern_count=8
}
_disk_u4000() {
	_disk_u2500
	
	export flipKey_headerKeySize=20000000
	export flipKey_containerSize=3000000000
	export flipKey_pattern_count=16
}
_disk_u2500_keyPartition() {
	_disk_u2500
	_disk_u_keyPartition
}
_disk_u4000_keyPartition() {
	_disk_u4000
	_disk_u_keyPartition
}
_disk_u_keyPartition() {
	# DANGER: Small chance *any* 'USB Mass Storage Device' may be regarded as such - make sure a uDrive and ONLY a uDrive is connected by USB (ie. NOT any 'USB flash drive').
	export flipKey_headerKeySize=20000000
	export flipKey_headerKeyFile=$(ls -A -1 /dev/disk/by-id/usb-USB_Mass_Storage_Device_????????????-*-part2 2>/dev/null | head -n 1)
	
	export flipKey_filesystem="ext4"
	#export flipKey_filesystem="btrfs"
}






# WARNING: Inefficient, may not have 'snapshotting'/'undelete', may reduce reliability, may impose substantial wear on drive.
# Better to create through 'shm' 'ramdrive', copy files, and then 'backup' to a '_packetDisc_permanent', rather than to create directly within another flipKey container on a disc as may be implied by 'nested'.
_disc_nested56() {
	_disk_common
	
	export flipKey_headerKeyFile="$scriptLocal"/c-h-flipKey
	export flipKey_removable='true'
	export flipKey_physical='true'
	export flipKey_headerKeySize=3500000
	export flipKey_containerSize=56000000
	
	export flipKey_pattern_bs=1000000
	export flipKey_pattern_count=2
	
	export flipKey_badblocks='false'
	
	export flipKey_filesystem="btrfs-mix"
	
	
	# Although not necessarily exactly accurate, 'nested' usually implies similar, if not exactly same, constraints.
	export flipKey_packetDisc_exhaustible="true"
}
_disc_nested448() {
	_disc_nested56
	
	export flipKey_headerKeySize=24000000
	export flipKey_containerSize=448000000
	
	export flipKey_filesystem="btrfs-mix"
}
_disc_nested1920() {
	_disc_nested56
	
	export flipKey_headerKeySize=32000000
	export flipKey_containerSize=1920000000
	
	export flipKey_filesystem="btrfs-mix"
}


_disk_common() {
	export flipKey_headerKeyFile="$scriptLocal"/c-h-flipKey
	export flipKey_removable='false'
	export flipKey_physical='false'
	export flipKey_headerKeySize=1800000000
	export flipKey_containerSize=12000000000

	if [[ "$flipKey_mount" != "$flipKey_mount_temp" ]] && [[ "$flipKey_functions_fsTemp" == '' ]]
	then
		export flipKey_mount="$scriptLocal"/fs
		#export flipKey_mount="$scriptLocal"/../../../fs
	fi

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


_disk_default() {
	#_disk_common
	#_disk_experimental
	_disc_bd25
}

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
	
	[[ "$flipKey_headerKeyFile" != "/dev/"* ]] && [[ $(cat "$flipKey_headerKeyFile" | wc -c | tr -dc '0-9') != "$flipKey_headerKeySize" ]] && _messagePlain_bad 'fail: create: size' && return 1
	
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
		
		if [[ "$flipKey_container" != "/dev"* ]]
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
	
	[[ "$flipKey_headerKeyFile" != "/dev/"* ]] && [[ $(cat "$flipKey_headerKeyFile" | wc -c | tr -dc '0-9') != "$flipKey_headerKeySize" ]] && _messagePlain_bad 'fail: size' && return 1
	
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
	
	#[[ "$flipKey_headerKeyFile" != "/dev/"* ]] && [[ $(cat "$flipKey_headerKeyFile" | wc -c | tr -dc '0-9') != "$flipKey_headerKeySize" ]] && _messagePlain_bad 'fail: size' && return 1
	
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



_set_occasional_read_redundant_headerKey_fsTemp() {
	export flipKey_headerKeyFile="$flipKey_headerKey_temp01_devFile"
	
	# https://unix.stackexchange.com/questions/538397/how-to-run-a-command-1-out-of-n-times-in-bash
	[ "$RANDOM" -lt 6554 ] && export flipKey_headerKeyFile="$flipKey_headerKey_temp02_devFile"
}



_z__grab_fsTemp() {
	echo 'fs: temp: '${FUNCNAME[0]}
	export flipKey_mount="$flipKey_mount_temp"
	export flipKey_functions_fsTemp='true'
	export flipKey_filesystem="btrfs-dup"
	__grab() {
		_veracrypt_mount
	}
	
	_set_occasional_read_redundant_headerKey_fsTemp
	export flipKey_container="$flipKey_container_temp01_devFile"
	
	
	__grab "$@"
}
_z__toss_fsTemp() {
	echo 'fs: temp: '${FUNCNAME[0]}
	export flipKey_mount="$flipKey_mount_temp"
	export flipKey_functions_fsTemp='true'
	export flipKey_filesystem="btrfs-dup"
	__toss() {
		_veracrypt_unmount
	}
	
	_set_occasional_read_redundant_headerKey_fsTemp
	export flipKey_container="$flipKey_container_temp01_devFile"
	
	
	__toss "$@"
}
_zz_zzCreate_fsTemp() {
	echo 'fs: temp: '${FUNCNAME[0]}
	export flipKey_mount="$flipKey_mount_temp"
	export flipKey_functions_fsTemp='true'
	export flipKey_filesystem="btrfs-dup"
	__create() {
		_generate
		_veracrypt_create
	}
	
	export flipKey_headerKeyFile="$flipKey_headerKey_temp01_devFile"
	export flipKey_container="$flipKey_container_temp01_devFile"
	
	_disk_declare
	_check_keyPartition
	_delay_exists_mount
	
	
	
	export flipKey_headerKeyFile="$flipKey_headerKey_temp02_devFile"
	_sweep-flipKey "$flipKey_headerKeyFile"
	
	export flipKey_headerKeyFile="$flipKey_headerKey_temp01_devFile"
	_sweep-flipKey "$flipKey_headerKeyFile"
	
	
	
	__create "$@"
	
	echo 'fs: temp: redundancy: key'
	sudo -n dd if="$flipKey_headerKey_temp01_devFile" of="$flipKey_headerKey_temp02_devFile" bs=128K
}





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
	sudo -n mkdir -p "$flipKey_mount"
	
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
	
	local currentFillPath
	currentFillPath="$scriptLocal"/fill
	[[ "$flipKey_fillPath" != "" ]] && currentFillPath="$flipKey_fillPath"
	[[ "$1" != "" ]] && currentFillPath="$1"
	
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















___btrfs_balance() {
	_disk_declare
	
	sudo -n btrfs balance start --full-balance -v "$flipKey_mount"
	
	sleep 3
}

___btrfs_defrag() {
	_disk_declare
	
	sudo -n btrfs filesystem defragment -r "$flipKey_mount"
	
	sleep 3
}


___btrfs_scrub_start() {
	_disk_declare
	
	sudo -n btrfs scrub start -r "$flipKey_mount"
	
	sleep 20
}

___btrfs_scrub_status() {
	_disk_declare
	
	sudo -n btrfs scrub status "$flipKey_mount"
	
	sleep 20
}


___btrfs_snapshot() {
	_disk_declare
	
	mkdir -p "$flipKey_mount"/.snapshots/ > /dev/null 2>&1
	sudo -n mkdir -p "$flipKey_mount"/.snapshots/
	
	sudo -n btrfs subvolume snapshot -r "$flipKey_mount" "$flipKey_mount"/.snapshots/$(date +%Y_%m_%d_%s%N | cut -b1-24)
	
	echo "$flipKey_mount"/.snapshots/$(date +%Y_%m_%d_%s%N | cut -b1-24)
	
	sleep 3
}

# WARNING: Deletes all snapsots.
___btrfs_gc() {
	_disk_declare
	
	sudo -n btrfs subvolume delete "$flipKey_mount"/.snapshots/*
	
	rmdir "$flipKey_mount"/.snapshots/ > /dev/null 2>&1
	[[ -e "$flipKey_mount"/.snapshots/ ]] && sudo -n rmdir "$flipKey_mount"/.snapshots/
	
	sleep 3
}
___btrfs_snapshot_gc() {
	___btrfs_gc "$@"
}

___btrfs_compsize() {
	_disk_declare
	
	sudo -n compsize "$flipKey_mount"
	
	sleep 20
}

















#currentReversePort=""
#currentMatchingReversePorts=""
#currentReversePortOffset=""
#matchingOffsetPorts=""
#matchingReversePorts=""
#matchingEMBEDDED=""

#Creates "${matchingOffsetPorts}[@]" from "${matchingReversePorts}[@]".
#Intended for public server tunneling (ie. HTTPS).
# ATTENTION: Overload with 'ops' .
_offset_reversePorts() {
	local currentReversePort
	local currentMatchingReversePorts
	local currentReversePortOffset
	for currentReversePort in "${matchingReversePorts[@]}"
	do
		let currentReversePortOffset="$currentReversePort"+100
		currentMatchingReversePorts+=( "$currentReversePortOffset" )
	done
	matchingOffsetPorts=("${currentMatchingReversePorts[@]}")
	export matchingOffsetPorts
}


#####Network Specific Variables
#Statically embedded into monolithic ubiquitous_bash.sh/cautossh script by compile .

# WARNING Must use unique netName!
export netName=default
export gatewayName=gtw-"$netName"-"$netName"
export LOCALSSHPORT=22


#Optional equivalent to LOCALSSHPORT, also respected for tunneling ports from other services.
export LOCALLISTENPORT="$LOCALSSHPORT"

# ATTENTION: Mostly future proofing. Due to placement of autossh within a 'while true' loop, associated environment variables are expected to have minimal, if any, effect.
#Poll time must be double network timeouts.
export AUTOSSH_FIRST_POLL=45
export AUTOSSH_POLL=45
#export AUTOSSH_GATETIME=0
export AUTOSSH_GATETIME=15
#export AUTOSSH_PORT=0
#export AUTOSSH_DEBUG=1
#export AUTOSSH_LOGLEVEL=7

_get_reversePorts() {
	export matchingReversePorts
	matchingReversePorts=()
	export matchingEMBEDDED="false"

	local matched

	local testHostname
	testHostname="$1"
	[[ "$testHostname" == "" ]] && testHostname=$(hostname -s)

	if [[ "$testHostname" == 'hostnameA' ]] || [[ "$testHostname" == 'hostnameB' ]] || [[ "$testHostname" == '*' ]]
	then
		matchingReversePorts+=( '20001' )
		matched='true'
	fi
	if [[ "$testHostname" == 'hostnameC' ]] || [[ "$testHostname" == 'hostnameD' ]] || [[ "$testHostname" == '*' ]]
	then
		matchingReversePorts+=( '20002' )
		export matchingEMBEDDED='true'
		matched='true'
	fi
	if ! [[ "$matched" == 'true' ]] || [[ "$testHostname" == '*' ]]
	then
		matchingReversePorts+=( '20003' )
	fi

	export matchingReversePorts
}
_get_reversePorts
export reversePorts=("${matchingReversePorts[@]}")
export EMBEDDED="$matchingEMBEDDED"

_offset_reversePorts
export matchingOffsetPorts

export keepKeys_SSH='true'


_generate_lean-lib-python_here() {
	cat << 'CZXWXcRMTo8EmM8i4d'

# https://stackoverflow.com/questions/44834/can-someone-explain-all-in-python

# https://bruxy.regnet.cz/programming/bash-python/workshop_bash-python-en.html
# https://www.geeksforgeeks.org/how-to-run-bash-script-in-python/
# https://softwareengineering.stackexchange.com/questions/207613/encoding-a-bash-script-for-use-in-python

# https://www.codementor.io/@arpitbhayani/personalize-your-python-prompt-13ts4kw6za

# https://kimsereylam.com/python/2020/02/07/improve-your-python-shell-with-pythonrc.html




#os.system("python --version")
#print (sys.version_info)



#os.system("ubiquitous_bash.sh _getAbsoluteFolder .")



# https://www.geeksforgeeks.org/how-to-pass-multiple-arguments-to-function/

#def _bin(currentArgumentsString):
#	os.system("ubiquitous_bash.sh _bin " + currentArgumentsString)

#_bin("_getAbsoluteFolder .")

#_bin("_scope .")

#_bin("_bash -i")



#def _bash():
#	os.system("ubiquitous_bash.sh _bin _bash -i ")

#def _bash():
#	os.system("$HOME/.ubcore/ubiquitous_bash/ubcore.sh _bash -i ")

#_bash()





########################################


# WARNING: Python API documentation suggests significant possibility of incompatibility (perhaps return object type) 'if sys.hexversion < 0x03060000' or 'if sys.hexversion < 0x03000000'.
# CAUTION: Python API version compatibility may or may not be strictly enforced, due to lack of known failures, and/or usual expectations of problems from the multiple ways of doing things.
# Apparently reasonable expectations confirmed by exhaustive research may be met if python version is at least >0x20710f0 and <0x30703f0 .
#import sys
#if sys.hexversion < 0x03060000:
# https://stackoverflow.com/questions/446052/how-can-i-check-for-python-version-in-a-program-that-uses-new-language-features
#	exit(1)


#_messagePlain_request( 'request: user please install...' )
def _messagePlain_request(currentMessage = '', currentContext = '(python)'):
	print ( '\x01\033[0;35;47m\x02' + currentContext + '\x01\033[0m\x02' + '\x01\033[0;35m\x02 ' + currentMessage + ' \x01\033[0m\x02' )

#_messagePlain_nominal( 'init: _function' )
def _messagePlain_nominal(currentMessage = '', currentContext = '(python)'):
	print ( '\x01\033[0;35;47m\x02' + currentContext + '\x01\033[0m\x02' + '\x01\033[0;36m\x02 ' + currentMessage + ' \x01\033[0m\x02' )

#_messagePlain_probe( '_messagePlain_probe ( \'_messagePlain_probe\' ) ' )
def _messagePlain_probe(currentMessage = '', currentContext = '(python)'):
	print ( '\x01\033[0;35;47m\x02' + currentContext + '\x01\033[0m\x02' + '\x01\033[0;34m\x02 ' + currentMessage + ' \x01\033[0m\x02' )

#_messagePlain_good( 'good: success' )
def _messagePlain_good(currentMessage = '', currentContext = '(python)'):
	print ( '\x01\033[0;35;47m\x02' + currentContext + '\x01\033[0m\x02' + '\x01\033[0;32m\x02 ' + currentMessage + ' \x01\033[0m\x02' )

#_messagePlain_warn( 'warn: workaround' )
def _messagePlain_warn(currentMessage = '', currentContext = '(python)'):
	print ( '\x01\033[0;35;47m\x02' + currentContext + '\x01\033[0m\x02' + '\x01\033[1;33m\x02 ' + currentMessage + ' \x01\033[0m\x02' )

#_messagePlain_bad( 'bad: fail: missing' )
def _messagePlain_bad(currentMessage = '', currentContext = '(python)'):
	print ( '\x01\033[0;35;47m\x02' + currentContext + '\x01\033[0m\x02' + '\x01\033[0;31m\x02 ' + currentMessage + ' \x01\033[0m\x02' )

#_messageNormal( '_function_sequence: Stop' )
def _messageNormal(currentMessage = '', currentContext = '(python)'):
	print ( '\x01\033[0;35;47m\x02' + currentContext + '\x01\033[0m\x02' + '\x01\033[1;32;46m\x02 ' + currentMessage + ' \x01\033[0m\x02' )

#_messageError( 'FAIL: unknown app failure' )
def _messageERROR(currentMessage = '', currentContext = '(python)'):
	print ( '\x01\033[0;35;47m\x02' + currentContext + '\x01\033[0m\x02' + '\x01\033[1;33;41m\x02 ' + currentMessage + ' \x01\033[0m\x02' )


#_messageNormal( '_function_sequence: Start' )

#_messagePlain_nominal( 'init: _function' )
#_messagePlain_request( 'request: user please install...' )
#_messagePlain_probe( '_messagePlain_probe ( \'_messagePlain_probe\' ) ' )

#_messagePlain_good( 'good: success' )
#_messagePlain_warn( 'warn: workaround' )
#_messagePlain_bad( 'bad: fail: missing' )

#_messageERROR( 'FAIL: unknown app failure' )

#_messageNormal( '_function_sequence: Stop' )







import sys
# https://stackoverflow.com/questions/446052/how-can-i-check-for-python-version-in-a-program-that-uses-new-language-features
#if sys.hexversion < 0x03060000:
#	exit(1)
import string
import subprocess
import os
# WARNING: Procedures exclusively relying on python code are NOT intended or expected to be robust. Instead use '_getScriptAbsoluteLocation' within 'ubiquitous_bash.sh' as able.
# WARNING: Whether '__file__' has similar characteristics to "$0" as used within 'ubiquitous_bash' in all relevant cases is NOT determined and is NOT to be relied upon.
# WARNING: Historically 'python' has NOT had the API stability, reliability, or portability of 'bash'.
# https://stackoverflow.com/questions/4934806/how-can-i-find-scripts-directory
# https://stackoverflow.com/questions/3503879/assign-output-of-os-system-to-a-variable-and-prevent-it-from-being-displayed-on
#currentPathCheck = subprocess.Popen(['/bin/bash', '--noprofile', '--norc', '-c', 'type -p ubiquitous_bash.sh'], stdout=subprocess.PIPE, universal_newlines=True)
#print(os.path.dirname(os.path.realpath(__file__)))
#print(sys.path[0])
#os.path.abspath(os.path.dirname(os.path.realpath(__file__))).rstrip('\n')
#if True:
#currentProc = subprocess.Popen(['/bin/bash', '-c', 'ubiquitous_bash.sh _getAbsoluteFolder ' + __file__], stdout=subprocess.PIPE, universal_newlines=True)
#currentProc = subprocess.Popen(['/bin/bash', '--noprofile', '--norc', '-c', 'ubiquitous_bash.sh _getAbsoluteFolder ' + __file__], stdout=subprocess.PIPE, universal_newlines=True)
#currentProc = subprocess.Popen(['ubiquitous_bash.sh', '_getAbsoluteFolder', __file__], stdout=subprocess.PIPE, universal_newlines=True)
def _getScriptAbsoluteFolder():
	currentPathCheck = subprocess.Popen(['/bin/bash', '-c', 'type -p ubiquitous_bash.sh'], stdout=subprocess.PIPE, universal_newlines=True)
	currentPathCheck.communicate()
	currentPathCheck.wait()
	if currentPathCheck.returncode == 0:
		currentProc = subprocess.Popen(['ubiquitous_bash.sh', '_getAbsoluteFolder', __file__], stdout=subprocess.PIPE, universal_newlines=True)
		(currentOut, currentErr) = currentProc.communicate()
		currentProc.wait()
		currentOut = currentOut.rstrip('\n')
		return(currentOut.rstrip('\n'))
	else:
		return(os.path.abspath(os.path.dirname(os.path.realpath(__file__))).rstrip('\n'))

#print(_getScriptAbsoluteFolder())










import sys
#if sys.hexversion < 0x03060000:
#	exit(1)
import string
import subprocess
import os
#
#_bash()
# WARNING: CAUTION: DANGER: Beware '_getScriptAbsoluteLocation' will NOT be set correctly!
#_bash(['-c', '_getScriptAbsoluteLocation'], True, os.path.expanduser("~/core/infrastructure/ubiquitous_bash/ubiquitous_bash.sh"))
#_bash("-c '_getScriptAbsoluteLocation'", True, os.path.expanduser("~/core/infrastructure/ubiquitous_bash/ubiquitous_bash.sh"))
#
#_bash(['-c', 'echo test', 'xyz'])
#print(_bash(['-c', 'echo test', 'xyz'], False))
#print(_bash(['-c', '_false'], False))
#print(_bash(['-c', '_false'], False)[1])
#
#_bash('-i')
#_bash("-c '/bin/echo true'")
#_bash("-c 'echo true'")
# https://stackoverflow.com/questions/38821586/one-line-to-check-if-string-or-list-then-convert-to-list-in-python
# https://stackoverflow.com/questions/23883394/detect-if-python-script-is-run-from-an-ipython-shell-or-run-from-the-command-li
#sys.argv[1]
#os.system("$HOME/.ubcore/ubiquitous_bash/ubcore.sh _bash -i ")
#currentArguments = [currentArguments] if isinstance(currentArguments, str) else currentArguments
#print(['ubiquitous_bash.sh', '_bash'] + currentArguments)
def _bash(currentArguments = ['-i'], currentPrint = False, current_ubiquitous_bash = "ubiquitous_bash.sh"):
	if current_ubiquitous_bash == "ubiquitous_bash.sh":
		if os.path.exists(os.environ['HOME'] + "/.ubcore/ubiquitous_bash/ubcore.sh"):
			current_ubiquitous_bash = (os.environ['HOME'] + "/.ubcore/ubiquitous_bash/ubcore.sh")
	if current_ubiquitous_bash == "ubiquitous_bash.sh":
		if os.path.exists("/cygdrive/c/core/infrastructure/ubiquitous_bash/ubcore.sh"):
			current_ubiquitous_bash = "/cygdrive/c/core/infrastructure/ubiquitous_bash/ubcore.sh"
	if current_ubiquitous_bash == "ubiquitous_bash.sh":
		if os.path.exists("/cygdrive/c/core/infrastructure/lean/lean.sh"):
			current_ubiquitous_bash = "/cygdrive/c/core/infrastructure/lean/lean.sh"
	currentArguments = ['-i'] if currentArguments == '-i' else currentArguments
	if isinstance(currentArguments, str):
		# WARNING: Discouraged.
		if not currentArguments == '-i':
			currentProc = subprocess.Popen(current_ubiquitous_bash + " _bash " + currentArguments, stdout=subprocess.PIPE, universal_newlines=True, shell=True)
			(currentOut, currentErr) = currentProc.communicate()
			currentProc.wait()
			currentOut = currentOut.rstrip('\n')
			if currentPrint == True:
				print(currentOut)
				return (currentOut), currentProc.returncode
		else:
			currentProc = subprocess.Popen(current_ubiquitous_bash + " _bash " + currentArguments, universal_newlines=True, shell=True)
			(currentOut, currentErr) = currentProc.communicate()
			currentProc.wait()
		return (currentOut), currentProc.returncode
	else:
		if not currentArguments == ['-i']:
			currentArguments = [currentArguments] if isinstance(currentArguments, str) else currentArguments
			currentProc = subprocess.Popen([current_ubiquitous_bash, '_bash'] + currentArguments, stdout=subprocess.PIPE, universal_newlines=True)
			(currentOut, currentErr) = currentProc.communicate()
			currentProc.wait()
			currentOut = currentOut.rstrip('\n')
			if currentPrint == True:
				print(currentOut)
				return (currentOut), currentProc.returncode
		else:
			currentArguments = [currentArguments] if isinstance(currentArguments, str) else currentArguments
			currentProc = subprocess.Popen([current_ubiquitous_bash, '_bash'] + currentArguments, universal_newlines=True)
			(currentOut, currentErr) = currentProc.communicate()
			currentProc.wait()
		return (currentOut), currentProc.returncode





import sys
#if sys.hexversion < 0x03060000:
#	exit(1)
import string
import subprocess
import os
#
#_bin(['/bin/bash', '-i'])
#_bin(['_getScriptAbsoluteLocation'], True, os.path.expanduser("~/core/infrastructure/ubiquitous_bash/ubiquitous_bash.sh"))
#_bin(['_getScriptAbsoluteLocation'], True)
#_bin(['echo', 'test'], True, os.path.expanduser("~/core/infrastructure/ubiquitous_bash/ubiquitous_bash.sh"))
#print(_bin(['_false'], False, os.path.expanduser("~/core/infrastructure/ubiquitous_bash/ubiquitous_bash.sh"))[1])
#
#_bin('_true')
#_bin('_echo test')
#_bin('_bash')
#print( _bin('_false', False)[1] )
#_bin("_getScriptAbsoluteLocation", True, os.path.expanduser("~/core/infrastructure/ubiquitous_bash/ubiquitous_bash.sh"))
def _bin(currentArguments = [''], currentPrint = False, current_ubiquitous_bash = "ubiquitous_bash.sh"):
	if current_ubiquitous_bash == "ubiquitous_bash.sh":
		if os.path.exists(os.environ['HOME'] + "/.ubcore/ubiquitous_bash/ubcore.sh"):
			current_ubiquitous_bash = (os.environ['HOME'] + "/.ubcore/ubiquitous_bash/ubcore.sh")
	if current_ubiquitous_bash == "ubiquitous_bash.sh":
		if os.path.exists("/cygdrive/c/core/infrastructure/ubiquitous_bash/ubcore.sh"):
			current_ubiquitous_bash = "/cygdrive/c/core/infrastructure/ubiquitous_bash/ubcore.sh"
	if current_ubiquitous_bash == "ubiquitous_bash.sh":
		if os.path.exists("/cygdrive/c/core/infrastructure/lean/lean.sh"):
			current_ubiquitous_bash = "/cygdrive/c/core/infrastructure/lean/lean.sh"
	currentArguments = [''] if currentArguments == '' else currentArguments
	if isinstance(currentArguments, str):
		# WARNING: Discouraged.
		if not ( ( currentArguments == '/bin/bash -i' ) or ( currentArguments == '/bin/bash' ) ):
			currentProc = subprocess.Popen(current_ubiquitous_bash + " _bin " + currentArguments, stdout=subprocess.PIPE, universal_newlines=True, shell=True)
			(currentOut, currentErr) = currentProc.communicate()
			currentProc.wait()
			currentOut = currentOut.rstrip('\n')
			if currentPrint == True:
				print(currentOut)
				return (currentOut), currentProc.returncode
		else:
			currentProc = subprocess.Popen(current_ubiquitous_bash + " _bin " + currentArguments, universal_newlines=True, shell=True)
			(currentOut, currentErr) = currentProc.communicate()
			currentProc.wait()
		return (currentOut), currentProc.returncode
	else:
		if not (  ( currentArguments == ['/bin/bash', '-i'] ) or ( currentArguments == ['/bin/bash'] ) or ( currentArguments == ['_qalculate', ''] ) or ( currentArguments == ['_qalculate'] ) or ( currentArguments == ['_octave', ''] ) or ( currentArguments == ['_octave'] )  ):
			currentArguments = [currentArguments] if isinstance(currentArguments, str) else currentArguments
			currentProc = subprocess.Popen([current_ubiquitous_bash, '_bin'] + currentArguments, stdout=subprocess.PIPE, universal_newlines=True)
			(currentOut, currentErr) = currentProc.communicate()
			currentProc.wait()
			currentOut = currentOut.rstrip('\n')
			if currentPrint == True:
				print(currentOut)
				return (currentOut), currentProc.returncode
		else:
			currentArguments = [currentArguments] if isinstance(currentArguments, str) else currentArguments
			currentProc = subprocess.Popen([current_ubiquitous_bash, '_bin'] + currentArguments, universal_newlines=True)
			(currentOut, currentErr) = currentProc.communicate()
			currentProc.wait()
		return (currentOut), currentProc.returncode

# ATTENTION: Only intended for indirect calls.
# https://stackoverflow.com/questions/5067604/determine-function-name-from-within-that-function-without-using-traceback
#	'there aren't enough important use cases given'
# https://www.tutorialspoint.com/How-can-I-remove-the-ANSI-escape-sequences-from-a-string-in-python
# https://docs.python.org/3/library/re.html
#return _bin(currentCommand + currentArguments + currentString, currentPrint)[0]
#return re.sub(r'(\x9B|\x1B\[)[0-?]*[ -\/]*[@-~]', '', _bin(currentCommand + currentArguments + currentString, currentPrint)[0])
def _bin_stringAfterArgs(currentString = [], currentArguments = [], currentPrint = False, currentCommand = ['_false']):
	currentString = [currentString] if isinstance(currentString, str) else currentString
	currentArguments = [currentArguments] if isinstance(currentArguments, str) else currentArguments
	if currentPrint:
		return _bin(currentCommand + currentArguments + currentString, currentPrint)
	else:
		return re.sub(r'\n', '', re.sub(r'(\x9B|\x1B\[)[0-?]*[ -\/]*[@-~]', '', _bin(currentCommand + currentArguments + currentString, currentPrint)[0]))

#def _bash(currentArguments = [''], currentPrint = True, current_ubiquitous_bash = "ubiquitous_bash.sh"):
#	_bin(['/bin/bash', '-i'])



#if sys.hexversion < 0x03000000:
#	exit(1)
#_bin_alias = _bin


#_clc('1 + 2')
#_qalculate('1 + 2')
#_octave('1 + 2')
#print(_octave_solve('(y == x * 2, x)' ))

def _clc(currentString = [], currentArguments = [], currentPrint = False, currentCommand = ['_clc']):
	return _bin_stringAfterArgs(currentString, currentArguments, currentPrint, currentCommand)

def clc(currentString = [], currentArguments = [], currentPrint = False, currentCommand = ['clc']):
	return _bin_stringAfterArgs(currentString, currentArguments, currentPrint, currentCommand)

def c(currentString = [], currentArguments = [], currentPrint = False, currentCommand = ['c']):
	return _bin_stringAfterArgs(currentString, currentArguments, currentPrint, currentCommand)

def _solve(currentString = [], currentArguments = [], currentPrint = False, currentCommand = ['_solve']):
	return _bin_stringAfterArgs(currentString, currentArguments, currentPrint, currentCommand)

def solve(currentString = [], currentArguments = [], currentPrint = False, currentCommand = ['solve']):
	return _bin_stringAfterArgs(currentString, currentArguments, currentPrint, currentCommand)

def nsolve(currentString = [], currentArguments = [], currentPrint = False, currentCommand = ['nsolve']):
	return _bin_stringAfterArgs(currentString, currentArguments, currentPrint, currentCommand)

def _qalculate_solve(currentString = [], currentArguments = [], currentPrint = False, currentCommand = ['_qalculate_solve']):
	return _bin_stringAfterArgs(currentString, currentArguments, currentPrint, currentCommand)

def _qalculate_nsolve(currentString = [], currentArguments = [], currentPrint = False, currentCommand = ['_qalculate_nsolve']):
	return _bin_stringAfterArgs(currentString, currentArguments, currentPrint, currentCommand)

def _octave_solve(currentString = [], currentArguments = [], currentPrint = False, currentCommand = ['_octave_solve']):
	return _bin_stringAfterArgs(currentString, currentArguments, currentPrint, currentCommand)

def _octave_nsolve(currentString = [], currentArguments = [], currentPrint = False, currentCommand = ['_octave_nsolve']):
	return _bin_stringAfterArgs(currentString, currentArguments, currentPrint, currentCommand)


def _qalculate(currentString = [], currentArguments = [], currentPrint = False, currentCommand = ['_qalculate']):
	return _bin_stringAfterArgs(currentString, currentArguments, currentPrint, currentCommand)

def _octave(currentString = [], currentArguments = [], currentPrint = False, currentCommand = ['_octave']):
	return _bin_stringAfterArgs(currentString, currentArguments, currentPrint, currentCommand)








import readline # optional, will allow Up/Down/History in the console
import code
#_python()
# https://stackoverflow.com/questions/5597836/embed-create-an-interactive-python-shell-inside-a-python-program
def _python():
	variables = globals().copy()
	variables.update(locals())
	shell = code.InteractiveConsole(variables)
	shell.interact()



import sys
import os
import socket
import string
import re
#if sys.hexversion < 0x03060000:
#	exit(1)
# https://www.codementor.io/@arpitbhayani/personalize-your-python-prompt-13ts4kw6za
# https://stackoverflow.com/questions/4271740/how-can-i-use-python-to-get-the-system-hostname
# https://bugs.python.org/issue20359
#os.environ['PWD']
#os.path.expanduser(os.getcwd())
#\033[0;35;47mpython-%d\033[0m
#return "\033[92mIn [%d]:\033[0m " % (self.line)
#return ">>> "
#return "\033[1;94m|\033[91m#:\033[1;93m%s\033[1;92m@%s\033[1;94m)-%s(\033[1;95m\033[0;35;47mpython-%s\033[0m\033[1;94m)\033[1;96m|\n\033[1;94m|\033[1;97m[%s]\n\033[1;94m|\033[1;96m%d\033[1;94m) \033[1;96m>\033[0m " % (os.environ['USER'], socket.gethostname(), os.environ.get('prompt_cloudNetName', ''), hex(sys.hexversion), re.sub('^%s' % os.environ['HOME'], '~', os.path.expanduser(os.getcwd()) ), self.line)
#return "\033[1;94m|\033[91m#:\033[1;93m%s\033[1;92m@%s\033[1;94m)-%s(\033[1;95m\033[0;35;47mpython-%s\033[0m\033[1;94m)\033[1;96m|\n\033[1;94m|\033[1;97m[%s]\n\033[1;94m|%d\033[1;94m) \033[1;96m>\033[0m " % (os.environ['USER'], socket.gethostname(), os.environ.get('prompt_cloudNetName', ''), hex(sys.hexversion), re.sub('^%s' % os.environ['HOME'], '~', os.path.expanduser(os.getcwd()) ), self.line)
class ubPythonPS1(object):
	def __init__(self):
		self.line = 0

	def __str__(self):
		self.line += 1
		if self.line == 1:
			return "\x01\033[1;94m\x02|\x01\033[91m\x02#:\x01\033[1;93m\x02%s\x01\033[1;92m\x02@%s\x01\033[1;94m\x02)-%s(\x01\033[1;95m\x02\x01\033[0;35;47m\x02python-%s\x01\033[0m\x02\x01\033[1;94m\x02)\x01\033[1;96m\x02|\n\x01\033[1;94m\x02|\x01\033[1;97m\x02[%s]\n\x01\033[1;94m\x02|\x01\033[1;96m\x02%d\x01\033[1;94m\x02) \x01\033[1;96m\x02>\x01\033[0m\x02 " % (os.environ['USER'], socket.gethostname(), os.environ.get('prompt_cloudNetName', ''), hex(sys.hexversion), re.sub('^%s' % os.environ['HOME'], '~', os.path.expanduser(os.getcwd()) ), self.line)
		else:
			return "\x01\033[1;94m\x02|\x01\033[91m\x02#:\x01\033[1;93m\x02%s\x01\033[1;92m\x02@%s\x01\033[1;94m\x02)-%s(\x01\033[1;95m\x02\x01\033[0;35;47m\x02python-%s\x01\033[0m\x02\x01\033[1;94m\x02)\x01\033[1;96m\x02|\n\x01\033[1;94m\x02|\x01\033[1;97m\x02[%s]\n\x01\033[1;94m\x02|%d\x01\033[1;94m\x02) \x01\033[1;96m\x02>\x01\033[0m\x02 " % (os.environ['USER'], socket.gethostname(), os.environ.get('prompt_cloudNetName', ''), hex(sys.hexversion), re.sub('^%s' % os.environ['HOME'], '~', os.path.expanduser(os.getcwd()) ), self.line)

sys.ps1 = ubPythonPS1()
sys.ps2 = "\x01\033[0;96m\x02|...\x01\033[0m\x02 "




#_python()





CZXWXcRMTo8EmM8i4d
}


_generate_lean-overrides-python_here() {
	cat << 'CZXWXcRMTo8EmM8i4d'










#################################################
# ATTENTION: Add '_prog' script code here!







def _main():
	pass


















# ATTENTION: Add '_prog' script code here!
#################################################


import sys
if sys.hexversion > 0x03000000:
	exec('_print = print')

import sys
import string
#./lean.py "_python(c('1 + 2'))"
#./lean.py "_print(c('1 + 2'))"
#./lean.py "print(c('1 + 2'))"
# https://www.tutorialspoint.com/python/python_command_line_arguments.htm
# https://www.programiz.com/python-programming/methods/built-in/exec
# https://www.geeksforgeeks.org/python-program-to-convert-a-list-to-string/
# https://www.geeksforgeeks.org/python-removing-first-element-of-list/
#print ( 'Argument List:', str(sys.argv) )
#eval( sys.argv[1] + ' ' + ' '.join( sys.argv[2:] ) )
#exec( sys.argv[1] )
#if (1 in sys.argv):
if len(sys.argv) > 1:
	if ( sys.argv[1].startswith('_') ) or ( sys.argv[1].startswith('print') ) :
		exec( sys.argv[1] )











_main()



CZXWXcRMTo8EmM8i4d
}




_generate_lean-python_prog() {
	[[ "$objectName" == "ubiquitous_bash" ]] && return 0
	
	return 1
}

_generate_lean-python() {
	! _generate_lean-python_prog && return 0
	
	echo '#!/usr/bin/env python3' > "$scriptAbsoluteFolder"/lean.py
	
	_generate_lean-lib-python_here "$@" >> "$scriptAbsoluteFolder"/lean.py
	
	_generate_lean-overrides-python_here "$@" >> "$scriptAbsoluteFolder"/lean.py
	
	chmod u+x "$scriptAbsoluteFolder"/lean.py
}






# 
# _python_hook_here() {
# 	cat << CZXWXcRMTo8EmM8i4d
# 	
# 	_setupUbiquitous_accessories_here-python_hook
# 	
# CZXWXcRMTo8EmM8i4d
# }
# 
# 
# _python_hook() {
# 	_messageNormal "init: _python_hook"
# 	local ubHome
# 	ubHome="$HOME"
# 	[[ "$1" != "" ]] && ubHome="$1"
# 	
# 	export ubcoreDir="$ubHome"/.ubcore
# 	
# 	_python_hook_here > "$ubcoreDir"/python_bash_rc
# }
# 
































_findUbiquitous() {
	export ubiquitousLibDir="$scriptAbsoluteFolder"
	export ubiquitiousLibDir="$ubiquitousLibDir"
	
	local scriptBasename=$(basename "$scriptAbsoluteFolder")
	if [[ "$scriptBasename" == "ubiquitous_bash" ]]
	then
		return 0
	fi
	
	if [[ -e "$ubiquitousLibDir"/_lib/ubiquitous_bash ]]
	then
		export ubiquitousLibDir="$ubiquitousLibDir"/_lib/ubiquitous_bash
		export ubiquitiousLibDir="$ubiquitousLibDir"
		return 0
	fi
	
	local ubiquitousLibDirDiscovery=$(find ./_lib -maxdepth 3 -type d -name 'ubiquitous_bash' | head -n 1)
	if [[ "$ubiquitousLibDirDiscovery" != "" ]] && [[ -e "$ubiquitousLibDirDiscovery" ]]
	then
		export ubiquitousLibDir="$ubiquitousLibDirDiscovery"
		export ubiquitiousLibDir="$ubiquitousLibDir"
		return 0
	fi
	
	return 1
}


#####Overrides

[[ "$isDaemon" == "true" ]] && echo "$$" | _prependDaemonPID

#May allow traps to work properly in simple scripts which do not include more comprehensive "_stop" or "_stop_emergency" implementations.
if ! type _stop > /dev/null 2>&1
then
	# ATTENTION: Consider carefully, override with "ops".
	# WARNING: Unfortunate, but apparently necessary, workaround for script termintaing while "sleep" or similar run under background.
	_stop_stty_echo() {
		#true
		
		stty echo --file=/dev/tty > /dev/null 2>&1
		
		#[[ "$ubFoundEchoStatus" != "" ]] && stty --file=/dev/tty "$ubFoundEchoStatus" 2> /dev/null
	}
	_stop() {
		_stop_stty_echo
		
		if [[ "$1" != "" ]]
		then
			exit "$1"
		else
			exit 0
		fi
	}
fi
if ! type _stop_emergency > /dev/null 2>&1
then
	_stop_emergency() {
		_stop "$1"
	}
fi

#Traps, if script is not imported into existing shell, or bypass requested.
# WARNING Exact behavior of this system is critical to some use cases.
if [[ "$ub_import" != "true" ]] || [[ "$ub_import_param" == "--bypass" ]]
then
	trap 'excode=$?; _stop $excode; trap - EXIT; echo $excode' EXIT HUP QUIT PIPE 	# reset
	trap 'excode=$?; trap "" EXIT; _stop $excode; echo $excode' EXIT HUP QUIT PIPE 	# ignore
	
	# DANGER: Mechanism of workaround 'ub_trapSet_stop_emergency' is not fully understood, and was added undesirably late in development, with unknown effects. Nevertheless, a need for such functionality is expected to be encountered only rarely.
	# At least '_closeChRoot' , '_userChRoot' , '_userVBox' do not seem to have lost functionality.
	# DANGER: Any shell command matching ' _timeout.*&$ ' (backgrounding of _timeout) will probably be unable to reach '_stop' correctly, and may not remove temporary directories, etc.
	if [[ "$ub_trapSet_stop_emergency" != 'true' ]]
	then
		trap 'excode=$?; _stop_emergency $excode; trap - EXIT; echo $excode' INT TERM	# reset
		trap 'excode=$?; trap "" EXIT; _stop_emergency $excode; echo $excode' INT TERM	# ignore
		export ub_trapSet_stop_emergency='true'
	fi
fi

# DANGER: NEVER intended to be set in an end user shell for ANY reason.
# DANGER: Implemented to prevent 'compile.sh' from attempting to run functions from 'ops.sh'. No other valid use currently known or anticipated!
if [[ "$ub_ops_disable" != 'true' ]]
then
	#Override functions with external definitions from a separate file if available.
	#if [[ -e "./ops" ]]
	#then
	#	. ./ops
	#fi

	#Override functions with external definitions from a separate file if available.
	# CAUTION: Recommend only "ops" or "ops.sh" . Using both can cause confusion.
	# ATTENTION: Recommend "ops.sh" only when unusually long. Specifically intended for "CoreAutoSSH" .
	if [[ -e "$objectDir"/ops ]]
	then
		. "$objectDir"/ops
	fi
	if [[ -e "$objectDir"/ops.sh ]]
	then
		. "$objectDir"/ops.sh
	fi
	if [[ -e "$scriptLocal"/ops ]]
	then
		. "$scriptLocal"/ops
	fi
	if [[ -e "$scriptLocal"/ops.sh ]]
	then
		. "$scriptLocal"/ops.sh
	fi
	if [[ -e "$scriptLocal"/ssh/ops ]]
	then
		. "$scriptLocal"/ssh/ops
	fi
	if [[ -e "$scriptLocal"/ssh/ops.sh ]]
	then
		. "$scriptLocal"/ssh/ops.sh
	fi

	#WILL BE OVERWRITTEN FREQUENTLY.
	#Intended for automatically generated shell code identifying usable resources, such as unused network ports. Do NOT use for serialization of internal variables (use $varStore for that).
	if [[ -e "$objectDir"/opsauto ]]
	then
		. "$objectDir"/opsauto
	fi
	if [[ -e "$scriptLocal"/opsauto ]]
	then
		. "$scriptLocal"/opsauto
	fi
	if [[ -e "$scriptLocal"/ssh/opsauto ]]
	then
		. "$scriptLocal"/ssh/opsauto
	fi
fi

#Wrapper function to launch arbitrary commands within the ubiquitous_bash environment, including its PATH with scriptBin.
_bin() {
	"$@"
}
#Mostly intended to launch bash prompt for MSW/Cygwin users.
_bash() {
	local currentIsCygwin
	currentIsCygwin='false'
	[[ -e '/cygdrive' ]] && uname -a | grep -i cygwin > /dev/null 2>&1 && _if_cygwin && currentIsCygwin='true'
	
	# WARNING: What is otherwise considered bad practice may be accepted to reduce substantial MSW/Cygwin inconvenience .
	[[ "$currentIsCygwin" == 'true' ]] && echo -n '.'
	
	
	_visualPrompt
	[[ "$ub_scope_name" != "" ]] && _scopePrompt
	
	
	[[ "$1" == '-i' ]] && shift
	
	
	
	if [[ "$currentIsCygwin" == 'true' ]] && grep ubcore "$HOME"/.bashrc > /dev/null 2>&1 && [[ "$scriptAbsoluteLocation" == *"lean.sh" ]]
	then
		export sessionid=""
		export scriptAbsoluteFolder=""
		export scriptAbsoluteLocation=""
		bash -i "$@"
		return
	elif  [[ "$currentIsCygwin" == 'true' ]] && grep ubcore "$HOME"/.bashrc > /dev/null 2>&1 && [[ "$scriptAbsoluteLocation" != *"lean.sh" ]]
	then
		bash -i "$@"
		return
	elif [[ "$currentIsCygwin" == 'true' ]] && ! grep ubcore "$HOME"/.bashrc > /dev/null 2>&1
	then
		bash --norc -i "$@"
		return
	else
		bash -i "$@"
		return
	fi
	
	bash -i "$@"
	return
	
	return 1
}

#Mostly if not entirely intended for end user convenience.
_python() {
	if [[ -e "$safeTmp"/lean.py ]]
	then
		"$safeTmp"/lean.py '_python()'
		return
	fi
	if [[ -e "$scriptAbsoluteFolder"/lean.py ]]
	then
		"$scriptAbsoluteFolder"/lean.py '_python()'
		return
	fi
	if type -p 'lean.py' > /dev/null 2>&1
	then
		lean.py '_python()'
		return
	fi
	return 1
}

#Launch internal functions as commands, and other commands, as root.
_sudo() {
	sudo -n "$scriptAbsoluteLocation" _bin "$@"
}

_true() {
	#"$scriptAbsoluteLocation" _false && return 1
	#! "$scriptAbsoluteLocation" _bin true && return 1
	#"$scriptAbsoluteLocation" _bin false && return 1
	true
}
_false() {
	false
}
_echo() {
	echo "$@"
}

_diag() {
	echo "$sessionid"
}

#Stop if script is imported, parameter not specified, and command not given.
if [[ "$ub_import" == "true" ]] && [[ "$ub_import_param" == "" ]] && [[ "$1" != '_'* ]]
then
	_messagePlain_warn 'import: missing: parameter, missing: command' | _user_log-ub
	ub_import=""
	return 1 > /dev/null 2>&1
	exit 1
fi

#Set "ubOnlyMain" in "ops" overrides as necessary.
if [[ "$ubOnlyMain" != "true" ]]
then
	
	#Launch command named by link name.
	if scriptLinkCommand=$(_getScriptLinkName)
	then
		if [[ "$scriptLinkCommand" == '_'* ]]
		then
			"$scriptLinkCommand" "$@"
			internalFunctionExitStatus="$?"
			
			#Exit if not imported into existing shell, or bypass requested, else fall through to subsequent return.
			if [[ "$ub_import" != "true" ]] || [[ "$ub_import_param" == "--bypass" ]] || [[ "$ub_import_param" == "--compressed" ]]
			then
				#export noEmergency=true
				exit "$internalFunctionExitStatus"
			fi
			ub_import=""
			return "$internalFunctionExitStatus" > /dev/null 2>&1
			exit "$internalFunctionExitStatus"
		fi
	fi
	
	# NOTICE Launch internal functions as commands.
	#if [[ "$1" != "" ]] && [[ "$1" != "-"* ]] && [[ ! -e "$1" ]]
	#if [[ "$1" == '_'* ]] || [[ "$1" == "true" ]] || [[ "$1" == "false" ]]
	# && [[ "$1" != "_test" ]] && [[ "$1" != "_setup" ]] && [[ "$1" != "_build" ]] && [[ "$1" != "_vector" ]] && [[ "$1" != "_setupCommand" ]] && [[ "$1" != "_setupCommand_meta" ]] && [[ "$1" != "_setupCommands" ]] && [[ "$1" != "_find_setupCommands" ]] && [[ "$1" != "_setup_anchor" ]] && [[ "$1" != "_anchor" ]] && [[ "$1" != "_package" ]] && [[ "$1" != *"_prog" ]] && [[ "$1" != "_main" ]] && [[ "$1" != "_collect" ]] && [[ "$1" != "_enter" ]] && [[ "$1" != "_launch" ]] && [[ "$1" != "_default" ]] && [[ "$1" != "_experiment" ]]
	if [[ "$1" == '_'* ]] && type "$1" > /dev/null 2>&1 && [[ "$1" != "_test" ]] && [[ "$1" != "_setup" ]] && [[ "$1" != "_build" ]] && [[ "$1" != "_vector" ]] && [[ "$1" != "_setupCommand" ]] && [[ "$1" != "_setupCommand_meta" ]] && [[ "$1" != "_setupCommands" ]] && [[ "$1" != "_find_setupCommands" ]] && [[ "$1" != "_setup_anchor" ]] && [[ "$1" != "_anchor" ]] && [[ "$1" != "_package" ]] && [[ "$1" != *"_prog" ]] && [[ "$1" != "_main" ]] && [[ "$1" != "_collect" ]] && [[ "$1" != "_enter" ]] && [[ "$1" != "_launch" ]] && [[ "$1" != "_default" ]] && [[ "$1" != "_experiment" ]]
	then
		"$@"
		internalFunctionExitStatus="$?"
		
		#Exit if not imported into existing shell, or bypass requested, else fall through to subsequent return.
		if [[ "$ub_import" != "true" ]] || [[ "$ub_import_param" == "--bypass" ]] || [[ "$ub_import_param" == "--compressed" ]]
		then
			#export noEmergency=true
			exit "$internalFunctionExitStatus"
		fi
		ub_import=""
		return "$internalFunctionExitStatus" > /dev/null 2>&1
		exit "$internalFunctionExitStatus"
		#_stop "$?"
	fi
fi

[[ "$ubOnlyMain" == "true" ]] && export ubOnlyMain="false"

#Do not continue script execution through program code if critical global variables are not sane.
[[ ! -e "$scriptAbsoluteLocation" ]] && exit 1
[[ ! -e "$scriptAbsoluteFolder" ]] && exit 1
_failExec || exit 1

#Return if script is under import mode, and bypass is not requested.
# || [[ "$current_internal_CompressedScript" != "" ]] || [[ "$current_internal_CompressedScript_cksum" != "" ]] || [[ "$current_internal_CompressedScript_bytes" != "" ]]
if [[ "$ub_import" == "true" ]] && ! ( [[ "$ub_import_param" == "--bypass" ]] ) || [[ "$ub_import_param" == "--compressed" ]] || [[ "$ub_import_param" == "--parent" ]] || [[ "$ub_import_param" == "--profile" ]]
then
	return 0 > /dev/null 2>&1
	exit 0
fi


#####Entry

# WARNING: Do not add code directly here without disabling checksum!
# WARNING: Checksum may only be disabled either by override of 'generic/minimalheader.sh' or by adding appropriate '.nck' file !

#"$scriptAbsoluteLocation" _setup




if [[ "$1" == '_'* ]] && type "$1" > /dev/null 2>&1
then
	"$@"
	internalFunctionExitStatus="$?"
	return "$internalFunctionExitStatus" > /dev/null 2>&1
	exit "$internalFunctionExitStatus"
fi
if [[ "$1" != '_'* ]]
then
	_main "$@"
fi
