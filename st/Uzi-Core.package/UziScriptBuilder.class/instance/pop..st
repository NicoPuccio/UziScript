instruction creation
pop: arg
	^ args, locals detect: [:each | each name = arg]
		ifFound: [:variable |
			self addInstruction: (UziWriteLocalInstruction arg: variable)]
		ifNone: [| variable |
			variable := program registerGlobal: arg.
			self addInstruction: (UziPopInstruction arg: variable)]