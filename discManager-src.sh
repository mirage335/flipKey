#!/bin/bash
# WARNING: Do NOT symlink, hardlink, or point '_anchor' scripts and such at this script, as "$0" is used directly.

# NOTICE: README !
# 
# Simple script to desilver, partition, format, and install flipKey, to removable media discs (eg. mo640, zip250).
# 
# 
# ATTENTION
# ```
# _desilver_mo
# _desilver_zip
# _desilver_u
# _desilver_packetDisc
# _desilver_packetDisc_quick
# ```
# 
# Default (keyPartition).
# ATTENTION
# ```
# _mo2300
# _mo640
# _mo230
# _zip250
# _zip100
# ```
# 
# Prefer btrfs/nilfs2/ext4 filesystems and dedicated keyPartition .
# ATTENTION
# ```
# _mo2300_keyPartition
# _mo640_keyPartition
# _mo230_keyPartition
# _zip250_keyPartition
# _zip100_keyPartition
# ```
# 
# Apply NTFS filesystems and no dedicated keyPartition if MSW compatibility required.
# ATTENTION
# ```
# _mo2300_ntfs
# _mo640_ntfs
# _mo230_ntfs
# _zip250_ntfs
# _zip100_ntfs
# ```
# 
# Archival longevity maximized, usually by single-disc quad-redundant integrity checksummed RAID1C4.
# ATTENTION
# ```
# _mo640_extremelyRedundant
# ```
# 
# Specialized.
# ATTENTION
# ```
#	Arbitrary HDD/SSD disk.
# _pattern_recovery_write /dev/disk/by-id/usb-USB_Mass_Storage_Device_816820130806-0\:0
# _generic_keyPartition /dev/disk/by-id/usb-USB_Mass_Storage_Device_816820130806-0\:0
# 
# 
#	Arbitrary HDD/SSD disk or hardware RAID1 array.
# _pattern_recovery_write /dev/disk/by-id/usb-USB_Mass_Storage_Device_816820130806-0\:0
# _generic_slightlyRedundant /dev/disk/by-id/usb-USB_Mass_Storage_Device_816820130806-0\:0
# 
# _u4000_slightlyRedundant
# _u2500_slightlyRedundant
# 
# _u4000_keyPartition
# _u2500_keyPartition
# 
# 
#	Arbitrary 'packetDisc' . Defaults to available '/dev/dvd' or similar.
# _packetDisc
# _packetDisc_ntfs /dev/disk/by-id/usb-USB_Mass_Storage_Device_816820130806-0\:0
# _packetDisc_keyPartition /dev/disk/by-id/usb-USB_Mass_Storage_Device_816820130806-0\:0
# _packetDisc_marginallyRedundant /dev/disk/by-id/usb-USB_Mass_Storage_Device_816820130806-0\:0
# 
# _bd25
# _bd100
# _bd128
# 
# 
#	Bank of disc devices.
# _bd25_bank
# 
# 
#	Permanently write a read-only copy of existing file-based or mo keyPartition (NOT other partitioned) flipKey volume to a 'packetDisc' .
#	May fail if temporary directories used are not writable (eg. if MO disc is used read-only).
# _packetDisc_permanent
# 
# ```
# 
# ATTENTION
# Unusually requires an effective 'current directory' (ie. PWD). Temporary files and directories will be placed in the 'current directory'. Obviously, this current directory must NOT be a removable media disc (albeit this script may be included with removable media disc).
# 
# 
# NOTICE: README !
#__README_uk4uPhB663kVcygT0q_README__


# Other commands may be useful in unusual situations.

# 'Upgrading' a disc.

# ./discManager _mo_flipKey_unpackage _disc_mo230_keyPartition
# ./discManager _mo_flipKey_unpackage _disc_mo640_keyPartition
# ./discManager _zip_flipKey_unpackage _disk_zip250_keyPartition
# ./discManager _u_flipKey_unpackage _disk_u4000_keyPartition







# Experimental, extremely rare, or demonstrations of usable code for unlikely future use cases.
# If you don't know why you might want these commands, you definitely don't.

#	Prefer '_packetDisc_keyPartition' .
# _raw_packetDisc_keyPartition
#	Prefer '_mo640_extremelyRedundant' .
# _raw_packetDisc_slightlyRedundant
# _packetDisc_split_single

#	Example only.
# _splitDisc
# _splitDisc_bd25_bank
# _splitDisc_single
# dmsetup remove /dev/mapper/*_splitDisc*






# Archival reliability is best when '_mo640_extremelyRedundant' is used with some of the Magneto Optical discs made by some brands (eg. Verbatim, Sony).
# Otherwise special precautions must be considered.


#  Beware apparently not all MO discs are manufactured under cleanroom or without residue. Inspect briefly with >25x stereomicroscope.
#  Sony, Verbatim brand discs known to have far lower dust particle counts and strictly limited dust particle diameter, inspiring archival confidence.
#  FujiFilm, BASF brand discs apparently have some limits on dust particle diameter and quantity, suitable for short-term use.
#  Fujitsu (drives are excellent though), Philips, brand discs, apparently have high dust particle counts and uncontrolled dust particle diameter.



#  Strongly recommend 'desilver' before using discs manufactured many years ago.
#  Magneto-Optical discs are known for extreme reliability (~30-100 years, first time every time, see 'RELIABILITY EVALUATION OF 3M MAGNETO-OPTIC MEDIA'), however, 'FORMAT UNIT' might possibly 'refresh' old necessary factory-written information and replace bad sectors.
#  Magneto Optical discs apparently can be factory shipped without *any* formatting, causing first-pass write speeds to be approximately halved in these cases. Possibility of not-recently 'formatted' sectors overwhelming hardware defect management. Strongly recommend 'desilvering' before using any Magneto-Optical discs.
#  Zip disks may perform better with less seeking (particularly under non-sequential writing) if filled with noisy data, and possibly also after 'FORMAT UNIT'.
#  Of course, zip disks are not appropriate for any part of archival storage, due to possibility of mechanical failure, simultaneous rapid degradation by corrosion, and simultaneous loss of magnetization.



# #  All known 'packetDiscs' (ie. BD/DVD/CD) usually do not have integrated 'caddies', and recent drives do not support caddies. Discs data surfaces must be protected from any physical contact or deforming pressure during storage. Thick jewel cases meet these criteria. Slim cases (or worse simple envelopes), may not have adequate rigidity or absence of physical contact to ensure archival reliability. Beware BD disc tolerance for dust may be ~0.1mm diameter, and tilt may be <<deg, so only attempts after the fact to remove noticeable dust or deformation are more likely to cause corruption.



#  Hybrid HDD/SSD RAID1 requires silent corruption experiments. Either SSD must not cause silent corruption and hardware RAID must return valid data from remaining HDD, or RAID must identify and disregard SSD silent corruption. Otherwise, filesystem and applications reading 'garbage' may overwrite remaining copies of data on the RAID1 array (ie. garbage in, garbage out). Ensuring correct behaviror may require testing by damaging an SSD to cause silent corruption, by overwriting all SSD data (except RAID headers) with random data, with a device that can emulate such behavior on a SATA interface, etc.

#  Tin whisker reset pin bridging of a hardware RAID array may cause catastrophic overwriting of all copies of all data . Add suitable pull up resistors, diodes, and supercapacitors, or alternative protective circuitry. Test with wires to ensure vaporization of such whiskers before reset occurs. Or arrange to disconnect power (possibly breaking a fuse) when reset is pulled while a safety switch is not off. Prefer hardware RAID controllers requiring interactive confirmation of reset button press only while a confirmation light illuminates several times.

#  Dual platter surface HDD disk may in practice geometrically distribute redundancy sufficient to prevent a single 'head crash' from unrecoverably obliterating all copies.
#  * Consult Drive Savers * before chosing a RAID1 HDD/SSD device pair - inquire about the possibility of recovering a specific model HDD after complete electronics and SSD failure!
# Thinner 2.5inch HDD disks (ie. maybe <<7mm) may be dual platter surface. More than one platter (more than two platter surfaces) will likely result in less desirable geometric redundancy distribution.



#  'Split' software may be copied and used to map disc regions to multiple 'devices' for partitioning (eg. by '_generic_slightlyRedundant' or '_generic_keyPartition').
#  Especially may 'split' a single 'BD-RE' disc as a huge 'library' (aka. 'bank') of many smaller 'independent' optical discs.
#  If creating such a 'bank' of optical disc devices, one device may be needed as a '_generic_keyPartition' with a text file as an 'index' of human-readable labels of the other devices.


#  'Permanent' may be written to '25GB' BD-R, '100GB' 'M-Disc', or possibly '128GB' archival quality BD-R . Multilayer BD-R (or BD-RE) discs probably should only be considered if credibly and plausibly specified for long archival reliability (as may be 'M-Disc' or 'enterprise' discs).








# NOTICE














# NOTICE: '_packetDisc_split'


_packetDisc_split_single() {
	export currentSplitDisc_procedure="_splitDisc_single_procedure"
	_packetDisc_split "$@"
}
_packetDisc_split_bd25_bank() {
	export currentSplitDisc_procedure="_splitDisc_bd25_bank_procedure"
	_packetDisc_split "$@"
}
_bd25_bank() {
	_packetDisc_split_bd25_bank "$@"
}
# Copies only 'discManager' and a minimalistic derivative script . Intended to 'create' other optical disc 'devices' from parts of the disc by 'dmsetup' 'linear' mappings, then usable by any such program as 'fdisk', 'sgdisk', 'gparted', 'discManager' (eg. '_generic_keyPartition' , '_generic_slightlyRedundant' ) , etc .
_packetDisc_split() {
	! _marginallyRedundant_criticalDep && return 1
	local currentDrive
	currentDrive=$(_find_packetDrive)
	[[ "$1" != "" ]] && currentDrive="$1"
	_check_driveDeviceFile "$currentDrive"
	
	
	[[ "$currentSplitDisc_procedure" == "" ]] && export currentSplitDisc_procedure="_splitDisc_bd25_bank_procedure"
	
	_splitDisc_is_packetDisc "$currentDrive" && export flipKey_packetDisc_exhaustible="true"
	
	export currentRandomUUID=$(cat /dev/urandom 2> /dev/null | xxd -p | tr -d '\n' | head -c16)
	export currentSplitDiscDriveUUID="$currentRandomUUID"
	export currentSplitDiscDrive=/dev/disk/by-uuid/"$currentRandomUUID"
	
	
	local current_packetDisc_split_METHOD
	
	# ATTENTION: WARNING: Not directly mountable by MSW, possibly not copyable by MSW, probably necessitating a LinuxVM.
	#current_packetDisc_split_METHOD="iso_single"
	
	# ATTENTION: WARNING: Probably writable by MSW (even on 'writeOnce' disc).
	current_packetDisc_split_METHOD="udf_temp_mkudffs"
	
	# DANGER: Script cannot use 'uuid' to find disc if 'genisoimage' or similar is used - mkudffs required for this safety check!
	[[ "$current_packetDisc_split_METHOD" == "iso_single" ]] && export currentSplitDiscDrive=
	
	
	local currentVolumeDirectory
	currentVolumeDirectory="$2"
	[[ "$currentVolumeDirectory" == "" ]] && currentVolumeDirectory="$PWD"
	[[ ! -e "$currentVolumeDirectory"/discManager ]] && currentVolumeDirectory="$PWD"
	[[ ! -e "$currentVolumeDirectory"/discManager ]] && echo 'FAIL: missing: discManager' && exit 1
	
	
	
	
	echo && echo '!!!!! ##### !!!!! packetDisc_split: WRITING AFTER ~12SECONDS! !!!!! ##### !!!!!' && echo
	
	[[ -e "$currentVolumeDirectory"/isoSymlinks ]] && echo 'FAIL: exists: temporary directory' && exit 1
	[[ -e "$currentVolumeDirectory"/udfFiles ]] && echo 'FAIL: exists: temporary directory' && exit 1
	
	
	echo && echo '##### packetDisc_split: format: sparing' && echo
	# DANGER: Defect management may or may not be necessary to minimize use of 'weak' 'sectors' on disc which are readable but at the limits of ECC.
	# DANGER: Checksum is first session only - defect management may be necessary to ensure data is written correctly when 'multisessioning' .
	# WARNING: Checksum may not match expectations (especially if multisessioning) .
	# http://www.blu-raydisc.com/Assets/Downloadablefile/BD-R_Physical_3rd_edition_0602f1-15268.pdf
	sleep 12
	sudo -n dvd+rw-format -force -ssa=default "$currentDrive"
	#sudo -n dvd+rw-format -force -blank -ssa=default "$currentDrive"
	#sudo -n dvd+rw-format -ssa=none "$currentDrive"
	sync
	sleep 9
	
	
	export currentSplitDiscSize=$(sudo -n blockdev --getsize64 "$currentDrive" | tr -dc '0-9')
	
	
	if [[ "$current_packetDisc_split_METHOD" == "udf_temp_mkudffs" ]]
	then
		echo && echo '##### packetDisc_split: mkudffs (temporary file)' && echo
		_packetDisc_split_software_mkudffs "$currentVolumeDirectory"
	fi
	
	
	if [[ "$current_packetDisc_split_METHOD" == "udf_temp_mkudffs" ]]
	then
		( [[ "$current_packetDisc_split_METHOD" == "iso_single" ]] ) && echo && echo '##### packetDisc_split: checksum: mkisofs (pipe)' && echo
		[[ "$current_packetDisc_split_METHOD" == "udf_temp_mkudffs" ]] && echo && echo '##### packetDisc_split: checksum (temporary file)' && echo
		local current_cksum_raw
		local current_cksum_cksum
		local current_cksum_size
		( [[ "$current_packetDisc_split_METHOD" == "iso_single" ]] ) && current_cksum_raw=$(_packetDisc_split_software_mkisofs "$currentVolumeDirectory" | env CMD_ENV=xpg4 cksum | tr -dc '0-9 ')
		[[ "$current_packetDisc_split_METHOD" == "udf_temp_mkudffs" ]] && current_cksum_raw=$(cat "$currentVolumeDirectory"/udfImage | env CMD_ENV=xpg4 cksum | tr -dc '0-9 ')
		current_cksum_cksum=$(echo "$current_cksum_raw" | cut -f1 -d\  )
		current_cksum_size=$(echo "$current_cksum_raw" | cut -f2 -d\  )
		
		echo 'current_cksum_raw= '"$current_cksum_raw"
		echo 'current_cksum_cksum= '"$current_cksum_cksum"
		echo 'current_cksum_size= '"$current_cksum_size"
	fi
	
	
	
	
	
	# Theoretically, it might be unfortunate (corrupted disc) if mkisofs fails to 'pipe' data quickly enough. Practically, any 'disk' mkisofs is 'reading' a small number of files from should be more likely to cause such failures (negating theoretical reliability benefit of temporary file).
	#-allow-limited-size
	#-dvd-compat
	( [[ "$current_packetDisc_split_METHOD" == "iso_single" ]] ) && echo && echo '##### packetDisc_split: growisofs: mkisofs (pipe)' && echo
	( [[ "$current_packetDisc_split_METHOD" == "iso_single" ]] ) && _packetDisc_split_software_mkisofs "$currentVolumeDirectory" | growisofs -dvd-compat -Z "$currentDrive"=/dev/stdin -use-the-force-luke=notray
	
	# Using 'mkudffs' apparently requires a temporary file.
	#-dvd-compat
	[[ "$current_packetDisc_split_METHOD" == "udf_temp_mkudffs" ]] && echo && echo '##### packetDisc_split: growisofs (temporary file)' && echo
	#[[ "$current_packetDisc_split_METHOD" == "udf_temp_mkudffs" ]] && cat /dev/mapper/discManager_mkudffs_uk4uPhB663kVcygT0q | growisofs -dvd-compat -Z "$currentDrive"=/dev/stdin -use-the-force-luke=notray
	#[[ "$current_packetDisc_split_METHOD" == "udf_temp_mkudffs" ]] && growisofs -dvd-compat -Z "$currentDrive"=/dev/mapper/discManager_mkudffs_uk4uPhB663kVcygT0q -use-the-force-luke=notray
	#[[ "$current_packetDisc_split_METHOD" == "udf_temp_mkudffs" ]] && growisofs -dvd-compat -Z "$currentDrive"="$currentVolumeDirectory"/udfImage -use-the-force-luke=notray
	[[ "$current_packetDisc_split_METHOD" == "udf_temp_mkudffs" ]] && growisofs -Z "$currentDrive"="$currentVolumeDirectory"/udfImage -use-the-force-luke=notray
	
	sync
	sleep 9
	
	
	
	rm -f "$currentVolumeDirectory"/udfImage
	
	
	sudo -n partprobe
	#_extremelyRedundant_is_packetDisc "$currentDrive" && sudo -n kpartx -a "$currentDrive"
	sync
	
	# https://unix.stackexchange.com/questions/256832/mount-dvd-without-eject-after-burn
	sudo -n udevadm trigger
	sync
	
	
	while ! [[ "$currentIteration" -gt 6 ]] && ! [[ -e "$currentSplitDiscDrive" ]] && [[ "$current_packetDisc_split_METHOD" != "iso_single" ]]
	do
		echo 'wait: disc: iteration: '"$currentIteration"
		ls -A -1 "$currentSplitDiscDrive"
		ls -A -1 /dev/disk/by-partuuid/"$currentRandomUUID"
		
		sudo -n partprobe
		#_extremelyRedundant_is_packetDisc "$currentDrive" && sudo -n kpartx -a "$currentDrive"
		sync
		
		# https://unix.stackexchange.com/questions/256832/mount-dvd-without-eject-after-burn
		sudo -n udevadm trigger
		sync
		
		sleep 15
		
		if ! [[ -e "$currentSplitDiscDrive" ]]
		then
			if ! [[ "$currentIteration" -lt 1 ]]
			then
				_messagePlain_request 'request: may be necessary to remove and reinsert disk (sleep 45)'
				sleep 45
			else
				true
				#sleep 15
			fi
		fi
		
		let currentIteration=currentIteration+1
	done
	
	
	if [[ "$current_packetDisc_split_METHOD" == "udf_temp_mkudffs" ]]
	then
		echo && echo '##### packetDisc_split: read' && echo
		echo 'current_cksum_raw= '"$current_cksum_raw"
		echo 'current_cksum_cksum= '"$current_cksum_cksum"
		echo 'current_cksum_size= '"$current_cksum_size"
		echo
		_messagePlain_request 'request: compare checksum (in progress)'
		dd if="$currentDrive" bs=1M | head --bytes="$current_cksum_size" | env CMD_ENV=xpg4 cksum
	fi
}
_packetDisc_split_software_mkisofs() {
	local currentVolumeDirectory
	currentVolumeDirectory="$1"
	[[ -e "$currentVolumeDirectory"/isoSymlinks ]] && echo 'FAIL: exists: temporary directory' && exit 1
	
	mkdir -p "$currentVolumeDirectory"/isoSymlinks/
	! [[ -e "$currentVolumeDirectory"/isoSymlinks/ ]] && exit 1
	
	ln -sf "$currentVolumeDirectory"/discManager "$currentVolumeDirectory"/isoSymlinks/
	#ln -sf "$currentVolumeDirectory"/package.tar.xz "$currentVolumeDirectory"/isoSymlinks/
	ln -sf "$currentVolumeDirectory"/gpl-3.0.txt "$currentVolumeDirectory"/isoSymlinks/
	ln -sf "$currentVolumeDirectory"/license.txt "$currentVolumeDirectory"/isoSymlinks/
	ln -sf "$currentVolumeDirectory"/README.md "$currentVolumeDirectory"/isoSymlinks/
	ln -sf "$currentVolumeDirectory"/.gitignore "$currentVolumeDirectory"/isoSymlinks/
	
	_splitDisc_generate "$currentVolumeDirectory"/isoSymlinks
	_splitDisc_anchor "$currentVolumeDirectory"/isoSymlinks
	
	
	# https://www.hungred.com/how-to/making-mount-dvdcdrom-executable-linux/
	# Mounting as 'iso9660' filesystem instead of 'udf' seems to result in reasonable 'executable' file permissions.
	# 'man genisoimage'
	#  '-udf'
	#   'no POSIX permission support'
	#-V "$currentRandomUUID" -volset "$currentRandomUUID" -sysid "$currentRandomUUID"
	#-V "discSoftware" -volset "discSoftware" -sysid "discSoftware"
	# DANGER: Script cannot use 'uuid' to find disc if 'genisoimage' or similar is used - mkudffs required for this safety check!
	_mkisofs -output-charset iso8859-1 -V "$currentRandomUUID" -volset "$currentRandomUUID" -sysid "$currentRandomUUID" -uid 0 -gid 0 -dir-mode 0770 -file-mode 0770 -new-dir-mode 0770 -r -l -f -J -o /dev/stdout "$currentVolumeDirectory"/isoSymlinks
	
	
	! [[ -e "$currentVolumeDirectory"/isoSymlinks ]] && exit 1
	
	rm -f "$currentVolumeDirectory"/isoSymlinks/discManager
	#rm -f "$currentVolumeDirectory"/isoSymlinks/package.tar.xz
	rm -f "$currentVolumeDirectory"/isoSymlinks/gpl-3.0.txt
	rm -f "$currentVolumeDirectory"/isoSymlinks/license.txt
	rm -f "$currentVolumeDirectory"/isoSymlinks/README.md
	rm -f "$currentVolumeDirectory"/isoSymlinks/.gitignore
	
	rm -f "$currentVolumeDirectory"/isoSymlinks/splitDisc.sh
	rm -f "$currentVolumeDirectory"/isoSymlinks/_splitDisc.bat
	rm -f "$currentVolumeDirectory"/isoSymlinks/_splitDisc_remove.bat
	
	rmdir "$currentVolumeDirectory"/isoSymlinks
}
_packetDisc_split_software_mkudffs() {
	local currentVolumeDirectory
	currentVolumeDirectory="$1"
	
	[[ -e "$currentVolumeDirectory"/udfFiles ]] && echo 'FAIL: exists: temporary' && exit 1
	
	# DANGER: May or may not be 'read-only' if written to 'rewritable' disc.
	# DANGER: Must be large enough not to quickly exhaust sparing due to timestamp updates.
	# DANGER: A 'strictly' read-only filesystem created by 'mkisofs' is preferred to prevent any possibility of problems from rewrite exhaustion.
	# 14336 == 28 MiB
	# 24576 == 48 MiB
	sudo -n mkudffs --utf8 --blocksize=2048 --media-type=dvdram --udfrev=0x0201 --bootarea erase --uuid "$currentRandomUUID" --lvid="discSoftware" --vid="discSoftware" "$currentVolumeDirectory"/udfImage 24576
	sudo -n chown "$USER":"$USER" "$currentVolumeDirectory"/udfImage
	sync
	
	mkdir -p "$currentVolumeDirectory"/udfFiles
	sudo -n mount "$currentVolumeDirectory"/udfImage "$currentVolumeDirectory"/udfFiles
	sudo -n chown "$USER":"$USER" "$currentVolumeDirectory"/udfFiles
	if ! mountpoint "$currentVolumeDirectory"/udfFiles > /dev/null 2>&1
	then
		rmdir "$currentVolumeDirectory"/udfFiles
		return 1
	fi
	
	mkdir -m 700 -p "$currentVolumeDirectory"/udfFiles/
	
	cp "$currentVolumeDirectory"/discManager "$currentVolumeDirectory"/udfFiles/
	#cp "$currentVolumeDirectory"/package.tar.xz "$currentVolumeDirectory"/udfFiles/
	cp "$currentVolumeDirectory"/gpl-3.0.txt "$currentVolumeDirectory"/udfFiles/
	cp "$currentVolumeDirectory"/license.txt "$currentVolumeDirectory"/udfFiles/
	cp "$currentVolumeDirectory"/README.md "$currentVolumeDirectory"/udfFiles/
	cp "$currentVolumeDirectory"/.gitignore "$currentVolumeDirectory"/udfFiles/
	
	_splitDisc_generate "$currentVolumeDirectory"/udfFiles
	_splitDisc_anchor "$currentVolumeDirectory"/udfFiles
	
	sync
	
	#man umount
	# --detach-loop
	#  'unnecessary for devices initialized by mount'
	sudo -n umount "$currentVolumeDirectory"/udfFiles
	sync
	
	rmdir "$currentVolumeDirectory"/udfFiles
	
	return 0
}



# NOTICE: '_packetDisc_split'











# NOTICE: '_marginallyRedundant' , 'packetDisc' (UDF) ###


_marginallyRedundant_criticalDep() {
	! sudo -n which mkudffs > /dev/null && exit 1
	
	! sudo -n which mkisofs > /dev/null && ! sudo -n which genisoimage > /dev/null && exit 1
	
	! sudo -n which dvd+rw-format > /dev/null && exit 1
	! sudo -n which growisofs > /dev/null && exit 1
	
	! which cksum > /dev/null && exit 1
	
	! which realpath > /dev/null && exit 1
	
	! sudo -n which udevadm > /dev/null && exit 1
	
	return 0
}


_find_packetDrive() {
	! sudo -n which dmsetup > /dev/null && exit 1
	if type _marginallyRedundant_criticalDep > /dev/null 2>&1
	then
		! _marginallyRedundant_criticalDep && exit 1
	fi
	if type _splitDisc_criticalDep > /dev/null 2>&1
	then
		! _splitDisc_criticalDep && exit 1
	fi
	
	# DANGER: Assumes only one (relevant) drive.
	[[ -e /dev/cdrom ]] && realpath /dev/cdrom && return 0
	[[ -e /dev/cdrw ]] && realpath /dev/cdrw && return 0
	[[ -e /dev/dvd ]] && realpath /dev/dvd && return 0
	[[ -e /dev/sr0 ]] && echo /dev/sr0 && return 0
	[[ -e /dev/sr1 ]] && echo /dev/sr1 && return 0
	
	return 1
}

_embed_packetDisc_read() {
	! _marginallyRedundant_criticalDep && return 1
	local currentDrive
	currentDrive=$(_find_packetDrive)
	[[ "$1" != "" ]] && currentDrive="$1"
	_check_driveDeviceFile "$currentDrive"
	
	
	dd if="$currentDrive" bs=1 skip=700 count=8192 iflag=fullblock conv=notrunc 2>/dev/null | head --bytes=1152 | tail --bytes=12
	echo
	dd if="$currentDrive" bs=1 skip=22808 count=8192 iflag=fullblock conv=notrunc 2>/dev/null | head --bytes=1152 | tail --bytes=12
	echo
	echo
	sleep 9
}

_embed_packetDisc() {
	! _marginallyRedundant_criticalDep && return 1
	local currentDrive
	currentDrive=$(_find_packetDrive)
	[[ "$1" != "" ]] && currentDrive="$1"
	_check_driveDeviceFile "$currentDrive"
	
	
	local randomTempName
	randomTempName=$(cat /dev/urandom 2> /dev/null | base64 2> /dev/null | tr -dc 'a-zA-Z0-9' 2> /dev/null | head -c 8 2> /dev/null)
	echo > /dev/shm/"$randomTempName".key
	chmod 0700 /dev/shm/"$randomTempName".key
	cat /dev/urandom 2> /dev/null | base64 2> /dev/null | tr -dc 'a-z0-9' 2> /dev/null | head --bytes=8192 > /dev/shm/"$randomTempName".key
	
	#seek=700
	#seek=22808
	#count=8192
	head --bytes=8192 /dev/shm/"$randomTempName".key | dd of="$currentDrive" bs=1 seek=700 status=progress iflag=fullblock conv=notrunc
	sync
	head --bytes=8192 /dev/shm/"$randomTempName".key | dd of="$currentDrive" bs=1 seek=22808 status=progress iflag=fullblock conv=notrunc
	echo
	sync
	
	dd if="$currentDrive" bs=1 skip=700 count=8192 iflag=fullblock conv=notrunc 2>/dev/null | head --bytes=1152 | tail --bytes=12
	echo
	dd if="$currentDrive" bs=1 skip=22808 count=8192 iflag=fullblock conv=notrunc 2>/dev/null | head --bytes=1152 | tail --bytes=12
	echo
	echo
	sleep 9
	
	
	
	# https://en.wikipedia.org/wiki/Blu-ray
	# DANGER: A track is estimated at ~334kB == 4.5MB/s / (810 RPM / 60s) . Thus very poorly if at all even 'marginallyRedundant'. Loss of a single track will destroy both copies.
	
	cat /dev/urandom 2> /dev/null | base64 2> /dev/null | tr -dc 'a-z0-9' 2> /dev/null | dd of=/dev/shm/"$randomTempName".key bs=256K count=8 iflag=fullblock > /dev/null 2>&1
	cp /dev/shm/"$randomTempName".key /dev/shm/"$randomTempName".tmp
	dd if=/dev/shm/"$randomTempName".key bs=1 skip=700 count=8192 2>/dev/null | tr -dc 'a-z0-9' | dd of=/dev/shm/"$randomTempName".tmp bs=1 seek=22808 iflag=fullblock conv=notrunc > /dev/null 2>&1
	mv /dev/shm/"$randomTempName".tmp /dev/shm/"$randomTempName".key
	
	sleep 6
	growisofs -Z "$currentDrive"=/dev/shm/"$randomTempName".key -use-the-force-luke=notray
	sync
	sleep 9
	
	dd if=/dev/shm/"$randomTempName".key of="$currentDrive" status=progress iflag=fullblock conv=notrunc
	echo
	sync
	sleep 9
	
	
	rm -f /dev/shm/"$randomTempName".tmp > /dev/null 2>&1
	rm -f /dev/shm/"$randomTempName".key
	sync
	
	
	_embed_packetDisc_read "$1"
}



# DANGER: Only intended to 'writeOnce' archive file based 'flipKey'. Not intended for, and not compatible with, any kind of partitioning, 'keyPartition', 'extremelyRedundant', etc.
# WARNING: A 'keyPartition' disc may work with this directly if 'c-h-flipKey' and 'container.vc' are appropriate symlinks (and a keyPartition is not embedded within the filesystem as with a udf '_packetDisc_keypartition'), however, it is preferable simply to create a nested container, as nevertheless required with 'extremelyRedundant'.
# Discs may be fully rewritable due to 'mkudffs', however, this is not intended. At most, 'writeOnce' appending of data would be desirable, but this may not yet be available (or may not be recoverable from).
# TODO: Experimentally, MSW can write 'udf' filesystems on 'writeOnce' discs. However, MSW seems unable to read/write veracrypt volumes formatted with 'udf', and Linux cannot write 'udf' on 'writeOnce' disc, so this is not yet interesting.
# DANGER: If intented for long-term archival or other 'backup', *test* that data as written is readable.
_packetDisc_permanent() {
	! _marginallyRedundant_criticalDep && return 1
	local currentDrive
	currentDrive=$(_find_packetDrive)
	[[ "$1" != "" ]] && currentDrive="$1"
	#_check_driveDeviceFile "$currentDrive"
	
	! [[ -e "$currentDrive" ]] && echo 'FAIL: missing: drive' && exit 1
	if findmnt "$currentDrive" > /dev/null 2>&1 || findmnt "$currentDrive"-part1 > /dev/null 2>&1  || findmnt "$currentDrive"-part2 > /dev/null 2>&1 || findmnt "$currentDrive"-part3 > /dev/null 2>&1 || findmnt "$currentDrive"1 > /dev/null 2>&1 || findmnt "$currentDrive"2 > /dev/null 2>&1 || findmnt "$currentDrive"3 > /dev/null 2>&1
	then
		echo 'FAIL: safety: detect: mountpoint' && exit 1
	fi
	
	
	# Strongly recommended for write-once disc, as no such disc is known to have incomplete 'overwriting' functionality with possibly 'inaccessible' areas.
	# 'Rot' of at least a few bits from microscopic defects is likely mitigated by the redundant copy.
	local current_packetDisc_permanent_redundantKeyFile
	current_packetDisc_permanent_redundantKeyFile="true"
	
	local current_packetDisc_permanent_METHOD
	
	# NOTICE: Prefer 'udf_single' .
	# ATTENTION: WARNING: Not directly mountable by MSW, possibly not copyable by MSW, probably necessitating a LinuxVM.
	# At least 'DVD-RAM' and 'BD-R' discs seem copyable by MSW from this mode, at least when MSW is completely idle.
	# Possible issues combining MSW, BD-RE, and non-idle CPU, from the 'udf_single' mode, are significant but not substantial, while the 'udf_tmmp_mkudffs' mode may be at much greater risk of substantial data loss or severe inconvenience.
	current_packetDisc_permanent_METHOD="udf_single"
	
	# NOTICE: Do not depend on 'writeOnce' discs as impossible to modify unintentionally by software, rather, at best having physical durability and a long archival life . Recovering data from unintended software modification may be guaranteed in principle, and inconvenient in practice.
	# ATTENTION: WARNING: Probably writable by MSW (even on 'writeOnce' disc), possibly writable by future Linux kernel versions.
	# CAUTION: DANGER: In fact, MSW may add irrelevant directories of its own without prompting, greatly delay attempts to 'grab' directly, and if the disc is removed, 'scanning and repairing' may be necessitated in some cases.
	# DANGER: MSW may alter the checksum of the originally written data of a BD-R disc (implying data was written to addresses within that data)! Disc checksum might not change after every mounting, but this should not be relied upon.
	# Recovering an image of the disc back to a usable session may be possible. Mounting with '-o session=0' does NOT revert changes.
	# https://en.wikipedia.org/wiki/CDRoller
	# Not writable by Linux if 'writeOnce' BD-R disc, at least by default by kernels released ~2020 .
	#current_packetDisc_permanent_METHOD="udf_temp_mkudffs"
	
	# DANGER: May be unreadable even if written correctly! Not successfully tested for expected readability!
	#current_packetDisc_permanent_METHOD="iso9660_single_udf_multi"
	
	
	
	local currentVolumeDirectory
	currentVolumeDirectory="$2"
	[[ "$currentVolumeDirectory" == "" ]] && currentVolumeDirectory="$PWD"
	#[[ ! -e "$currentVolumeDirectory"/_local/disk.sh ]] && currentVolumeDirectory="$PWD"
	[[ ! -e "$currentVolumeDirectory"/_local/container.vc ]] && currentVolumeDirectory="$PWD"
	[[ ! -e "$currentVolumeDirectory"/_local/c-h-flipKey ]] && currentVolumeDirectory="$PWD"
	
	if [[ ! -e "$currentVolumeDirectory"/_local/container.vc ]] || [[ ! -e "$currentVolumeDirectory"/_local/c-h-flipKey ]]
	then
		echo 'FAIL: missing: container or key!'
		exit 1
	fi
	
	#[[ ! -e "$currentVolumeDirectory"/_local/c-h-flipKey.bak ]] && echo 'warn: redundant key recommended if large'
	
	if mountpoint "$currentVolumeDirectory"/_local/fs > /dev/null 2>&1 || mountpoint "$currentVolumeDirectory"/fs > /dev/null 2>&1 || mountpoint "$currentVolumeDirectory" > /dev/null 2>&1 || ( [[ ! -e "$currentVolumeDirectory"/_local/fs ]] && [[ ! -e "$currentVolumeDirectory"/fs ]] && ( mountpoint "$currentVolumeDirectory"/../fs > /dev/null 2>&1 || mountpoint "$currentVolumeDirectory"/../../fs > /dev/null 2>&1 ) )
	then
		echo 'FAIL: mounted!'
		exit 1
	fi
	
	if mountpoint "$currentVolumeDirectory"/_local/fs_temp > /dev/null 2>&1 || mountpoint "$currentVolumeDirectory"/fs_temp > /dev/null 2>&1 || mountpoint "$currentVolumeDirectory" > /dev/null 2>&1 || ( [[ ! -e "$currentVolumeDirectory"/_local/fs_temp ]] && [[ ! -e "$currentVolumeDirectory"/fs_temp ]] && ( mountpoint "$currentVolumeDirectory"/../fs_temp > /dev/null 2>&1 || mountpoint "$currentVolumeDirectory"/../../fs_temp > /dev/null 2>&1 ) )
	then
		echo 'FAIL: mounted!'
		exit 1
	fi
	
	
	
	
	echo && echo '!!!!! ##### !!!!! packetDisc_permanent: WRITING AFTER ~12SECONDS! !!!!! ##### !!!!!' && echo
	
	[[ -e "$currentVolumeDirectory"/isoSymlinks ]] && echo 'FAIL: exists: temporary directory' && exit 1
	[[ -e "$currentVolumeDirectory"/udfFiles ]] && echo 'FAIL: exists: temporary directory' && exit 1
	
	
	echo && echo '##### packetDisc_permanent: format: sparing' && echo
	# DANGER: Defect management may or may not be necessary to minimize use of 'weak' 'sectors' on disc which are readable but at the limits of ECC.
	# DANGER: Checksum is first session only - defect management may be necessary to ensure data is written correctly when 'multisessioning' .
	# WARNING: Checksum may not match expectations (especially if multisessioning) .
	# http://www.blu-raydisc.com/Assets/Downloadablefile/BD-R_Physical_3rd_edition_0602f1-15268.pdf
	sleep 12
	sudo -n dvd+rw-format -force -ssa=default "$currentDrive"
	#sudo -n dvd+rw-format -force -blank -ssa=default "$currentDrive"
	#sudo -n dvd+rw-format -ssa=none "$currentDrive"
	sync
	sleep 9
	
	# WARNING: Attempts to use 'shm' (ie. 'ramdrive') if 'free space' is small enough to presume the 'curentVolumeDirectory' is a small removable disc .
	#local current_udfImage
	export current_udfImage="$currentVolumeDirectory"/udfImage
	if [[ $(bc <<< "scale=0; "$(echo $(($(stat -f --format="%a*%S" "$currentVolumeDirectory"))) | tr -dc '0-9')" / 1048576"" < 2500") != "0" ]]
	then
		export current_udfImage=/dev/shm/udfImage_uk4uPhB663kVcygT0q
		#current_packetDisc_permanent_METHOD="udf_temp_mkudffs"
	fi
	[[ -e "$current_udfImage" ]] && echo 'FAIL: exists: '"$current_udfImage" && exit 1
	
	[[ -L "$currentVolumeDirectory"/_local/c-h-flipKey ]] && current_packetDisc_permanent_METHOD="udf_temp_mkudffs"
	[[ -L "$currentVolumeDirectory"/_local/container.vc ]] && current_packetDisc_permanent_METHOD="udf_temp_mkudffs"
	
	
	if [[ "$current_packetDisc_permanent_METHOD" == "udf_temp_mkudffs" ]]
	then
		echo && echo '##### packetDisc_permanent: mkudffs (temporary file)' && echo
		local temporaryFileKey
		temporaryFileKey=$(cat /dev/urandom 2> /dev/null | base64 2> /dev/null | tr -dc 'a-zA-Z0-9' 2> /dev/null | head -c 96 2> /dev/null)
		
		local desiredMebibytes
		desiredMebibytes=$(sudo -n blockdev --getsize64 "$currentDrive" | tr -dc '0-9')
		[[ "$desiredMebibytes" == "" ]] && exit 1
		desiredMebibytes=$(bc <<< "scale=0; ( $desiredMebibytes / 1048576 ) - 2")
		
		local desiredMebibytes_fromContainer
		desiredMebibytes_fromContainer=$(sudo -n wc -c "$currentVolumeDirectory"/_local/container.vc "$currentVolumeDirectory"/_local/c-h-flipKey | cut -f1 -d\  | tail -n1 | tr -dc '0-9')
		[[ "$desiredMebibytes_fromContainer" == "" ]] && exit 1
		desiredMebibytes_fromContainer=$(bc <<< "scale=0; ( $desiredMebibytes_fromContainer / 1048576 ) + 28 + 2")
		
		local desiredMebibytes_fromContainer_redundant
		desiredMebibytes_fromContainer_redundant=$(sudo -n wc -c "$currentVolumeDirectory"/_local/c-h-flipKey | cut -f1 -d\  | tail -n1 | tr -dc '0-9')
		[[ "$desiredMebibytes_fromContainer_redundant" == "" ]] && exit 1
		desiredMebibytes_fromContainer_redundant=$(bc <<< "scale=0; ( $desiredMebibytes_fromContainer_redundant / 1048576 ) + $desiredMebibytes_fromContainer ")
		
		desiredMebibytes="$desiredMebibytes_fromContainer_redundant"
		
		echo 'desiredMebibytes= '"$desiredMebibytes"
		echo 'desiredMebibytes_fromContainer_redundant= '"$desiredMebibytes_fromContainer_redundant"
		dd if=/dev/zero of="$current_udfImage" bs=1048576 count="$desiredMebibytes" status=progress
		sync
		
		sudo -n /sbin/cryptsetup remove discManager_mkudffs_uk4uPhB663kVcygT0q
		[[ -e /dev/mapper/discManager_mkudffs_uk4uPhB663kVcygT0q ]] && exit 1
		echo "$temporaryFileKey" | sudo -n /sbin/cryptsetup --hash whirlpool --key-size=512 --cipher aes-xts-plain64 --key-file=- create discManager_mkudffs_uk4uPhB663kVcygT0q "$current_udfImage"
		sync
		! [[ -e /dev/mapper/discManager_mkudffs_uk4uPhB663kVcygT0q ]] && exit 1
		
		_pattern_recovery_write /dev/mapper/discManager_mkudffs_uk4uPhB663kVcygT0q
		sync
		
		temporaryFileKey=""
		unset temporaryFileKey
		
		_packetDisc_permanent_software_mkudffs "$currentVolumeDirectory"
	fi
	
	
	if [[ "$current_packetDisc_permanent_METHOD" == "udf_temp_mkudffs" ]]
	then
		( [[ "$current_packetDisc_permanent_METHOD" == "udf_single" ]] || [[ "$current_packetDisc_permanent_METHOD" == "iso9660_single_udf_multi" ]] ) && echo && echo '##### packetDisc_permanent: checksum: mkisofs (pipe)' && echo
		[[ "$current_packetDisc_permanent_METHOD" == "udf_temp_mkudffs" ]] && echo && echo '##### packetDisc_permanent: checksum (temporary file)' && echo
		local current_cksum_raw
		local current_cksum_cksum
		local current_cksum_size
		( [[ "$current_packetDisc_permanent_METHOD" == "udf_single" ]] || [[ "$current_packetDisc_permanent_METHOD" == "iso9660_single_udf_multi" ]] ) && current_cksum_raw=$(_packetDisc_permanent_software_mkisofs "$currentVolumeDirectory" | env CMD_ENV=xpg4 cksum | tr -dc '0-9 ')
		[[ "$current_packetDisc_permanent_METHOD" == "udf_temp_mkudffs" ]] && current_cksum_raw=$(cat /dev/mapper/discManager_mkudffs_uk4uPhB663kVcygT0q | env CMD_ENV=xpg4 cksum | tr -dc '0-9 ')
		current_cksum_cksum=$(echo "$current_cksum_raw" | cut -f1 -d\  )
		current_cksum_size=$(echo "$current_cksum_raw" | cut -f2 -d\  )
		
		echo 'current_cksum_raw= '"$current_cksum_raw"
		echo 'current_cksum_cksum= '"$current_cksum_cksum"
		echo 'current_cksum_size= '"$current_cksum_size"
	fi
	
	
	
	sleep 6
	
	# Theoretically, it might be unfortunate (ruined writeOnce disc) if mkisofs fails to 'pipe' data quickly enough. Practically, any 'disk' mkisofs is 'reading' a small number of files from should be more likely to cause such failures (negating theoretical reliability benefit of temporary file).
	#-allow-limited-size
	#-dvd-compat
	( [[ "$current_packetDisc_permanent_METHOD" == "udf_single" ]] || [[ "$current_packetDisc_permanent_METHOD" == "iso9660_single_udf_multi" ]] ) && echo && echo '##### packetDisc_permanent: growisofs: mkisofs (pipe)' && echo
	( [[ "$current_packetDisc_permanent_METHOD" == "udf_single" ]] ) && _packetDisc_permanent_software_mkisofs "$currentVolumeDirectory" | growisofs -dvd-compat -Z "$currentDrive"=/dev/stdin -use-the-force-luke=notray
	( [[ "$current_packetDisc_permanent_METHOD" == "iso9660_single_udf_multi" ]] ) && _packetDisc_permanent_software_mkisofs "$currentVolumeDirectory" 2>/dev/null | growisofs -Z "$currentDrive"=/dev/stdin -use-the-force-luke=notray
	
	# Using 'mkudffs' apparently requires a temporary file. Without multisessioning of the 'udf' filesystem, that would take >25GB 'temporary' storage, imposing at best, SSD wear and such.
	# WARNING: Regardless of actual temporary file size, 'growisofs' will show 'progress' estimates equivalent to writing entire disc.
	#-dvd-compat
	[[ "$current_packetDisc_permanent_METHOD" == "udf_temp_mkudffs" ]] && echo && echo '##### packetDisc_permanent: growisofs (temporary file)' && echo
	#[[ "$current_packetDisc_permanent_METHOD" == "udf_temp_mkudffs" ]] && cat /dev/mapper/discManager_mkudffs_uk4uPhB663kVcygT0q | growisofs -dvd-compat -Z "$currentDrive"=/dev/stdin -use-the-force-luke=notray
	[[ "$current_packetDisc_permanent_METHOD" == "udf_temp_mkudffs" ]] && growisofs -dvd-compat -Z "$currentDrive"=/dev/mapper/discManager_mkudffs_uk4uPhB663kVcygT0q -use-the-force-luke=notray
	
	sync
	sleep 9
	
	
	if [[ "$current_packetDisc_permanent_METHOD" == "iso9660_single_udf_multi" ]]
	then
		echo && echo '##### packetDisc_permanent: growisofs: multisessioning: mkisofs (pipe)' && echo
		# DANGER: May be unreadable even if written correctly!
		# Multisessioning after an iso9660 filesystem (albeit resulting in some 'udf') . Attempted workaround to keep the correct permissions of an iso9660 filesystem, while adding large files.
		# Unfortunately, at least Linux does not recognize the correct large file size, at best causing even greater inconvenience.
		# Apparently 'growisofs' does NOT use a temporary file for output of mkisofs/'genisoimage' .
		#  # '  Executing 'genisoimage -C ##,#### -M /dev/fd/3 -allow-limited-size -f -R -J "$currentVolumeDirectory"/isoSymlinks | builtin_dd of=/dev/dvd obs=32k seek=503'  '
		mkdir -p "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local
		#ln -sf "$currentVolumeDirectory"/_local "$currentVolumeDirectory"/isoSymlinks/user/flipKey/
		ln -sf "$currentVolumeDirectory"/ops.sh "$currentVolumeDirectory"/isoSymlinks/user/flipKey/
		ln -sf "$currentVolumeDirectory"/_local/ops.sh "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local/
		#ln -sf "$currentVolumeDirectory"/_local/disk.sh "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local/
		ln -sf "$currentVolumeDirectory"/_local/disk.sh "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local/disk.sh.orig
		ln -sf "$currentVolumeDirectory"/_local/c-h-flipKey "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local/
		ln -sf "$currentVolumeDirectory"/_local/container.vc "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local/
		[[ -e "$currentVolumeDirectory"/_local/fs ]] && mkdir -p "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local/fs
		# Strongly recommended.
		[[ "$current_packetDisc_permanent_redundantKeyFile" == "true" ]] && ln -sf "$currentVolumeDirectory"/_local/c-h-flipKey "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local/c-h-flipKey.bak
		echo '

_disk_declare() {
	_disk_default
	
	
	[[ -e "$scriptLocal"/fs ]] && export flipKey_mount="$scriptLocal"/fs
	[[ -e "$scriptLocal"/../../../fs ]] && export flipKey_mount="$scriptLocal"/../../../fs
	
	[[ -e "$scriptLocal"/../../fs ]] && export flipKey_mount="$scriptLocal"/../../fs
	[[ -e "$scriptLocal"/../fs ]] && export flipKey_mount="$scriptLocal"/../fs
	
	
	export flipKey_headerKeySize='$(cat "$currentVolumeDirectory"/_local/c-h-flipKey | wc -c | tr -dc '0-9')'
	
	
	export flipKey_packetDisc_exhaustible="true"
}

' > "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local/disk.sh
		sleep 6
		growisofs -M /dev/dvd -use-the-force-luke=notray -allow-limited-size -f -R -J "$currentVolumeDirectory"/isoSymlinks
		sleep 9
		rm -f "$currentVolumeDirectory"/isoSymlinks/user/flipKey/ops.sh
		rm -f "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local/ops.sh
		rm -f "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local/disk.sh.orig
		rm -f "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local/disk.sh
		rm -f "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local/c-h-flipKey
		rm -f "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local/container.vc
		rm -f "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local/c-h-flipKey.bak
		#rm -f "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local
		rmdir "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local/fs
		rmdir "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local
		rmdir "$currentVolumeDirectory"/isoSymlinks/user/flipKey
		rmdir "$currentVolumeDirectory"/isoSymlinks/user
		rmdir "$currentVolumeDirectory"/isoSymlinks
	fi
	
	
	
	[[ -e /dev/mapper/discManager_mkudffs_uk4uPhB663kVcygT0q ]] && currentIterations=0 && while [[ "$currentIterations" -lt 3 ]] && ! sudo -n /sbin/cryptsetup remove discManager_mkudffs_uk4uPhB663kVcygT0q ; do sleep 20 ; let currentIterations=currentIterations+1 ; done
	rm -f "$current_udfImage"
	
	
	sudo -n partprobe
	#_extremelyRedundant_is_packetDisc "$currentDrive" && sudo -n kpartx -a "$currentDrive"
	sync
	
	# https://unix.stackexchange.com/questions/256832/mount-dvd-without-eject-after-burn
	sudo -n udevadm trigger
	sync
	
	if [[ "$current_packetDisc_permanent_METHOD" == "udf_temp_mkudffs" ]]
	then
		echo && echo '##### packetDisc_permanent: read' && echo
		echo 'current_cksum_raw= '"$current_cksum_raw"
		echo 'current_cksum_cksum= '"$current_cksum_cksum"
		echo 'current_cksum_size= '"$current_cksum_size"
		echo
		_messagePlain_request 'request: compare checksum (in progress)'
		echo sudo -n dd if=\""$currentDrive"\" bs=1M \| head --bytes=\""$current_cksum_size"\" \| env CMD_ENV=xpg4 cksum
		sudo -n dd if="$currentDrive" bs=1M | head --bytes="$current_cksum_size" | env CMD_ENV=xpg4 cksum
	fi
	
	# WARNING: CAUTION: Apparently, 'writeOnce' (ie. 'BD-R') discs may actually require power cycle, ejection, or SCSI reset. Indeed, SCSI reset does apparently work, though scripting this may be unusually risky.
	# sudo -n blockdev --getsize64 /dev/sr0
	# https://unix.stackexchange.com/questions/256832/mount-dvd-without-eject-after-burn
	_messagePlain_request 'request: eject or power cycle of packetDrive peripherial may be necessary'
	
	return 0
}
# WARNING: MSW apparently will not copy a few tens of thousands of files efficiently from CDROM filesystems.
# https://arstechnica.com/civis/viewtopic.php?f=20&t=557321
# mkisofs -r -l -f -o test.iso -J ./iso
_packetDisc_permanent_software_mkisofs() {
	local currentVolumeDirectory
	currentVolumeDirectory="$1"
	[[ -e "$currentVolumeDirectory"/isoSymlinks ]] && echo 'FAIL: exists: temporary directory' && exit 1
	
	#"$1"/_local "$1"/_lib/_setups "$1"/_lib/ubiquitous_bash/*.sh "$1"/_lib/ubiquitous_bash/*.py "$1"/_lib/ubiquitous_bash/*.bat "$1"/_lib/ubiquitous_bash/*.txt "$1"/_lib/ubiquitous_bash/*.md "$1"/_lib/ubiquitous_bash/*.gpl "$1"/_lib/ubiquitous_bash/*.html "$1"/_lib/ubiquitous_bash/*.jar "$1"/_lib/ubiquitous_bash/*.agpl "$1"/_lib/ubiquitous_bash/fork "$1"/_lib/ubiquitous_bash/lab "$1"/_prog "$1"/*.bat "$1"/*.md "$1"/*.sh "$1"/package* "$1"/*.py "$1"/flipKey "$1"/discManager "$1"/license* "$1"/gpl*.txt "$1"/.gitignore
	
	mkdir -p "$currentVolumeDirectory"/isoSymlinks/user/flipKey
	mkdir -p "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_lib
	mkdir -p "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_lib/_setups
	! [[ -e "$currentVolumeDirectory"/isoSymlinks/user/flipKey ]] && exit 1
	
	if [[ "$current_packetDisc_permanent_METHOD" == "udf_single" ]] && [[ "$current_packetDisc_permanent_METHOD" != "iso9660_single_udf_multi" ]]
	then
		#ln -sf "$currentVolumeDirectory"/_local "$currentVolumeDirectory"/isoSymlinks/user/flipKey/
		mkdir -p "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local
		ln -sf "$currentVolumeDirectory"/ops.sh "$currentVolumeDirectory"/isoSymlinks/user/flipKey/
		ln -sf "$currentVolumeDirectory"/_local/ops.sh "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local
		#ln -sf "$currentVolumeDirectory"/_local/disk.sh "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local
		ln -sf "$currentVolumeDirectory"/_local/disk.sh "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local/disk.sh.orig
		ln -sf "$currentVolumeDirectory"/_local/c-h-flipKey "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local
		ln -sf "$currentVolumeDirectory"/_local/container.vc "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local
		[[ -e "$currentVolumeDirectory"/_local/fs ]] && mkdir -p "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local/fs
		[[ -e "$currentVolumeDirectory"/fs ]] && mkdir -p "$currentVolumeDirectory"/isoSymlinks/user/flipKey/fs
		
		# Strongly recommended.
		[[ "$current_packetDisc_permanent_redundantKeyFile" == "true" ]] && ln -sf "$currentVolumeDirectory"/_local/c-h-flipKey "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local/c-h-flipKey.bak
		
		echo '

_disk_declare() {
	_disk_default
	
	
	[[ -e "$scriptLocal"/fs ]] && export flipKey_mount="$scriptLocal"/fs
	[[ -e "$scriptLocal"/../../../fs ]] && export flipKey_mount="$scriptLocal"/../../../fs
	
	[[ -e "$scriptLocal"/../../fs ]] && export flipKey_mount="$scriptLocal"/../../fs
	[[ -e "$scriptLocal"/../fs ]] && export flipKey_mount="$scriptLocal"/../fs
	
	
	export flipKey_headerKeySize='$(cat "$currentVolumeDirectory"/_local/c-h-flipKey | wc -c | tr -dc '0-9')'
	
	
	export flipKey_packetDisc_exhaustible="true"
}

' > "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local/disk.sh
	
	fi
	
	
	ln -sf "$currentVolumeDirectory"/_prog "$currentVolumeDirectory"/isoSymlinks/user/flipKey/
	ln -sf "$currentVolumeDirectory"/_lib/_setups/distribution "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_lib/_setups/
	ln -sf "$currentVolumeDirectory"/_lib/_setups/veracrypt "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_lib/_setups/
	#ln -sf "$currentVolumeDirectory"/package* "$currentVolumeDirectory"/isoSymlinks/user/flipKey/
	#ln -sf "$currentVolumeDirectory"/discManager* "$currentVolumeDirectory"/isoSymlinks/user/flipKey/
	ln -sf "$currentVolumeDirectory"/flipKey "$currentVolumeDirectory"/isoSymlinks/user/flipKey/
	ln -sf "$currentVolumeDirectory"/*.bat "$currentVolumeDirectory"/isoSymlinks/user/flipKey/
	ln -sf "$currentVolumeDirectory"/*.sh "$currentVolumeDirectory"/isoSymlinks/user/flipKey/
	ln -sf "$currentVolumeDirectory"/*.py "$currentVolumeDirectory"/isoSymlinks/user/flipKey/
	ln -sf "$currentVolumeDirectory"/gpl-3.0.txt "$currentVolumeDirectory"/isoSymlinks/user/flipKey/
	ln -sf "$currentVolumeDirectory"/license.txt "$currentVolumeDirectory"/isoSymlinks/user/flipKey/
	ln -sf "$currentVolumeDirectory"/README.md "$currentVolumeDirectory"/isoSymlinks/user/flipKey/
	ln -sf "$currentVolumeDirectory"/.gitignore "$currentVolumeDirectory"/isoSymlinks/user/flipKey/
	
	[[ -e "$currentVolumeDirectory"/../../fs ]] && mkdir -p "$currentVolumeDirectory"/isoSymlinks/fs
	[[ -e "$currentVolumeDirectory"/../fs ]] && mkdir -p "$currentVolumeDirectory"/isoSymlinks/user/fs
	
	
	rm -f "$currentVolumeDirectory"/isoSortList
	echo 'user/flipKey/_local/c-h-flipKey	1000' >> "$currentVolumeDirectory"/isoSortList
	echo 'user/flipKey/_local/container.vc	2000' >> "$currentVolumeDirectory"/isoSortList
	echo -n 'user/flipKey/_local/c-h-flipKey.bak	3000' >> "$currentVolumeDirectory"/isoSortList
	#echo >> "$currentVolumeDirectory"/isoSortList
	
	
	if [[ "$current_packetDisc_permanent_METHOD" == "udf_single" ]] && [[ "$current_packetDisc_permanent_METHOD" != "iso9660_single_udf_multi" ]]
	then
		# https://www.hungred.com/how-to/making-mount-dvdcdrom-executable-linux/
		# Mounting as 'iso9660' filesystem instead of 'udf' seems to result in reasonable 'executable' file permissions.
		# 'man genisoimage'
		#  '-udf'
		#   'no POSIX permission support'
		_mkisofs -allow-limited-size -udf -output-charset iso8859-1 -uid 0 -gid 0 -dir-mode 0770 -file-mode 0770 -new-dir-mode 0770 -r -l -f -J -sort "$currentVolumeDirectory"/isoSortList -o /dev/stdout "$currentVolumeDirectory"/isoSymlinks
	fi
	
	if [[ "$current_packetDisc_permanent_METHOD" == "iso9660_single_udf_multi" ]]
	then
		# Apparently, leaving the large files for 'multisessioning' allows a 'iso9660' filesystem to show the correct permissions when mounted by Linux.
		_mkisofs -output-charset iso8859-1 -uid 0 -gid 0 -dir-mode 0770 -file-mode 0770 -new-dir-mode 0770 -r -l -f -J -sort "$currentVolumeDirectory"/isoSortList -o /dev/stdout "$currentVolumeDirectory"/isoSymlinks
	fi
	
	rm -f "$currentVolumeDirectory"/isoSortList
	
	
	! [[ -e "$currentVolumeDirectory"/isoSymlinks/user/flipKey ]] && exit 1
	
	rm -f "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local
	
	rm -f "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_prog
	#rm -f "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_lib/_setups
	rm -f "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_lib/_setups/distribution
	rm -f "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_lib/_setups/veracrypt
	rm -f "$currentVolumeDirectory"/isoSymlinks/user/flipKey/ops.sh
	rm -f "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local/ops.sh
	rm -f "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local/disk.sh
	rm -f "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local/disk.sh.orig
	rm -f "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local/c-h-flipKey
	rm -f "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local/container.vc
	rm -f "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local/c-h-flipKey.bak
	
	! [[ -e "$currentVolumeDirectory"/isoSymlinks/user/flipKey ]] && exit 1
	rmdir "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_lib/_setups
	rmdir "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_lib
	rmdir "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local/fs
	rmdir "$currentVolumeDirectory"/isoSymlinks/user/flipKey/fs
	rmdir "$currentVolumeDirectory"/isoSymlinks/user/fs
	rmdir "$currentVolumeDirectory"/isoSymlinks/user/flipKey/_local
	rmdir "$currentVolumeDirectory"/isoSymlinks/fs
	rm -f "$currentVolumeDirectory"/isoSymlinks/user/flipKey/.gitignore
	rm -f "$currentVolumeDirectory"/isoSymlinks/user/flipKey/*
	
	rmdir "$currentVolumeDirectory"/isoSymlinks/user/flipKey
	rmdir "$currentVolumeDirectory"/isoSymlinks/user
	rmdir "$currentVolumeDirectory"/isoSymlinks
}
_packetDisc_permanent_software_mkudffs() {
	local currentVolumeDirectory
	currentVolumeDirectory="$1"
	
	[[ -e "$currentVolumeDirectory"/udfFiles ]] && echo 'FAIL: exists: temporary' && exit 1
	
	# DANGER: May or may not be 'permanent' (as in 'read-only') if written to 'rewritable' disc.
	# 14336
	sudo -n mkudffs --utf8 --blocksize=2048 --media-type=dvdram --udfrev=0x0201 --lvid="CDROM" --vid="CDROM" /dev/mapper/discManager_mkudffs_uk4uPhB663kVcygT0q
	sudo -n chown "$USER":"$USER" "$current_udfImage"
	sync
	
	mkdir -p "$currentVolumeDirectory"/udfFiles
	sudo -n mount /dev/mapper/discManager_mkudffs_uk4uPhB663kVcygT0q "$currentVolumeDirectory"/udfFiles
	sudo -n chown "$USER":"$USER" "$currentVolumeDirectory"/udfFiles
	if ! mountpoint "$currentVolumeDirectory"/udfFiles > /dev/null 2>&1
	then
		rmdir "$currentVolumeDirectory"/udfFiles
		return 1
	fi
	
	mkdir -m 700 -p "$currentVolumeDirectory"/udfFiles/user/flipKey
	mkdir -m 700 -p "$currentVolumeDirectory"/udfFiles/user/flipKey/_lib/_setups
	
	cp -r "$currentVolumeDirectory"/_prog "$currentVolumeDirectory"/udfFiles/user/flipKey/
	cp -r "$currentVolumeDirectory"/_lib/_setups/distribution "$currentVolumeDirectory"/udfFiles/user/flipKey/_lib/_setups/
	cp -r "$currentVolumeDirectory"/_lib/_setups/veracrypt "$currentVolumeDirectory"/udfFiles/user/flipKey/_lib/_setups/
	cp "$currentVolumeDirectory"/flipKey "$currentVolumeDirectory"/udfFiles/user/flipKey/
	cp "$currentVolumeDirectory"/*.bat "$currentVolumeDirectory"/udfFiles/user/flipKey/
	cp "$currentVolumeDirectory"/*.sh "$currentVolumeDirectory"/udfFiles/user/flipKey/
	cp "$currentVolumeDirectory"/*.py "$currentVolumeDirectory"/udfFiles/user/flipKey/
	cp "$currentVolumeDirectory"/gpl-3.0.txt "$currentVolumeDirectory"/udfFiles/user/flipKey/
	cp "$currentVolumeDirectory"/license.txt "$currentVolumeDirectory"/udfFiles/user/flipKey/
	cp "$currentVolumeDirectory"/README.md "$currentVolumeDirectory"/udfFiles/user/flipKey/
	cp "$currentVolumeDirectory"/.gitignore "$currentVolumeDirectory"/udfFiles/user/flipKey/
	
	
	mkdir -m 700 -p "$currentVolumeDirectory"/udfFiles/user/flipKey/_local
	[[ -e "$currentVolumeDirectory"/_local/fs ]] && mkdir -p "$currentVolumeDirectory"/udfFiles/user/flipKey/_local/fs
	[[ -e "$currentVolumeDirectory"/fs ]] && mkdir -p "$currentVolumeDirectory"/udfFiles/user/flipKey/fs
	[[ -e "$currentVolumeDirectory"/../fs ]] && mkdir -p "$currentVolumeDirectory"/udfFiles/user/fs
	[[ -e "$currentVolumeDirectory"/../../fs ]] && mkdir -p "$currentVolumeDirectory"/udfFiles/fs
	cp "$currentVolumeDirectory"/ops.sh "$currentVolumeDirectory"/udfFiles/user/flipKey/
	#cp "$currentVolumeDirectory"/_local/disk.sh "$currentVolumeDirectory"/udfFiles/user/flipKey/_local/
	cp "$currentVolumeDirectory"/_local/disk.sh "$currentVolumeDirectory"/udfFiles/user/flipKey/_local/disk.sh.orig
	cp "$currentVolumeDirectory"/_local/ops.sh "$currentVolumeDirectory"/udfFiles/user/flipKey/_local/
	
	#cp "$currentVolumeDirectory"/_local/c-h-flipKey "$currentVolumeDirectory"/udfFiles/user/flipKey/_local/
	#cp "$currentVolumeDirectory"/_local/container.vc "$currentVolumeDirectory"/udfFiles/user/flipKey/_local/
	sudo -n dd if="$currentVolumeDirectory"/_local/c-h-flipKey of="$currentVolumeDirectory"/udfFiles/user/flipKey/_local/c-h-flipKey bs=1M
	sudo -n dd if="$currentVolumeDirectory"/_local/container.vc of="$currentVolumeDirectory"/udfFiles/user/flipKey/_local/container.vc bs=1M status=progress
	sudo -n chown "$USER":"$USER" "$currentVolumeDirectory"/udfFiles/user/flipKey/_local/c-h-flipKey
	sudo -n chown "$USER":"$USER" "$currentVolumeDirectory"/udfFiles/user/flipKey/_local/container.vc
	sync
	
	# Strongly recommended.
	[[ "$current_packetDisc_permanent_redundantKeyFile" == "true" ]] && cp "$currentVolumeDirectory"/_local/c-h-flipKey "$currentVolumeDirectory"/udfFiles/user/flipKey/_local/c-h-flipKey.bak
	
	
	[[ -e "$currentVolumeDirectory"/../../fs ]] && mkdir -p "$currentVolumeDirectory"/udfFiles/fs
	sync
	
	echo '

_disk_declare() {
	_disk_default
	
	
	[[ -e "$scriptLocal"/fs ]] && export flipKey_mount="$scriptLocal"/fs
	[[ -e "$scriptLocal"/../../../fs ]] && export flipKey_mount="$scriptLocal"/../../../fs
	
	[[ -e "$scriptLocal"/../../fs ]] && export flipKey_mount="$scriptLocal"/../../fs
	[[ -e "$scriptLocal"/../fs ]] && export flipKey_mount="$scriptLocal"/../fs
	
	
	export flipKey_headerKeySize='$(cat "$currentVolumeDirectory"/_local/c-h-flipKey | wc -c | tr -dc '0-9')'
	
	
	export flipKey_packetDisc_exhaustible="true"
}

' > "$currentVolumeDirectory"/udfFiles/user/flipKey/_local/disk.sh
	
	
	
	sudo -n umount "$currentVolumeDirectory"/udfFiles
	sync
	
	rmdir "$currentVolumeDirectory"/udfFiles
	
	return 0
}



_desilver_packetDisc() {
	export current_desilver_packetDisc_limited="false"
	
	if [[ "$flipKey_packetDisc_writeOnce" == "true" ]]
	then
		_desilver_packetDisc_wo "$@"
		return
	fi
	
	_desilver_packetDisc_rw "$@"
}
_desilver_packetDisc_quick() {
	_desilver_packetDisc_partitionTable "$@"
}
_desilver_packetDisc_partitionTable() {
	export current_desilver_packetDisc_limited="true"
	
	if [[ "$flipKey_packetDisc_writeOnce" == "true" ]]
	then
		_desilver_packetDisc_wo "$@"
		return
	fi
	
	_desilver_packetDisc_rw "$@"
}
_desilver_packetDisc_wo() {
	! _marginallyRedundant_criticalDep && return 1
	local currentDrive
	currentDrive=$(_find_packetDrive)
	[[ "$1" != "" ]] && currentDrive="$1"
	_check_driveDeviceFile "$currentDrive"
	
	[[ "$current_desilver_packetDisc_limited" != "true" ]] && export current_desilver_packetDisc_limited="false"
	
	
	# WARNING: Untested.
	# WARNING: May only be set ONCE for 'write-once' disc.
	echo '##### desilver: format: enable sparing	##### #####'
	sleep 12
	#sudo -n dvd+rw-format -force -ssa=default "$currentDrive"
	sudo -n dvd+rw-format -force -blank -ssa=default "$currentDrive"
	sync
	sleep 9
}
_desilver_packetDisc_rw() {
	! _marginallyRedundant_criticalDep && return 1
	local currentDrive
	currentDrive=$(_find_packetDrive)
	[[ "$1" != "" ]] && currentDrive="$1"
	_check_driveDeviceFile "$currentDrive"
	
	[[ "$current_desilver_packetDisc_limited" != "true" ]] && export current_desilver_packetDisc_limited="false"
	
	
	
	# ATTENTION: Look for other places where 'dvd+rw-format' command may be 'commented', possibly inappropriately.
	# http://fy.chalmers.se/~appro/linux/DVD+RW/Blu-ray/
	#  'when growisofs "runs into" a blank BD-RE media, it automatically pre-formats it with minimal spare area of 256MB'
	#echo '##### desilver: format'
	echo '##### desilver: format: enable sparing	##### #####'
	sleep 12
	sudo -n dvd+rw-format -force -ssa=default "$currentDrive"
	sync
	sleep 9
	
	
	# https://www.kernel.org/doc/html/latest/cdrom/packet-writing.html
	# pktcdvd driver makes the disc appear as a regular block device with a 2KB block size
	# Usually not necessary - useful 'rewritable' packet discs apparently may be used as regular block devices by Linux .
	
	
	local randomTempName
	randomTempName=$(cat /dev/urandom 2> /dev/null | base64 2> /dev/null | tr -dc 'a-zA-Z0-9' 2> /dev/null | head -c 8 2> /dev/null)
	local currentRandomLabel
	local currentRandomUUID
	local currentIteration=0
	local currentIterationLimit=12
	_extremelyRedundant_is_packetDisc "$currentDrive" && currentIterationLimit=3
	[[ "$flipKey_packetDisc_exhaustible" == "true" ]] && currentIterationLimit=3
	while [[ "$currentIteration" -lt "$currentIterationLimit" ]]
	do
		if [[ "$currentIteration" == 2 ]]
		then
			echo '##### desilver: write (part): disable sparing	##### #####'
			sleep 12
			sudo -n dvd+rw-format -force -ssa=none "$currentDrive"
			sync
			sleep 9
		fi
		
		# DANGER: An 'iso' image will fails to 'random' overwrite UDF 'bootarea' and such, which may be at positions <34kB .
		# Seems an iso image with a random file usually only begins after 51200 bytes.
		# #dd if="$randomTempName" bs=1 skip=51200 count=10 2>/dev/null ; echo -n
		#cat /dev/urandom 2> /dev/null | base64 2> /dev/null | tr -dc 'A-Z0-9' 2> /dev/null | head -c 134217728 2> /dev/null > /dev/shm/"$randomTempName".rnd
		##_mkisofs -r -o /dev/shm/"$randomTempName".iso /dev/shm/"$randomTempName".rnd
		#sleep 9
		
		#echo '##### desilver: write (part): growisofs'
		#sleep 6
		##growisofs -Z "$currentDrive"=/dev/shm/"$randomTempName".iso -use-the-force-luke=notray
		#growisofs -Z "$currentDrive"=/dev/shm/"$randomTempName".rnd -use-the-force-luke=notray
		#sync
		#sleep 9
		
		
		echo '##### desilver: write (part): dd'
		
		cat /dev/urandom 2> /dev/null | base64 2> /dev/null | tr -dc 'A-Z0-9' 2> /dev/null | sudo -n dd of="$currentDrive" bs=1M count=128 oflag=direct conv=fdatasync status=progress iflag=fullblock
		sync
		sleep 9
		
		rm -f /dev/shm/"$randomTempName".iso > /dev/null 2>&1
		rm -f /dev/shm/"$randomTempName".rnd
		
		
		echo '##### desilver: write (part): embed'
		_embed_packetDisc "$currentDrive"
		
		
		#echo '##### desilver: write (part): mkusffs'
		#currentRandomLabel=$(cat /dev/urandom 2> /dev/null | base64 2> /dev/null | tr -dc 'a-zA-Z0-9' 2> /dev/null | head -c 8 2> /dev/null)
		#currentRandomUUID=$(cat /dev/urandom 2> /dev/null | xxd -p | tr -d '\n' | head -c16)
		#sudo -n mkudffs --utf8 --blocksize=2048 --media-type=dvdrw --udfrev=0x0201 --bootarea erase --uuid "$currentRandomUUID" --lvid="$currentRandomLabel" --vid="$currentRandomLabel" "$currentDrive"
		#sync
		#sleep 24
		
		let currentIteration=currentIteration+1
		echo '##### desilver: write (part): iteration= '"$currentIteration"'	====='
	done
	
	#echo '##### desilver: write (full): disable sparing	##### #####'
	#sleep 12
	#sudo -n dvd+rw-format -force -ssa=none "$currentDrive"
	#sync
	#sleep 9
	
	
	
	#echo '##### desilver: write (full): growisofs'
	#sleep 6
	#growisofs -Z "$currentDrive"=/dev/urandom -use-the-force-luke=notray
	#sync
	#sleep 12
	
	if [[ "$current_desilver_packetDisc_limited" != "true" ]]
	then
		echo '##### desilver: write (full): dd'
		#cat /dev/urandom | sudo -n dd of="$currentDrive" bs=1M count=128 oflag=direct conv=fdatasync status=progress iflag=fullblock
		#sync
		cat /dev/urandom | sudo -n dd of="$currentDrive" bs=1M oflag=direct conv=fdatasync status=progress iflag=fullblock
		sync
		sleep 9
	fi
	
	
	echo '##### desilver: format: enable sparing	##### #####'
	sleep 12
	sudo -n dvd+rw-format -force -ssa=default "$currentDrive"
	sync
	sleep 9
	
	
	echo '##### desilver: pattern'
	_pattern_recovery_write "$currentDrive" 128
	
	echo '##### desilver: embed'
	_embed_packetDisc "$currentDrive" > /dev/null
	
	return 0
}

_packetDisc() {
	_packetDisc_keyPartition "$@"
}
_packetDisc_bd25() {
	_packetDisc_keyPartition "$@"
}
_bd25() {
	_packetDisc_bd25 "$@"
}
_packetDisc_bd100() {
	_packetDisc_keyPartition "$@"
}
_bd100() {
	_packetDisc_bd100 "$@"
}
_packetDisc_bd128() {
	_packetDisc_keyPartition "$@"
}
_bd128() {
	_packetDisc_bd128 "$@"
}
# DANGER: May NOT qualify even as 'marginallyRedundant', even if 'btrfs-dup' and veracrypt redundant headers are available.
# DANGER: Redundancy is unpredictable at best, and all known 'packet' discs may be read at highly plausibly unsafe spindle speeds.
# Positioning two redundant reasonably geometrically separate 'keyPartition' areas within the UDF 'bootarea', 'label', etc, may be unpredictable at best.
_packetDisc_marginallyRedundant() {
	export marginallyRedundant="true"
	export MSWcompatible="false"
	
	#export flipKey_packetDisc_exhaustible='true'
	
	#export flipKey_packetDisc_writeOnce='false'
	#export flipKey_packetDisc_partitionEmulation='false'
	
	_packetDisc_procedure "$@"
}
# Broken. Linux kernel apparently cannot write to 'udf-vat' .
_packetDisc_writeOnce() {
	export marginallyRedundant="false"
	export MSWcompatible="true"
	
	export flipKey_packetDisc_exhaustible='true'
	
	export flipKey_packetDisc_writeOnce='true'
	#export flipKey_packetDisc_partitionEmulation='false'
	
	_packetDisc_procedure "$@"
}
_packetDisc_ntfs() {
	export marginallyRedundant="false"
	export MSWcompatible="true"
	
	#export flipKey_packetDisc_exhaustible='true'
	
	#export flipKey_packetDisc_writeOnce='false'
	#export flipKey_packetDisc_partitionEmulation='false'
	
	_packetDisc_procedure "$@"
}
_packetDisc_keyPartition() {
	export marginallyRedundant="false"
	export MSWcompatible="false"
	
	#export flipKey_packetDisc_exhaustible='true'
	
	#export flipKey_packetDisc_writeOnce='false'
	#export flipKey_packetDisc_partitionEmulation='false'
	
	
	_packetDisc_procedure "$@"
}
#_disc_packetDisc_keyPartition
_packetDisc_procedure() {
	! _marginallyRedundant_criticalDep && return 1
	local currentDrive
	currentDrive=$(_find_packetDrive)
	[[ "$1" != "" ]] && currentDrive="$1"
	_check_driveDeviceFile "$currentDrive"
	
	local functionEntryPWD
	functionEntryPWD="$PWD"
	
	
	if [[ "$flipKey_packetDisc_writeOnce" != "true" ]]
	then
		# https://superuser.com/questions/1620197/udf-formatting-a-bd-re-under-linux-media-type-bdr-unknown
		# Reportedly, 'BD-RE' may be formatted as a 'dvd+rw' .
		# However, beware BD-RE media may plausibly be 'discontinued' imminently.
		# High quality new discs of known recent manufacturing may already be difficult to obtain.
		
		echo '##### _packetDisc_keyPartition: format: desilver	##### #####'
		_desilver_packetDisc_partitionTable "$currentDrive"
		
		echo '##### _packetDisc_keyPartition: format: enable sparing	##### #####'
		#sudo -n dvd+rw-format -force -ssa=default "$currentDrive"
		sudo -n dvd+rw-format -force -blank -ssa=default "$currentDrive"
	fi
	
	
	# A 'keyPartition' as such is only needed for rewritable, MSW *NOT* compatible, discs.
	if [[ "$MSWcompatible" != "true" ]] && [[ "$flipKey_packetDisc_writeOnce" != "true" ]] && [[ "$flipKey_packetDisc_partitionEmulation" != "true" ]]
	then
		echo '##### _packetDisc_keyPartition: embed'
		_embed_packetDisc "$currentDrive" > /dev/null
		_embed_packetDisc "$currentDrive" > /dev/null
		echo
		_embed_packetDisc "$currentDrive" > /dev/null
	fi
	
	
	
	# 11 random alphanumeric digits, starting with alpha charcter.
	local currentRandomLabel
	currentRandomLabel=$(cat /dev/urandom 2> /dev/null | base64 2> /dev/null | tr -dc 'a-zA-Z' 2> /dev/null | tr -d 'acdefhilmnopqrsuvACDEFHILMNOPQRSU14580' | head -c 1 2> /dev/null)$(cat /dev/urandom 2> /dev/null | base64 2> /dev/null | tr -dc 'a-zA-Z0-9' 2> /dev/null | tr -d 'acdefhilmnopqrsuvACDEFHILMNOPQRSU14580' | head -c 10 2> /dev/null)
	
	local currentRandomUUID
	currentRandomUUID=$(cat /dev/urandom 2> /dev/null | xxd -p | tr -d '\n' | head -c16)
	
	
	echo '##### _packetDisc_keyPartition: filesystem'
	
	
	local current_keyPartition_sampleA_cksum
	local current_keyPartition_sampleA_wc
	local current_keyPartition_sampleA_text
	local current_keyPartition_sampleC_cksum
	local current_keyPartition_sampleC_wc
	local current_keyPartition_sampleC_text
	local current_keyPartition_sampleB_cksum
	local current_keyPartition_sampleB_wc
	local current_keyPartition_sampleB_text
	local current_keyPartition_sampleD_cksum
	local current_keyPartition_sampleD_wc
	local current_keyPartition_sampleD_text
	
	# A 'keyPartition' as such is only needed for rewritable, MSW *NOT* compatible, discs.
	if [[ "$MSWcompatible" != "true" ]] && [[ "$flipKey_packetDisc_writeOnce" != "true" ]] && [[ "$flipKey_packetDisc_partitionEmulation" != "true" ]]
	then
		current_keyPartition_sampleA_cksum=$(sudo -n dd if="$currentDrive" bs=1 skip=700 count=8192 2>/dev/null | tr -dc 'a-zA-Z0-9' | env CMD_ENV=xpg4 cksum | cut -f1 -d\  | tr -dc '0-9' | head --bytes=2)
		current_keyPartition_sampleA_wc=$(sudo -n dd if="$currentDrive" bs=1 skip=700 count=8192 2>/dev/null | tr -dc 'a-zA-Z0-9' | wc -c | cut -f1 -d\  | tr -dc '0-9')
		current_keyPartition_sampleA_text=$(sudo -n dd if="$currentDrive" bs=1 skip=700 count=6 2>/dev/null | tr -dc 'a-zA-Z0-9')$(sudo -n dd if="$currentDrive" bs=1 skip=8880 count=6 2>/dev/null | tr -dc 'a-zA-Z0-9')
		echo "-- cksum=$current_keyPartition_sampleA_cksum	wc=$current_keyPartition_sampleA_wc		text=$current_keyPartition_sampleA_text"
		
		current_keyPartition_sampleC_cksum=$(sudo -n dd if="$currentDrive" bs=1 skip=22808 count=8192 2>/dev/null | tr -dc 'a-zA-Z0-9' | env CMD_ENV=xpg4 cksum | cut -f1 -d\  | tr -dc '0-9' | head --bytes=2)
		current_keyPartition_sampleC_wc=$(sudo -n dd if="$currentDrive" bs=1 skip=22808 count=8192 2>/dev/null | tr -dc 'a-zA-Z0-9' | wc -c | cut -f1 -d\  | tr -dc '0-9')
		current_keyPartition_sampleC_text=$(sudo -n dd if="$currentDrive" bs=1 skip=22808 count=6 2>/dev/null | tr -dc 'a-zA-Z0-9')$(sudo -n dd if="$currentDrive" bs=1 skip=8880 count=6 2>/dev/null | tr -dc 'a-zA-Z0-9')
		echo "-- cksum=$current_keyPartition_sampleC_cksum	wc=$current_keyPartition_sampleC_wc		text=$current_keyPartition_sampleC_text"
		
		#sudo -n mkudffs --utf8 --blocksize=2048 --media-type=dvdrw --udfrev=0x0201 --bootarea mbr --uuid "$currentRandomUUID" --lvid="$currentRandomLabel" --vid="$currentRandomLabel" "$currentDrive"
		#sudo -n mkudffs --utf8 --blocksize=2048 --media-type=dvdrw --udfrev=0x0201 --bootarea preserve --uuid "$currentRandomUUID" --lvid="$currentRandomLabel" --vid="$currentRandomLabel" "$currentDrive"
		sudo -n mkudffs --utf8 --blocksize=2048 --media-type=dvdram --udfrev=0x0201 --bootarea preserve --uuid "$currentRandomUUID" --lvid="$currentRandomLabel" --vid="$currentRandomLabel" "$currentDrive"
		#sudo -n mkudffs --utf8 --udfrev=0x0201 --bootarea preserve --uuid="$currentRandomUUID" --lvid="$currentRandomLabel" --vid="$currentRandomLabel" "$currentDrive"
		sync
		
		current_keyPartition_sampleB_cksum=$(sudo -n dd if="$currentDrive" bs=1 skip=700 count=8192 2>/dev/null | tr -dc 'a-zA-Z0-9' | env CMD_ENV=xpg4 cksum | cut -f1 -d\  | tr -dc '0-9' | head --bytes=2)
		current_keyPartition_sampleB_wc=$(sudo -n dd if="$currentDrive" bs=1 skip=700 count=8192 2>/dev/null | tr -dc 'a-zA-Z0-9' | wc -c | cut -f1 -d\  | tr -dc '0-9')
		current_keyPartition_sampleB_text=$(sudo -n dd if="$currentDrive" bs=1 skip=700 count=6 2>/dev/null | tr -dc 'a-zA-Z0-9')$(sudo -n dd if="$currentDrive" bs=1 skip=8880 count=6 2>/dev/null | tr -dc 'a-zA-Z0-9')
		echo "-- cksum=$current_keyPartition_sampleB_cksum	wc=$current_keyPartition_sampleB_wc		text=$current_keyPartition_sampleB_text"
		
		current_keyPartition_sampleD_cksum=$(sudo -n dd if="$currentDrive" bs=1 skip=22808 count=8192 2>/dev/null | tr -dc 'a-zA-Z0-9' | env CMD_ENV=xpg4 cksum | cut -f1 -d\  | tr -dc '0-9' | head --bytes=2)
		current_keyPartition_sampleD_wc=$(sudo -n dd if="$currentDrive" bs=1 skip=22808 count=8192 2>/dev/null | tr -dc 'a-zA-Z0-9' | wc -c | cut -f1 -d\  | tr -dc '0-9')
		current_keyPartition_sampleD_text=$(sudo -n dd if="$currentDrive" bs=1 skip=22808 count=6 2>/dev/null | tr -dc 'a-zA-Z0-9')$(sudo -n dd if="$currentDrive" bs=1 skip=8880 count=6 2>/dev/null | tr -dc 'a-zA-Z0-9')
		echo "-- cksum=$current_keyPartition_sampleD_cksum	wc=$current_keyPartition_sampleD_wc		text=$current_keyPartition_sampleD_text"
		
		( [[ "$current_keyPartition_sampleA_cksum" != "$current_keyPartition_sampleA_cksum" ]] || [[ "$current_keyPartition_sampleA_cksum" != "$current_keyPartition_sampleB_cksum" ]] || [[ "$current_keyPartition_sampleA_cksum" != "$current_keyPartition_sampleC_cksum" ]] || [[ "$current_keyPartition_sampleA_cksum" != "$current_keyPartition_sampleD_cksum" ]] ) && echo 'FAIL: keyPartition mismatch after filesystem!' && return 1
		( [[ "$current_keyPartition_sampleA_wc" != "8192" ]] || [[ "$current_keyPartition_sampleB_wc" != "8192" ]] || [[ "$current_keyPartition_sampleC_wc" != "8192" ]] || [[ "$current_keyPartition_sampleD_wc" != "8192" ]] ) && echo 'FAIL: keyPartition mismatch after filesystem!' && return 1
		( [[ "$current_keyPartition_sampleA_text" != "$current_keyPartition_sampleA_text" ]] || [[ "$current_keyPartition_sampleA_text" != "$current_keyPartition_sampleB_text" ]] || [[ "$current_keyPartition_sampleA_text" != "$current_keyPartition_sampleC_text" ]] || [[ "$current_keyPartition_sampleA_text" != "$current_keyPartition_sampleD_text" ]] ) && echo 'FAIL: keyPartition mismatch after filesystem!' && return 1
	else
		if [[ "$flipKey_packetDisc_writeOnce" != "true" ]] && [[ "$flipKey_packetDisc_partitionEmulation" != "true" ]]
		then
			# ie. MSWcompatible
			echo 'MSWcompatible'
			# WARNING: Most likely, 'keyPartition' use of 'bootarea' incompatible and ineffective with MSW. Instead, 'mbr' may have some benefit.
			# WARNING: Apparently '--media-type=dvdram' works with other discs as well (ie. BD-RE) and even with 'dvdram', may be *necessary* to allow expected 'mass storage' behavior, including correct 'permissions', 'executable' scripts, real-time read/write of disc .
			sudo -n mkudffs --utf8 --blocksize=2048 --media-type=dvdram --udfrev=0x0201 --bootarea mbr --uuid "$currentRandomUUID" --lvid="$currentRandomLabel" --vid="$currentRandomLabel" "$currentDrive"
			##sudo -n mkudffs --utf8 --udfrev=0x0201 --bootarea mbr --uuid="$currentRandomUUID" --lvid="$currentRandomLabel" --vid="$currentRandomLabel" "$currentDrive"
			#sync
		elif [[ "$flipKey_packetDisc_partitionEmulation" == "true" ]]
		then
			# ie. partitionEmulation
			echo 'partitionEmulation'
			# ATTENTION: Unusual. UDF partition of only 32MiB, as 'software' partition, which may access other parts of the disc through 'dmsetup' 'partitionEmulation' .
			# Beware any such functionality necessarily probably will be unable to use PARTUUID.
			# 'man mkudffs' 'Linux  kernel  ignores  MBR table if contains partition which starts at sector 0.'
			#  So probably not worthwhile to bother with that.
			# No plausible use with 'writeOnce' discs.
			# --read-only
			sudo -n mkudffs --utf8 --blocksize=2048 --media-type=dvdram --udfrev=0x0201 --bootarea mbr --uuid "$currentRandomUUID" --lvid="$currentRandomLabel" --vid="$currentRandomLabel" "$currentDrive" 16384
		else
			# ie. writeOnce
			# TODO: Apparently unusable.
			echo 'writeOnce'
			sudo -n mkudffs --utf8 --blocksize=2048 --vat --media-type=dvdr --udfrev=0x0201 --bootarea mbr --uuid "$currentRandomUUID" --lvid="$currentRandomLabel" --vid="$currentRandomLabel" "$currentDrive"
		fi
	fi
	
	
	[[ "$marginallyRedundant" != "true" ]] && export marginallyRedundant="false"
	[[ "$MSWcompatible" != "true" ]] && export MSWcompatible="false"
	[[ "$flipKey_packetDisc_partitionEmulation" != "true" ]] && export flipKey_packetDisc_partitionEmulation="false"
	
	# /dev/disk/by-uuid/????????????????
	# /dev/disk/by-uuid/"$currentRandomUUID"
	# Indeed the UUID is apparently unusual - exactly 16 characters with no punctuation.
	#export flipKey_software_udf_uuid=$(sudo -n lsblk --noheadings -o PARTUUID "$currentDrive" | grep -v '^$' | head -n1 | tail -n1 )
	export flipKey_software_udf_uuid="$currentRandomUUID"
	export flipkey_headerKey_udf_uuid="$currentRandomUUID"
	
	export flipkey_headerKey_udf_skip01="700"
	export flipkey_headerKey_udf_skip02="22808"
	export flipkey_headerKey_udf_count="8192"
	
	sync
	local currentIteration
	currentIteration=0
	while ! [[ "$currentIteration" -gt 6 ]] && ! [[ -e /dev/disk/by-uuid/"$currentRandomUUID" ]]
	do
		echo 'wait: disc: iteration: '"$currentIteration"
		ls -A -1 /dev/disk/by-uuid/"$currentRandomUUID"
		ls -A -1 /dev/disk/by-partuuid/"$currentRandomUUID"
		
		sudo -n partprobe
		#_extremelyRedundant_is_packetDisc "$currentDrive" && sudo -n kpartx -a "$currentDrive"
		sync
		
		# https://unix.stackexchange.com/questions/256832/mount-dvd-without-eject-after-burn
		sudo -n udevadm trigger
		sync
		
		sleep 15
		
		if ! [[ -e /dev/disk/by-uuid/"$currentRandomUUID" ]]
		then
			if ! [[ "$currentIteration" -lt 1 ]]
			then
				_messagePlain_request 'request: may be necessary to remove and reinsert disk (sleep 45)'
				sleep 45
			else
				true
				#sleep 15
			fi
		fi
		
		let currentIteration=currentIteration+1
	done
	
	echo 'accepted: disc'
	! [[ -e /dev/disk/by-uuid/"$currentRandomUUID" ]] && return 1
	sleep 30
	
	
	# ATTENTION: Software .
	
	mkdir -m 700 -p ./diskMount/user
	
	#if true
	if [[ "$flipKey_packetDisc_partitionEmulation" != "true" ]]
	then
		sudo -n mount /dev/disk/by-uuid/"$flipKey_software_udf_uuid" ./diskMount
	else
		# In some cases, might be preferable to mount with option to 'close' session after writing.
		# https://man.netbsd.org/NetBSD-5.0/mount_udf.8
		sudo -n mount /dev/disk/by-uuid/"$flipKey_software_udf_uuid" ./diskMount
	fi
	
	sudo -n chown "$USER":"$USER" ./diskMount
	mkdir -m 700 -p ./diskMount/user
	sudo -n chown "$USER":"$USER" ./diskMount/user
	
	if ! mountpoint ./diskMount > /dev/null 2>&1
	then
		rmdir ./diskMount/user
		rmdir ./diskMount
		return 1
	fi
	
	sudo -n ln -s -n /dev/shm ./diskMount/shm
	
	# ATTENTION: Unusual. Pre-generated keyFile.
	mkdir -p ./diskMount/user/flipKey/_local
	dd if=/dev/urandom of=./diskMount/user/flipKey/_local/c-h-flipKey bs=1M count=6
	sync
	#if [[ "$marginallyRedundant" == "true" ]]
	#then
		if [[ "$flipKey_packetDisc_writeOnce" != "true" ]]
		then
			cp ./diskMount/user/flipKey/_local/c-h-flipKey ./diskMount/user/flipKey/_local/c-h-flipKey.bak
			sync
		fi
	#fi
	
	
	#_extractAttachment
	_attachment > "$functionEntryPWD"/package_tmp.tar.xz
	_noAttachment | tee ./discManager_noAttachment.sh > /dev/null 2>&1
	cd "$functionEntryPWD"/diskMount/user
	mv "$functionEntryPWD"/diskMount/user/flipKey/_local/disk.sh "$functionEntryPWD"/diskMount/user/flipKey/_local/disk.sh.bak
	mv "$functionEntryPWD"/diskMount/user/flipKey/_local/ops.sh "$functionEntryPWD"/diskMount/user/flipKey/_local/ops.sh.bak > /dev/null 2>&1
	mv "$functionEntryPWD"/diskMount/user/flipKey/ops.sh "$functionEntryPWD"/diskMount/user/flipKey/ops.sh.bak
	tar -xvpf "$functionEntryPWD"/package_tmp.tar.*
	sync
	
	
	rm "$functionEntryPWD"/package_tmp.tar.*
	cd "$functionEntryPWD"/diskMount
	sudo -n mv "$functionEntryPWD"/discManager_noAttachment.sh ./discManager
	sudo -n rm -f "$functionEntryPWD"/discManager_noAttachment.sh > /dev/null 2>&1
	#sudo -n cp "$functionEntryPWD"/discManager ./
	sudo -n rm ./discManager
	cd "$functionEntryPWD"
	sync
	
	
	
	[[ "$flipKey_packetDisc_exhaustible" != "true" ]] && export flipKey_packetDisc_exhaustible='false'
	_extremelyRedundant_is_packetDisc "$currentDrive" && export flipKey_packetDisc_exhaustible='true'
	[[ "$flipKey_packetDisc_writeOnce" == "true" ]] && export flipKey_packetDisc_exhaustible='true'
	
	_here_keyPartition_udf > ./diskMount/user/flipKey/_local/disk.sh
	sync
	
	# Similar to 'splitDisc', but not same as. Should use 'dmsetup' linear mappings, but as part of '__grab' or similar function overides, using specific regions of disc directly for volume and key partitions. Whereas splitDisc creates separate devices to be partitioned as would be entire discs.
	# WARNING: Apparently unusable. Creating 'dmsetup' linear mappings apparently does not work if disc filesystem is mounted, necessitating 'splitDisc' instead.
	[[ "$flipKey_packetDisc_partitionEmulation" == "true" ]] && type _here_keyPartition_udf-partitionEmulation > /dev/null 2>&1 && _here_keyPartition_udf-partitionEmulation > ./diskMount/user/flipKey/_local/disk.sh
	sync
	
	
	
	cd "$functionEntryPWD"/diskMount
	sudo -n ln -s ./user/flipKey/___nilfs_gc.bat
	sudo -n ln -s ./user/flipKey/__grab.bat
	sudo -n ln -s ./user/flipKey/__toss.bat
	sudo -n ln -s ./user/flipKey/discManager-src.sh ./discManager
	
	sudo -n ln -s ./user/flipKey/___btrfs_balance.bat
	sudo -n ln -s ./user/flipKey/___btrfs_defrag.bat
	sudo -n ln -s ./user/flipKey/___btrfs_scrub_start.bat
	sudo -n ln -s ./user/flipKey/___btrfs_scrub_status.bat
	sudo -n ln -s ./user/flipKey/___btrfs_snapshot.bat
	sudo -n ln -s ./user/flipKey/___btrfs_gc.bat
	sudo -n ln -s ./user/flipKey/___btrfs_compsize.bat
	
	
	cd "$functionEntryPWD"
	
	
	mv -f "$functionEntryPWD"/diskMount/user/flipKey/_local/disk.sh.bak "$functionEntryPWD"/diskMount/user/flipKey/_local/disk.sh
	mv -f "$functionEntryPWD"/diskMount/user/flipKey/_local/ops.sh.bak "$functionEntryPWD"/diskMount/user/flipKey/_local/ops.sh > /dev/null 2>&1
	mv -f "$functionEntryPWD"/diskMount/user/flipKey/ops.sh.bak "$functionEntryPWD"/diskMount/user/flipKey/ops.sh
	
	# ATTENTION: Unusual. Copies pre-generated keyFile, possibly three copies total, after copying other files, hopefully geometrically spacing the copies a few tracks apart on the disc.
	# DANGER: Overwriting of this keyFile during 'desilvering' may be inadequate if 'keyPartition' is ignored (eg. due to 'MSWcompatible').
	if [[ "$flipKey_packetDisc_writeOnce" == "true" ]]
	then
		cp ./diskMount/user/flipKey/_local/c-h-flipKey ./diskMount/user/flipKey/_local/c-h-flipKey.bak
		sync
	fi
	if [[ "$marginallyRedundant" == "true" ]]
	then
		mv ./diskMount/user/flipKey/_local/c-h-flipKey.bak ./diskMount/user/flipKey/_local/c-h-flipKey.bak2
		cp ./diskMount/user/flipKey/_local/c-h-flipKey ./diskMount/user/flipKey/_local/c-h-flipKey.bak
		sync
	fi
	
	sudo -n umount ./diskMount
	sync
	
	if [[ "$flipKey_packetDisc_partitionEmulation" == "true" ]] && _extremelyRedundant_is_packetDisc
	then
		echo > ./diskMount/empty
		sleep 6
		growisofs -dvd-compat -M "$currentDrive"=./diskMount/empty
		sync
		sleep 9
		rm -f ./diskMount/empty
		
		sleep 12
		sudo -n dvd+rw-format -lead-out "$currentDrive"
		sync
		sleep 9
	fi
	
	rmdir ./diskMount/user
	rmdir ./diskMount
	
	# ATTENTION: Software .
	
	
	
	
	_messagePlain_request 'request: eject or power cycle of packetDrive peripherial may be necessary'
	return 0
}



_here_keyPartition_udf() {
	export currentDiscType=_disc_packetDisc_keyPartition
	[[ "$MSWcompatible" == "true" ]] && export currentDiscType=_disc_packetDisc
	[[ "$marginallyRedundant" == "true" ]] && export currentDiscType=_disc_packetDisc_marginallyRedundant
	[[ "$flipKey_packetDisc_writeOnce" == "true" ]] && export currentDiscType=_disc_packetDisc_writeOnce
	[[ "$flipKey_packetDisc_partitionEmulation" == "true" ]] && export currentDiscType=_disc_packetDisc_partitionEmulation
	
	cat << CZXWXcRMTo8EmM8i4d
export currentDiscType=$currentDiscType

export marginallyRedundant=$marginallyRedundant
export MSWcompatible=$MSWcompatible

export flipKey_packetDisc_writeOnce=$flipKey_packetDisc_writeOnce
export flipKey_packetDisc_partitionEmulation=$flipKey_packetDisc_partitionEmulation

# /dev/disk/by-uuid/????????????????
export flipKey_software_udf_uuid=$flipKey_software_udf_uuid
export flipkey_headerKey_udf_uuid=$flipkey_headerKey_udf_uuid

export flipkey_headerKey_udf_skip01=$flipkey_headerKey_udf_skip01
export flipkey_headerKey_udf_skip02=$flipkey_headerKey_udf_skip02
export flipkey_headerKey_udf_count=$flipkey_headerKey_udf_count


CZXWXcRMTo8EmM8i4d
	
	
	cat << 'CZXWXcRMTo8EmM8i4d'


_read_keyPartition_UDF() {
	export flipkey_headerKey_udf_skip="$flipkey_headerKey_udf_skip01"
	export flipkey_headerKey_udf_file="$scriptLocal"/c-h-flipKey
	
	# https://unix.stackexchange.com/questions/538397/how-to-run-a-command-1-out-of-n-times-in-bash
	[ "$RANDOM" -lt 3277 ] && export flipkey_headerKey_udf_skip="$flipkey_headerKey_udf_skip02"
	[ "$RANDOM" -lt 3277 ] && [[ -e "$scriptLocal"/c-h-flipKey.bak ]] && export flipkey_headerKey_udf_file="$scriptLocal"/c-h-flipKey.bak
	
	
	sudo -n dd if=/dev/disk/by-uuid/"$flipKey_software_udf_uuid" bs=1 skip="$flipkey_headerKey_udf_skip" count="$flipkey_headerKey_udf_count" 2>/dev/null | cat - "$flipkey_headerKey_udf_file"
}

_set_occasional_concatenated_read_redundant_headerKey_UDF() {
	# ATTENTION: No 'keyPartition' Usually only appropriate if 'ntfs' 'MSW' compatibility desired.
	if [[ "$MSWcompatible" == "true" ]]
	then
		export flipKey_headerKeyFile="$scriptLocal"/c-h-flipKey
		[ "$RANDOM" -lt 3277 ] && [[ -e "$scriptLocal"/c-h-flipKey.bak ]] && export flipkey_headerKey_udf_file="$scriptLocal"/c-h-flipKey.bak
		return 0
	fi
	
	mkdir -m 0700 -p "$bootTmp"/"$sessionid"/
	export flipKey_headerKeyFile="$bootTmp"/"$sessionid"/flipKey_assembly_headerKeyFile
	
	_read_keyPartition_UDF > "$flipKey_headerKeyFile"
	
	return 0
}

_unset_headerKey_UDF() {
	_sweep "$bootTmp"/"$sessionid"/flipKey_assembly_headerKeyFile
	rm -f "$bootTmp"/"$sessionid"/flipKey_assembly_headerKeyFile > /dev/null 2>&1
	
	if [[ "$MSWcompatible" == "true" ]]
	then
		rmdir "$bootTmp"/"$sessionid"/ > /dev/null 2>&1
	else
		rmdir "$bootTmp"/"$sessionid"/
	fi
	
	export flipKey_headerKeyFile="$scriptLocal"/c-h-flipKey
}




_disk_declare() {
	[[ "$flipKey_headerKeyFile" == "" ]] && export flipKey_headerKeyFile="$scriptLocal"/c-h-flipKey
	
	export flipKey_removable='true'
	
	# DANGER: Overwriting from a 'packet' disc filesystem is probably futile!
	# Otherwise 'flipKey_physical' really should be 'false' for a 'packet' disc filesystem.
	export flipKey_physical='true'
	
	
	export flipKey_headerKeySize=6291456
	export flipKey_containerSize=$(bc <<< "scale=0; ( ( "$(df --block-size=1 --output=avail "$scriptLocal" | tr -dc '0-9')" / 1.01 ) * 1 ) - 128000000")
	
	# Reducing the size of the container hopefully might keep data a few millimeters away from the edges, where contamination due to 'handling' of the disc may be visually noticeable before data loss occurs.
	[[ "$marginallyRedundant" == "true" ]] && export flipKey_containerSize=$(bc <<< "scale=0; $flipKey_containerSize / 1.08")
	
	# 'Overhead' .
	[[ "$flipKey_packetDisc_writeOnce" == "true" ]] && export flipKey_containerSize=$(bc <<< "scale=0; $flipKey_containerSize / 1.20")
	
	[[ "$flipKey_containerSize" == "" ]] && export flipKey_containerSize=50000000
	
	
	# ATTENTION: Uncomment to force a small container size (reducing time to 'create').
	#export flipKey_containerSize=400000000
	
CZXWXcRMTo8EmM8i4d
	
	cat << CZXWXcRMTo8EmM8i4d
	
	export flipKey_packetDisc_exhaustible=$flipKey_packetDisc_exhaustible
	
CZXWXcRMTo8EmM8i4d
	
	cat << 'CZXWXcRMTo8EmM8i4d'
	
	if [[ "$flipKey_mount" != "$flipKey_mount_temp" ]] && [[ "$flipKey_functions_fsTemp" == '' ]]
	then
		export flipKey_mount="$scriptLocal"/../../../fs
	fi
	
	export flipKey_container="$scriptLocal"/container.vc
	export flipKey_MSWdrive='V'
	
	export flipKey_pattern_bs=1000000000
	export flipKey_pattern_count=$(bc <<< "scale=0; $flipKey_containerSize / $flipKey_pattern_bs")
	
	unset flipKey_tokenID
	unset flipKey_token_keyID
	
	# DANGER: Defects will emerge on all known 'packet' discs far too often to benefit from 'badblocks' (due to low official rewrite cycle specifications).
	# DVD-RAM is not a 'packet' disc, and the somewhat higher rewrite cycle specifications may not apply to all discs, speeds, etc.
	export flipKey_badblocks='false'
	
	
	#export flipKey_filesystem="ext4"
	#export flipKey_filesystem="udf"
	#export flipKey_filesystem="nilfs2"
	export flipKey_filesystem="btrfs"
	
	[[ "$flipKey_packetDisc_writeOnce" ]] && export flipKey_filesystem="udf-vat"
	
	# DANGER: Dubious benefit from multilayer discs.
	if [[ "$marginallyRedundant" == "true" ]] && [[ "$MSWcompatible" != "true" ]]
	then
		export flipKey_filesystem="btrfs-dup"
	fi
	
	if [[ "$MSWcompatible" == "true" ]]
	then
		export flipKey_filesystem="ntfs"
	fi
}




# ### Overrides.
# TODO: Preferably overwrite 'keyPartition' with 'dd' or similar if possible. Definitely not 'MSWcompatible'.

__grab() {
	echo 'udf: '${FUNCNAME[0]}
	
	_set_occasional_concatenated_read_redundant_headerKey_UDF
	
	_veracrypt_mount
	
	_unset_headerKey_UDF
}
__toss() {
	echo 'udf: '${FUNCNAME[0]}
	
	_unset_headerKey_UDF > /dev/null 2>&1
	
	_veracrypt_unmount
}
__create() {
	echo 'udf: '${FUNCNAME[0]}
	
	_disk_declare
	_check_keyPartition
	_delay_exists_mount
	
	
	if [[ -e "$scriptLocal"/c-h-flipKey ]] || [[ -e "$scriptLocal"/c-h-flipKey.bak ]]
	then
		_messagePlain_warn 'WARN: default NOT sweep existing key files from udf filesystem'
	else
		# DANGER: Overwriting this file (and overwriting all free space) from a 'packet' disc is probably futile!
		export flipKey_headerKeyFile="$scriptLocal"/c-h-flipKey.bak
		_sweep-flipKey "$flipKey_headerKeyFile"
		export flipKey_headerKeyFile="$scriptLocal"/c-h-flipKey
		_sweep-flipKey "$flipKey_headerKeyFile"
		
		
		#__create "$@"
		
		#_generate
		
		# DANGER: Overwriting this file (and overwriting all free space) from a 'packet' disc is probably futile!
		export flipKey_headerKeyFile="$scriptLocal"/c-h-flipKey
		_generate_flipKey_header
		[[ "$marginallyRedundant" == "true" ]] && cp "$scriptLocal"/c-h-flipKey "$scriptLocal"/c-h-flipKey.bak
	fi
	
	
	
	_set_occasional_concatenated_read_redundant_headerKey_UDF
	
	_veracrypt_create
	
	_unset_headerKey_UDF
}
_purge() {
	echo 'udf: '${FUNCNAME[0]}
	
	_disk_declare
	_check_keyPartition
	_delay_exists_mount
	
	
	# DANGER: Overwriting this file (and overwriting all free space) from a 'packet' disc is probably futile!
	export flipKey_headerKeyFile="$scriptLocal"/c-h-flipKey.bak
	_sweep-flipKey "$flipKey_headerKeyFile"
	export flipKey_headerKeyFile="$scriptLocal"/c-h-flipKey
	_sweep-flipKey "$flipKey_headerKeyFile"
	
	
	#__create "$@"
	
	#_generate
}
_generate() {
	echo 'udf: '${FUNCNAME[0]}
	
	_disk_declare
	_check_keyPartition
	_delay_exists_mount
	
	
	# DANGER: Overwriting this file (and overwriting all free space) from a 'packet' disc is probably futile!
	export flipKey_headerKeyFile="$scriptLocal"/c-h-flipKey.bak
	_sweep-flipKey "$flipKey_headerKeyFile"
	export flipKey_headerKeyFile="$scriptLocal"/c-h-flipKey
	_sweep-flipKey "$flipKey_headerKeyFile"
	
	
	#__create "$@"
	
	#_generate
	
	# DANGER: Overwriting this file (and overwriting all free space) from a 'packet' disc is probably futile!
	export flipKey_headerKeyFile="$scriptLocal"/c-h-flipKey
	_generate_flipKey_header
	[[ "$marginallyRedundant" == "true" ]] && cp "$scriptLocal"/c-h-flipKey "$scriptLocal"/c-h-flipKey.bak
}

CZXWXcRMTo8EmM8i4d
}


# NOTICE: '_marginallyRedundant' , 'packetDisc' (UDF) ###






# ### NOTICE: 'generic' 'keyPartition' ###

_raw_packetDisc_keyPartition() {
	! _marginallyRedundant_criticalDep && return 1
	export currentDiscType=_disc_raw_packet_keyPartition
	
	local currentDrive
	currentDrive=$(_find_packetDrive)
	_check_driveDeviceFile "$currentDrive"
	
	sudo -n dmsetup remove /dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice?? > /dev/null 2>&1
	sudo -n dmsetup remove /dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice? > /dev/null 2>&1
	sudo -n dmsetup remove /dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice > /dev/null 2>&1
	
	local currentDriveLinearSize
	currentDriveLinearSize=$(sudo -n blockdev --getsz "$currentDrive")
	sudo -n dmsetup create uk4uPhB663kVcygT0q_packetDriveDevice --table '0 '"$currentDriveLinearSize"' linear '"$currentDrive"' 0'
	
	export flipKey_packetDisc_exhaustible='true'
	_keyPartition_disk_generic /dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice
}
_generic_keyPartition() {
	export currentDiscType=_disk_generic_keyPartition
	#export flipKey_packetDisc_exhaustible='false'
	_keyPartition_disk_generic "$@"
}
_keyPartition_disk_generic() {
	! _extremelyRedundant_criticalDep && exit 1
	
	[[ "$currentDiscType" == "" ]] && export currentDiscType=_disk_generic_keyPartition
	
	local functionEntryPWD
	functionEntryPWD="$PWD"
	
	local currentDrive
	currentDrive="$1"
	_check_driveDeviceFile "$currentDrive"
	
	
	[[ ! -e "$currentDrive" ]] && echo 'fail: missing: '"$currentDrive" && exit 1
	[[ -d "$currentDrive" ]] && echo 'FAIL: DANGER: directory instead of file!' && exit 1
	
	local currentDrive_size
	currentDrive_size=$(sudo -n blockdev --getsize64 "$currentDrive" | tr -dc '0-9')
	[[ "$currentDrive_size" == "" ]] && return 1
	
	
	local keyPartition_desiredMebibytes
	keyPartition_desiredMebibytes=8
	if bc <<< "$currentDrive_size > 192000000000"
	then
		keyPartition_desiredMebibytes=300
	fi
	if bc <<< "$currentDrive_size > 768000000000"
	then
		keyPartition_desiredMebibytes=750
	fi
	
	local keyPartition_desiredMebibytes_key
	let keyPartition_desiredMebibytes_key=keyPartition_desiredMebibytes-1
	
	
	local desiredMebibytes
	desiredMebibytes=$(bc <<< " ( $currentDrive_size / 1048576 ) - 28 - ( $keyPartition_desiredMebibytes * 2 ) - 16")
	
	
	_extremelyRedundant_desilver_partitions "$currentDrive"
	_extremelyRedundant_desilver_partitionTable "$currentDrive"
	_extremelyRedundant_is_packetDisc "$currentDrive" && _pattern_recovery_write "$currentDrive" 128
	# https://unix.stackexchange.com/questions/13848/wipe-last-1mb-of-a-hard-drive
	sudo -n dd bs=512 if=/dev/urandom of="$currentDrive" count=65536 seek=$((`sudo -n blockdev --getsz "$currentDrive"` - 65536)) oflag=direct conv=fdatasync status=progress
	echo
	
	
	_extremelyRedundant_dmsetup_remove_part "$currentDrive"
	
	
	
	# ATTENTION: Partitioning .
	
	sudo -n sgdisk "$currentDrive" --zap-all > /dev/null 2>&1
	sudo -n sgdisk "$currentDrive" --clear > /dev/null 2>&1
	sudo -n sgdisk "$currentDrive" --zap-all
	sudo -n sgdisk "$currentDrive" --clear
	#sudo -n parted --script "$currentDrive" 'mklabel gpt'
	echo
	echo
	sync
	sleep 15
	
	export expectedSECTOR=$(sudo -n sgdisk "$currentDrive" --print | grep -i 'Sector size' | grep -i 'logical' | tr -dc '0-9/' | sed 's/^\///' | cut -f1 -d\/)
	if [[ "$expectedSECTOR" != 2048 ]] && [[ "$expectedSECTOR" != 512 ]] && [[ "$expectedSECTOR" != 1024 ]] && [[ "$expectedSECTOR" != 4096 ]]
	then
		echo 'fail: unrecognized sector size: '"$expectedSECTOR" && exit 1
		#export expectedSECTOR="2048"
	fi
	
	_extremelyRedundant_newKeyPartition() { _extremelyRedundant_newPartition $keyPartition_desiredMebibytes_key MiB $keyPartition_desiredMebibytes ; }
	
	
	_extremelyRedundant_sectorPosition_reset
	echo $current_nonexistent_boundary
	sync
	sudo -n partprobe
	_extremelyRedundant_is_packetDisc "$currentDrive" && sudo -n kpartx -a "$currentDrive"
	sudo -n udevadm trigger ; sync
	
	# Unallocated space (no partition).
	# WARNING: Must create partitions by sector counts. May not be compatible with specifying partitions by MiB and such.
	if _extremelyRedundant_is_packetDisc "$currentDrive"
	then
		desiredMebibytes=$(bc <<< "$desiredMebibytes - 1")
		
		
		if _extremelyRedundant_is_packetDisc "$currentDrive" && [[ "$desiredMebibytes" -gt 18000 ]]
		then
			# Blu-Ray 'inner' rotational rate is drastically different, and data begins there by default, causing a substantial performance penalty.
			desiredMebibytes=$(bc <<< "$desiredMebibytes - 896 - 1")
			_extremelyRedundant_sectorPosition_set 896 MiB 896
			export currentPartitionNumber=0
			echo "$currentBegin	$currentEnd	$currentPad_begin_exists"M"	$currentPartitionSize""	(unallocated)"
		else
			# Placeholder for ISO image (assuming backup GPT may remain usable somehow after overwrite or MBR may be usable somehow).
			# Minimum of 48MiB should be sufficient.
			desiredMebibytes=$(bc <<< "$desiredMebibytes - 48 - 1")
			_extremelyRedundant_sectorPosition_set 48 MiB 48
			export currentPartitionNumber=0
			echo "$currentBegin	$currentEnd	$currentPad_begin_exists"M"	$currentPartitionSize""	(unallocated)"
		fi
	fi
	
	_extremelyRedundant_newPartition 28 MiB "" software
	#sudo -n sgdisk "$currentDrive" --typecode=0:8300
	#sudo -n sgdisk "$currentDrive" --typecode=1:8300
	echo
	
	_extremelyRedundant_newKeyPartition
	_extremelyRedundant_newPartition "$desiredMebibytes" MiB
	#_extremelyRedundant_newKeyPartition
	echo
	
	
	sync
	sudo -n partprobe
	_extremelyRedundant_is_packetDisc "$currentDrive" && sudo -n kpartx -a "$currentDrive"
	sudo -n udevadm trigger ; sync
	
	echo 'list: sgdisk'
	sudo -n sgdisk "$currentDrive" --print
	sudo -n sgdisk "$currentDrive" --verify
	echo
	echo
	#echo 'list: parted'
	#sudo -n parted --script "$currentDrive" 'unit MiB print'
	#echo
	
	
	sleep 15
	local currentIteration
	currentIteration=0
	while [[ "$currentIteration" -lt 6 ]] && ( ! [[ -e "$currentDrive"-part1 ]] || ! [[ -e "$currentDrive"-part2 ]] || ! [[ -e "$currentDrive"-part3 ]] ) && ( ! [[ -e "$currentDrive"1 ]] || ! [[ -e "$currentDrive"2 ]] || ! [[ -e "$currentDrive"3 ]] ) # && ( ! [[ -e "$currentDrive"-part4 ]] || ! [[ -e "$currentDrive"4 ]] )
	do
		echo 'wait: partitions: iteration: '"$currentIteration"
		sync
		sudo -n partprobe
		_extremelyRedundant_is_packetDisc "$currentDrive" && sudo -n kpartx -a "$currentDrive"
		sudo -n udevadm trigger ; sync
		sleep 15
		let currentIteration=currentIteration+1
	done
	
	export flipKey_software_uuid=$(sudo -n lsblk --noheadings -o PARTUUID "$currentDrive" | grep -v '^$' | head -n1 | tail -n1 | tr -dc 'a-zA-Z0-9-' )
	export flipKey_headerKey_uuid=$(sudo -n lsblk --noheadings -o PARTUUID "$currentDrive" | grep -v '^$' | head -n2 | tail -n1 | tr -dc 'a-zA-Z0-9-' )
	export flipKey_container_uuid=$(sudo -n lsblk --noheadings -o PARTUUID "$currentDrive" | grep -v '^$' | head -n3 | tail -n1 | tr -dc 'a-zA-Z0-9-' )
	#export flipKey_headerKey_backup_uuid=$(sudo -n lsblk --noheadings -o PARTUUID "$currentDrive" | grep -v '^$' | head -n4 | tail -n1 | tr -dc 'a-zA-Z0-9-' )
	
	echo flipKey_software_uuid="$flipKey_software_uuid"
	echo flipKey_headerKey_uuid="$flipKey_headerKey_uuid"
	echo flipKey_container_uuid="$flipKey_container_uuid"
	echo flipKey_headerKey_backup_uuid="$flipKey_headerKey_backup_uuid"
	echo
	
	export flipKey_software_devFile=/dev/disk/by-partuuid/"$flipKey_software_uuid"
	export flipKey_headerKey_devFile=/dev/disk/by-partuuid/"$flipKey_headerKey_uuid"
	export flipKey_container_devFile=/dev/disk/by-partuuid/"$flipKey_container_uuid"
	#export flipKey_headerKey_backup_uuid=/dev/disk/by-partuuid/"$flipKey_headerKey_backup_uuid"
	echo
	
	( [[ ! -e "$flipKey_software_devFile" ]] || [[ -d "$flipKey_software_devFile" ]] ) && [[ "$flipKey_software_uuid" == "" ]] && [[ -e "$currentDrive"1 ]] && export flipKey_software_devFile="$currentDrive"1
	( [[ ! -e "$flipKey_headerKey_devFile" ]] || [[ -d "$flipKey_headerKey_devFile" ]] ) && [[ "$flipKey_headerKey_uuid" == "" ]] && [[ -e "$currentDrive"2 ]] && export flipKey_headerKey_devFile="$currentDrive"2
	( [[ ! -e "$flipKey_container_devFile" ]] || [[ -d "$flipKey_container_devFile" ]] ) && [[ "$flipKey_container_uuid" == "" ]] && [[ -e "$currentDrive"3 ]] && export flipKey_container_devFile="$currentDrive"3
	#( [[ ! -e "$flipKey_headerKey_backup_devFile" ]] || [[ -d "$flipKey_headerKey_backup_devFile" ]] ) && [[ "$flipKey_headerKey_backup_uuid" == "" ]] && [[ -e "$currentDrive"4 ]] && export flipKey_headerKey_backup_devFile="$currentDrive"4
	
	( [[ ! -e "$flipKey_software_devFile" ]] || [[ -d "$flipKey_software_devFile" ]] ) && [[ "$flipKey_software_uuid" == "" ]] && [[ -e "$currentDrive"-part1 ]] && export flipKey_software_devFile="$currentDrive"-part1
	( [[ ! -e "$flipKey_headerKey_devFile" ]] || [[ -d "$flipKey_headerKey_devFile" ]] ) && [[ "$flipKey_headerKey_uuid" == "" ]] && [[ -e "$currentDrive"-part2 ]] && export flipKey_headerKey_devFile="$currentDrive"-part2
	( [[ ! -e "$flipKey_container_devFile" ]] || [[ -d "$flipKey_container_devFile" ]] ) && [[ "$flipKey_container_uuid" == "" ]] && [[ -e "$currentDrive"-part3 ]] && export flipKey_container_devFile="$currentDrive"-part3
	#( [[ ! -e "$flipKey_headerKey_backup_devFile" ]] || [[ -d "$flipKey_headerKey_backup_devFile" ]] ) && [[ "$flipKey_headerKey_backup_uuid" == "" ]] && [[ -e "$currentDrive"-part4 ]] && export flipKey_headerKey_backup_devFile="$currentDrive"-part4
	
	echo flipKey_software_devFile="$flipKey_software_devFile"
	echo flipKey_headerKey_devFile="$flipKey_headerKey_devFile"
	echo flipKey_container_devFile="$flipKey_container_devFile"
	echo flipKey_headerKey_backup_devFile="$flipKey_headerKey_backup_devFile"
	echo
	
	# ATTENTION: Partitioning .
	
	
	
	# ATTENTION: Software .
	
	sudo -n mkfs.ext4 -O 64bit,metadata_csum -cc -b -2048 -e remount-ro -E lazy_itable_init=0,lazy_journal_init=0 -m 0 -I 256 -F "$flipKey_software_devFile"
	sync
	
	mkdir -m 700 -p ./diskMount/user
	sudo -n mount "$flipKey_software_devFile" ./diskMount
	sudo -n chown "$USER":"$USER" ./diskMount
	mkdir -m 700 -p ./diskMount/user
	sudo -n chown "$USER":"$USER" ./diskMount/user
	
	if ! mountpoint ./diskMount > /dev/null 2>&1
	then
		rmdir ./diskMount/user
		rmdir ./diskMount
		return 1
	fi
	
	sudo -n ln -s -n /dev/shm ./diskMount/shm
	
	#_extractAttachment
	_attachment > "$functionEntryPWD"/package_tmp.tar.xz
	_noAttachment | tee ./discManager_noAttachment.sh > /dev/null 2>&1
	cd "$functionEntryPWD"/diskMount/user
	mv "$functionEntryPWD"/diskMount/user/flipKey/_local/disk.sh "$functionEntryPWD"/diskMount/user/flipKey/_local/disk.sh.bak
	mv "$functionEntryPWD"/diskMount/user/flipKey/_local/ops.sh "$functionEntryPWD"/diskMount/user/flipKey/_local/ops.sh.bak > /dev/null 2>&1
	mv "$functionEntryPWD"/diskMount/user/flipKey/ops.sh "$functionEntryPWD"/diskMount/user/flipKey/ops.sh.bak
	tar -xvpf "$functionEntryPWD"/package_tmp.tar.*
	sync
	
	
	rm "$functionEntryPWD"/package_tmp.tar.*
	cd "$functionEntryPWD"/diskMount
	sudo -n mv "$functionEntryPWD"/discManager_noAttachment.sh ./discManager
	sudo -n rm -f "$functionEntryPWD"/discManager_noAttachment.sh > /dev/null 2>&1
	#sudo -n cp "$functionEntryPWD"/discManager ./
	sudo -n rm ./discManager
	cd "$functionEntryPWD"
	sync
	
	
	[[ "$flipKey_packetDisc_exhaustible" != "true" ]] && export flipKey_packetDisc_exhaustible='false'
	_extremelyRedundant_is_packetDisc "$currentDrive" && export flipKey_packetDisc_exhaustible='true'
	
	_here_keyPartition_disk > ./diskMount/user/flipKey/_local/disk.sh
	sync
	
	
	
	cd "$functionEntryPWD"/diskMount
	sudo -n ln -s ./user/flipKey/__grab.bat
	sudo -n ln -s ./user/flipKey/__toss.bat
	sudo -n ln -s ./user/flipKey/discManager-src.sh ./discManager
	
	
	cd "$functionEntryPWD"
	
	
	mv -f "$functionEntryPWD"/diskMount/user/flipKey/_local/disk.sh.bak "$functionEntryPWD"/diskMount/user/flipKey/_local/disk.sh
	mv -f "$functionEntryPWD"/diskMount/user/flipKey/_local/ops.sh.bak "$functionEntryPWD"/diskMount/user/flipKey/_local/ops.sh > /dev/null 2>&1
	mv -f "$functionEntryPWD"/diskMount/user/flipKey/ops.sh.bak "$functionEntryPWD"/diskMount/user/flipKey/ops.sh
	
	sudo -n umount ./diskMount
	sync
	
	rmdir ./diskMount/user
	rmdir ./diskMount
	
	# ATTENTION: Software .
	
	
	[[ "$currentDrive" == "/dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice"* ]] && sudo -n dmsetup remove "$currentDrive"?? > /dev/null 2>&1
	[[ "$currentDrive" == "/dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice"* ]] && sudo -n dmsetup remove "$currentDrive"? > /dev/null 2>&1
	[[ "$currentDrive" == "/dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice"* ]] && sudo -n dmsetup remove "$currentDrive" > /dev/null 2>&1
	
	return 0
}



_here_keyPartition_disk() {
	cat << CZXWXcRMTo8EmM8i4d

export currentDiscType=$currentDiscType

CZXWXcRMTo8EmM8i4d
	
	
	cat << CZXWXcRMTo8EmM8i4d
_disk_declare() {
	_disk_default
	
	export flipKey_headerKeyFile=$flipKey_headerKey_devFile
	export flipKey_container=$flipKey_container_devFile
	#export flipKey_headerKeyFile=/dev/disk/by-partuuid/$flipKey_headerKey_uuid
	#export flipKey_container=/dev/disk/by-partuuid/$flipKey_container_uuid
	
	export flipKey_removable='true'
	export flipKey_physical='true'
	export flipKey_headerKeySize=20000000
	export flipKey_containerSize=1500000000
	export flipKey_filesystem="ext4"
	#export flipKey_filesystem="NTFS"
	
	#export flipKey_headerKeyFile_backup=$flipKey_headerKey_backup_devFile
	#export flipKey_headerKeyFile_backup=/dev/disk/by-partuuid/$flipKey_headerKey_backup_uuid
	
	
	export flipKey_packetDisc_exhaustible=$flipKey_packetDisc_exhaustible
	
	#[[ "\$flipKey_packetDisc_exhaustible" == "true" ]] && export flipKey_filesystem="nilfs2"
	[[ "\$flipKey_packetDisc_exhaustible" == "true" ]] && export flipKey_filesystem="btrfs-mix"
	
	# ATTENTION: WARNING: Highly irregular. Places 'fs' next to user assuming directory structure includes 'user' and 'flipKey' successfully changes 'ownership' of the 'fs' directory.
	export flipKey_mount="\$scriptLocal"/../../../fs
	
	true
}
CZXWXcRMTo8EmM8i4d
}

# ### NOTICE: 'generic' 'keyPartition' ###













# ### NOTICE: 'extremelyRedundant' ###

_extremelyRedundant_criticalDep() {
	! sudo -n which gdisk > /dev/null && exit 1
	! sudo -n which sgdisk > /dev/null && exit 1
	
	! sudo -n which blkid > /dev/null && exit 1
	
	! sudo -n which partprobe > /dev/null && exit 1
	! sudo -n which kpartx > /dev/null && exit 1
	
	! sudo -n which blkdiscard > /dev/null && exit 1
	
	return 0
}



_extremelyRedundant_is_packetDisc() {
	[[ "$1" != "/dev/mapper/"* ]] && [[ "$1" != "/dev/sr"* ]] && [[ "$1" != "/dev/dvd"* ]] && return 1
	return 0
}



_extremelyRedundant_dmsetup_remove_part() {
	if [[ -e "$1"1 ]] && _extremelyRedundant_is_packetDisc "$@"
	then
		echo 'dmsetup: remove: '"$1"??
		#sudo -n dmsetup remove "$1"
		sudo -n dmsetup remove "$1"??
		sudo -n dmsetup remove "$1"?
		[[ "$?" != "0" ]] && exit 1
		sync
		return
	fi
	return 0
}




_extremelyRedundant_desilver_part() {
	sudo -n dd if=/dev/urandom of="$1" bs=1M count=2 oflag=direct conv=fdatasync status=progress
	sync
	
	if ! _extremelyRedundant_is_packetDisc "$@" && ! [[ "$flipKey_packetDisc_exhaustible" == "true" ]]
	then
		local currentIteration
		for currentIteration in {1..8}
		do
			sudo -n dd if=/dev/urandom of="$1" bs=256K count=2 oflag=direct conv=fdatasync status=progress
			sync
		done
		
		if man wipe 2> /dev/null | grep 'Berke Durak' > /dev/null && man wipe 2> /dev/null | grep '\-Q <number\-of\-passes>' > /dev/null && man wipe 2> /dev/null | grep '\-s (silent mode)' > /dev/null
		then
			wipe -l 36K -k -F -f -D "$1"
			sync
		fi
		
		sudo -n blkdiscard "$1"
		sync
		#sudo -n mkfs.ext2 -F -E discard "$1"
		sync
	else
		sleep 9
		sudo -n dd if=/dev/urandom of="$1" bs=256K count=2 oflag=direct conv=fdatasync status=progress
		sync
		sleep 9
		sync
	fi
	
	sudo -n dd if=/dev/urandom of="$1" bs=256K count=2 oflag=direct conv=fdatasync status=progress
	sync
}

_extremelyRedundant_desilver_partitionTable() {
	echo 'desilver (part): '"$1"
	sudo -n dd if=/dev/urandom of="$1" bs=2M count=16 oflag=direct conv=fdatasync status=progress
	sync
	if ! _extremelyRedundant_is_packetDisc "$@" && ! [[ "$flipKey_packetDisc_exhaustible" == "true" ]]
	then
		_extremelyRedundant_desilver_part "$@"
		_extremelyRedundant_desilver_part "$@"
		sudo -n dd if=/dev/urandom of="$1" bs=2M count=16 oflag=direct conv=fdatasync status=progress
		sync
	fi
}
_extremelyRedundant_desilver_partitions_single() {
	echo 'desilver (part): '"$1"
	_extremelyRedundant_desilver_part "$@"
	_extremelyRedundant_desilver_part "$@"
}
_extremelyRedundant_desilver_partitions() {
	local currentDrive
	currentDrive="$1"
	
	currentDrive_folder=$(dirname "$currentDrive")
	currentDrive_basename=$(basename "$currentDrive")
	_check_driveDeviceFile "$currentDrive_folder"/"$currentDrive_basename"
	
	find "$currentDrive_folder" -mindepth 1 -maxdepth 1 -name "$currentDrive_basename"* ! -name "$currentDrive_basename" -exec "$0" _extremelyRedundant_desilver_partitions_single {} \;
}



_extremelyRedundant_sectorPosition_reset() {
	[[ "$expectedSECTOR" == "" ]] && export expectedSECTOR=2048
	
	local KIBIBYTE ; KIBIBYTE="1024" ; local MEBIBYTE ; MEBIBYTE="1048576"
	
	#export current_nonexistent_boundary=511
	export current_nonexistent_boundary=2047
	[[ "$expectedSECTOR" == 512 ]] && export current_nonexistent_boundary=2047
	( [[ "$expectedSECTOR" == 2048 ]] || [[ "$expectedSECTOR" == 1024 ]] || [[ "$expectedSECTOR" == 4096 ]] ) && export current_nonexistent_boundary=511
	
	export currentBOUNDARY="$current_nonexistent_boundary"
	
	#_extremelyRedundant_sectorPosition_set 0 MiB 0
	export currentPartitionSize=0
	export currentPartitionMultiplier=MiB
	export currentBegin="$current_nonexistent_boundary"
	export currentEnd="$current_nonexistent_boundary"
	
	export currentBegin_MiB=0
	export currentEnd_MiB=0
	export currentBOUNDARY_MiB=1
	
	export currentBegin_KiB=0
	export currentEnd_KiB=0
	export currentBOUNDARY_KiB=1024
	
	export currentPartitionNumber=0
	
	return 0
}
_extremelyRedundant_sectorPosition_set() {
	local KIBIBYTE ; KIBIBYTE="1024" ; local MEBIBYTE ; MEBIBYTE="1048576"
	
	local partitionSize
	partitionSize="$1"
	
	export currentPartitionMultiplier="$2"
	if ( [[ "$currentPartitionMultiplier" == "k"* ]] || [[ "$currentPartitionMultiplier" == "K"* ]] || [[ "$currentPartitionMultiplier" == "KiB"* ]] )
	then
		export currentPartitionMultiplier=K
		partitionSize="$1"" * $KIBIBYTE"
	else
		export currentPartitionMultiplier=M
		partitionSize="$1"" * $MEBIBYTE"
	fi
	
	export currentPartitionSize="$1""$currentPartitionMultiplier"
	
	export currentBegin=$(bc <<< "$currentBOUNDARY + 1")
	export currentEnd=$(bc <<< "$currentBegin + ( ( $partitionSize ) / $expectedSECTOR ) - 1 ")
	
	export currentBOUNDARY="$currentEnd"
	[[ "$3" != "" ]] && export currentBOUNDARY=$(bc <<< "$currentBegin + ( ( $3 * $MEBIBYTE ) / $expectedSECTOR ) - 1 ")
	
	
	# DANGER: 'currentEnd_MiB' is NOT guaranteed to an exact or usable result !
	export currentBegin_MiB=$(_safeEcho "$currentBOUNDARY_MiB" | cut -f1 -d\. )
	export currentEnd_MiB=$(bc <<< "scale=8; $currentBegin_MiB + ( $partitionSize / $MEBIBYTE )")
	export currentBOUNDARY_MiB="$currentEnd_MiB"
	[[ "$3" != "" ]] && export currentBOUNDARY_MiB=$(bc <<< "$currentBegin_MiB + $3")
	
	export currentBegin_KiB="$currentBOUNDARY_KiB"
	export currentEnd_KiB=$(bc <<< "$currentBegin_KiB + ( $partitionSize / $KIBIBYTE )")
	export currentBOUNDARY_KiB="$currentEnd_KiB"
	[[ "$3" != "" ]] && export currentBOUNDARY_KiB=$(bc <<< "$currentBegin_KiB + ( $3 * ( $MEBIBYTE / $KIBIBYTE ) ) ")
	
	
	# Either a 1MiB pad, or none at all.
	export currentPad_begin_exists="$currentPad_end_exists"
	[[ "$currentPad_begin_exists" == "" ]] && currentPad_begin_exists=0
	if [[ "$3" != "" ]] && [[ "$3" -gt "1" ]]
	then
		export currentPad_end_exists="1"
	else
		export currentPad_end_exists="0"
	fi
	[[ "$currentPad_end_exists" == "" ]] && currentPad_end_exists=0
	
	
	
	let currentPartitionNumber=currentPartitionNumber+1
	
	return 0
}
_extremelyRedundant_newPartition() {
	_extremelyRedundant_sectorPosition_set "$1" "$2" "$3"
	echo "$currentBegin	$currentEnd	$currentPad_begin_exists"M"	$currentPartitionSize"
	if [[ "$4" != "software" ]]
	then
		if _extremelyRedundant_is_packetDisc
		then
			sudo -n sgdisk "$currentDrive" --new="$currentPartitionNumber":$currentBegin:$currentEnd --typecode="$currentPartitionNumber":a906
		else
			sudo -n sgdisk "$currentDrive" --new="$currentPartitionNumber":$currentBegin:$currentEnd --typecode="$currentPartitionNumber":a906
			#sudo -n sgdisk "$currentDrive" --new=0:+"$currentPad_begin_exists"M:+"$currentPartitionSize" --typecode="$currentPartitionNumber":a906
			#sudo -n parted --script "$currentDrive" 'mkpart primary '"$currentBegin_MiB"'MiB '"$currentEnd_MiB"'MiB'
		fi
		true
	else
		if _extremelyRedundant_is_packetDisc
		then
			sudo -n sgdisk "$currentDrive" --new="$currentPartitionNumber":$currentBegin:$currentEnd --typecode="$currentPartitionNumber":8300
		else
			sudo -n sgdisk "$currentDrive" --new="$currentPartitionNumber":$currentBegin:$currentEnd --typecode="$currentPartitionNumber":8300
			#sudo -n sgdisk "$currentDrive" --new=0:+"$currentPad_begin_exists"M:+"$currentPartitionSize" --typecode="$currentPartitionNumber":8300
			#sudo -n parted --script "$currentDrive" 'mkpart primary '"$currentBegin_MiB"'MiB '"$currentEnd_MiB"'MiB'
		fi
		true
	fi
	sync
	sleep 3
	echo
}














_raw_packetDisc_slightlyRedundant() {
	! _marginallyRedundant_criticalDep && return 1
	
	# Ignored. Regarded as '_disk_generic_slightlyRedundant' .
	export currentDiscType=_disc_raw_packet_slightlyRedundant
	
	local currentDrive
	currentDrive=$(_find_packetDrive)
	_check_driveDeviceFile "$currentDrive"
	
	sudo -n dmsetup remove /dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice?? > /dev/null 2>&1
	sudo -n dmsetup remove /dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice? > /dev/null 2>&1
	sudo -n dmsetup remove /dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice > /dev/null 2>&1
	
	local currentDriveLinearSize
	currentDriveLinearSize=$(sudo -n blockdev --getsz "$currentDrive")
	sudo -n dmsetup create uk4uPhB663kVcygT0q_packetDriveDevice --table '0 '"$currentDriveLinearSize"' linear '"$currentDrive"' 0'
	
	export flipKey_packetDisc_exhaustible='true'
	_generic_slightlyRedundant /dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice
}
_generic_slightlyRedundant() {
	local currentDrive
	currentDrive="$1"
	
	[[ ! -e "$currentDrive" ]] && echo 'fail: missing: '"$currentDrive"
	[[ -d "$currentDrive" ]] && echo 'FAIL: DANGER: directory instead of file!'
	
	local currentDrive_size
	currentDrive_size=$(sudo -n blockdev --getsize64 "$currentDrive" | tr -dc '0-9')
	[[ "$currentDrive_size" == "" ]] && return 1
	
	local desiredMebibytes
	desiredMebibytes=$(bc <<< " ( ( $currentDrive_size / 1048576 ) - 28 - ( 8 * 6 ) - 16 ) / 6 ")
	
	local desiredMebibytes_temp
	desiredMebibytes_temp=$(bc <<< " ( ( ( $currentDrive_size / 1048576 ) - 28 - ( 8 * 6 ) - 16 ) / 6 ) * 2 ")
	
	
	_extremelyRedundant_desilver_partitions "$currentDrive"
	_extremelyRedundant_desilver_partitionTable "$currentDrive"
	echo
	
	_extremelyRedundant_disc "$currentDrive" "_disk_generic_slightlyRedundant" "$desiredMebibytes" "$desiredMebibytes_temp"
}
_u4000_slightlyRedundant() {
	local currentDrive
	currentDrive=$( _find_uDrive )
	_check_uDrive
	
	_extremelyRedundant_desilver_partitions "$currentDrive"
	_extremelyRedundant_desilver_partitionTable "$currentDrive"
	echo
	
	_desilver_u
	echo
	
	_extremelyRedundant_disc "$currentDrive" "_disk_u4000_slightlyRedundant"
}
_u2500_slightlyRedundant() {
	local currentDrive
	currentDrive=$( _find_uDrive )
	_check_uDrive
	
	_extremelyRedundant_desilver_partitions "$currentDrive"
	_extremelyRedundant_desilver_partitionTable "$currentDrive"
	echo
	
	_desilver_u
	echo
	
	_extremelyRedundant_disc "$currentDrive" "_disk_u2500_slightlyRedundant"
}
_mo640_extremelyRedundant() {
	local currentDrive
	currentDrive=$( _find_moDrive )
	_check_moDrive
	
	_extremelyRedundant_desilver_partitions "$currentDrive"
	_extremelyRedundant_desilver_partitionTable "$currentDrive"
	echo
	
	_desilver_mo
	echo
	
	_extremelyRedundant_disc "$currentDrive" "_disc_mo640_extremelyRedundant"
}
_extremelyRedundant_disc() {
	! _extremelyRedundant_criticalDep && exit 1
	
	local functionEntryPWD
	functionEntryPWD="$PWD"
	
	local currentDrive
	currentDrive="$1"
	_check_driveDeviceFile "$currentDrive"
	
	
	_extremelyRedundant_dmsetup_remove_part "$currentDrive"
	
	
	# ATTENTION: Disc Type .
	# Strongly prefer mo640 .
	
	# Few discs are assured sufficiently for use as 'extremelyRedundant' .
	# Complex composite (presumably) of 'gigamo' discs may be more vulnerable to delamination, despite official archival specifications.
	local currentDiscType
	#currentDiscType=_disc_mo640_extremelyRedundant
	[[ "$2" == "_disc_mo640_extremelyRedundant" ]] && currentDiscType="$2"
	[[ "$2" == "_disk_u2500_slightlyRedundant" ]] && currentDiscType="$2"
	[[ "$2" == "_disk_u4000_slightlyRedundant" ]] && currentDiscType="$2"
	[[ "$2" == "_disk_generic_slightlyRedundant" ]] && currentDiscType="$2"
	[[ "$currentDiscType" == "" ]] && exit 1
	
	
	local desiredRedundancy ; desiredRedundancy=4
	[[ "$currentDiscType" == *"extremelyRedundant" ]] && desiredRedundancy=4
	[[ "$currentDiscType" == *"slightlyRedundant" ]] && desiredRedundancy=4
	#[[ "$currentDiscType" == *"marginallyRedundant" ]] && desiredRedundancy=2
	
	local desiredMebibytes
	local desiredMebibytes_temp
	desiredMebibytes=92
	desiredMebibytes_temp=184
	[[ "$currentDiscType" == "_disc_mo640_extremelyRedundant" ]] && desiredMebibytes=92 && desiredMebibytes_temp=184
	[[ "$currentDiscType" == "_disk_u2500_slightlyRedundant" ]] && desiredMebibytes=288 && desiredMebibytes_temp=576
	[[ "$currentDiscType" == "_disk_u4000_slightlyRedundant" ]] && desiredMebibytes=576 && desiredMebibytes_temp=1152
	[[ "$currentDiscType" == "_disk_generic_slightlyRedundant" ]] && desiredMebibytes="$3" && desiredMebibytes_temp="$4"
	
	# ATTENTION: Disc Type .
	
	
	# ATTENTION: Partitioning .
	
	sudo -n sgdisk "$currentDrive" --zap-all > /dev/null 2>&1
	sudo -n sgdisk "$currentDrive" --clear > /dev/null 2>&1
	sudo -n sgdisk "$currentDrive" --zap-all
	sudo -n sgdisk "$currentDrive" --clear
	#sudo -n parted --script "$currentDrive" 'mklabel gpt'
	echo
	echo
	sync
	sleep 15
	
	export expectedSECTOR=$(sudo -n sgdisk "$currentDrive" --print | grep -i 'Sector size' | grep -i 'logical' | tr -dc '0-9/' | sed 's/^\///' | cut -f1 -d\/)
	if [[ "$expectedSECTOR" != 2048 ]] && [[ "$expectedSECTOR" != 512 ]] && [[ "$expectedSECTOR" != 1024 ]] && [[ "$expectedSECTOR" != 4096 ]]
	then
		echo 'fail: unrecognized sector size: '"$expectedSECTOR" && exit 1
		#export expectedSECTOR="2048"
	fi
	[[ "$currentDiscType" == "_disc_mo640_extremelyRedundant" ]] && export expectedSECTOR="2048" # _mo640 discs are *always* 2048b/sector, and this standardization greatly simplifies recovery
	#[[ "$currentDiscType" == "_disk_u2500_slightlyRedundant" ]] && export expectedSECTOR="512"
	#[[ "$currentDiscType" == "_disk_u4000_slightlyRedundant" ]] && export expectedSECTOR="512"
	#[[ "$currentDiscType" == "_disk_generic_slightlyRedundant" ]] && export expectedSECTOR="4096" # Unpredictable. Do NOT set.
	#export expectedSECTOR="2048" # Forcing >=2KiB sector alginment may be usefully better than accepting incorrect use of 512b sectors.
	
	
	_extremelyRedundant_newKeyPartition() { _extremelyRedundant_newPartition 384 KiB 1 ; }
	[[ "$currentDiscType" == "_disc_mo640_extremelyRedundant" ]] && _extremelyRedundant_newKeyPartition() { _extremelyRedundant_newPartition 384 KiB 1 ; }
	[[ "$currentDiscType" == "_disk_u2500_slightlyRedundant" ]] && _extremelyRedundant_newKeyPartition() { _extremelyRedundant_newPartition 7 MiB 8 ; }
	[[ "$currentDiscType" == "_disk_u4000_slightlyRedundant" ]] && _extremelyRedundant_newKeyPartition() { _extremelyRedundant_newPartition 7 MiB 8 ; }
	[[ "$currentDiscType" == "_disk_generic_slightlyRedundant" ]] && _extremelyRedundant_newKeyPartition() { _extremelyRedundant_newPartition 7 MiB 8 ; }
	
	
	_extremelyRedundant_sectorPosition_reset
	echo $current_nonexistent_boundary
	sync
	sudo -n partprobe
	_extremelyRedundant_is_packetDisc "$currentDrive" && sudo -n kpartx -a "$currentDrive"
	sudo -n udevadm trigger ; sync
	
	# Unallocated space (no partition).
	# WARNING: Must create partitions by sector counts. May not be compatible with specifying partitions by MiB and such.
	if _extremelyRedundant_is_packetDisc "$currentDrive"
	then
		desiredMebibytes=$(bc <<< "$desiredMebibytes - 1")
		desiredMebibytes_temp=$(bc <<< "$desiredMebibytes_temp - 1")
		
		
		if _extremelyRedundant_is_packetDisc "$currentDrive" && [[ "$desiredMebibytes" -gt 18000 ]]
		then
			# Blu-Ray 'inner' rotational rate is drastically different, and data begins there by default, causing a substantial performance penalty.
			desiredMebibytes=$(bc <<< "$desiredMebibytes - ( 896 / 6 ) - 1")
			desiredMebibytes_temp=$(bc <<< "$desiredMebibytes_temp - ( 896 / 6 ) - 1")
			_extremelyRedundant_sectorPosition_set 896 MiB 896
			export currentPartitionNumber=0
			echo "$currentBegin	$currentEnd	$currentPad_begin_exists"M"	$currentPartitionSize""	(unallocated)"
		else
			# Placeholder for ISO image (assuming backup GPT may remain usable somehow after overwrite or MBR may be usable somehow).
			# Minimum of 48MiB should be sufficient.
			desiredMebibytes=$(bc <<< "$desiredMebibytes - ( 48 / 6 ) - 1")
			desiredMebibytes_temp=$(bc <<< "$desiredMebibytes_temp - ( 48 / 6 ) - 1")
			_extremelyRedundant_sectorPosition_set 48 MiB 48
			export currentPartitionNumber=0
			echo "$currentBegin	$currentEnd	$currentPad_begin_exists"M"	$currentPartitionSize""	(unallocated)"
		fi
	fi
	
	_extremelyRedundant_newPartition 28 MiB "" software
	#sudo -n sgdisk "$currentDrive" --typecode=0:8300
	#sudo -n sgdisk "$currentDrive" --typecode=1:8300
	echo
	
	# fs_temp - Temporary storage while 'shredding' . Usually only double redundant.
	_extremelyRedundant_newKeyPartition
	_extremelyRedundant_newPartition "$desiredMebibytes_temp" MiB
	_extremelyRedundant_newKeyPartition
	echo
	_extremelyRedundant_newKeyPartition
	_extremelyRedundant_newPartition "$desiredMebibytes" MiB
	_extremelyRedundant_newKeyPartition
	_extremelyRedundant_newPartition "$desiredMebibytes" MiB
	_extremelyRedundant_newKeyPartition
	_extremelyRedundant_newPartition "$desiredMebibytes" MiB
	_extremelyRedundant_newKeyPartition
	_extremelyRedundant_newPartition "$desiredMebibytes" MiB
	
	sync
	sudo -n partprobe
	_extremelyRedundant_is_packetDisc "$currentDrive" && sudo -n kpartx -a "$currentDrive"
	sudo -n udevadm trigger ; sync
	
	echo 'list: sgdisk'
	sudo -n sgdisk "$currentDrive" --print
	sudo -n sgdisk "$currentDrive" --verify
	echo
	echo
	#echo 'list: parted'
	#sudo -n parted --script "$currentDrive" 'unit MiB print'
	#echo
	
	sleep 15
	local currentIteration
	currentIteration=0
	while [[ "$currentIteration" -lt 6 ]] && ( ! [[ -e "$currentDrive"-part1 ]] || ! [[ -e "$currentDrive"-part2 ]] || ! [[ -e "$currentDrive"-part3 ]] || ! [[ -e "$currentDrive"-part4 ]] || ! [[ -e "$currentDrive"-part5 ]] || ! [[ -e "$currentDrive"-part6 ]] || ! [[ -e "$currentDrive"-part7 ]] || ! [[ -e "$currentDrive"-part8 ]] || ! [[ -e "$currentDrive"-part9 ]] || ! [[ -e "$currentDrive"-part10 ]] || ! [[ -e "$currentDrive"-part11 ]] || ! [[ -e "$currentDrive"-part12 ]] ) && ( ! [[ -e "$currentDrive"1 ]] || ! [[ -e "$currentDrive"2 ]] || ! [[ -e "$currentDrive"3 ]] || ! [[ -e "$currentDrive"4 ]] || ! [[ -e "$currentDrive"5 ]] || ! [[ -e "$currentDrive"6 ]] || ! [[ -e "$currentDrive"7 ]] || ! [[ -e "$currentDrive"8 ]] || ! [[ -e "$currentDrive"9 ]] || ! [[ -e "$currentDrive"10 ]] || ! [[ -e "$currentDrive"11 ]] || ! [[ -e "$currentDrive"12 ]] )
	do
		echo 'wait: partitions: iteration: '"$currentIteration"
		sync
		sudo -n partprobe
		_extremelyRedundant_is_packetDisc "$currentDrive" && sudo -n kpartx -a "$currentDrive"
		sudo -n udevadm trigger ; sync
		sleep 15
		let currentIteration=currentIteration+1
	done
	
	
	export flipKey_software_uuid=$(sudo -n lsblk --noheadings -o PARTUUID "$currentDrive" | grep -v '^$' | head -n1 | tail -n1 )
	
	# Randomly read just one headerKey file.
	# Favor reading 'flipKey_headerKey_temp01' most often to minimize possibility of simultaneous failure if MSR demagnetization may have significance.
	export flipKey_headerKey_temp01_uuid=$(sudo -n lsblk --noheadings -o PARTUUID "$currentDrive" | grep -v '^$' | head -n2 | tail -n1 )
	export flipKey_container_temp01_uuid=$(sudo -n lsblk --noheadings -o PARTUUID "$currentDrive" | grep -v '^$' | head -n3 | tail -n1 )
	export flipKey_headerKey_temp02_uuid=$(sudo -n lsblk --noheadings -o PARTUUID "$currentDrive" | grep -v '^$' | head -n4 | tail -n1 )
	
	
	# Randomly read just one headerKey file.
	# Favor reading 'flipKey_headerKey_mult01', possibly some others, more often to minimize possibility of simultaneous failure if MSR demagnetization may have significance.
	export flipKey_headerKey_mult01_uuid=$(sudo -n lsblk --noheadings -o PARTUUID "$currentDrive" | grep -v '^$' | head -n5 | tail -n1 )
	export flipKey_container_mult02_uuid=$(sudo -n lsblk --noheadings -o PARTUUID "$currentDrive" | grep -v '^$' | head -n6 | tail -n1 )
	export flipKey_headerKey_mult03_uuid=$(sudo -n lsblk --noheadings -o PARTUUID "$currentDrive" | grep -v '^$' | head -n7 | tail -n1 )
	export flipKey_container_mult04_uuid=$(sudo -n lsblk --noheadings -o PARTUUID "$currentDrive" | grep -v '^$' | head -n8 | tail -n1 )
	export flipKey_headerKey_mult05_uuid=$(sudo -n lsblk --noheadings -o PARTUUID "$currentDrive" | grep -v '^$' | head -n9 | tail -n1 )
	export flipKey_container_mult06_uuid=$(sudo -n lsblk --noheadings -o PARTUUID "$currentDrive" | grep -v '^$' | head -n10 | tail -n1 )
	export flipKey_headerKey_mult07_uuid=$(sudo -n lsblk --noheadings -o PARTUUID "$currentDrive" | grep -v '^$' | head -n11 | tail -n1 )
	export flipKey_container_mult08_uuid=$(sudo -n lsblk --noheadings -o PARTUUID "$currentDrive" | grep -v '^$' | head -n12 | tail -n1 )
	
	
	
	echo 'flipKey_headerKey_temp01_uuid= '"$flipKey_headerKey_temp01_uuid"
	echo 'flipKey_container_temp01_uuid= '"$flipKey_container_temp01_uuid"
	echo 'flipKey_headerKey_temp02_uuid= '"$flipKey_headerKey_temp02_uuid"
	echo
	echo 'flipKey_headerKey_mult01_uuid= '"$flipKey_headerKey_mult01_uuid"
	echo 'flipKey_container_mult02_uuid= '"$flipKey_container_mult02_uuid"
	echo 'flipKey_headerKey_mult03_uuid= '"$flipKey_headerKey_mult03_uuid"
	echo 'flipKey_container_mult04_uuid= '"$flipKey_container_mult04_uuid"
	echo 'flipKey_headerKey_mult05_uuid= '"$flipKey_headerKey_mult05_uuid"
	echo 'flipKey_container_mult06_uuid= '"$flipKey_container_mult06_uuid"
	echo 'flipKey_headerKey_mult07_uuid= '"$flipKey_headerKey_mult07_uuid"
	echo 'flipKey_container_mult08_uuid= '"$flipKey_container_mult08_uuid"
	
	
	
	
	
	export flipKey_software_devFile=/dev/disk/by-partuuid/"$flipKey_software_uuid"
	
	export flipKey_headerKey_temp01_devFile=/dev/disk/by-partuuid/"$flipKey_headerKey_temp01_uuid"
	export flipKey_container_temp01_devFile=/dev/disk/by-partuuid/"$flipKey_container_temp01_uuid"
	export flipKey_headerKey_temp02_devFile=/dev/disk/by-partuuid/"$flipKey_headerKey_temp02_uuid"
	
	export flipKey_headerKey_mult01_devFile=/dev/disk/by-partuuid/"$flipKey_headerKey_mult01_uuid"
	export flipKey_container_mult02_devFile=/dev/disk/by-partuuid/"$flipKey_container_mult02_uuid"
	export flipKey_headerKey_mult03_devFile=/dev/disk/by-partuuid/"$flipKey_headerKey_mult03_uuid"
	export flipKey_container_mult04_devFile=/dev/disk/by-partuuid/"$flipKey_container_mult04_uuid"
	export flipKey_headerKey_mult05_devFile=/dev/disk/by-partuuid/"$flipKey_headerKey_mult05_uuid"
	export flipKey_container_mult06_devFile=/dev/disk/by-partuuid/"$flipKey_container_mult06_uuid"
	export flipKey_headerKey_mult07_devFile=/dev/disk/by-partuuid/"$flipKey_headerKey_mult07_uuid"
	export flipKey_container_mult08_devFile=/dev/disk/by-partuuid/"$flipKey_container_mult08_uuid"
	
	echo
	
	
	( [[ ! -e "$flipKey_software_devFile" ]] || [[ -d "$flipKey_software_devFile" ]] ) && [[ "$flipKey_software_uuid" == "" ]] && [[ -e "$currentDrive"1 ]] && export flipKey_software_devFile="$currentDrive"1
	
	( [[ ! -e "$flipKey_headerKey_temp01_devFile" ]] || [[ -d "$flipKey_headerKey_temp01_devFile" ]] ) && [[ "$flipKey_headerKey_temp01_uuid" == "" ]] && [[ -e "$currentDrive"2 ]] && export flipKey_headerKey_temp01_devFile="$currentDrive"2
	( [[ ! -e "$flipKey_container_temp01_devFile" ]] || [[ -d "$flipKey_container_temp01_devFile" ]] ) && [[ "$flipKey_container_temp01_uuid" == "" ]] && [[ -e "$currentDrive"3 ]] && export flipKey_container_temp01_devFile="$currentDrive"3
	( [[ ! -e "$flipKey_headerKey_temp02_devFile" ]] || [[ -d "$flipKey_headerKey_temp02_devFile" ]] ) && [[ "$flipKey_headerKey_temp02_uuid" == "" ]] && [[ -e "$currentDrive"4 ]] && export flipKey_headerKey_temp02_devFile="$currentDrive"4
	
	( [[ ! -e "$flipKey_headerKey_mult01_devFile" ]] || [[ -d "$flipKey_headerKey_mult01_devFile" ]] ) && [[ "$flipKey_headerKey_mult01_uuid" == "" ]] && [[ -e "$currentDrive"5 ]] && export flipKey_headerKey_mult01_devFile="$currentDrive"5
	( [[ ! -e "$flipKey_container_mult02_devFile" ]] || [[ -d "$flipKey_container_mult02_devFile" ]] ) && [[ "$flipKey_container_mult02_uuid" == "" ]] && [[ -e "$currentDrive"6 ]] && export flipKey_container_mult02_devFile="$currentDrive"6
	( [[ ! -e "$flipKey_headerKey_mult03_devFile" ]] || [[ -d "$flipKey_headerKey_mult03_devFile" ]] ) && [[ "$flipKey_headerKey_mult03_uuid" == "" ]] && [[ -e "$currentDrive"7 ]] && export flipKey_headerKey_mult03_devFile="$currentDrive"7
	( [[ ! -e "$flipKey_container_mult04_devFile" ]] || [[ -d "$flipKey_container_mult04_devFile" ]] ) && [[ "$flipKey_container_mult04_uuid" == "" ]] && [[ -e "$currentDrive"8 ]] && export flipKey_container_mult04_devFile="$currentDrive"8
	( [[ ! -e "$flipKey_headerKey_mult05_devFile" ]] || [[ -d "$flipKey_headerKey_mult05_devFile" ]] ) && [[ "$flipKey_headerKey_mult05_uuid" == "" ]] && [[ -e "$currentDrive"9 ]] && export flipKey_headerKey_mult05_devFile="$currentDrive"9
	( [[ ! -e "$flipKey_container_mult06_devFile" ]] || [[ -d "$flipKey_container_mult06_devFile" ]] ) && [[ "$flipKey_container_mult06_uuid" == "" ]] && [[ -e "$currentDrive"10 ]] && export flipKey_container_mult06_devFile="$currentDrive"10
	( [[ ! -e "$flipKey_headerKey_mult07_devFile" ]] || [[ -d "$flipKey_headerKey_mult07_devFile" ]] ) && [[ "$flipKey_headerKey_mult07_uuid" == "" ]] && [[ -e "$currentDrive"11 ]] && export flipKey_headerKey_mult07_devFile="$currentDrive"11
	( [[ ! -e "$flipKey_container_mult08_devFile" ]] || [[ -d "$flipKey_container_mult08_devFile" ]] ) && [[ "$flipKey_container_mult08_uuid" == "" ]] && [[ -e "$currentDrive"12 ]] && export flipKey_container_mult08_devFile="$currentDrive"12
	
	
	( [[ ! -e "$flipKey_software_devFile" ]] || [[ -d "$flipKey_software_devFile" ]] ) && [[ "$flipKey_software_uuid" == "" ]] && [[ -e "$currentDrive"-part1 ]] && export flipKey_software_devFile="$currentDrive"-part1
	
	( [[ ! -e "$flipKey_headerKey_temp01_devFile" ]] || [[ -d "$flipKey_headerKey_temp01_devFile" ]] ) && [[ "$flipKey_headerKey_temp01_uuid" == "" ]] && [[ -e "$currentDrive"-part2 ]] && export flipKey_headerKey_temp01_devFile="$currentDrive"-part2
	( [[ ! -e "$flipKey_container_temp01_devFile" ]] || [[ -d "$flipKey_container_temp01_devFile" ]] ) && [[ "$flipKey_container_temp01_uuid" == "" ]] && [[ -e "$currentDrive"-part3 ]] && export flipKey_container_temp01_devFile="$currentDrive"-part3
	( [[ ! -e "$flipKey_headerKey_temp02_devFile" ]] || [[ -d "$flipKey_headerKey_temp02_devFile" ]] ) && [[ "$flipKey_headerKey_temp02_uuid" == "" ]] && [[ -e "$currentDrive"-part4 ]] && export flipKey_headerKey_temp02_devFile="$currentDrive"-part4
	
	( [[ ! -e "$flipKey_headerKey_mult01_devFile" ]] || [[ -d "$flipKey_headerKey_mult01_devFile" ]] ) && [[ "$flipKey_headerKey_mult01_uuid" == "" ]] && [[ -e "$currentDrive"-part5 ]] && export flipKey_headerKey_mult01_devFile="$currentDrive"-part5
	( [[ ! -e "$flipKey_container_mult02_devFile" ]] || [[ -d "$flipKey_container_mult02_devFile" ]] ) && [[ "$flipKey_container_mult02_uuid" == "" ]] && [[ -e "$currentDrive"-part6 ]] && export flipKey_container_mult02_devFile="$currentDrive"-part6
	( [[ ! -e "$flipKey_headerKey_mult03_devFile" ]] || [[ -d "$flipKey_headerKey_mult03_devFile" ]] ) && [[ "$flipKey_headerKey_mult03_uuid" == "" ]] && [[ -e "$currentDrive"-part7 ]] && export flipKey_headerKey_mult03_devFile="$currentDrive"-part7
	( [[ ! -e "$flipKey_container_mult04_devFile" ]] || [[ -d "$flipKey_container_mult04_devFile" ]] ) && [[ "$flipKey_container_mult04_uuid" == "" ]] && [[ -e "$currentDrive"-part8 ]] && export flipKey_container_mult04_devFile="$currentDrive"-part8
	( [[ ! -e "$flipKey_headerKey_mult05_devFile" ]] || [[ -d "$flipKey_headerKey_mult05_devFile" ]] ) && [[ "$flipKey_headerKey_mult05_uuid" == "" ]] && [[ -e "$currentDrive"-part9 ]] && export flipKey_headerKey_mult05_devFile="$currentDrive"-part9
	( [[ ! -e "$flipKey_container_mult06_devFile" ]] || [[ -d "$flipKey_container_mult06_devFile" ]] ) && [[ "$flipKey_container_mult06_uuid" == "" ]] && [[ -e "$currentDrive"-part10 ]] && export flipKey_container_mult06_devFile="$currentDrive"-part10
	( [[ ! -e "$flipKey_headerKey_mult07_devFile" ]] || [[ -d "$flipKey_headerKey_mult07_devFile" ]] ) && [[ "$flipKey_headerKey_mult07_uuid" == "" ]] && [[ -e "$currentDrive"-part11 ]] && export flipKey_headerKey_mult07_devFile="$currentDrive"-part11
	( [[ ! -e "$flipKey_container_mult08_devFile" ]] || [[ -d "$flipKey_container_mult08_devFile" ]] ) && [[ "$flipKey_container_mult08_uuid" == "" ]] && [[ -e "$currentDrive"-part12 ]] && export flipKey_container_mult08_devFile="$currentDrive"-part12
	
	
	
	
	echo flipKey_software_devFile="$flipKey_software_devFile"
	
	echo flipKey_headerKey_temp01_devFile="$flipKey_headerKey_temp01_devFile"
	echo flipKey_container_temp01_devFile="$flipKey_container_temp01_devFile"
	echo flipKey_headerKey_temp02_devFile="$flipKey_headerKey_temp02_devFile"
	
	echo flipKey_headerKey_mult01_devFile="$flipKey_headerKey_mult01_devFile"
	echo flipKey_container_mult02_devFile="$flipKey_container_mult02_devFile"
	echo flipKey_headerKey_mult03_devFile="$flipKey_headerKey_mult03_devFile"
	echo flipKey_container_mult04_devFile="$flipKey_container_mult04_devFile"
	echo flipKey_headerKey_mult05_devFile="$flipKey_headerKey_mult05_devFile"
	echo flipKey_container_mult06_devFile="$flipKey_container_mult06_devFile"
	echo flipKey_headerKey_mult07_devFile="$flipKey_headerKey_mult07_devFile"
	echo flipKey_container_mult08_devFile="$flipKey_container_mult08_devFile"
	
	echo
	
	
	[[ "$flipKey_headerKey_temp01_uuid" == "" ]] && export flipKey_headerKey_temp01_uuid=$(_getUUID)
	[[ "$flipKey_container_temp01_uuid" == "" ]] && export flipKey_container_temp01_uuid=$(_getUUID)
	[[ "$flipKey_headerKey_temp02_uuid" == "" ]] && export flipKey_headerKey_temp02_uuid=$(_getUUID)
	
	[[ "$flipKey_headerKey_mult01_uuid" == "" ]] && export flipKey_headerKey_mult01_uuid=$(_getUUID)
	[[ "$flipKey_container_mult02_uuid" == "" ]] && export flipKey_container_mult02_uuid=$(_getUUID)
	[[ "$flipKey_headerKey_mult03_uuid" == "" ]] && export flipKey_headerKey_mult03_uuid=$(_getUUID)
	[[ "$flipKey_container_mult04_uuid" == "" ]] && export flipKey_container_mult04_uuid=$(_getUUID)
	[[ "$flipKey_headerKey_mult05_uuid" == "" ]] && export flipKey_headerKey_mult05_uuid=$(_getUUID)
	[[ "$flipKey_container_mult06_uuid" == "" ]] && export flipKey_container_mult06_uuid=$(_getUUID)
	[[ "$flipKey_headerKey_mult07_uuid" == "" ]] && export flipKey_headerKey_mult07_uuid=$(_getUUID)
	[[ "$flipKey_container_mult08_uuid" == "" ]] && export flipKey_container_mult08_uuid=$(_getUUID)
	
	
	# ATTENTION: Partitioning .
	
	
	# ATTENTION: Software .
	
	sudo -n mkfs.ext4 -O 64bit,metadata_csum -cc -b -2048 -e remount-ro -E lazy_itable_init=0,lazy_journal_init=0 -m 0 -I 256 -F "$flipKey_software_devFile"
	sync
	
	mkdir -m 700 -p ./diskMount/user
	sudo -n mount "$flipKey_software_devFile" ./diskMount
	sudo -n chown "$USER":"$USER" ./diskMount
	mkdir -m 700 -p ./diskMount/user
	sudo -n chown "$USER":"$USER" ./diskMount/user
	
	if ! mountpoint ./diskMount > /dev/null 2>&1
	then
		rmdir ./diskMount/user
		rmdir ./diskMount
		return 1
	fi
	
	sudo -n ln -s -n /dev/shm ./diskMount/shm
	
	#_extractAttachment
	_attachment > "$functionEntryPWD"/package_tmp.tar.xz
	_noAttachment | tee ./discManager_noAttachment.sh > /dev/null 2>&1
	cd "$functionEntryPWD"/diskMount/user
	mv "$functionEntryPWD"/diskMount/user/flipKey/_local/disk.sh "$functionEntryPWD"/diskMount/user/flipKey/_local/disk.sh.bak
	mv "$functionEntryPWD"/diskMount/user/flipKey/_local/ops.sh "$functionEntryPWD"/diskMount/user/flipKey/_local/ops.sh.bak > /dev/null 2>&1
	mv "$functionEntryPWD"/diskMount/user/flipKey/ops.sh "$functionEntryPWD"/diskMount/user/flipKey/ops.sh.bak
	tar -xvpf "$functionEntryPWD"/package_tmp.tar.*
	sync
	
	
	rm "$functionEntryPWD"/package_tmp.tar.*
	cd "$functionEntryPWD"/diskMount
	sudo -n mv "$functionEntryPWD"/discManager_noAttachment.sh ./discManager
	sudo -n rm -f "$functionEntryPWD"/discManager_noAttachment.sh > /dev/null 2>&1
	#sudo -n cp "$functionEntryPWD"/discManager ./
	sudo -n rm ./discManager
	cd "$functionEntryPWD"
	sync
	
	
	[[ "$flipKey_packetDisc_exhaustible" != "true" ]] && export flipKey_packetDisc_exhaustible='false'
	_extremelyRedundant_is_packetDisc "$currentDrive" && export flipKey_packetDisc_exhaustible='true'
	
	_here_extremelyRedundant_disk > ./diskMount/user/flipKey/_local/disk.sh
	sync
	
	
	
	cd "$functionEntryPWD"/diskMount
	sudo -n ln -s ./user/flipKey/__grab.bat
	sudo -n ln -s ./user/flipKey/__toss.bat
	sudo -n ln -s ./user/flipKey/discManager-src.sh ./discManager
	
	sudo -n ln -s ./user/flipKey/_z__grab_fsTemp.bat
	sudo -n ln -s ./user/flipKey/_z__toss_fsTemp.bat
	
	sudo -n ln -s ./user/flipKey/___btrfs_balance.bat
	sudo -n ln -s ./user/flipKey/___btrfs_defrag.bat
	sudo -n ln -s ./user/flipKey/___btrfs_scrub_start.bat
	sudo -n ln -s ./user/flipKey/___btrfs_scrub_status.bat
	sudo -n ln -s ./user/flipKey/___btrfs_snapshot.bat
	sudo -n ln -s ./user/flipKey/___btrfs_gc.bat
	sudo -n ln -s ./user/flipKey/___btrfs_compsize.bat
	
	cd "$functionEntryPWD"
	
	
	mv -f "$functionEntryPWD"/diskMount/user/flipKey/_local/disk.sh.bak "$functionEntryPWD"/diskMount/user/flipKey/_local/disk.sh
	mv -f "$functionEntryPWD"/diskMount/user/flipKey/_local/ops.sh.bak "$functionEntryPWD"/diskMount/user/flipKey/_local/ops.sh > /dev/null 2>&1
	mv -f "$functionEntryPWD"/diskMount/user/flipKey/ops.sh.bak "$functionEntryPWD"/diskMount/user/flipKey/ops.sh
	
	sudo -n umount ./diskMount
	sync
	
	rmdir ./diskMount/user
	rmdir ./diskMount
	
	# ATTENTION: Software .
	
	
	[[ "$currentDrive" == "/dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice"* ]] && sudo -n dmsetup remove "$currentDrive"?? > /dev/null 2>&1
	[[ "$currentDrive" == "/dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice"* ]] && sudo -n dmsetup remove "$currentDrive"? > /dev/null 2>&1
	[[ "$currentDrive" == "/dev/mapper/uk4uPhB663kVcygT0q_packetDriveDevice"* ]] && sudo -n dmsetup remove "$currentDrive" > /dev/null 2>&1
	
	return 0
}






_here_extremelyRedundant_disk() {
	cat << CZXWXcRMTo8EmM8i4d

export currentDiscType=$currentDiscType
export desiredRedundancy=$desiredRedundancy

export flipKey_headerKey_temp01_uuid=$flipKey_headerKey_temp01_uuid
export flipKey_container_temp01_uuid=$flipKey_container_temp01_uuid
export flipKey_headerKey_temp02_uuid=$flipKey_headerKey_temp02_uuid

export flipKey_headerKey_mult01_uuid=$flipKey_headerKey_mult01_uuid
export flipKey_container_mult02_uuid=$flipKey_container_mult02_uuid
export flipKey_headerKey_mult03_uuid=$flipKey_headerKey_mult03_uuid
export flipKey_container_mult04_uuid=$flipKey_container_mult04_uuid
export flipKey_headerKey_mult05_uuid=$flipKey_headerKey_mult05_uuid
export flipKey_container_mult06_uuid=$flipKey_container_mult06_uuid
export flipKey_headerKey_mult07_uuid=$flipKey_headerKey_mult07_uuid
export flipKey_container_mult08_uuid=$flipKey_container_mult08_uuid




export flipKey_headerKey_temp01_devFile=$flipKey_headerKey_temp01_devFile
export flipKey_container_temp01_devFile=$flipKey_container_temp01_devFile
export flipKey_headerKey_temp02_devFile=$flipKey_headerKey_temp02_devFile

export flipKey_headerKey_mult01_devFile=$flipKey_headerKey_mult01_devFile
export flipKey_container_mult02_devFile=$flipKey_container_mult02_devFile
export flipKey_headerKey_mult03_devFile=$flipKey_headerKey_mult03_devFile
export flipKey_container_mult04_devFile=$flipKey_container_mult04_devFile
export flipKey_headerKey_mult05_devFile=$flipKey_headerKey_mult05_devFile
export flipKey_container_mult06_devFile=$flipKey_container_mult06_devFile
export flipKey_headerKey_mult07_devFile=$flipKey_headerKey_mult07_devFile
export flipKey_container_mult08_devFile=$flipKey_container_mult08_devFile


CZXWXcRMTo8EmM8i4d
	
	cat << 'CZXWXcRMTo8EmM8i4d'


if [[ "$flipKey_mount" != "$flipKey_mount_temp" ]] && [[ "$flipKey_functions_fsTemp" == '' ]]
then


__create() {
	local currentExitStatus
	currentExitStatus=0
	
	[[ "$flipKey_functions_fsTemp" != "" ]] && return 1
	
	export flipKey_mount="$scriptLocal"/../../../fs
	export flipKey_functions_fsTemp=''
	export flipKey_filesystem="btrfs-raid1c4"
	
	export flipKey_headerKeyFile="$flipKey_headerKey_mult01_devFile"
	
	_disk_declare
	_check_keyPartition
	_delay_exists_mount
	
	
	
	export flipKey_headerKeyFile="$flipKey_headerKey_mult01_devFile"
	_sweep-flipKey "$flipKey_headerKeyFile"
	[[ "$?" != 0 ]] && currentExitStatus=1
	
	export flipKey_headerKeyFile="$flipKey_headerKey_mult03_devFile"
	_sweep-flipKey "$flipKey_headerKeyFile"
	[[ "$?" != 0 ]] && currentExitStatus=1
	
	export flipKey_headerKeyFile="$flipKey_headerKey_mult05_devFile"
	_sweep-flipKey "$flipKey_headerKeyFile"
	[[ "$?" != 0 ]] && currentExitStatus=1
	
	export flipKey_headerKeyFile="$flipKey_headerKey_mult07_devFile"
	_sweep-flipKey "$flipKey_headerKeyFile"
	[[ "$?" != 0 ]] && currentExitStatus=1
	
	
	
	
	export flipKey_headerKeyFile="$flipKey_headerKey_mult01_devFile"
	_generate
	sudo -n dd if="$flipKey_headerKey_mult01_devFile" of="$flipKey_headerKey_mult03_devFile" bs=128K
	sudo -n dd if="$flipKey_headerKey_mult01_devFile" of="$flipKey_headerKey_mult05_devFile" bs=128K
	sudo -n dd if="$flipKey_headerKey_mult01_devFile" of="$flipKey_headerKey_mult07_devFile" bs=128K
	
	
	! sudo -n type -p cryptsetup > /dev/null 2>&1
	
	export flipKey_headerKeyFile="$flipKey_headerKey_mult01_devFile"
	_extremelyRedundant_create
	[[ "$?" != 0 ]] && currentExitStatus=1
	
	[[ "$currentExitStatus" != '0' ]] && _messagePlain_good 'fail: create'
	[[ "$currentExitStatus" == '0' ]] && _messagePlain_good 'good: create'
	
	sleep 3
	return "$currentExitStatus"
}

__grab() {
	[[ "$flipKey_functions_fsTemp" != "" ]] && return 1
	
	export flipKey_mount="$scriptLocal"/../../../fs
	_set_occasional_read_redundant_headerKey
	_extremelyRedundant_mount
}

__toss() {
	[[ "$flipKey_functions_fsTemp" != "" ]] && return 1
	
	export flipKey_mount="$scriptLocal"/../../../fs
	_set_occasional_read_redundant_headerKey
	_extremelyRedundant_unmount
}


_purge() {
	local currentExitStatus
	currentExitStatus=0
	
	[[ "$flipKey_functions_fsTemp" != "" ]] && return 1
	
	export flipKey_mount="$scriptLocal"/../../../fs
	export flipKey_functions_fsTemp=''
	export flipKey_filesystem="btrfs-raid1c4"
	
	export flipKey_headerKeyFile="$flipKey_headerKey_mult01_devFile"
	
	_disk_declare
	_check_keyPartition
	_delay_exists_mount
	
	
	export flipKey_headerKeyFile="$flipKey_headerKey_mult01_devFile"
	_sweep-flipKey "$flipKey_headerKeyFile"
	[[ "$?" != 0 ]] && currentExitStatus=1
	
	export flipKey_headerKeyFile="$flipKey_headerKey_mult03_devFile"
	_sweep-flipKey "$flipKey_headerKeyFile"
	[[ "$?" != 0 ]] && currentExitStatus=1
	
	export flipKey_headerKeyFile="$flipKey_headerKey_mult05_devFile"
	_sweep-flipKey "$flipKey_headerKeyFile"
	[[ "$?" != 0 ]] && currentExitStatus=1
	
	export flipKey_headerKeyFile="$flipKey_headerKey_mult07_devFile"
	_sweep-flipKey "$flipKey_headerKeyFile"
	[[ "$?" != 0 ]] && currentExitStatus=1
	
	
	return "$currentExitStatus"
}





fi



CZXWXcRMTo8EmM8i4d
	
	
	
		cat << CZXWXcRMTo8EmM8i4d

# Mostly not relevant to 'extremelyRedundant' .
_disk_declare() {
	if [[ "\$flipKey_mount" != "\$flipKey_mount_temp" ]] && [[ "\$flipKey_functions_fsTemp" == '' ]]
	then
		export flipKey_mount="\$scriptLocal"/../../../fs
	fi
	
	export flipKey_removable='true'
	export flipKey_physical='true'
	
	export flipKey_headerKeySize=1500000
	export flipKey_containerSize=50000000
	
	export flipKey_pattern_bs=10000000
	export flipKey_pattern_count=2
	
	export flipKey_badblocks='true'
	
	
	export flipKey_packetDisc_exhaustible=$flipKey_packetDisc_exhaustible
}


CZXWXcRMTo8EmM8i4d
}





# ### NOTICE: 'extremelyRedundant' ###









_check_driveDeviceFile() {
	! [[ -e "$1" ]] && echo 'FAIL: missing: drive' && exit 1
	
	if ! sudo -n dd if="$1" of=/dev/null bs=1k count=1 > /dev/null 2>&1
	then
		echo 'FAIL: drive cannot read any removable media (may be empty)' && exit 1
	fi
	if ! [[ "$flipKey_packetDisc_exhaustible" == "true" ]]
	then
		type _extremelyRedundant_is_packetDisc > /dev/null 2>&1 && _extremelyRedundant_is_packetDisc "$1" && sleep 1
	else
		sleep 1
	fi
	
	if findmnt "$1" > /dev/null 2>&1 || findmnt "$1"-part1 > /dev/null 2>&1  || findmnt "$1"-part2 > /dev/null 2>&1 || findmnt "$1"-part3 > /dev/null 2>&1 || findmnt "$1"1 > /dev/null 2>&1 || findmnt "$1"2 > /dev/null 2>&1 || findmnt "$1"3 > /dev/null 2>&1
	then
		echo 'FAIL: safety: detect: mountpoint' && exit 1
	fi
	
	return 0
}


_enumerate_zipDrive() {
	ls -A -1 /dev/disk/by-id/usb*IOMEGA*ZIP_250* | grep -v 'part'
}
_find_zipDrive() {
	export currentDriveDeviceFile="$1"
	[[ "$currentDriveDeviceFile" != "" ]] && [[ -e "$currentDriveDeviceFile" ]] && echo "$currentDriveDeviceFile" && return 0
	
	# DANGER: Assumes only one Zip drive.
	export currentDriveDeviceFile=$(_enumerate_zipDrive | head -n 1)
	[[ "$currentDriveDeviceFile" != "" ]] && [[ -e "$currentDriveDeviceFile" ]] && echo "$currentDriveDeviceFile" && return 0
	
	return 1
}
_check_zipDrive() {
	[[ "$currentDriveDeviceFile" != "" ]] && _check_driveDeviceFile "$currentDriveDeviceFile"
	
	local currentZipDrive
	currentZipDrive=$( _find_zipDrive )
	
	_check_driveDeviceFile "$currentZipDrive"
	
	
	if [[ $(_enumerate_zipDrive | wc -l) -gt 1 ]]
	then
		echo 'FAIL: safety: Multiple relevant drives for removable media not allowed!'
		exit 1
	fi
	
	return 0
}


_enumerate_moDrive() {
	#ls -A -1 /dev/disk/by-id/usb-FUJITSU_MC?3?30??-?_????????????-0\:0 | grep -v 'part'
	ls -A -1 /dev/disk/by-id/usb-FUJITSU_MC?3?64UB_????????????????-0:0 /dev/disk/by-id/usb-FUJITSU_MC?3?30??-?_????????????-0:0 | grep -v 'part'
}
_find_moDrive() {
	export currentDriveDeviceFile="$1"
	
	[[ "$currentDriveDeviceFile" != "" ]] && [[ -e "$currentDriveDeviceFile" ]] && echo "$currentDriveDeviceFile" && return 0
	
	# DANGER: Assumes only one (relevant) drive.
	export currentDriveDeviceFile=$(_enumerate_moDrive | head -n 1)
	[[ "$currentDriveDeviceFile" != "" ]] && [[ -e "$currentDriveDeviceFile" ]] && echo "$currentDriveDeviceFile" && return 0
	
	return 1
}
_check_moDrive() {
	[[ "$currentDriveDeviceFile" != "" ]] && _check_driveDeviceFile "$currentDriveDeviceFile"
	
	local current_moDrive
	current_moDrive=$( _find_moDrive )
	
	_check_driveDeviceFile "$current_moDrive"
	
	if [[ $(_enumerate_moDrive | wc -l) -gt 1 ]]
	then
		echo 'FAIL: safety: Multiple relevant drives for removable media not allowed!'
		exit 1
	fi
	
	return 0
}


# DANGER: Small chance *any* 'USB Mass Storage Device' may be regarded as such - make sure a uDrive and ONLY a uDrive is connected by USB (ie. NOT any 'USB flash drive').
_enumerate_uDrive() {
	#ls -A -1 /dev/disk/by-id/usb-USB_Mass_Storage_Device_????????????-* | grep -v 'part'
	
	# https://www.google.com/search?q=%22816820130806%22
	ls -A -1 /dev/disk/by-id/usb-USB_Mass_Storage_Device_816820130806-* | grep -v 'part'
}
_find_uDrive() {
	export currentDriveDeviceFile="$1"
	
	[[ "$currentDriveDeviceFile" != "" ]] && [[ -e "$currentDriveDeviceFile" ]] && echo "$currentDriveDeviceFile" && return 0
	
	# DANGER: Assumes only one (relevant) drive.
	export currentDriveDeviceFile=$(_enumerate_uDrive | head -n 1)
	[[ "$currentDriveDeviceFile" != "" ]] && [[ -e "$currentDriveDeviceFile" ]] && echo "$currentDriveDeviceFile" && return 0
	
	return 1
}
_check_uDrive() {
	[[ "$currentDriveDeviceFile" != "" ]] && _check_driveDeviceFile "$currentDriveDeviceFile"
	
	local current_uDrive
	current_uDrive=$( _find_uDrive )
	
	_check_driveDeviceFile "$current_uDrive"
	
	if [[ $(_enumerate_uDrive | wc -l) -gt 1 ]]
	then
		echo 'FAIL: safety: Multiple relevant drives for removable media not allowed!'
		exit 1
	fi
	
	return 0
}



# No production use. User convenience.
_fdisk_u() {
	local currentDrive
	currentDrive=$( _find_uDrive )
	_check_uDrive
	
	#-b 4096
	sudo -n fdisk -c=nondos "$currentDrive"
}
_fdisk_mo() {
	local currentDrive
	currentDrive=$( _find_moDrive )
	_check_moDrive
	
	#-b 4096
	sudo -n fdisk -c=nondos "$currentDrive"
}
_fdisk_zip() {
	local currentZipDrive
	currentZipDrive=$( _find_zipDrive )
	_check_zipDrive
	
	# https://www.thomas-krenn.com/en/wiki/Partition_Alignment_detailed_explanation
	#-b 512
	sudo -n fdisk -c=nondos "$currentZipDrive"
}
_fdisk() {
	#_fdisk_mo "$@"
	_fdisk_zip "$@"
}
_gparted_u() {
	local currentDrive
	currentDrive=$( _find_uDrive )
	_check_uDrive
	
	sudo -n gparted "$currentDrive"
}
_gparted_mo() {
	local currentDrive
	currentDrive=$( _find_moDrive )
	_check_moDrive
	
	sudo -n gparted "$currentDrive"
}
_gparted() {
	_gparted_mo "$@"
}




_fdisk_wait() {
	sync
	if ! [[ -e "$1"-part1 ]]
	then
		sleep 0.3
		[[ -e "$1"-part1 ]] && return 0
		sleep 1
		[[ -e "$1"-part1 ]] && return 0
		sleep 3
		[[ -e "$1"-part1 ]] && return 0
		sleep 9
		[[ -e "$1"-part1 ]] && return 0
		sleep 27
		[[ -e "$1"-part1 ]] && return 0
	fi
	while ! [[ -e "$1"-part1 ]] && _messagePlain_request 'request: may be necessary to remove and reinsert disk (sleep 45)' && sleep 45
	do
		sync
		sleep 1
	done
	sleep 1
	sleep 9
	sync
}





_fdisk_automatic-u-keyPartition-containerPartition() {
	local currentDrive
	currentDrive=$( _find_uDrive )
	_check_uDrive
	
	_desilver_u_partitionTable
	
	#18M + 384K = 18816K
	
	# https://superuser.com/questions/332252/how-to-create-and-format-a-partition-using-a-bash-script
	#-b 4096
	sudo -n fdisk -c=nondos "$currentDrive" << EOF
g
n
1

+28M
n
2

+18M
t
2
64
n
4

+1M
n
3


t
3
64
d
4
w
EOF
	
	sync
	_fdisk_wait "$currentDrive"
	sudo -n fdisk "$currentDrive" << EOF
p
EOF
	
	sync
	_fdisk_wait "$currentDrive"
	
	sync
	sleep 9
	_fdisk_wait "$currentDrive"
}
_fdisk_automatic-u-keyPartition() {
	_fdisk_automatic-u-keyPartition-containerPartition "$@"
}

_fdisk_automatic-u() {
	local currentDrive
	currentDrive=$( _find_uDrive )
	_check_uDrive
	
	_desilver_u_partitionTable
	
	# https://superuser.com/questions/332252/how-to-create-and-format-a-partition-using-a-bash-script
	sudo -n fdisk "$currentDrive" << EOF
o
n
p
1

-4M
w
EOF
	
	sync
	_fdisk_wait "$currentDrive"
	sudo -n fdisk "$currentDrive" << EOF
p
EOF
	
	sync
	_fdisk_wait "$currentDrive"
	
	sync
	sleep 9
	_fdisk_wait "$currentDrive"
}






_fdisk_automatic-mo-keyPartition-containerPartition() {
	local currentDrive
	currentDrive=$( _find_moDrive )
	_check_moDrive
	
	_desilver_mo_partitionTable
	
	# https://superuser.com/questions/332252/how-to-create-and-format-a-partition-using-a-bash-script
	#-b 4096
	sudo -n fdisk -c=nondos "$currentDrive" << EOF
g
n
1

+28M
n
2

+384K
t
2
64
n
3

-1M
t
3
64
w
EOF
	
	
	# ATTENTION: Slightly different 'fdisk' command 'script' will add an extra partition for 'manual' duplicate key backup.
	# Unwise. If the key backup is needed, then there is a ~1000x greater probability of data corruption elsewhere.
	#g
	#n
	#1
	#
	#+28M
	#n
	#2
	#
	#+384K
	#t
	#2
	#64
	#n
	#3
	#
	##-1M
	#t
	#3
	#64
	##n
	##4
	##
	##+384K
	##t
	##4
	##64
	#w
	
	
	sync
	_fdisk_wait "$currentDrive"
	sudo -n fdisk "$currentDrive" << EOF
p
EOF
	
	sync
	_fdisk_wait "$currentDrive"
	
	sync
	sleep 9
	_fdisk_wait "$currentDrive"
}
_fdisk_automatic-mo-keyPartition() {
	_fdisk_automatic-mo-keyPartition-containerPartition "$@"
}

_fdisk_automatic-mo() {
	local currentDrive
	currentDrive=$( _find_moDrive )
	_check_moDrive
	
	_desilver_mo_partitionTable
	
	# https://superuser.com/questions/332252/how-to-create-and-format-a-partition-using-a-bash-script
	sudo -n fdisk "$currentDrive" << EOF
o
n
p
1

-4M
w
EOF
	
	sync
	_fdisk_wait "$currentDrive"
	sudo -n fdisk "$currentDrive" << EOF
p
EOF
	
	sync
	_fdisk_wait "$currentDrive"
	
	sync
	sleep 9
	_fdisk_wait "$currentDrive"
}



_fdisk_automatic-zip-keyPartition-containerPartition() {
	local currentZipDrive
	currentZipDrive=$( _find_zipDrive )
	_check_zipDrive
	
	_desilver_zip_partitionTable
	
	# 'c' ' sqrt(250 * (10^6)) = approx. 15811.388 '
	# https://superuser.com/questions/332252/how-to-create-and-format-a-partition-using-a-bash-script
	#-b 512
	sudo -n fdisk -c=nondos "$currentZipDrive" << EOF
g
n
1

+28M
n
2

+4M
t
2
64
n
3


t
3
64
w
EOF
	
	sync
	_fdisk_wait "$currentZipDrive"
	sudo -n fdisk "$currentZipDrive" << EOF
p
EOF
	
	sync
	_fdisk_wait "$currentZipDrive"
	
	sync
	sleep 9
	_fdisk_wait "$currentZipDrive"
}
_fdisk_automatic-zip-keyPartition() {
	_fdisk_automatic-zip-keyPartition-containerPartition "$@"
}

# WARNING: OBSOLETE. Container was stored on a filesystem. Mildly dangerous as this increases the risk of seek errors with mechanical removable disk (at least if both filesystems are journaling - which is still strongly recommended) .
_fdisk_automatic-zip-keyPartition-containerFile() {
	local currentZipDrive
	currentZipDrive=$( _find_zipDrive )
	_check_zipDrive
	
	_desilver_zip_partitionTable
	
	# 'c' ' sqrt(250 * (10^6)) = approx. 15811.388 '
	# https://superuser.com/questions/332252/how-to-create-and-format-a-partition-using-a-bash-script
	sudo -n fdisk "$currentZipDrive" << EOF
o
n
p
1

-4M
n
p
2


t
2
64
w
EOF
	
	sync
	_fdisk_wait "$currentZipDrive"
	sudo -n fdisk "$currentZipDrive" << EOF
p
EOF
	
	sync
	_fdisk_wait "$currentZipDrive"
	
	sync
	sleep 9
	_fdisk_wait "$currentZipDrive"
}

_fdisk_automatic-zip() {
	local currentZipDrive
	# DANGER: Assumes only one Zip drive.
	currentZipDrive=$( _find_zipDrive )
	_check_zipDrive
	
	_desilver_zip_partitionTable

	# https://superuser.com/questions/332252/how-to-create-and-format-a-partition-using-a-bash-script
	sudo -n fdisk "$currentZipDrive" << EOF
o
n
p
1

-4M
w
EOF
	
	sync
	_fdisk_wait "$currentZipDrive"
	sudo -n fdisk "$currentZipDrive" << EOF
p
EOF
	
	sync
	_fdisk_wait "$currentZipDrive"
	
	sync
	sleep 9
	_fdisk_wait "$currentZipDrive"
}


_flipKey_disk() {
	cat << EOF

_disk_declare() {
	_disk_default
	
	$1
	
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
	
	#export flipKey_filesystem="btrfs-mix"
	#export flipKey_filesystem="btrfs"
	#export flipKey_filesystem="ext4"
	#export flipKey_filesystem="NTFS"
	
	#export flipKey_filesystem="btrfs-dup"
	
	#export flipKey_mount="\$scriptLocal"/../../fs
	
	# ATTENTION: WARNING: Highly irregular. Places 'fs' next to user assuming directory structure includes 'user' and 'flipKey' successfully changes 'ownership' of the 'fs' directory.
	export flipKey_mount="\$scriptLocal"/../../../fs
	
	
	
	
	# NOTICE: Automatically generated. Do NOT edit.
	if [[ "$1" == *"keyPartition" ]] && [[ "$2" != "" ]]
	then
		#export flipKey_headerKeyFile=\$(ls -A -1 /dev/disk/by-id/usb*IOMEGA*ZIP_250*-part2 2>/dev/null | head -n 1)
		export flipKey_headerKeyFile=/dev/disk/by-partuuid/$2
		
		true
	fi
	if [[ "$1" == *"keyPartition" ]] && [[ "$3" != "" ]]
	then
		#export flipKey_container="\$scriptLocal"/container.vc
		export flipKey_container=/dev/disk/by-partuuid/$3
		
		true
	fi
	if [[ "$1" == *"keyPartition" ]] && [[ "$4" != "" ]]
	then
		# Unwise. Should not be partitioned by default.
		#export flipKey_headerKeyFile_backup=/dev/disk/by-partuuid/$4
		
		true
	fi
	
	true
}

EOF
}


_flipKey_unpackage() {
	local functionEntryPWD
	functionEntryPWD="$PWD"
	
	local currentDrive
	currentDrive="$2"
	
	mkdir -m 700 -p ./diskMount/user
	sudo -n mount "$currentDrive"-part1 ./diskMount
	sudo -n chown "$USER":"$USER" ./diskMount
	mkdir -m 700 -p ./diskMount/user
	sudo -n chown "$USER":"$USER" ./diskMount/user
	
	if ! mountpoint ./diskMount > /dev/null 2>&1
	then
		rmdir ./diskMount/user
		rmdir ./diskMount
		return 1
	fi
	
	sudo -n ln -s -n /dev/shm ./diskMount/shm
	
	#_extractAttachment
	_attachment > "$functionEntryPWD"/package_tmp.tar.xz
	_noAttachment | tee ./discManager_noAttachment.sh > /dev/null 2>&1
	cd "$functionEntryPWD"/diskMount/user
	rm "$functionEntryPWD"/diskMount/user/flipKey/_lib/_setups/distribution/*.deb
	rm "$functionEntryPWD"/diskMount/user/flipKey/_lib/_setups/veracrypt/*.deb
	mv "$functionEntryPWD"/diskMount/user/flipKey/_local/disk.sh "$functionEntryPWD"/diskMount/user/flipKey/_local/disk.sh.bak
	mv "$functionEntryPWD"/diskMount/user/flipKey/_local/ops.sh "$functionEntryPWD"/diskMount/user/flipKey/_local/ops.sh.bak > /dev/null 2>&1
	mv "$functionEntryPWD"/diskMount/user/flipKey/ops.sh "$functionEntryPWD"/diskMount/user/flipKey/ops.sh.bak
	tar -xvpf "$functionEntryPWD"/package_tmp.tar.*
	sync
	
	
	
	rm "$functionEntryPWD"/package_tmp.tar.*
	cd "$functionEntryPWD"/diskMount
	sudo -n mv "$functionEntryPWD"/discManager_noAttachment.sh ./discManager
	sudo -n rm -f "$functionEntryPWD"/discManager_noAttachment.sh > /dev/null 2>&1
	#sudo -n cp "$functionEntryPWD"/discManager ./
	sudo -n rm ./discManager
	cd "$functionEntryPWD"
	sync
	
	local currentDrive_keyPartition
	local currentDrive_containerPartition
	[[ "$currentDrive" != "" ]] && [[ -e "$currentDrive"-part2 ]] && sudo -n dd if="$currentDrive"-part2 of=/dev/null bs=1k count=1 > /dev/null 2>&1 && currentDrive_keyPartition=$(sudo -n blkid -s PARTUUID "$currentDrive"-part2 | grep PARTUUID\= | cut -d\= -f2 )
	
	[[ "$currentDrive" != "" ]] && [[ -e "$currentDrive"-part3 ]] && sudo -n dd if="$currentDrive"-part3 of=/dev/null bs=1k count=1 > /dev/null 2>&1 && currentDrive_containerPartition=$(sudo -n blkid -s PARTUUID "$currentDrive"-part3 | grep PARTUUID\= | cut -d\= -f2 )
	
	# Unwise, should not be partitioned by default.
	[[ "$currentDrive" != "" ]] && [[ -e "$currentDrive"-part4 ]] && sudo -n dd if="$currentDrive"-part4 of=/dev/null bs=1k count=1 > /dev/null 2>&1 && currentDrive_keyPartition_backup=$(sudo -n blkid -s PARTUUID "$currentDrive"-part4 | grep PARTUUID\= | cut -d\= -f2 )
	
	_flipKey_disk "$1" "$currentDrive_keyPartition" "$currentDrive_containerPartition" "$currentDrive_keyPartition_backup" > ./diskMount/user/flipKey/_local/disk.sh
	
	
	cd "$functionEntryPWD"/diskMount/user/flipKey/_local
	# WARNING: Compatibility only. Copy contents, but do NOT use directly.
	sudo -n ln -s $(echo "/dev/disk/by-partuuid/$currentDrive_keyPartition" | tr -dc 'a-zA-Z0-9-/') ./c-h-flipKey
	sudo -n ln -s $(echo "/dev/disk/by-partuuid/$currentDrive_containerPartition" | tr -dc 'a-zA-Z0-9-/') ./container.vc
	cd "$functionEntryPWD"
	
	cd "$functionEntryPWD"/diskMount
	sudo -n ln -s ./user/flipKey/___nilfs_gc.bat
	sudo -n ln -s ./user/flipKey/__grab.bat
	sudo -n ln -s ./user/flipKey/__toss.bat
	sudo -n ln -s ./user/flipKey/discManager-src.sh ./discManager
	
	sudo -n ln -s ./user/flipKey/___btrfs_balance.bat
	sudo -n ln -s ./user/flipKey/___btrfs_defrag.bat
	sudo -n ln -s ./user/flipKey/___btrfs_scrub_start.bat
	sudo -n ln -s ./user/flipKey/___btrfs_scrub_status.bat
	sudo -n ln -s ./user/flipKey/___btrfs_snapshot.bat
	sudo -n ln -s ./user/flipKey/___btrfs_gc.bat
	sudo -n ln -s ./user/flipKey/___btrfs_compsize.bat
	
	
	cd "$functionEntryPWD"
	
	
	
	mv -f "$functionEntryPWD"/diskMount/user/flipKey/_local/disk.sh.bak "$functionEntryPWD"/diskMount/user/flipKey/_local/disk.sh
	mv -f "$functionEntryPWD"/diskMount/user/flipKey/_local/ops.sh.bak "$functionEntryPWD"/diskMount/user/flipKey/_local/ops.sh > /dev/null 2>&1
	mv -f "$functionEntryPWD"/diskMount/user/flipKey/ops.sh.bak "$functionEntryPWD"/diskMount/user/flipKey/ops.sh
	sync
	
	sudo -n umount ./diskMount
	sync
	
	rmdir ./diskMount/user
	rmdir ./diskMount
	
	return 0
}


_u_flipKey_unpackage() {
	local currentDrive
	currentDrive=$( _find_uDrive )
	_check_uDrive
	
	_flipKey_unpackage "$1" "$currentDrive"
}


_mo_flipKey_unpackage() {
	local currentDrive
	currentDrive=$( _find_moDrive )
	_check_moDrive
	
	_flipKey_unpackage "$1" "$currentDrive"
}

_zip_flipKey_unpackage() {
	local currentDrive
	currentDrive=$( _find_zipDrive )
	_check_zipDrive
	
	_flipKey_unpackage "$1" "$currentDrive"
}



_filesystem_u() {
	local functionEntryPWD
	functionEntryPWD="$PWD"
	
	local currentDrive
	currentDrive=$( _find_uDrive )
	_check_uDrive
	
	# Optional '-cc' instead of '-c' .
	# Read/write checking of disk for bad blocks may seem unnecessary. However, these filesystems will usually be small, intended for scripts or token storage (where corruption might cause more severe data loss).
	# Where convenience and compatibility are required instead of reliability, 'ntfs' is expected.
	[[ "$1" == "ext4" ]] && sudo -n mkfs."$1" -O 64bit,metadata_csum -cc -b -2048 -e remount-ro -E lazy_itable_init=0,lazy_journal_init=0 -m 0 -I 256 -F "$currentDrive"-part1
	[[ "$1" == "ext2" ]] && sudo -n mkfs."$1" -cc -b -2048 -e remount-ro -E lazy_itable_init=0,lazy_journal_init=0 -m 0 -I 256 -F "$currentDrive"-part1
	
	[[ "$1" == "btrfs" ]] && sudo -n mkfs."$1" -f "$currentDrive"-part1
	
	[[ "$1" == "ntfs" ]] && sudo -n mkfs."$1" -f "$currentDrive"-part1
	
	sync
	
	_u_flipKey_unpackage "$2"
	
	
	cd "$functionEntryPWD"
}


_filesystem_mo() {
	local functionEntryPWD
	functionEntryPWD="$PWD"
	
	local currentDrive
	currentDrive=$( _find_moDrive )
	_check_moDrive
	
	# Optional '-cc' instead of '-c' .
	# Read/write checking of disk for bad blocks may seem unnecessary. However, these filesystems will usually be small, intended for scripts or token storage (where corruption might cause more severe data loss).
	# Where convenience and compatibility are required instead of reliability, 'ntfs' is expected.
	[[ "$1" == "ext4" ]] && sudo -n mkfs."$1" -O 64bit,metadata_csum -cc -b -2048 -e remount-ro -E lazy_itable_init=0,lazy_journal_init=0 -m 0 -I 256 -F "$currentDrive"-part1
	[[ "$1" == "ext2" ]] && sudo -n mkfs."$1" -cc -b -2048 -e remount-ro -E lazy_itable_init=0,lazy_journal_init=0 -m 0 -I 256 -F "$currentDrive"-part1
	
	[[ "$1" == "btrfs" ]] && sudo -n mkfs."$1" -f "$currentDrive"-part1
	
	[[ "$1" == "ntfs" ]] && sudo -n mkfs."$1" -f "$currentDrive"-part1
	
	sync
	
	_mo_flipKey_unpackage "$2"
	
	
	cd "$functionEntryPWD"
}

_filesystem_zip() {
	local functionEntryPWD
	functionEntryPWD="$PWD"
	
	local currentZipDrive
	currentZipDrive=$( _find_zipDrive )
	_check_zipDrive
	
	# Optional '-cc' instead of '-c' .
	# Read/write checking of disk for bad blocks may seem unnecessary. However, these filesystems will usually be small, intended for scripts or token storage (where corruption might cause more severe data loss).
	# Where convenience and compatibility are required instead of reliability, 'ntfs' is expected.
	# Extra inode size may solve the 'y2k38' problem, which may be more significant for the filesystem which merely hosts scripts.
	[[ "$1" == "ext4" ]] && sudo -n mkfs."$1" -O 64bit,metadata_csum -c -b -1024 -e remount-ro -E lazy_itable_init=0,lazy_journal_init=0 -m 0 -I 256 -F "$currentZipDrive"-part1
	[[ "$1" == "ext2" ]] && sudo -n mkfs."$1" -c -b -1024 -e remount-ro -E lazy_itable_init=0,lazy_journal_init=0 -m 0 -I 256 -F "$currentZipDrive"-part1
	
	[[ "$1" == "btrfs" ]] && sudo -n mkfs."$1" -f "$currentZipDrive"-part1
	
	[[ "$1" == "ntfs" ]] && sudo -n mkfs."$1" -f "$currentZipDrive"-part1
	
	sync
	
	_zip_flipKey_unpackage "$2"
	
	
	cd "$functionEntryPWD"
}



_u_badblocks_keyPartition() {
	local currentDrive
	currentDrive=$( _find_uDrive )
	_check_uDrive
	
	if [[ "$currentDrive" != "" ]] && [[ -e "$currentDrive"-part2 ]] && sudo -n dd if="$currentDrive"-part2 of=/dev/null bs=1k count=1 > /dev/null 2>&1
	then
		# https://wiki.archlinux.org/title/badblocks#Read-write_test_(non-destructive)
		# ' simply repeats one "random pattern" '
		! sudo -n badblocks -wsv -t random "$currentDrive"-part2 && echo 'FAIL: badblocks' && _messagePlain_request 'request: discard and do NOT use this removable media disc (aka. disk)!' && exit 1
	fi
	return 0
}


_mo_badblocks_keyPartition() {
	local currentDrive
	currentDrive=$( _find_moDrive )
	_check_moDrive
	
	if [[ "$currentDrive" != "" ]] && [[ -e "$currentDrive"-part2 ]] && sudo -n dd if="$currentDrive"-part2 of=/dev/null bs=1k count=1 > /dev/null 2>&1
	then
		# https://wiki.archlinux.org/title/badblocks#Read-write_test_(non-destructive)
		# ' simply repeats one "random pattern" '
		! sudo -n badblocks -wsv -t random "$currentDrive"-part2 && echo 'FAIL: badblocks' && _messagePlain_request 'request: discard and do NOT use this removable media disc (aka. disk)!' && exit 1
	fi
	return 0
}

_zip_badblocks_keyPartition() {
	local currentZipDrive
	currentZipDrive=$( _find_zipDrive )
	_check_zipDrive
	
	if [[ "$currentZipDrive" != "" ]] && [[ -e "$currentZipDrive"-part2 ]] && sudo -n dd if="$currentZipDrive"-part2 of=/dev/null bs=1k count=1 > /dev/null 2>&1
	then
		# https://wiki.archlinux.org/title/badblocks#Read-write_test_(non-destructive)
		# ' simply repeats one "random pattern" '
		! sudo -n badblocks -wsv -t random "$currentZipDrive"-part2 && echo 'FAIL: badblocks' && _messagePlain_request 'request: discard and do NOT use this removable media disc (aka. disk)!' && exit 1
	fi
	return 0
}



_zip250_ntfs() {
	_fdisk_automatic-zip
	_filesystem_zip ntfs _disk_zip250
}

_zip100_ntfs() {
	_fdisk_automatic-zip
	_filesystem_zip ntfs _disk_zip100
}

_zip250_keyPartition() {
	_fdisk_automatic-zip-keyPartition
	_zip_badblocks_keyPartition
	_filesystem_zip ext4 _disk_zip250_keyPartition
	#_filesystem_zip btrfs _disk_zip250_keyPartition
}

_zip100_keyPartition() {
	_fdisk_automatic-zip-keyPartition
	_zip_badblocks_keyPartition
	_filesystem_zip ext4 _disk_zip100_keyPartition
}

_zip250() {
	_zip250_keyPartition
}

_zip100() {
	_zip100_keyPartition
}




_mo230_ntfs() {
	_fdisk_automatic-mo
	_filesystem_mo ntfs _disc_mo230
}
_mo640_ntfs() {
	_fdisk_automatic-mo
	_filesystem_mo ntfs _disc_mo640
}
_mo2300_ntfs() {
	_fdisk_automatic-mo
	_filesystem_mo ntfs _disc_mo2300
}

_mo230_keyPartition() {
	_fdisk_automatic-mo-keyPartition
	_mo_badblocks_keyPartition
	_filesystem_mo ext4 _disc_mo230_keyPartition
	#_filesystem_mo btrfs _disc_mo230_keyPartition
}
_mo640_keyPartition() {
	_fdisk_automatic-mo-keyPartition
	_mo_badblocks_keyPartition
	_filesystem_mo ext4 _disc_mo640_keyPartition
}
_mo2300_keyPartition() {
	_fdisk_automatic-mo-keyPartition
	_mo_badblocks_keyPartition
	_filesystem_mo ext4 _disc_mo2300_keyPartition
}

_mo230() {
	_mo230_keyPartition
}
_mo640() {
	_mo640_keyPartition
}
_mo2300() {
	_mo2300_keyPartition
}




_u2500_ntfs() {
	_fdisk_automatic-u
	_filesystem_u ntfs _disk_u2500
}
_u4000_ntfs() {
	_fdisk_automatic-u
	_filesystem_u ntfs _disk_u4000
}

_u2500_keyPartition() {
	_fdisk_automatic-u-keyPartition
	_u_badblocks_keyPartition
	_filesystem_u ext4 _disk_u2500_keyPartition
	#_filesystem_u btrfs _u2500_keyPartition
}
_u4000_keyPartition() {
	_fdisk_automatic-u-keyPartition
	_u_badblocks_keyPartition
	_filesystem_u ext4 _disk_u4000_keyPartition
}

_u2500() {
	_u2500_keyPartition
}
_u4000() {
	_u4000_keyPartition
}




_zip_token() {
	#_fdisk_automatic-zip-keyPartition-containerFile
	_fdisk_automatic-zip
	
	local currentZipDrive
	currentZipDrive=$( _find_zipDrive )
	_check_zipDrive
	
	sudo -n mkfs.ext2 -c -b -1024 -e remount-ro -E lazy_itable_init=0,lazy_journal_init=0 -m 0 -I 256 -F "$currentZipDrive"-part1
	
	_messagePlain_request 'request: blkid: consider UUID (ie. token id)'
	sudo -n blkid "$currentZipDrive"-part1
}


# Strongly discouraged. Will not create unique PARTUUID .
_zip_diskToImage() {
	local currentZipDrive
	currentZipDrive=$( _find_zipDrive )
	_check_zipDrive
	
	sudo -n dd if="$currentZipDrive" bs=2M status=progress | env XZ_OPT=-e9 xz -c > image.ima.xz
	#sudo -n chown "$USER":"$USER" ./image.ima
}
# Strongly discouraged. Will not create unique PARTUUID .
_zip_diskFromImage() {
	local currentZipDrive
	currentZipDrive=$( _find_zipDrive )
	_check_zipDrive
	
	xz -d image.ima.xz | sudo -n dd of="$currentZipDrive" bs=2M status=progress
}


_desilver_zip_keyPartition() {
	local currentDrive
	currentDrive="$1"
	
	if [[ "$currentDrive" != "" ]] && [[ -e "$currentDrive"-part2 ]] && sudo -n dd if="$currentDrive"-part2 of=/dev/null bs=1k count=1 > /dev/null 2>&1
	then
		echo 'desilver: keyPartition: found: '"$currentDrive"-part2
		sudo -n dd if=/dev/urandom of="$currentDrive"-part2 bs=1M count=50 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part2 bs=512K count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part2 bs=256K count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part2 bs=256K count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part2 bs=128K count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part2 bs=128K count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part2 bs=128K count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part2 bs=128K count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/zero of="$currentDrive"-part2 bs=1M count=50 oflag=direct conv=fdatasync status=progress
		sync
		echo 'desilver: keyPartition'
		return 0
	fi
	return 1
}

_desilver_zip() {
	local currentZipDrive
	currentZipDrive=$( _find_zipDrive )
	_check_zipDrive
	
	_desilver_zip_keyPartition "$currentZipDrive" > /dev/null
	sudo -n dd if=/dev/urandom of="$currentZipDrive" bs=2M oflag=direct conv=fdatasync status=progress
	
	sudo -n sg_format --format "$currentZipDrive"
	sync
	
	sudo -n dd if=/dev/urandom of="$currentZipDrive" bs=2M oflag=direct conv=fdatasync status=progress
	sync
	
	# Although filling with zeros is probably not ideal and wastes considerable time, this may be used to generate a compressible disk image .
	#sudo -n dd if=/dev/zero of="$currentZipDrive" bs=1M oflag=direct conv=fdatasync status=progress
	_pattern_recovery_write "$currentZipDrive"
	sync
}

_desilver_zip_partitionTable() {
	local currentZipDrive
	currentZipDrive=$( _find_zipDrive )
	_check_zipDrive
	
	_desilver_zip_keyPartition "$currentZipDrive" > /dev/null
	
	#sudo -n dd if=/dev/urandom of="$currentZipDrive" bs=1M count=6 oflag=direct conv=fdatasync status=progress
	#sync
	
	# Although filling with zeros is probably not ideal and wastes considerable time, this may be used to generate a compressible disk image .
	sudo -n dd if=/dev/urandom of="$currentZipDrive" bs=1M count=1 oflag=direct conv=fdatasync status=progress
	#sudo -n dd if=/dev/zero of="$currentZipDrive" bs=1M count=6 oflag=direct conv=fdatasync status=progress
	sync
	
	_pattern_recovery_write "$currentZipDrive" 2
	sync
}








_desilver_u_keyPartition() {
	local currentDrive
	currentDrive="$1"
	
	if [[ "$currentDrive" != "" ]] && [[ -e "$currentDrive"-part2 ]] && sudo -n dd if="$currentDrive"-part2 of=/dev/null bs=1k count=1 > /dev/null 2>&1
	then
		echo 'desilver: keyPartition: found: '"$currentDrive"-part2
		sudo -n dd if=/dev/urandom of="$currentDrive"-part2 bs=2M count=50 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part2 bs=2M count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part2 bs=2M count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part2 bs=2M count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part2 bs=1M count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part2 bs=1M count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part2 bs=1M count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part2 bs=1M count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/zero of="$currentDrive"-part2 bs=1M count=50 oflag=direct conv=fdatasync status=progress
		sync
		echo 'desilver: keyPartition'
		return 0
	fi
	return 1
}

_desilver_u() {
	local currentDrive
	currentDrive=$( _find_uDrive )
	_check_uDrive
	
	_desilver_u_keyPartition "$currentDrive" > /dev/null
	sudo -n dd if=/dev/urandom of="$currentDrive" bs=2M oflag=direct conv=fdatasync status=progress
	
	#sudo -n sg_format --format "$currentDrive"
	#sync
	
	local currentIteration
	currentIteration=0
	while [[ "$currentIteration" -lt "9" ]] && ! sudo -n dd if="$currentDrive" of=/dev/null bs=1k count=1 > /dev/null 2>&1
	do
		sleep 3
		sync
		let currentIteration=currentIteration+1
	done
	sleep 9
	sync
	
	sudo -n dd if=/dev/urandom of="$currentDrive" bs=2M oflag=direct conv=fdatasync status=progress
	sync
	
	# Although filling with zeros is probably not ideal and wastes considerable time, this may be used to generate a compressible disk image .
	#sudo -n dd if=/dev/zero of="$currentDrive" bs=1M oflag=direct conv=fdatasync status=progress
	#sync
	
	# Microdrives may be especially likely to benefit from realignment recovery numbering.
	_pattern_recovery_write "$currentDrive"
}

_desilver_u_partitionTable() {
	local currentDrive
	currentDrive=$( _find_uDrive )
	_check_uDrive
	
	_desilver_u_keyPartition "$currentDrive" > /dev/null
	
	sudo -n dd if=/dev/urandom of="$currentDrive" bs=1M count=6 oflag=direct conv=fdatasync status=progress
	sync
	
	# Although filling with zeros is probably not ideal and wastes considerable time, this may be used to generate a compressible disk image .
	#sudo -n dd if=/dev/urandom of="$currentDrive" bs=1M count=1 oflag=direct conv=fdatasync status=progress
	sudo -n dd if=/dev/zero of="$currentDrive" bs=1M count=6 oflag=direct conv=fdatasync status=progress
	sync
	
	_pattern_recovery_write "$currentDrive" 8
	sync
}











_desilver_mo_keyPartition() {
	local currentDrive
	currentDrive="$1"
	
	if [[ "$currentDrive" != "" ]] && [[ -e "$currentDrive"-part4 ]] && sudo -n dd if="$currentDrive"-part4 of=/dev/null bs=1k count=1 > /dev/null 2>&1
	then
		echo 'desilver: keyPartition: found: '"$currentDrive"-part4
		sudo -n dd if=/dev/urandom of="$currentDrive"-part4 bs=256K count=50 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part4 bs=256K count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part4 bs=256K count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part4 bs=256K count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part4 bs=128K count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part4 bs=128K count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part4 bs=128K count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part4 bs=128K count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/zero of="$currentDrive"-part4 bs=128K count=50 oflag=direct conv=fdatasync status=progress
		sync
		echo 'desilver: keyPartition'
	fi
	if [[ "$currentDrive" != "" ]] && [[ -e "$currentDrive"-part2 ]] && sudo -n dd if="$currentDrive"-part2 of=/dev/null bs=1k count=1 > /dev/null 2>&1
	then
		echo 'desilver: keyPartition: found: '"$currentDrive"-part2
		sudo -n dd if=/dev/urandom of="$currentDrive"-part2 bs=256K count=50 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part2 bs=256K count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part2 bs=256K count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part2 bs=256K count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part2 bs=128K count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part2 bs=128K count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part2 bs=128K count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/urandom of="$currentDrive"-part2 bs=128K count=2 oflag=direct conv=fdatasync status=progress
		sync
		sudo -n dd if=/dev/zero of="$currentDrive"-part2 bs=128K count=50 oflag=direct conv=fdatasync status=progress
		sync
		echo 'desilver: keyPartition'
		return 0
	fi
	return 1
}


_yDesilver_check_mo_formatDone_read() {
	sleep 1
	
	local dateA
	local dateB
	local dateDelta
	
	dateA=$(date +%s)
	
	! sudo -n dd if="$1" of=/dev/null bs=1M count=3 > /dev/null 2>&1 && return 1
	#! sudo -n dd if=/dev/urandom of="$1" bs=1M count=3 oflag=direct conv=fdatasync > /dev/null 2>&1 && return 1
	#sync
	
	dateB=$(date +%s)
	
	dateDelta=$(bc <<< "$dateB - $dateA")
	
	[[ "$dateDelta" -gt 25 ]] && return 1
	
	return 0
}
# DANGER: Destructive, erases data.
_yDesilver_check_mo_formatDone_write() {
	! _yDesilver_check_mo_formatDone_read "$1" && return 1
	
	sleep 1
	
	local dateA
	local dateB
	local dateDelta
	
	dateA=$(date +%s)
	
	#! sudo -n dd if="$1" of=/dev/null bs=1M count=3 > /dev/null 2>&1 && return 1
	! sudo -n dd if=/dev/urandom of="$1" bs=1M count=3 oflag=direct conv=fdatasync > /dev/null 2>&1 && return 1
	sync
	
	dateB=$(date +%s)
	
	dateDelta=$(bc <<< "$dateB - $dateA")
	
	[[ "$dateDelta" -gt 25 ]] && return 1
	return 0
}
_desilver_mo() {
	local currentDrive
	currentDrive=$( _find_moDrive )
	_check_moDrive
	
	local currentDrive_currentDisc_gigamo
	currentDrive_currentDisc_gigamo='false'
	[[ $(sudo -n blockdev --getsize64 "$currentDrive" 2>/dev/null | tr -dc '0-9' | head --bytes='-6') -gt '715' ]] && currentDrive_currentDisc_gigamo='true'
	[[ "$currentDrive_currentDisc_gigamo" == 'true' ]] && echo "detected: 'gigamo' disc"
	
	_desilver_mo_keyPartition "$currentDrive" > /dev/null
	sudo -n dd if=/dev/urandom of="$currentDrive" bs=2M oflag=direct conv=fdatasync status=progress
	
	sudo -n dd if=/dev/urandom of="$currentDrive" bs=2M oflag=direct conv=fdatasync status=progress
	sync
	
	sudo -n sg_format --format "$currentDrive"
	sync
	
	# DANGER: CAUTION: Do not reduce delay to less than thermal cooling of slowest and hottest plausible drive. Differences of >>30% read/write/heating/cooling time may exist between perfectly normal Magneto Optical drives.
	# Theoretically 2700s should suffice (as this exceeds whole disc writing speed). Definitely, 5400s seems to prevent awkward failure of sustaining a writing speed of only 30kB/s for a while. At most, 7323s should suffice (three times worst known, expected, estimated, or averaged, whole disc writing speed).
	#sleep 2700
	if [[ "$currentDrive_currentDisc_gigamo" == 'true' ]]
	then
		echo "delay: 1.5hr from "$(date +%H:%M:%S\.%d)": 'format unit' of 'gigamo' disc"
		sleep 5400
	fi
	sleep 180
	local currentIteration
	currentIteration=0
	while [[ "$currentIteration" -lt "60" ]] && ! ( sudo -n dd if="$currentDrive" of=/dev/null bs=1k count=1 > /dev/null 2>&1 && _yDesilver_check_mo_formatDone_write "$currentDrive" )
	do
		sleep 180
		sync
		let currentIteration=currentIteration+1
	done
	sleep 9
	sync
	
	
	
	# Although filling with zeros is probably not ideal and wastes considerable time, this may be used to generate a compressible disk image .
	#sudo -n dd if=/dev/zero of="$currentDrive" bs=1M oflag=direct conv=fdatasync status=progress
	_pattern_recovery_write "$currentDrive"
	sync
}

_desilver_mo_partitionTable() {
	local currentDrive
	currentDrive=$( _find_moDrive )
	_check_moDrive
	_check_driveDeviceFile "$currentDrive"
	
	_desilver_mo_keyPartition "$currentDrive" > /dev/null
	
	if [[ -e "$currentDrive"-part6 ]]
	then
		echo 'detected: additional partitions'
		type _extremelyRedundant_desilver_partitions > /dev/null 2>&1 && _extremelyRedundant_desilver_partitions "$currentDrive"
		type _extremelyRedundant_desilver_partitionTable > /dev/null 2>&1 && _extremelyRedundant_desilver_partitionTable "$currentDrive"
		echo
	fi
	
	sudo -n dd if=/dev/urandom of="$currentDrive" bs=1M count=6 oflag=direct conv=fdatasync status=progress
	sync
	
	# Although filling with zeros is probably not ideal and wastes considerable time, this may be used to generate a compressible disk image .
	#sudo -n dd if=/dev/urandom of="$currentDrive" bs=1M count=1 oflag=direct conv=fdatasync status=progress
	sudo -n dd if=/dev/zero of="$currentDrive" bs=1M count=6 oflag=direct conv=fdatasync status=progress
	sync
	
	_pattern_recovery_write "$currentDrive" 8
	sync
}



_fill() {
	[[ "$1" != "" ]] && cd "$1"
	local currentIteration
	currentIteration=0 ; while [[ "$currentIteration" -lt '24' ]] ; do dd if=/dev/urandom of=./fill bs=1M ; sync ; rm ./fill ; sync ; let currentIteration=currentIteration+1 ; done
}

_block_96M() {
	sudo -n dd if=/dev/urandom of=./block_96 bs=1M count=96 oflag=direct conv=fdatasync status=progress
	sudo -n mv block_96 block_96-$(md5sum block_96 | cut -f1 -d\ )
}

_block_64M() {
	sudo -n dd if=/dev/urandom of=./block_64 bs=1M count=64 oflag=direct conv=fdatasync status=progress
	sudo -n mv block_64 block_64-$(md5sum block_64 | cut -f1 -d\ )
}

_block_fill() {
	sudo -n dd if=/dev/urandom of=./block_fill bs=1M oflag=direct conv=fdatasync status=progress
	sudo -n mv block_fill block_fill-$(md5sum block_fill | cut -f1 -d\ )
}

_dd_user() {
	dd "$@" oflag=direct conv=fdatasync status=progress
}
_dd() {
	sudo -n dd "$@" oflag=direct conv=fdatasync status=progress
}

_dropCache() {
	sync ; echo 3 | sudo -n tee /proc/sys/vm/drop_caches
}

















# NOTICE: '_splitDisc'

# End-user convenience, mostly for experimental or recovery. Ignored in production use.
_splitDisc() {
	_splitDisc_procedure "$1" _splitDisc_bd25_bank_procedure
	sleep 20
}
_splitDisc_bd25_bank() {
	_splitDisc_procedure "$1" _splitDisc_bd25_bank_procedure
	sleep 20
}
_splitDisc_single() {
	_splitDisc_procedure "$1" _splitDisc_single_procedure
	sleep 20
}


_splitDisc_criticalDep() {
	! sudo -n which dvd+rw-format > /dev/null && exit 1
	! which realpath > /dev/null && exit 1
	
	! sudo -n which dmsetup > /dev/null && exit 1
	
	! sudo -n which blockdev > /dev/null && exit 1
	
	! sudo -n which partprobe > /dev/null && exit 1
	! sudo -n which kpartx > /dev/null && exit 1
	
	! sudo -n which udevadm > /dev/null && exit 1
	
	return 0
}


_splitDisc_is_packetDisc() {
	[[ "$1" != "/dev/mapper/"* ]] && [[ "$1" != "/dev/sr"* ]] && [[ "$1" != "/dev/dvd"* ]] && return 1
	return 0
}

_check_driveDeviceFile_splitDisc() {
	! [[ -e "$1" ]] && echo 'FAIL: missing: drive' && exit 1
	
	if ! sudo -n dd if="$1" of=/dev/null bs=1k count=1 > /dev/null 2>&1
	then
		echo 'FAIL: drive cannot read any removable media (may be empty)' && exit 1
	fi
	if ! [[ "$flipKey_packetDisc_exhaustible" == "true" ]]
	then
		type _extremelyRedundant_is_packetDisc > /dev/null 2>&1 && _extremelyRedundant_is_packetDisc "$1" && sleep 1
	else
		sleep 1
	fi
	
	if findmnt "$1" > /dev/null 2>&1 || findmnt "$1"-part1 > /dev/null 2>&1  || findmnt "$1"-part2 > /dev/null 2>&1 || findmnt "$1"-part3 > /dev/null 2>&1 || findmnt "$1"1 > /dev/null 2>&1 || findmnt "$1"2 > /dev/null 2>&1 || findmnt "$1"3 > /dev/null 2>&1
	then
		if [[ "$currentSplitDiscUID" == "" ]]
		then
			echo 'FAIL: safety: detect: mountpoint' && exit 1
		fi
	fi
	
	return 0
}



_splitDisc_remove() {
	_set_splitDisc_default
	
	local currentIteration
	currentIteration=0
	
	while [[ "$currentIteration" -lt 9 ]] && ls /dev/mapper/*_"$currentSplitDiscUID"_splitDisc* > /dev/null 2>&1
	do
		echo '_splitDisc_remove: dmsetup: remove'
		echo
		sudo -n dmsetup remove /dev/mapper/?_??_"$currentSplitDiscUID"_splitDisc??
		sudo -n dmsetup remove /dev/mapper/?_??_"$currentSplitDiscUID"_splitDisc?
		sudo -n dmsetup remove /dev/mapper/?_??_"$currentSplitDiscUID"_splitDisc
		
		sudo -n dmsetup remove /dev/mapper/?_?_"$currentSplitDiscUID"_splitDisc??
		sudo -n dmsetup remove /dev/mapper/?_?_"$currentSplitDiscUID"_splitDisc?
		sudo -n dmsetup remove /dev/mapper/?_?_"$currentSplitDiscUID"_splitDisc
		
		sync
		
		
		sudo -n find /dev/mapper/ -mindepth 1 -maxdepth 1 -xtype l -delete
		sync
		
		sleep 1
		ls /dev/mapper/*_"$currentSplitDiscUID"_splitDisc* > /dev/null 2>&1 && sleep 9
		let currentIteration=currentIteration+1
	done
	
	
	
	
	
	echo
	echo
	ls /dev/mapper/*_"$currentSplitDiscUID"_splitDisc*
	sleep 1
	echo
	ls /dev/mapper/*_"$currentSplitDiscUID"_splitDisc* > /dev/null 2>&1 && echo 'fail: dmsetup: remove'
	! ls /dev/mapper/*_"$currentSplitDiscUID"_splitDisc* > /dev/null 2>&1 && echo 'good: dmsetup: remove'
	sleep 3
}



_splitDisc_single_procedure() {
	export full_desiredMebibytes=$(bc <<< "scale=0; ( $currentDrive_size / 1048576 ) - $software_desiredMebibytes - $begin_desiredMebibytes - $end_desiredMebibytes - 16 - 2 ")
	export full_count=1
	
	export huge_desiredMebibytes=2375
	export huge_count=0
	
	export large_desiredMebibytes=715
	export large_count=0
	
	export small_desiredMebibytes=305
	export small_count=0
}

_splitDisc_bd25_bank_procedure() {
	export full_desiredMebibytes=$(bc <<< "scale=0; ( $currentDrive_size / 1048576 ) - $software_desiredMebibytes - $begin_desiredMebibytes - $end_desiredMebibytes - 16 - 2 ")
	export full_count=0
	
	export huge_desiredMebibytes=2375
	export huge_count=4
	
	export large_desiredMebibytes=715
	export large_count=15
	
	export small_desiredMebibytes=305
	export small_count=3
}


_set_splitDisc_default() {
	[[ "$currentSplitDiscUID" == "" ]] && export currentSplitDiscUID=$(cat /dev/urandom 2> /dev/null | base64 2> /dev/null | tr -dc 'a-zA-Z0-9' 2> /dev/null  | tr -d 'acdefhilmnopqrsuvACDEFHILMNOPQRSU14580' | head -c 18 2> /dev/null)
	export currentSplitDiscDevice="$currentSplitDiscUID"_splitDisc
}



_splitDisc_procedure() {
	! _splitDisc_criticalDep && exit 1
	_set_splitDisc_default
	
	! _vector_splitDisc_position > /dev/null 2>&1 && exit 1
	
	
	export currentDrive=$(_find_packetDrive)
	[[ "$1" != "" ]] && export currentDrive="$1"
	[[ "$currentSplitDiscDrive" != "" ]] && export currentDrive="$currentSplitDiscDrive"
	if [[ ! -e "$currentDrive" ]] && ( [[ "$flipKey_packetDisc_exhaustible" == "true" ]] || _splitDisc_is_packetDisc "$currentDrive" )
	then
		[[ -e /dev/sr0 ]] && sudo -n udevadm trigger --verbose --name=/dev/sr0 --settle
		[[ -e /dev/sr1 ]] && sudo -n udevadm trigger --verbose --name=/dev/sr1 --settle
		if [[ ! -e "$currentDrive" ]] && ( [[ "$flipKey_packetDisc_exhaustible" == "true" ]] || _splitDisc_is_packetDisc "$currentDrive" )
		then
			_messagePlain_request "request: remove all split devices, device mapper may be preventing udev from recreating '/dev/disk/by-uuid/*' file"
		fi
	fi
	_check_driveDeviceFile_splitDisc "$currentDrive"
	
	export currentDrive_size=$(sudo -n blockdev --getsize64 "$currentDrive" | tr -dc '0-9')
	[[ "$currentDrive_size" == "" ]] && return 1
	export currentDriveLinearSize=$(bc <<< "scale=0; $currentDrive_size / 512 ")
	
	local currentIteration
	
	
	export expectedSECTOR=512
	
	_splitDisc_position_reset
	
	
	
	# First and last BD-RE layers may benefit from >896MiB and ~2000MiB, respectively.
	# Blu-Ray 'inner' rotational rate is drastically different, and data begins there by default, causing a substantial performance penalty.
	# No reliability benefit for single quad-redundant filesystem spread across single-layer BD-RE disc (ie. 'slightlyRedundant').
	local software_desiredMebibytes=48
	local begin_desiredMebibytes=896
	local end_desiredMebibytes=450
	
	local desiredMebibytesEnd
	desiredMebibytesEnd=$(bc <<< "scale=0; ( $currentDrive_size / 1048576 ) - $end_desiredMebibytes - 16 ")
	
	_splitDisc_position_set $software_desiredMebibytes MiB
	_splitDisc_position_set $begin_desiredMebibytes MiB
	export currentPartitionNumber=0
	
	
	shift
	"$@"
	
	[[ "$full_desiredMebibytes" == "" ]] && export full_desiredMebibytes=0
	[[ "$full_count" == "" ]] && export full_count=0
	
	[[ "$huge_desiredMebibytes" == "" ]] && export huge_desiredMebibytes=2375
	[[ "$huge_count" == "" ]] && export huge_count=4
	
	[[ "$large_desiredMebibytes" == "" ]] && export large_desiredMebibytes=715
	[[ "$large_count" == "" ]] && export large_count=15
	
	[[ "$small_desiredMebibytes" == "" ]] && export small_desiredMebibytes=305
	[[ "$small_count" == "" ]] && export small_count=3
	
	
	
	# full
	export currentPartitionType="f"
	currentIteration=0
	while [[ "$currentIteration" -lt "$full_count" ]] && [[ $(bc <<< "scale=0; $currentEnd_MiB + $full_desiredMebibytes " | cut -f1 -d\. ) -le $(bc <<< "$desiredMebibytesEnd") ]]
	do
		_splitDisc_newPartition $full_desiredMebibytes MiB
		
		let currentIteration=currentIteration+1
	done
	
	# For reference, mo640M discs and mo230M discs (both 90mm diameter) were probably the most reliable and recoverable storage ever commonly available by 2021.
	# small
	export currentPartitionType="s"
	currentIteration=0
	while [[ "$currentIteration" -lt "$small_count" ]] && [[ $(bc <<< "scale=0; $currentEnd_MiB + $small_desiredMebibytes " | cut -f1 -d\. ) -le $(bc <<< "$desiredMebibytesEnd") ]]
	do
		_splitDisc_newPartition $small_desiredMebibytes MiB
		
		let currentIteration=currentIteration+1
	done
	
	# For reference, mo640M discs and mo230M discs (both 90mm diameter) were probably the most reliable and recoverable storage ever commonly available by 2021.
	# For reference, mo640M discs probably have been the best available for quad-redundant 'extremelyReliable' storage by 2021.
	# Geometrically, these are best placed away from disc edges, due to possible desire for reliability.
	# large
	export currentPartitionType="l"
	currentIteration=0
	while [[ "$currentIteration" -lt "$large_count" ]] && [[ $(bc <<< "scale=0; $currentEnd_MiB + $large_desiredMebibytes " | cut -f1 -d\. ) -le $(bc <<< "$desiredMebibytesEnd") ]]
	do
		_splitDisc_newPartition $large_desiredMebibytes MiB
		
		let currentIteration=currentIteration+1
	done
	
	# For reference, mo2300M discs added some complexity, while retaining probably better reliability than available 'packet' discs by 2021.
	# huge
	export currentPartitionType="h"
	currentIteration=0
	while [[ "$currentIteration" -lt "$huge_count" ]] && [[ $(bc <<< "scale=0; $currentEnd_MiB + $huge_desiredMebibytes " | cut -f1 -d\. ) -le $(bc <<< "$desiredMebibytesEnd") ]]
	do
		_splitDisc_newPartition $huge_desiredMebibytes MiB
		
		let currentIteration=currentIteration+1
	done
	
	echo
	echo
	
	# WARNING: UUIDs may not appear under '/dev/disk/by-uuid' or similar until 'sudo -n udevadm trigger' .
	# CAUTION: Convenience is substantially affected by unnecessary delays.
	#sudo -n partprobe
	#sudo -n kpartx -a /dev/mapper/"$currentPartitionType"_"$currentPartitionNumber"_"$currentSplitDiscDevice"
	#sync
	# https://unix.stackexchange.com/questions/256832/mount-dvd-without-eject-after-burn
	#sudo -n udevadm trigger
	#sync
	
	find /dev/mapper/ -mindepth 1 -maxdepth 1 -name '*_'"$currentSplitDiscUID"'_splitDisc' -exec sudo -n kpartx -v -a '{}' \;
	find /dev/mapper/ -mindepth 1 -maxdepth 1 -name '*_'"$currentSplitDiscUID"'_splitDisc' -exec sudo -n sudo -n udevadm trigger --verbose --name='{}' --settle \;
	
	echo
}



_splitDisc_position_reset() {
	# man dmsetup
	#  'each sector (512 bytes)'
	[[ "$expectedSECTOR" == "" ]] && export expectedSECTOR=512
	
	local KIBIBYTE ; KIBIBYTE="1024" ; local MEBIBYTE ; MEBIBYTE="1048576"
	
	#export current_nonexistent_boundary=511
	export current_nonexistent_boundary=2047
	[[ "$expectedSECTOR" == 512 ]] && export current_nonexistent_boundary=2047
	( [[ "$expectedSECTOR" == 2048 ]] || [[ "$expectedSECTOR" == 1024 ]] || [[ "$expectedSECTOR" == 4096 ]] ) && export current_nonexistent_boundary=511
	
	export currentBOUNDARY="$current_nonexistent_boundary"
	
	#_splitDisc_position_set 0 MiB 0
	export currentPartitionSize=0
	export currentPartitionMultiplier=MiB
	export currentBegin="$current_nonexistent_boundary"
	export currentEnd="$current_nonexistent_boundary"
	
	export currentBegin_MiB=0
	export currentEnd_MiB=0
	export currentBOUNDARY_MiB=1
	
	export currentBegin_KiB=0
	export currentEnd_KiB=0
	export currentBOUNDARY_KiB=1024
	
	export currentPartitionNumber=0
	
	return 0
}
_splitDisc_position_set() {
	local KIBIBYTE ; KIBIBYTE="1024" ; local MEBIBYTE ; MEBIBYTE="1048576"
	
	local partitionSize
	partitionSize="$1"
	
	export currentPartitionMultiplier="$2"
	if ( [[ "$currentPartitionMultiplier" == "k"* ]] || [[ "$currentPartitionMultiplier" == "K"* ]] || [[ "$currentPartitionMultiplier" == "KiB"* ]] )
	then
		export currentPartitionMultiplier=K
		partitionSize="$1"" * $KIBIBYTE"
	else
		export currentPartitionMultiplier=M
		partitionSize="$1"" * $MEBIBYTE"
	fi
	
	export currentPartitionSize="$1""$currentPartitionMultiplier"
	
	export currentBegin=$(bc <<< "scale=0; $currentBOUNDARY + 1")
	export currentEnd=$(bc <<< "scale=0; $currentBegin + ( ( $partitionSize ) / $expectedSECTOR ) - 1 ")
	
	export currentBOUNDARY="$currentEnd"
	[[ "$3" != "" ]] && export currentBOUNDARY=$(bc <<< "scale=0; $currentBegin + ( ( $3 * $MEBIBYTE ) / $expectedSECTOR ) - 1 ")
	
	
	# DANGER: 'currentEnd_MiB' is NOT guaranteed to an exact or usable result !
	export currentBegin_MiB=$(_safeEcho "$currentBOUNDARY_MiB" | cut -f1 -d\. )
	export currentEnd_MiB=$(bc <<< "scale=8; $currentBegin_MiB + ( $partitionSize / $MEBIBYTE )")
	export currentBOUNDARY_MiB="$currentEnd_MiB"
	[[ "$3" != "" ]] && export currentBOUNDARY_MiB=$(bc <<< "scale=0; $currentBegin_MiB + $3")
	
	export currentBegin_KiB="$currentBOUNDARY_KiB"
	export currentEnd_KiB=$(bc <<< "scale=0; $currentBegin_KiB + ( $partitionSize / $KIBIBYTE )")
	export currentBOUNDARY_KiB="$currentEnd_KiB"
	[[ "$3" != "" ]] && export currentBOUNDARY_KiB=$(bc <<< "scale=0; $currentBegin_KiB + ( $3 * ( $MEBIBYTE / $KIBIBYTE ) ) ")
	
	
	# Either a 1MiB pad, or none at all.
	export currentPad_begin_exists="$currentPad_end_exists"
	[[ "$currentPad_begin_exists" == "" ]] && currentPad_begin_exists=0
	if [[ "$3" != "" ]] && [[ "$3" -gt "1" ]]
	then
		export currentPad_end_exists="1"
	else
		export currentPad_end_exists="0"
	fi
	[[ "$currentPad_end_exists" == "" ]] && currentPad_end_exists=0
	
	
	
	let currentPartitionNumber=currentPartitionNumber+1
	
	return 0
}
_splitDisc_newPartition() {
	_set_splitDisc_default
	
	_splitDisc_position_set "$1" "$2" "$3"
		# https://www.kernel.org/doc/html/latest/cdrom/packet-writing.html
		#  'According to the DVD+RW specification, a drive supporting DVD+RW discs shall implement “true random writes with 2KB granularity”, which means that it should be possible to put any filesystem with a block size >= 2KB on such a disc.'
		#   Specification '2KB' implies 'KB' is actually 'KiB'.
		#  'some drives' ... 'expect the host to perform aligned writes at 32KB boundaries'
		# c 32 kibibytes / 512 bytes
		#  64
		# c 64 kibibytes / 512 bytes
		#  128
		# c 1 mebibyte / 64 kibibytes
		#  16
		# c 64000/512
		#  125
		local currentEnd_aligned
		currentEnd_aligned=$(bc <<< "scale=0; $currentEnd + 1 - 128 ")
		local currentSize_aligned
		currentSize_aligned=$(bc <<< "scale=0; ( $currentEnd_aligned - $currentBegin ) ")
		
		
		
		echo "	$currentBegin   		$currentEnd   		$currentPartitionSize	$currentSize_aligned"
		
		#echo -n "$currentBegin_MiB"M
		#echo -n "	"
		#echo -n $(echo -n "$currentEnd_MiB" | cut -f1 -d\. )M
		#echo -n "	"
		#echo -n "$currentPartitionSize"
		#echo -n "	"
		#echo -n "$currentSize_aligned"
		#echo -n "	"
		#echo
		
		if [[ ! -e /dev/mapper/"$currentPartitionType"_"$currentPartitionNumber"_"$currentSplitDiscDevice" ]]
		then
			echo ''sudo -n dmsetup create "$currentPartitionType"_"$currentPartitionNumber"_"$currentSplitDiscDevice" --table '0 '"$currentSize_aligned"' linear '"$currentDrive"' '"$currentBegin"
			sudo -n dmsetup create "$currentPartitionType"_"$currentPartitionNumber"_"$currentSplitDiscDevice" --table '0 '"$currentSize_aligned"' linear '"$currentDrive"' '"$currentBegin"
		else
			echo 'warn: dmsetup: exists'
		fi
	sync
	#sleep 3
	
	#echo
	
	# CAUTION: Convenience is substantially affected by unnecessary delays.
	#sudo -n partprobe
	#sudo -n kpartx -a /dev/mapper/"$currentPartitionType"_"$currentPartitionNumber"_"$currentSplitDiscDevice"
	#sync
	# https://unix.stackexchange.com/questions/256832/mount-dvd-without-eject-after-burn
	#sudo -n udevadm trigger
	#sync
	#echo
}


















_splitDisc_anchor() {
	# CAUTION: Untested. Not recommended. Especially may break simultaneous bash/batch interpretability. Removes comments, reducing comprehensibility of already complicated 'anchor'.
	#cat _splitDisc.bat | grep -v '^REM' | grep -v -P "^\t#" | grep -v -P "^\t\t#" | grep -v '^#' | xz -z -e9 -C crc64 --threads=1 | base64 -w 156 | fold -w 156 -s
	
	#cat _splitDisc.bat | xz -z -e9 -C crc64 --threads=1 | base64 -w 156 | fold -w 156 -s
	echo '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' | base64 -d | xz -d > "$1"/_splitDisc.bat
	cp "$1"/_splitDisc.bat "$1"/_splitDisc_remove.bat
	chmod u+x "$1"/_splitDisc.bat "$1"/_splitDisc_remove.bat
}



# $currentSplitDiscDrive == "/dev/deviceFile"
_here_splitDisc_generate() {
	export currentSplitDiscUID=$(cat /dev/urandom 2> /dev/null | base64 2> /dev/null | tr -dc 'a-zA-Z0-9' 2> /dev/null | tr -d 'acdefhilmnopqrsuvACDEFHILMNOPQRSU14580' | head -c 18 2> /dev/null)
	
	cat << CZXWXcRMTo8EmM8i4d
#!/bin/bash

export currentSplitDiscUID=$currentSplitDiscUID

export currentSplitDiscDrive=$currentSplitDiscDrive


#export currentSplitDiscSize=$currentSplitDiscSize


_splitDisc() {
	#_splitDisc_procedure "\$1" _splitDisc_single_procedure
	#_splitDisc_procedure "\$1" _splitDisc_bd25_bank_procedure
	#_splitDisc_procedure "\$1" _splitDisc_custom_procedure
	
	_splitDisc_procedure "\$1" $currentSplitDisc_procedure
	
	sleep 20
}
# _splitDisc_custom_procedure() {
#	true
#}


export flipKey_packetDisc_exhaustible=$flipKey_packetDisc_exhaustible

CZXWXcRMTo8EmM8i4d
	
	
	declare -f _splitDisc_criticalDep
	
	declare -f _splitDisc_is_packetDisc
	
	declare -f _check_driveDeviceFile_splitDisc
	declare -f _find_packetDrive
	
	declare -f _splitDisc_remove
	
	declare -f _splitDisc_single_procedure
	declare -f _splitDisc_bd25_bank_procedure
	
	declare -f _set_splitDisc_default
	declare -f _splitDisc_procedure
	
	declare -f _splitDisc_position_reset
	declare -f _splitDisc_position_set
	declare -f _splitDisc_newPartition
	
	declare -f _splitDisc_anchor
	
	declare -f _here_splitDisc_generate
	declare -f _splitDisc_generate
	
	
	declare -f _vector_splitDisc_newPartition
	declare -f _vector_splitDisc_position
	
	
	declare -f _getUUID
	declare -f _safeEcho
	declare -f _safeEcho_newline
	declare -f _messagePlain_request
	
	
	cat << 'CZXWXcRMTo8EmM8i4d'

_set_splitDisc_default



# DANGER: *Always* use '/dev/disk/by-id', '/dev/dvd', or similar, *never* '/dev/sd*' or similar !
if [[ "$1" == '_'* ]] && [[ "$2" != "/dev/sd"* ]] && [[ "$2" != "/dev/sd" ]] && [[ "$2" != "/dev/hd"* ]] && [[ "$2" != "/dev/hd" ]] && [[ "$2" != "/dev/nvme"* ]] && [[ "$2" != "/dev/nvme" ]] && [[ "$2" != "/dev/md"* ]] && [[ "$2" != "/dev/md" ]]
then
	"$@"
	exit "$?"
fi

echo './splitDisc.sh _splitDisc'
echo './splitDisc.sh _splitDisc_remove'

exit 0

CZXWXcRMTo8EmM8i4d


}



_splitDisc_generate() {
	local currentOutDir
	currentOutDir="$PWD"
	[[ "$1" != "" ]] && currentOutDir="$1"
	
	_here_splitDisc_generate > "$currentOutDir"/splitDisc.sh
	chmod u+x "$currentOutDir"/splitDisc.sh
}








#_vector_splitDisc_position
# 
#         1935360                 2426879                 240M    491392
#         2426880                 2918399                 240M    491392
#         2918400                 3409919                 240M    491392
#         3409920                 4741119                 650M    1331072
#         4741120                 6072319                 650M    1331072
#         6072320                 7403519                 650M    1331072
#         7403520                 8734719                 650M    1331072
#         8734720                 10065919                650M    1331072
#         10065920                11397119                650M    1331072
#         11397120                12728319                650M    1331072
#         12728320                14059519                650M    1331072
#         14059520                15390719                650M    1331072
#         15390720                16721919                650M    1331072
#         16721920                18053119                650M    1331072
#         18053120                19384319                650M    1331072
#         19384320                20715519                650M    1331072
#         20715520                22046719                650M    1331072
#         22046720                23377919                650M    1331072
#         23377920                28293119                2400M   4915072
#         28293120                33208319                2400M   4915072
#         33208320                38123519                2400M   4915072
#         38123520                43038719                2400M   4915072
# 
# 
#         38123520                43038719                2400M   4915072
# 
_vector_splitDisc_newPartition() {
	_set_splitDisc_default
	
	_splitDisc_position_set "$1" "$2" "$3"
		local currentEnd_aligned
		currentEnd_aligned=$(bc <<< "scale=0; $currentEnd + 1 - 128 ")
		local currentSize_aligned
		currentSize_aligned=$(bc <<< "scale=0; ( $currentEnd_aligned - $currentBegin ) ")
		echo "	$currentBegin   		$currentEnd   		$currentPartitionSize	$currentSize_aligned"
}
_vector_splitDisc_position() {
	! _splitDisc_criticalDep && exit 1
	
	local currentExitStatus
	currentExitStatus=0
	
	local currentEnd_aligned
	local currentSize_aligned
	
	export expectedSECTOR=512
	
	_splitDisc_position_reset
	
	export currentDrive_size=24220008448
	
	
	# First and last BD-RE layers may benefit from >896MiB and ~2000MiB, respectively.
	# Blu-Ray 'inner' rotational rate is drastically different, and data begins there by default, causing a substantial performance penalty.
	# No reliability benefit for single quad-redundant filesystem spread across single-layer BD-RE disc (ie. 'slightlyRedundant').
	local software_desiredMebibytes=48
	local begin_desiredMebibytes=896
	local end_desiredMebibytes=1750
	
	local desiredMebibytesEnd
	desiredMebibytesEnd=$(bc <<< "scale=0; ( $currentDrive_size / 1048576 ) - $end_desiredMebibytes - 16 ")
	
	_splitDisc_position_set $software_desiredMebibytes MiB
	_splitDisc_position_set $begin_desiredMebibytes MiB
	export currentPartitionNumber=0
	
	
	export full_desiredMebibytes=0
	export full_count=0
	
	export huge_desiredMebibytes=2400
	export huge_count=4
	
	export large_desiredMebibytes=650
	export large_count=15
	
	export small_desiredMebibytes=240
	export small_count=3
	
	
	
	
	
	# full
	export currentPartitionType="f"
	currentIteration=0
	while [[ "$currentIteration" -lt "$full_count" ]] && [[ $(bc <<< "scale=0; $currentEnd_MiB + $full_desiredMebibytes " | cut -f1 -d\. ) -le $(bc <<< "$desiredMebibytesEnd") ]]
	do
		_vector_splitDisc_newPartition $full_desiredMebibytes MiB
		
		let currentIteration=currentIteration+1
	done
	
	# For reference, mo640M discs and mo230M discs (both 90mm diameter) were probably the most reliable and recoverable storage ever commonly available by 2021.
	# small
	export currentPartitionType="s"
	currentIteration=0
	while [[ "$currentIteration" -lt "$small_count" ]] && [[ $(bc <<< "scale=0; $currentEnd_MiB + $small_desiredMebibytes " | cut -f1 -d\. ) -le $(bc <<< "$desiredMebibytesEnd") ]]
	do
		_vector_splitDisc_newPartition $small_desiredMebibytes MiB
		
		let currentIteration=currentIteration+1
	done
	
	# For reference, mo640M discs and mo230M discs (both 90mm diameter) were probably the most reliable and recoverable storage ever commonly available by 2021.
	# For reference, mo640M discs probably have been the best available for quad-redundant 'extremelyReliable' storage by 2021.
	# Geometrically, these are best placed away from disc edges, due to possible desire for reliability.
	# large
	export currentPartitionType="l"
	currentIteration=0
	while [[ "$currentIteration" -lt "$large_count" ]] && [[ $(bc <<< "scale=0; $currentEnd_MiB + $large_desiredMebibytes " | cut -f1 -d\. ) -le $(bc <<< "$desiredMebibytesEnd") ]]
	do
		_vector_splitDisc_newPartition $large_desiredMebibytes MiB
		
		let currentIteration=currentIteration+1
	done
	
	# For reference, mo2300M discs added some complexity, while retaining probably better reliability than available 'packet' discs by 2021.
	# huge
	export currentPartitionType="h"
	currentIteration=0
	while [[ "$currentIteration" -lt "$huge_count" ]] && [[ $(bc <<< "scale=0; $currentEnd_MiB + $huge_desiredMebibytes " | cut -f1 -d\. ) -le $(bc <<< "$desiredMebibytesEnd") ]]
	do
		_vector_splitDisc_newPartition $huge_desiredMebibytes MiB
		
		let currentIteration=currentIteration+1
	done
	
	echo
	echo
	
	currentEnd_aligned=$(bc <<< "scale=0; $currentEnd + 1 - 128 ")
	currentSize_aligned=$(bc <<< "scale=0; ( $currentEnd_aligned - $currentBegin ) ")
	echo "	$currentBegin   		$currentEnd   		$currentPartitionSize	$currentSize_aligned"
	
	[[ "$currentBegin" != "38123520" ]] && currentExitStatus=1
	[[ "$currentEnd" != "43038719" ]] && currentExitStatus=1
	[[ "$currentSize_aligned" != "4915072" ]] && currentExitStatus=1
	
	[[ "$currentExitStatus" != "0" ]] && exit 1
	[[ "$currentExitStatus" != "0" ]] && return 1
	
	
	
	
	_splitDisc_position_reset
	export full_desiredMebibytes=
	export full_count=
	export huge_desiredMebibytes=
	export huge_count=
	export large_desiredMebibytes=
	export large_count=
	export small_desiredMebibytes=
	export small_count=
	unset full_desiredMebibytes
	unset full_count
	unset huge_desiredMebibytes
	unset huge_count
	unset large_desiredMebibytes
	unset large_count
	unset small_desiredMebibytes
	unset small_count
	export export currentDrive_size=
	unset export currentDrive_size
	
	return 0
}

# NOTICE: '_splitDisc'





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




_mkisofs() {
		if type mkisofs > /dev/null 2>&1
		then
			mkisofs "$@"
			return $?
		fi
		
		if type genisoimage > /dev/null 2>&1
		then
			genisoimage "$@"
			return $?
		fi
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
_messagePlain_request() {
    echo -e -n '\E[0;35m ';
    echo -n "$@";
    echo -e -n ' \E[0m';
    echo;
    return 0
}
_README() {
	local currentAttachmentLine
	currentAttachmentLine=`awk '/^#__README_uk4uPhB663kVcygT0q_README__/ {print NR + 1; exit 0; }' "$0"`
	let currentAttachmentLine="$currentAttachmentLine - 1"
	head -n$currentAttachmentLine "$0"
}
[[ "$1" == "" ]] && _README && exit 0
# https://www.linuxjournal.com/node/1005818
_attachment() {
	local currentAttachmentLine
	currentAttachmentLine=`awk '/^__ATTACHMENT_uk4uPhB663kVcygT0q_ATTACHMENT__/ {print NR + 1; exit 0; }' "$0"`
	tail -n+$currentAttachmentLine "$0" | base64 -d
}
_noAttachment() {
	local currentAttachmentLine
	currentAttachmentLine=`awk '/^__ATTACHMENT_uk4uPhB663kVcygT0q_ATTACHMENT__/ {print NR + 1; exit 0; }' "$0"`
	let currentAttachmentLine="$currentAttachmentLine - 1"
	head -n$currentAttachmentLine "$0"
}
_rmAttachment() {
	# WARNING: Unattached package file may be deleted by script through user called functions.
	_extractAttachment
	_noAttachment > temp.sh
	mv temp.sh "$0"
	chmod u+x "$0"
}
_attachAttachment() {
	_noAttachment > temp.sh
	cat ./package.tar.xz | base64 >> temp.sh
	mv temp.sh "$0"
	chmod u+x "$0"
}
_extractAttachment() {
	[[ -e ./package.tar.xz ]] && return 0
	_attachment > ./package.tar.xz
}
if [[ "$1" == '_'* ]] && [[ "$2" != "/dev/sd"* ]] && [[ "$2" != "/dev/sd" ]] && [[ "$2" != "/dev/hd"* ]] && [[ "$2" != "/dev/hd" ]] && [[ "$2" != "/dev/nvme"* ]] && [[ "$2" != "/dev/nvme" ]] && [[ "$2" != "/dev/md"* ]] && [[ "$2" != "/dev/md" ]]
then
	"$@"
	exit "$?"
fi


exit 0


# Append base64 encoded attachment file here.
__ATTACHMENT_uk4uPhB663kVcygT0q_ATTACHMENT__
