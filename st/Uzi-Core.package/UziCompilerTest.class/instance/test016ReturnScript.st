tests
test016ReturnScript
	| program script1 |
	program := self compile: 'task main() running { return 1; }'.
	script1 := program scripts last.
	self assert: script1 instructions = {
		push arg: (program globals detect: [:var | var value = 1]).
		prim arg: (UziPrimitive named: #retv)
	}
