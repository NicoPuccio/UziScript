tests
test028PrimitiveBitwiseAnd
	| program |
	program := Uzi program: [:p | p
		registerGlobal: #n value: 0;
		script: #main
		ticking: true
		delay: 1000
		instructions: [:s | s
			push: 11;
			push: #n;
			push: 7;
			prim: #bitwiseAnd;
			push: 10;
			prim: #divide;
			prim: #write;
			push: #n;
			push: 1;
			prim: #add;
			pop: #n]].
	self writeFile: 'Test028PrimitiveBitwiseAnd' program: program