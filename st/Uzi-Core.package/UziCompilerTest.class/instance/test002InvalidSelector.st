tests
test002InvalidSelector
	self should: [self compile: 'task main() running 1/s {primitiveThatDoesNotExist(1);}'] 
		raise: UziError
	