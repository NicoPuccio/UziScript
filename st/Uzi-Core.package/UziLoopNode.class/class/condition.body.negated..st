instance creation
condition: conditionNode body: bodyNode negated: negatedBool
	^ self condition: conditionNode
		body: bodyNode
		negated: negatedBool
		evaluateBodyFirst: false