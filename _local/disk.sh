

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
	
	#export flipKey_filesystem="btrfs-mix"
	#export flipKey_filesystem="nilfs2"
	#export flipKey_filesystem="ext4"
	#export flipKey_filesystem="NTFS"
	
	#export flipKey_filesystem="btrfs"
	#export flipKey_filesystem="btrfs-dup"
	
	#export flipKey_mount="$scriptLocal"/../../fs
	#export flipKey_mount="$scriptLocal"/../../../fs
	
	# May be wise to set these to enable overwriting for any device not using a 'keyPartition' (eg. USB flash, ssd partition).
	# If removable (eg. 'USB flash'), frequent overwriting of most of device is not expected (because the drive would be removed and not used for any other purpose), so overwriting most of the device may be more immediately necessary.
	# If nonphysical (ie. remapped 'flash', 'solid-state', etc), overwriting most of device may be especially necessary to have a reasonable chance of actually overwriting specific blocks on the storage.
	#export flipKey_removable='true'
	#export flipKey_physical='false'
	
	# Example. Unusual. Uses much of the available space.
	#export flipKey_containerSize=$(bc <<< "scale=0; ( ( "$(df --block-size=1 --output=avail "$scriptLocal" | tr -dc '0-9')" / 1.01 ) * 1 ) - 128000000 - $flipKey_headerKeySize")
}






