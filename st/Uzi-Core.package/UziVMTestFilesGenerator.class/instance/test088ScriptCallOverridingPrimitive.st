tests
test088ScriptCallOverridingPrimitive
	| program |	
	program := '
task blink() running 1/s { toggle(D13, 0); }

proc toggle(pin, delay)  {
	if read(pin) { turnOff(pin); }
	else { turnOn(pin); }
	delayMs(delay);
}'.
	self writeFile: thisContext method selector
		program: program