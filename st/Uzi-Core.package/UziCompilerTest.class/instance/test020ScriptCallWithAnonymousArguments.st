tests
test020ScriptCallWithAnonymousArguments
	| program script |
	program := self compile: '
	var a;
	task main() running { a = foo(3); }
	func foo(a) { return a + 2; }'.
	script := program scripts detect: [:s | s name = #main].
	self assert: script instructions = {
		push arg: (program globals detect: [:var | var value = 3]).
		call arg: #foo.
		pop arg: (program globals detect: [:var | var name = 'a']).
	}