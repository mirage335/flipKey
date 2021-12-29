Copyright (C) 2021 m335
See the end of the file for license conditions.
See license.txt for flipKey license conditions.

Multiplatform crypto shredding framework around veracrypt and cryptsetup. Ensures fragments of supposedly deleted or shielded plaintext are unreadable after any erasure, scrambling, or unobservability of the large (usually gigabytes) key file.

May prevent unintended sharing of cloud storage credentials, incomplete disk erasure, files remaining undeleted within another encrypted volume, malware infection or hardware recognized packet (ie. Intel AMT, Intel ME, AMD PSP, etc) spreading, malware instituted exfiltration, side-channel ( 'TEMPEST' ) emissions of partially observable fragments, etc. Standalone disk erasure and fiber-optic data diode may also be necessary to realize some such benefits.


# Why?

Why not encrypt just one big volume with a key somewhere else.


Just 'one big volume' and 'key somewhere else' are the problem.


One big volume - you are not going to want to wipe/move *all* of that data just because one trade-secret project has been completed and the finished materials have been delivered.

Key somewhere else - you are not going to want to memorize another high-entropy password, ensure password keystrokes have never been observed, thoroughly erase old small keyfiles, or find places to store new keys.


Even within an encrypted volume, crypto shredding - deleting just enough of one huge keyfile on the same device - is a convenient way to ensure that specific data is deleted.



# Usage

```
# Create and Format container.
./_zzCreate.bat

# Mount container.
./_grab.bat

# Unmount container.
./_toss.bat
```

Some configuration of 'disk.sh' (preferred) or 'ops.sh' (discouraged) may be required (ie. container size).

```
_disk_declare() {
	_disk_usbStick128GB
}
```

Requires 'veracrypt' , 'SDelete' , 'ubcp' , installed as appropriate .

./_test.bat


Batch files open in both Cygwin/MSW (with 'ubcp' installed) and Linux (interpreted as 'bash' scripts).


Default configuration for most disks.
* MSW mounts to 'V:\' 'drive letter' (to minimize conflicts with other 'drive letter' assignments).
* Linux mounts to './_local/fs' directory.
* Configuration files (ie 'disk.sh'), volume file, key file, stored in './_local' directory.



# Usage - discManager

Create 'discManager' with the '_package' command.

```
./ubiquitous_bash.sh _package
```

A 'README' is prepended to the top of the 'discManager-src.sh' file. Commands to automatically 'format' removable media with flipKey in more complex partitioning schemes, including using partitions as keyFile and container, are documented there. Commands to 'desilver' removable media (ie. 'low level FORMAT UNIT and filling with random/zero) are included to improve performance/reliability with some media (eg. 'zip' 'superfloppy' disks, Magneto-Optical discs, 'MiniDisc', etc).

Magneto-Optical discs may of course be used by 'flipKey' without 'discManager' (ie. as would be done with USB flash).

Removable discs (ie. 'zip' 'superfloppy', Magneto-Optical, etc) in some cases still have significant reliability advantages over flash storage (especially SD cards), as well as being substantially easier to erase in part or in whole.

Notable uses of 'discManager' may include creating permanent copies on M-Disc/BD-R/DVD-R optical disc, creating BD-RE/DVD+RW/DVD-RAM project discs, creating magneto-optical project discs, and creating quad-redundant partitioned magneto-optical discs for extremely reliable data storage.

```
./discManager-src.sh _packetDisc_permanent

./discManager _bd25

./discManager _mo640_ntfs
./discManager _mo640_keyPartition
./discManager _mo640_extremelyRedundant

./discManager _bd25_bank
```


# Usage - splitDisc

Some discs may be 'split' by 'dmsetup' linear commands, dividing the disc into multiple separate devices. Simply use the provided '_splitDisc.bat' anchor (copied to a different location if necessary) to split the disc.

```
./_splitDisc.bat
./_splitDisc_remove.bat
```

On rare occasion it may be necessary to 'remap' some devices after unmounting and such. Use the './_splitDisc.bat' anchor when necessary as such - the 'discSoftware' is designed to ignore already mapped devices and scan all relevant devices for partitions in this case.



# Workarounds

## Split Disc Busy

Attempting to 'split' a disc while the 'discSoftware' partition is mounted may not create any devices because dmsetup deems the entire disc 'busy'. Copying the files to another location is expected to allow such discs to be 'split' without mounting their 'discSoftware' partition. Unlike most anchor files, these will accept the basename of their own directory as a possible script location if the path includes '/media*', '/var*', or '/home/*/core*' .


## Write-Once Not Mountable By MSW/Cygwin/Veracrypt

MSW/Cygwin/Veracrypt may not usefully mount a volume stored on read-only disc (Linux/Veracrypt apparently has no issues with such situations). Either connecting the drive to a Linux VM (preferred), or copying the files to a writable location (beware MSW may not complete copy from some hybrid iso/udf discs), can allow useful mounting of disc.


## Ejection (disabling)

Renaming or otherwise disabling the '/usr/bin/eject' binary apparently prevents automatic ejection when unmounting by udisks, with manual ejection apparently still disallowed while mounted. However, automatic ejection is useful and should only be disabled when specifically necessary.



# Upgrading

Copy/replace with files extracted from 'package_kit.tar.xz' , and copy/replace 'discManager' if appropriate, to 'upgrade' the 'software' usually associated with a 'volume' . Avoid replacing 'disk.sh' .



# Compatibility

An installation of 'ubcp' is needed for MSW compatibility. However, a pre-built package may not yet be available, build takes several hours, and these exact instructions serve only as a rough guide pending further testing.

```
# Download and Extract
# https://github.com/mirage335/ubiquitous_bash/archive/refs/heads/master.zip

# Run ' _local/ubcp/ubcp-cygwin-portable-installer.cmd ' .
# Copy ' _local/ubcp/overlay/* ' to '_local/ubcp/ ', overwriting files.

# Run ' bash.bat ' . A bash prompt should appear.

tskill ssh-pageant
./lean.sh _mitigate-ubcp
./lean.sh _package-cygwinOnly
./lean.sh _setup_ubcp
./lean.sh _setupUbiquitous_noNet
```



# Special

GPT provides partition UUIDs uniquely. MSDOS partition UUIDs are reasonably unique and no longer common or important enough to cause meaningful collision risk. Always strongly prefer GPT partitioning.



# Safety

DANGER: Do NOT attempt disc cleaning until another drive has confirmed the problem is likely with the disc instead of drive! Carefully always clean discs in the radial (not rotational) direction, do not apply pressure, and ensure any abrasives are absent.

DANGER: BEFORE attempting recovery, experimentally acquire inexpensive (eg. <1.3GB Magneto-Optical) drives and discs! Do NOT even allow a third-party (eg. Drive Savers) to attempt data recovery until the exact type of disc to be recovered has been successfully adequately read after *exactly* the same procedures attempted experimentally! Magneto-Optical disc or 'packetDisc', due to sparing, may be presumed to still have the recorded data if defects are not obviously visible under ~50x steromicroscope.

WARNING: Optical (especially Magneto Optical) drives intended for long-term intermittent use (ie. as archival reliability record keeping for remote servers) must be cleaned, thoroughly tested, cleaned again, and tested, before use as such. Lens attenuation, lens aberration, and spindle grip during acceleration, among other issues, may cause loss of remote access through drive (data loss from disc of course remains highly unlikely).

WARNING: Not intended to 'guarantee' security, only to 'improve' security (ie. 'better than nothing').


## Network Sharing

Container may be mountable from a 'network drive' (eg. by a 'Virtual Machine' through a 'shared folder'). Beware mounting a container twice simultaneously may cause *severe* filesystem corruption.


## Data Diode

Optical data diodes still necessary, unless wiping disc without reading or possibility of human error is possible. Firmware, software, hardware, etc, may be exploited by malware to potentially exfiltrate data through any storage, side-channel, etc. At least one direction of data transfer must always be completely validated (ideally including human key entry) for absence of any possible exploits.

Standalone computer (eg. RasPi) with fiber optic data diode may be used as a read-only adapter to storage (eg. disc drive).

Fully analog (ie. OpAmps only) controller attached to typical floppy or magneto-optical hardware with the sole purpose of overwritting may allow wiping without reading.


## Overwritability

Usually, setting 'flipKey_headerKeySize' to a substantial fraction of storage is expected to ensure all fragments of key file will be overwritten or scrambled, at least after overwriting empty filesystem space. Default has been ~6GB , expected to take ~15s to read from 400MB/s storage (a lower default of 1.8GB may be set alternatively for compatibility reasons) .

```
export flipKey_headerKeySize=6000000000
```

A partition on any easily overwritten disc may always be used instead.

```
export flipKey_headerKeyFile=/dev/disk/by-id/diskID-part2
```


Alternatively, experimental 'token' storage may be used - dedicated filesystem on easily overwritten disk (eg. magnetic hard disk with ext2 filesystem). However, this is not well tested, may be complicated to configure, and might not be thoroughly erased as desired.

```
export flipKey_headerKeySize=3500000
export flipKey_tokenID=UUID-UUID-UUID-UUID-UUID
export flipKey_token_keyID=123456789012345678901234

./_bash.bat
_token_mount rw
cd _local/token
sudo -n dd if=/dev/urandom of=./block bs=1M count=175
#_openssl_rand-flipKey 175000000 > ./block
cd ../..
_token_unmount rw
```


## MSW

Due to proprietary code, widespread known zero-day exploits, a lack of control over 'temporary' directories, lack of performance, etc, only limited 'best effort' practices are followed when MSW is used. Whether 'bitlocker' or such features as 'TPM' support are at all secure is questionable at best. MSW must not be considered unconditionally secure.

One of the reportedly 'better' practices under MSW is to delete all 'potentially sensitive' files including 'temporary' directory contents, fully decrypt, and fully re-encrypt. Obviously any files 'not known to self' presents an *unknown* or *blind spot* risk .


## Deniability

An unlimited number of encrypted volumes may be usable within encrypted or unencrypted filesystems. Any of these may be entirely nonfunctional due to corruption or experimental use cases. Due to this, despite not being statistically purely random, there is some plausibile deniability regarding any encrypted filesystem. Including with 'flipKey' .


## _zzDangerous (data loss commands)

Dangerous commands (which cause data loss) are prefixed with '_zz' to sort them in file managers as such relative to the '__' prefixed commands to mount/dismount/etc . Be careful not to accidentally 'double click' or otherwise launch these unintentionally. If data loss is a major concern, consider deleting these relevant batch files - they may be recreated by '_anchor.bat' at any time.


## Reliability Experiments

Pseudorandom files may be written and re-verified later by '_pattern'. May be erased with '_pattern_reset'. By default these files will be stored under "$scriptLocal"/pattern .

No corresponding functions to test "$scriptLocal"/fs or similar are available by default, expected unnecessary.

```
_pattern.bat
_pattern_reset.bat
```

Large default values of 'flipKey_pattern_bs' and 'flipKey_pattern_count' have the benefit of also (hopefully) 'overwriting' (most) 'empty' storage on filesystem (albeit with non-random patterns).


## Archival Reliability Expectations

Single high-quality optical disc written quad-redundantly in real-time is most reliable.

* _mo640_extremelyRedundant

Recently manufactured BD-R or BD-RE discs may be reasonable alternatives, although unsafe spindle speeds, degradable materials, marginal optical defocusing, and (usually unavoidable) absence of cartridges/caddies, must be mitigated thoroughly.

* _packetDisc_permanent

* _bd25_bank
* _generic_slightlyRedundant /dev/mapper/ ...


Many forms of data storage are not adequately relable. Cloud credentials (eg. passwords), especially must be both deletable, and must be reliably retrievable (cloud credentials being expected as an essential use of flipKey).

* RAID is not reliable, due to simultaneous thermal/humidity/corrosion/climate failure, simultaneous electronics failure (with individually unique EEPROM dependency), simultaneous mechanical failure (eg. spindle wear runout accumulation, 'head crash' on all platters on all disks, zinc whisker damage to all platters), unintended overwriting caused by tin whiskers, software overwriting, etc.
* YubiKey is not known to have redundand unpowered electrical interfaces or high-temperature several-decades retention times.
* DVD-RW and CD-RW are neither common nor as desirable, and may be less well designed for reliability. DVD+RW discs may also be of older manufacturing, of less reliable design, and without either defect management or high rewrite lifespan, contrasting with some BD-RE discs and especially some BD-R discs . DVD-RAM discs are technically interesting but may be of older manufacturing. MO (Magneto Optical) discs are usually of highly preferable design, and still usually preferred when possible.

Due to physics, a *single optical disc* accessed by a non-contact wide cone of light can have far higher archival reliability expectations than any combination of mechanical 'Hard Disk Drive HDD' or known 'Solid State Drive SSD'. Simultaneous disc failure is not necessarily much less likely than *single* disc failure, and not prevented by any form or RAID, possibly not even by 'off-site backup'.

One single Magneto-Optical 640M (and 230M) disc is probably the most reliable and recoverable storage ever commonly available by 2021. A well scrutinized standard design known for extreme reliability (~30-100 years, first time every time, see 'RELIABILITY EVALUATION OF 3M MAGNETO-OPTIC MEDIA').


## Server Reliability Expectations

Magneto Optical drives may have mechanical reliablity similar to 'hard drives' - although the disc remains readable and vastly more reliable. One of the more likely, but still rare, temporary failure modes for a Magneto Optical drive is some kind of spindle problem, causing the drive to repeatedly accelerate, and decelerate, causing the 'Operating System' 'kernel' to dismount the filesystem inconveniently. Such a failure may be (but has not been tested as such) less likely with a disc that has been continiously mounted for a long time, or if the drive is occasionally spun for long times (ie. by copying entire disc to '/dev/null').

Slim 'packetDisc' drives (ie. BD-RE) may be more mechanically reliable if very infrequently accessed in theory, due to absence of automated spindle grip mechanisms, if that is relevant. However, BD-RE discs are not expected to have the 'Archival Reliability Expectations' of Magneto Optical discs, which is a far more serious concern (data loss).



# Certification

Expect a 'host' with 'Linux Distribution' 'Debian 10 Buster' to achieve desired results from basic documented functionality with no eceptions.



# Disclaimer

Not 'cryptographic software' .

No 'ciphers' included. All 'cryptographic primitives' used are called from software typically shipped with or installable to 'operating systems' (ie. Linux distributions, MSW) with publicly available source code (eg. 'OpenSSL' , 'VeraCrypt') .

In some cases (eg. '_pattern', '_vector'), any 'hardcoded' 'keys' used may be intentionally low-entropy (ie. weak) to make plainly obvious that the 'cryptographic primitives' were only called for the sole purpose of pseudorandom pattern generation (ie. 'nothing-up-my-sleeve numbers' ).



# Future Work

## Alternative Storage

Ongoing obsolescence and some use cases may necessitate new 'archival reliability' storage technology, beyond the best available optical discs (ie. mo640/mo230) made to date.

* Hybrid HDD/SSD arrays, depending on silent corruption, tin whisker overwriting, portability.

* Redundant unpowered optically isolated interface archival retention solid-state storage externally readable by mechanical scanning of electron scatter or photon beam polarization.

* Sony Archival Disc, depending on adequate public scrutiny.

* Ultra Density Optical disc, depending on adequate public scrutiny.

* Retrofitting recent 'packetDisc' BD-R/BD-RE drives and discs with DVD-RAM caddies or other mitigation.

* Redundant microcontrollers with extremely long retention (>>30 years) Flash or FeRAM storage, internal microcontroller redundancy (ie. similar to ArduSat), and careful circuit board layout to minimize lead-free solder/wire-bonding risk.



# Reference

https://web.archive.org/web/20020921015009/http://www.bis.doc.gov/Encryption/PubAvailEncSourceCodeNofify.html
https://en.wikipedia.org/wiki/Nothing-up-my-sleeve_number

https://superuser.com/questions/1353447/secure-erase-single-directory-on-bitlocker-encrypted-ssd
	'bitlocker' ... 'fully decrypt'

https://goughlui.com/2015/12/21/experiments-zip-disk-defect-lists-mode-page-changes-protected-cartridges/


https://wiki.archlinux.org/title/Optical_disc_drive
	'In case of poor read quality the blocks get written again or redirected to the Spare Area where the data get stored in replacement blocks.'
		Implies BD-RE defect management actually does replace *weak* sectors, instead of completely broken sectors. However, BD-RE discs at <1000 official rewrite specifications have problems which magneto optical discs to not, including exhaustion at ~50terabytes, instead of >>2.3petabytes .

https://www.canada.ca/en/conservation-institute/services/conservation-preservation-publications/canadian-conservation-institute-notes/longevity-recordable-cds-dvds.html
	'BD-RE (erasable Blu-ray)' '20 to 50 years'

https://www.amazon.com/dp/B002FB7KT6
	'high-grade rewritable BD-RE discs with a one hundred year archival life'
	'Super Eutectic Recording Layer (SERL) recording dye'
		Be wary of 'dye'. Phase-change may be better once written.


https://smile.amazon.com/Cable-Matters-Aluminum-Enclosure-Supporting/dp/B07CQ6C4MW/


https://eu.mouser.com/new/swissbit/swissbit-industrial-SD-memory/
	'Power fail protection'
	'10 years @ life begin, 1 year @ life end'
		Unremarkable at best.
https://eu.mouser.com/pdfdocs/S-46u_fact_sheet.pdf
	'After every power on, the card reads the whole flash and performs a data refresh, if necessary. So the data retention can be much longer in most use cases.'
	'Data Retention at beginning @ 40degC'
		Not a very high temperature specification, not exactly promising. One wonders about the retention of the flash in the microcontroller firmware.


https://www.atpinc.com/blog/industrial-sd-cards-factors-requirements-to-consider
https://support.embeddedarm.com/support/solutions/articles/22000202866-sd-card-testing
	ATP shows an apparent window from a power cycling test for SD Cards. Meanwhile, an ATP sdcard reportedly showed corruption possibly due to power cycling.

https://electronics.stackexchange.com/questions/235898/a-guaranteed-way-to-corrupt-sd-card
	'software-controlled relay box to repeatedly power-cycle the device at intervals of a couple of minutes (it took >1m to boot up and resume testing)'
	'Systems usually failed overnight.'
		May seem inefficient to power-cycle an entire system just to test one flash device, but that should achieve ~720 cycles per day in testing. Slight power cycle timing randomization and automatic writing of random data after booting may improve chance of catching unusual failure modes (ie. during writes). Combined with rewriting a few tiny regions on the sdcard repeatedly (testing the extent of wear leveling endurance), this could build some significant statistical confidence.


https://www.amazon.com/dp/B07TBBT9ZQ
	'inorganic recording material'
	'one million continuous uses'

https://www.ritek.com/business
https://www.ritek.com/business-detail/index/1/id/1/title/M-DISC

https://www.reddit.com/r/DataHoarder/comments/l4n5rf/my_experience_archiving_data_to_bluray_discs/
	'those Optical Quantum Blu-Ray discs were rotten'
	'Ritek, which manufactured them, seems to have had a production issue affecting some batches.'

https://archive.goughlui.com/legacy/stateofbdr/index.htm
	'all five sampled discs were unreadable'
	'Spend more money on TDK or Verbatim if you care about your data.'
	'Memorex, Maxell, these are just rebrands of Ritek media. Ritek has always been garbage'
	'other discs in my collection (younger) which comprises of discs from MEI, Verbatim, CMC and TDK seem to be doing okay and haven't yet degraded into data loss. But that's not to say that they won't in the near future - for the CMC's and TDK's - there are physical signs of rot (oxidation of the reflective layer due to poor sealing) as can be seen in the following photos'

https://www.amazon.com/dp/B004EHZLWW




https://www.canada.ca/en/conservation-institute/services/conservation-preservation-publications/canadian-conservation-institute-notes/longevity-recordable-cds-dvds.html
	'information-carrying layer and metal reflective layer are applied to the bottom, or the reading side, of the disc, it is important to offer extra protection on this side of the disc so that the disk can function properly'
		Extra protection or not, if the optical depth is substantially reduced from the ~2mm apparently typical of magneto-optical discs, dust particles of much smaller diameter may obstruct reading, corrupting data. Especially, this is a problem if a single disc is permanently installed in a single drive.
	'Never wipe in a circular direction.'
		Implying error correction on optical discs may not be designed to tolerate loss of most or all of any single track.


https://www.reddit.com/r/DataHoarder/comments/5e3ifw/are_bd_discs_the_perfect_and_cheapest_longterm/
	'Bitrot is real. I've lost lots of blurays because of it.' ... 'Verbatims, your Fuji, your Taiyo Yuden'
	'seems strange that I have no Verbatim recordables left, guess they weren't that great after all'
		'Source? They are using an organic layer, of course they will fail a lot sooner'




http://www.disc-group.com/wp-content/uploads/2011/05/Blu-Ray-5-Key-techno-1.147KB.pdf
	'Blu-ray Disc' 'numerical aperture (NA) of 0.85' 'cover layer thickness of 0.1 mm is chosen to secure the disk tilt margin'
		_octave 'nsolve(0.85 == sin(x * 0.017453293), x)/45*0.1'
		 # ~ 0.13mm dust tolerance (optical only, before error correction, best case)
	'cover layer thickness, the light wavelength and the NA of DVD are 0.6 mm, 650 nm and 0.6 respectively'
		_octave 'nsolve(0.6 == sin(x * 0.017453293), x)/45*0.6'
		 # ~ 0.5mm dust tolerance (optical only, before error correction, best case)


https://en.wikipedia.org/wiki/Cleanroom
	'ISO 9' 'Room air'

https://foobot.io/guides/air-pollution-particle-size.php
	'Coarse particles (PM10)' '10 microns'

https://www.chegg.com/homework-help/01-mm-diameter-dust-particle-whose-density-21-g-cm3-observed-chapter-15-problem-62p-solution-9780077422400-exc




https://btrfs.wiki.kernel.org/index.php/Autosnap



https://lists.debian.org/debian-user/2017/06/msg00662.html
https://man7.org/linux/man-pages/man8/mkudffs.8.html



https://wiki.archlinux.org/title/Optical_disc_drive#BD_Defect_Management
http://www.thehaus.net/AltOS/Linux/ht-mtrainier.shtml
	'Mount Rainier drives must format the discs before they can be used. You also need to create a UDF filesystem.'
https://wiki.gentoo.org/wiki/CD/DVD/BD_writing#BD_defect_management
	'DVD-RW, DVD+RW, and Blu-ray Recordable Erasable (BD-RE) media can be easily written by simply mounting the media and writing to the media as a normal filesystem, as these devices and media allow random writing, versus CD-RW only allowing sequential writing.'
		'growisofs -dvd-compat -rock -V "TITLE" ./some/files /dev/sr0'
https://unix.stackexchange.com/questions/68426/how-to-burn-iso-image-to-dvd-using-dd-command
	'You can't use dd this way (it might work for DVD-RAM though). What you are looking for is growisofs - (the main) part of dvd+rw-tools.'

https://superuser.com/questions/703710/why-cant-cds-dvds-be-partitioned
	'It is quite easy to "partition" a DVD if you are creating the DVD on a Linux system. If you do "partition" the DVD, it will present itself to the OS as two or more separate DVD drives.
	There are numerous ways to do this. For example, you can use the -eltorito-alt-boot option to mkisofs. This is what I use to create my UEFI Rescue DVD which contains a 32-bit and a 64-bit set of tools along with both the EFI and UEFI shells.
	Oh, and the relevant specification is Mount Fuji v8.'


https://en.wikipedia.org/wiki/Professional_Disc
	'in late July 2009, Sony added the ability for computer users to store any computer files on the Professional Disc into the dedicated "User Data" folder'
		Raw disc access (ie. 'dd') seems doubtful.



https://en.wikipedia.org/wiki/EncFS
	'Anyone having access to the source directory is able to see how many files are in the encrypted filesystem, what permissions they have, their approximate size, and the last time they were accessed or modified, though the file names and file data are encrypted.[9]'
	'EncFS is not safe if the adversary has the opportunity to see two or more snapshots of the ciphertext at different times.'
		No need for this. Veracrypt volumes and such seem to work as expected while stored on 'udf' filesystem.


https://www.kernel.org/doc/html/latest/cdrom/packet-writing.html
	'Defect management (ie automatic remapping of bad sectors) has not been implemented yet, so you are likely to get at least some filesystem corruption if the disc wears out.'
	'Since the pktcdvd driver makes the disc appear as a regular block device with a 2KB block size, you can put any filesystem you like on the disc. For example, run:' ... '/sbin/mke2fs /dev/pktcdvd/dev_name' ... 'to create an ext2 filesystem on the disc.'
		Still does not demonstrate *partitioning*.
		Beware - absence of defect management is probably very dangerous even with quad-redundancy. Experimental.
		Relevant kernel may be deprecated, albeit should be available through ~2026.
	'drive supporting DVD+RW discs shall implement “true random writes with 2KB granularity”, which means that it should be possible to put any filesystem with a block size >= 2KB on such a disc'
		So do that instead, do NOT use 'pktsetup'. 'CD-RW' and 'DVD-RW' discs are not common nor desirable anyway.

https://en.wikipedia.org/wiki/DVD_recordable#Wobble_frequency
	'Developed by Philips and Sony with their DVD+RW Alliance, the "plus" format uses a more reliable[citation needed] bi-phase modulation technique[11] to provide 'sector' address information. It was introduced after the "-" format.'
		Seems like another reason to avoid 'DVD-RW' (and presumably 'CD-RW') discs, in addition to necessity of 'pktsetup' (which may be itself a result of less reliable disc design).




https://blog.samtec.com/post/new-pcie-gen-4-over-fiber-adapter-card/
https://blog.samtec.com/post/pci-express-over-100-meters-of-optical-cable/
https://blog.samtec.com/post/samtec-firefly-pcie-optical-flyover-cable-assembly-fully-supports-pcie-4-0/




https://www.cl.cam.ac.uk/~sps32/cardis2016_sem.pdf
	'Passive Voltage Contrast'
		Reading of 'flash' memory 'bits' by external e-beam may allow specially designed solid-state storage to intentionally allow recovery of data after all internal addressing circuitry has failed - combining the benefits of both solid-state and optical disc storage.








__Copyright__
This file is part of flipKey.

flipKey is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

flipKey is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with flipKey.  If not, see <http://www.gnu.org/licenses/>.
