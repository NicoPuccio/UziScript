initialize-release
initialize
	| acc |
	super initialize.
	acc := 0.
	scripts := OrderedCollection new.
	innerProgram scripts do: [:script |
		scripts add: (UziDebuggerScript 
			on: script 
			start: acc
			program: self).
		acc := acc + script instructions size]