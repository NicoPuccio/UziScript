tests
test001Toggle8
	| program |
	program := Uzi
		program: [:p | p
			script: #blink8
			ticking: true
			delay: 100
			instructions: [:s | s
				push: 8;
				prim: #toggle];
			script: #trigger
			ticking: true
			delay: 0
			instructions: [:s | s
				push: 13;
				prim: #toggle]].
	self writeFile: 'Test001Toggle8'
		program: program