accessing
delayMs
	^ (scale caseOf: {
		[#s] -> [1000].
		[#m] -> [1000 * 60].
		[#h] -> [1000 * 60 * 60].
		[#d] -> [1000 * 60 * 60 * 24]
	}) / value