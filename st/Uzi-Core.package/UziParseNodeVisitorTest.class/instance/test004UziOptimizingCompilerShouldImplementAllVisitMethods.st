autogenerated-tests
test004UziOptimizingCompilerShouldImplementAllVisitMethods
	| errors selectors |
	selectors := self allSelectorsFor: UziOptimizingCompiler.
	errors := self missingNodes: selectors.
	self assert: errors isEmpty
		description: 'UziOptimizingCompiler is missing some critical methods'