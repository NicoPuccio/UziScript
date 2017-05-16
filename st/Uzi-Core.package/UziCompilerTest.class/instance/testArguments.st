tests
testArguments
	| cc program script |
	cc := UziCompiler new.
	program := cc compile: '@mul [ :a :b | ^ a * b ]'.
	script := program scripts first.
	self assert: #(a b) equals: (script locals collect: [:each | each name]).
	self assert: script instructions = {
		readLocal arg: (script locals detect: [:var | var name = #a]).
		readLocal arg: (script locals detect: [:var | var name = #b]).		
		prim arg: (UziPrimitive named: #multiply).
		prim arg: (UziPrimitive named: #retv)
	}