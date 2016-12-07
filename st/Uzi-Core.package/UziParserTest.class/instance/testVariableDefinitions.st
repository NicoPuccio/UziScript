grammar-scripts
testVariableDefinitions
	| pp nodes vars |
	pp := UziParser new.
	nodes := pp parse: '
		a := 4. b := 3.
		#script1 ticking 1/s [foo]'.
	vars := nodes first.
	self assert: vars size equals: 2.
	self assert: #a equals: vars first name.
	self assert: #b equals: vars second name.
	self assert: 4 equals: vars first value.
	self assert: 3 equals: vars second value
	