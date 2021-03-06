tests
test015LoopConditionShouldBeAnExpression
	self assertInvalid: 'task foo() stopped { while turnOn(D13) { turnOff(D13); }}'.
	self assertInvalid: 'var a; task foo() stopped { while a = 3 { turnOff(D13); }}'.
	
	"self assertInvalid: 'var a; task foo() { do { turnOff(D13); } while {a}; }'"
	self assertInvalid: (program
		globals: { varDec name: #a }
		scripts: { 
			task
				name: #foo 
				arguments: #() 
				body: (block 
					statements: {
						doUntil
							condition: (block statements: { var named: #a })
							body: (block statements: {
								call selector: #turnOff
									arguments: { nil -> (number value: 13) }
									primitiveName: #turnOff
							})
					})
		}
		primitives: primitives).