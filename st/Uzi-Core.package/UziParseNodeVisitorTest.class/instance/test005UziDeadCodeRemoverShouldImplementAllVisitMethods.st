autogenerated-tests
test005UziDeadCodeRemoverShouldImplementAllVisitMethods
	| errors selectors |
	selectors := self allSelectorsFor: UziDeadCodeRemover.
	errors := self missingNodes: selectors.
	self assert: errors isEmpty
		description: 'UziDeadCodeRemover is missing some critical methods'