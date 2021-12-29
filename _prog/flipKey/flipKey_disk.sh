
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
