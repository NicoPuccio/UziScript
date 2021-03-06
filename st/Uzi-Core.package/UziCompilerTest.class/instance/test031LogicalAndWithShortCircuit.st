tests
test031LogicalAndWithShortCircuit
	| program script |
	program := self compile: '
	func foo() { return 1 && bar(); }
	func bar() { return 42; }'.
	script := program scripts detect: [:s | s name = #foo].
	self assert: script instructions = {
		push arg: (program constants detect: [:var | var value = 1]).
		jz arg: 2.
		call arg: #bar.
		jmp arg: 1.
		push arg: (program constants detect: [:var | var value = 0]).
		prim arg: (UziPrimitive named: #retv)
	}
