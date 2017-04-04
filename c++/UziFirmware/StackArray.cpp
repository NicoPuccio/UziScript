#include "StackArray.h"


void StackArray::push(float element)
{
	elements[pointer++] = element;
}

float StackArray::pop(void)
{
	return elements[--pointer];
}

float StackArray::top(void)
{
	return elements[pointer - 1];
}

void StackArray::reset(void)
{
	pointer = 0;
}

bool StackArray::overflow(void)
{
	return pointer >= MAX_SIZE;
}

uint16 StackArray::getPointer(void)
{
	return pointer;
}

void StackArray::setPointer(uint16 value)
{
	pointer = value;
}

float StackArray::getElementAt(uint16 index)
{
	return elements[index];
}

void StackArray::setElementAt(uint16 index, float value)
{
	elements[index] = value;
}