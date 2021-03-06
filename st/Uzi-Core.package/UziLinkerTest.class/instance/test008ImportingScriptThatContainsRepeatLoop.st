tests
test008ImportingScriptThatContainsRepeatLoop
	"
	import t6 = 'test6.uzi';
	task main() running { t6.foo(); }
	"
	| original expected actual |
	original := program 
		imports: {
			import alias: #t6 path: 'test6.uzi' 
		}
		globals: #()
		scripts: {
			task name: #main
				arguments: #()
				state: #running
				tickingRate: nil
				body: (block statements: {
					call selector: 't6.foo'
				})
		}
		primitives: primitives.
	expected := program 
		imports: {
			import alias: #t6 path: 'test6.uzi' isResolved: true
		}
		globals: #()
		scripts: {
			proc name: #'t6.foo'
				arguments: #()
				body: (block statements: {
					repeat
						times: (number value: 5)
						body: (block
							statements: {
								call selector: #'t6.toggle'
									arguments: { nil -> (pin type: #D number: 13) }
									primitiveName: #toggle
							})
				}).
			task name: #main				
				arguments: #()
				state: #running
				tickingRate: nil
				body: (block statements: {
					call selector: 't6.foo'
				})
		}
		primitives: primitives.
	actual := linker applyOn: original.
	self assert: expected equals: actual