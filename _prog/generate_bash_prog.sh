
_generate_lean-python_prog() {
	return 0
}

_generate_compile_bash_prog() {
	"$scriptAbsoluteLocation" _true
	
	#return
	
	#rm "$scriptAbsoluteFolder"/ubiquitous_bash.sh
	
	#"$scriptAbsoluteLocation" _compile_bash cautossh cautossh
	#"$scriptAbsoluteLocation" _compile_bash lean lean.sh
	
	"$scriptAbsoluteLocation" _compile_bash flipKey ubiquitous_bash.sh
	
	#"$scriptAbsoluteLocation" _compile_bash "" ""
	#"$scriptAbsoluteLocation" _compile_bash ubiquitous_bash ubiquitous_bash.sh
	
	#"$scriptAbsoluteLocation" _package
	
	"$scriptAbsoluteLocation" _compile_bash flipKey flipKey
	chmod 700 "$scriptAbsoluteFolder"/flipKey
}
