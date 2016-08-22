#include "Script.h"

Script::Script()
{
	// Initializes current script as NOP
	stepping = false;
	stepTime = lastStepTime = instructionCount = 0;
	instructions = 0;
}

Script::Script(Reader * rs, bool& timeout)
{
	long n = rs->nextLong(4, timeout);
	if (!timeout)
	{
		stepping = (n >> 31) & 1;
		stepTime = n & 0x7FFFFFFF;
		lastStepTime = 0;
	}
	if (!timeout) { instructionCount = rs->next(timeout); }
	if (!timeout) { parseInstructions(rs, timeout); }
}

Script::Script(const Script& other)
{
	operator=(other);
}

Script& Script::operator=(const Script& other)
{
	stepping = other.stepping;
	stepTime = other.stepTime;
	lastStepTime = other.lastStepTime;
	instructionCount = other.instructionCount;
	instructions = new Instruction[instructionCount];
	for (int i = 0; i < instructionCount; i++)
	{
		instructions[i] = other.instructions[i];
	}
	return *this;
}

Script::~Script(void)
{
	delete[] instructions;
}

unsigned char Script::getInstructionCount(void)
{
	return instructionCount;
}

Instruction Script::getInstructionAt(int index)
{
	return instructions[index];
}

void Script::rememberLastStepTime(long now)
{
	lastStepTime = now;
}

bool Script::shouldStepNow(long now)
{
	return (now - lastStepTime) >= stepTime;
}

bool Script::isStepping(void)
{
	return stepping;
}

void Script::setStepping(bool val)
{
	stepping = val;
}

long Script::getStepTime(void)
{
	return stepTime;
}

void Script::parseInstructions(Reader* rs, bool& timeout)
{
	instructions = new Instruction[instructionCount];
	for (int i = 0; i < instructionCount; i++)
	{
		Instruction instruction(rs, timeout);
		if (timeout) return;
		instructions[i] = instruction;
	}
}