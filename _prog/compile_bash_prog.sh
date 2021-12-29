_compile_bash_deps_prog() {
	if [[ "$1" == "flipKey" ]]
	then
		_deps_channel
		
		#_deps_metaengine
		
		
		#_deps_mount
		#_deps_notLean
		#_deps_image
		
		#_deps_git
		#_deps_bup
		
		# Include the extremely common applications (ie. 'dd) for disk repo shortcuts.
		_deps_repo
		
		_deps_calculators
		
		_deps_disc
		
		return 0
	fi
}

#Default is to include all, or run a specified configuration. For this reason, it will be more typical to override this entire function, rather than append any additional code.
# WARNING Find current version of this function at "build/bash/compile_bash.sh"
# _compile_bash_deps() {
# 	[[ "$1" == "lean" ]] && return 0
# 	
# 	false
# }

_vars_compile_bash_prog() {
	#export configDir="$scriptAbsoluteFolder"/_config
	
	#export progDir="$scriptAbsoluteFolder"/_prog
	#export progScript="$scriptAbsoluteFolder"/ubiquitous_bash.sh
	#[[ "$1" != "" ]] && export progScript="$scriptAbsoluteFolder"/"$1"
	
	true
}

_compile_bash_header_prog() {	
	export includeScriptList
	
	# Cygwin/MSW native binary override .
	includeScriptList+=( "flipKey/wrapper/veraCrypt/"veraCrypt_override.sh )
}

_compile_bash_header_program_prog() {	
	export includeScriptList
	true
}

_compile_bash_essential_utilities_prog() {	
	export includeScriptList
	true
}

_compile_bash_utilities_virtualization_prog() {	
	export includeScriptList
	true
}

_compile_bash_utilities_prog() {	
	export includeScriptList
	true
}

_compile_bash_shortcuts_prog() {	
	export includeScriptList
	true
}

_compile_bash_shortcuts_setup_prog() {	
	export includeScriptList
	true
}

_compile_bash_bundled_prog() {	
	export includeScriptList
	true
}

_compile_bash_vars_basic_prog() {	
	export includeScriptList
	true
}

_compile_bash_vars_global_prog() {	
	export includeScriptList
	true
}

_compile_bash_vars_spec_prog() {	
	export includeScriptList
	true
}

_compile_bash_vars_shortcuts_prog() {	
	export includeScriptList
	true
}

_compile_bash_vars_virtualization_prog() {	
	export includeScriptList
	true
}

_compile_bash_vars_bundled_prog() {	
	export includeScriptList
	true
}

_compile_bash_buildin_prog() {	
	export includeScriptList
	true
}

_compile_bash_environment_prog() {	
	export includeScriptList
	true
}

_compile_bash_installation_prog() {	
	export includeScriptList
	true
}

_compile_bash_program_prog() {	
	export includeScriptList
	
	
	includeScriptList+=( "flipKey/"flipKey_disk.sh )
	
	includeScriptList+=( "flipKey/wrapper/veraCrypt/"veraCrypt.sh )
	
	
	includeScriptList+=( "flipKey/specialized/extremelyRedundant/"fsTemp.sh )
	includeScriptList+=( "flipKey/specialized/extremelyRedundant/"extremelyRedundant.sh )
	
	
	includeScriptList+=( "flipKey/"token.sh )
	
	includeScriptList+=( "flipKey/"patterns.sh )
	
	includeScriptList+=( "flipKey/"generate.sh )
	includeScriptList+=( "flipKey/"sweep.sh )
	
	
	
	includeScriptList+=( "filesystem/"nilfs_garbageCollect.sh )
	includeScriptList+=( "filesystem/"btrfs.sh )
}

_compile_bash_config_prog() {	
	export includeScriptList
	true
}

_compile_bash_selfHost_prog() {	
	export includeScriptList
	true
}

_compile_bash_overrides_prog() {	
	export includeScriptList
	true
}

_compile_bash_entry_prog() {	
	export includeScriptList
	true
}
