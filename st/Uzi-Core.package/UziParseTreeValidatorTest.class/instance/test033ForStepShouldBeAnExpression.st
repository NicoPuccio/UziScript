tests
test033ForStepShouldBeAnExpression
	"self assertInvalid: 'task foo() running { 
		for a = 1 to 10 by toggle(D13) { toggle(D13); }
	}'."
	self assertInvalid: (program
		globals: #()
		scripts: { 
			task
				name: #foo 
				arguments: #() 
				state: #running
				tickingRate: nil
				body: (block 
					statements: {
						for 
							counter: (varDec name: #a)
							start: (number value: 1)
							stop: (number value: 10)
							step: (call
								selector: #toggle
								arguments: { nil -> (number value: 13) }
								primitiveName: #toggle)
							body: (block statements: {
								(call selector: #turnOn
									arguments: { nil -> (number value: 13) }
									primitiveName: #turnOn)
							})
					})
		}
		primitives: primitives).