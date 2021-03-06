tests
test024ScriptCallWithNamedArgumentsIncorrectOrder
	| program script |
	program := self compile: '
	var a;
	task main() running { a = foo(arg2: 4, arg1: 3);}
	func foo(arg1, arg2) { return arg1 * arg2; }'.
	script := program scripts detect: [:s | s name = #main].
	self assert: script instructions = {
		push arg: (program globals detect: [:var | var value = 3]).
		push arg: (program globals detect: [:var | var value = 4]).
		call arg: #foo.
		pop arg: (program globals detect: [:var | var name = 'a']).
	}
