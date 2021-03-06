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
	
	_tryExec "_mix_keyfile_vector"
	
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
	
	_getDep md5sum
	_getDep sha512sum
	
	
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
	
	_wantGetDep mkudffs || echo 'warn: missing: mkudffs'
	_wantGetDep dvd+rw-format || echo 'warn: missing: dvd+rw-format'
	_wantGetDep growisofs || echo 'warn: missing: growisofs'
	! _wantGetDep genisoimage && ! _wantGetDep mkisofs && echo 'warn: missing: genisoimage'
	_wantGetDep udevadm || echo 'warn: missing: udevadm'
	
	_wantGetDep gdisk || echo 'warn: missing: gdisk'
	_wantGetDep sgdisk || echo 'warn: missing: sgdisk'
	_wantGetDep blkid || echo 'warn: missing: blkid'
	_wantGetDep partprobe || echo 'warn: missing: partprobe'
	_wantGetDep blkdiscard || echo 'warn: missing: blkdiscard'
	
	
	_wantGetDep blockdev || echo 'warn: missing: blockdev'
	_wantGetDep xxd || echo 'warn: missing: xxd'
	_wantGetDep udevadm || echo 'warn: missing: udevadm'
	_wantGetDep partprobe || echo 'warn: missing: partprobe'
	_wantGetDep findmnt || echo 'warn: missing: findmnt'
	_wantGetDep stat || echo 'warn: missing: stat'
	#_wantGetDep bc || echo 'warn: missing: blkdiscard'
	_wantGetDep cryptsetup || echo 'warn: missing: cryptsetup'
	_wantGetDep lsblk || echo 'warn: missing: lsblk'
	_wantGetDep fdisk || echo 'warn: missing: fdisk'
	_wantGetDep badblocks || echo 'warn: missing: badblocks'
	_wantGetDep blkid || echo 'warn: missing: blkid'
	_wantGetDep xz || echo 'warn: missing: xz'
	
	
	_wantGetDep btrfs || echo 'warn: missing: btrfs'
	_wantGetDep wipe || echo 'warn: missing: wipe'
	
	
	_wantGetDep mount.nilfs2 || echo 'warn: missing: mount.nilfs2'
	
	
	_getDep pv || echo 'warn: missing: pv'
	_wantGetDep libhistory.so.8 || echo 'warn: missing: libhistory.so.8'
	
	# Only for automatic installation of veracrypt.
	_wantGetDep expect || echo 'warn: missing: expect'
	
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


