tests
test043ForLoop
	| program |
	program := 'task for() running { for i = 7 to 11 { turnOn(i); }}'.
	self writeFile: 'Test043ForLoop'
		program: program