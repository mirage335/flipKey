
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
















