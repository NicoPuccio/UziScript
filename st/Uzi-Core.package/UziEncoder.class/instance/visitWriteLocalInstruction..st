encoding instructions
visitWriteLocalInstruction: instruction
	| index |
	index := script indexOfLocal: instruction argument.
	stream
		nextPut: 16rFF;
		nextPut: (16r80 bitOr: index)