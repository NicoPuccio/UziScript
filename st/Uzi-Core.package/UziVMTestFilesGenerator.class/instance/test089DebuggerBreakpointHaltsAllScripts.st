tests
test089DebuggerBreakpointHaltsAllScripts
	| program |	
	program := '
task blink11() running 1/s {
	toggle(D11);
}

task blink13() running { 
	turnOn(D13);
	delayMs(1000);
	turnOff(D13);
	delayMs(1000);
}'.
	self writeFile: thisContext method selector
		program: program