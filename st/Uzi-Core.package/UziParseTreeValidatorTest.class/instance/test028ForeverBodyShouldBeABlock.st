tests
test028ForeverBodyShouldBeABlock
	"self assertInvalid: 'task foo() running { 
		forever toggle(D13);
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
						forever
							body: (prim
								selector: #turnOn
								arguments: { number value: 13 })
					})
		}).