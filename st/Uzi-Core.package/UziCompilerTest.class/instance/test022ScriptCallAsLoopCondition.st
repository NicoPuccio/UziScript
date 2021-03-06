tests
test022ScriptCallAsLoopCondition
	| program script |
	program := self compile: '
	proc main() { while foo() { toggle(D13); }}
	func foo() { return 1; }'.
	script := program scripts detect: [:s | s name = #main].
	self assert: script instructions = {
		call arg: #foo.
		jz arg: 3.
		push arg: (program globals detect: [:var | var value = 13]).
		prim arg: (UziPrimitive named: #toggle).
		jmp arg: -5
	}
