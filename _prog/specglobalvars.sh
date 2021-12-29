
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







