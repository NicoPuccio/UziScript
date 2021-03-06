tests
test009CompilerPreservesParseNodes
	| program instr1 instr2 script |
	program := self compile: 'task main() stopped 1 / s { toggle( D13); }'.
	self assert: program node globals isEmpty.
	script := program scripts last.
	self assert: #main equals: script node name.
	self assert: 2 equals: script instructions size.
	instr1 := script instructions first.
	self assert: 13 equals: instr1 node value.
	instr2 := script instructions second.
	self assert: instr1 node equals: instr2 node arguments first value.
	self assert: #toggle equals: instr2 node selector.
	self assert: instr2 node arguments size = 1