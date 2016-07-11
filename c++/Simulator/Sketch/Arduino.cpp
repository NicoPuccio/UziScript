//--------------------------------------------------------------------
// Arduino Console Stub
//--------------------------------------------------------------------

#if _MSC_VER 

#include "Arduino.h"
#include <conio.h>
#include <time.h>


CSerial Serial;

//--------------------------------------------------------------------
// Timers
//--------------------------------------------------------------------

unsigned long millis()
{
	return (clock() * 1000) / CLOCKS_PER_SEC;
}

void delay(unsigned long delayms)
{
	unsigned long u = millis() + delayms;
	while (u > millis())
		;
}

//--------------------------------------------------------------------
// I/O
//--------------------------------------------------------------------

void pinMode(int, int)
{}

extern unsigned short analogRead(unsigned int pin)
{
	return __getPinValue(pin);
}

void analogWrite(unsigned int pin, unsigned short value)
{
	__setPinValue(pin, (unsigned short)round(value * 4.01176470588235));
}

void digitalWrite(int pin, int value)
{
	analogWrite(pin, value == 0 ? LOW : 255);
}

bool digitalRead(int pin)
{
	return analogRead(pin) == 0 ? LOW : HIGH;
}

//--------------------------------------------------------------------
// Serial
//--------------------------------------------------------------------

void CSerial::begin(long)
{
	in_buffer[0] = 0;
	in_buflen = 0;

	out_buffer[0] = 0;
	out_buflen = 0;
}

void CSerial::print(char *pString)
{
	char temp[1024];
	int count = sprintf(temp, "%s", pString);
	out_write(temp, count);
}

void CSerial::print(int value, int)
{
	char temp[1024];
	int count = sprintf(temp, "%d", value);
	out_write(temp, count);
}

void CSerial::println()
{
	char temp[1024];
	int count = sprintf(temp, "\r\n");
	out_write(temp, count);
}

void CSerial::println(char *pString)
{
	char temp[1024];
	int count = sprintf(temp, "%s\r\n", pString);
	out_write(temp, count);
}

void CSerial::println(int value, int)
{
	char temp[1024];
	int count = sprintf(temp, "%d\r\n", value);
	out_write(temp, count);
}

void CSerial::println(unsigned int value, int)
{
	char temp[1024];
	int count = sprintf(temp, "%u\r\n", value);
	out_write(temp, count);
}

void CSerial::println(unsigned long value, int)
{
	char temp[1024];
	int count = sprintf(temp, "%lu\r\n", value);
	out_write(temp, count);
}


int CSerial::available()
{
	return in_buflen;
}

char CSerial::read()
{
	return in_read();
}

void CSerial::write(unsigned char c)
{
	out_write(c);
}

char CSerial::in_read()
{
	char c = 0;
	if (in_buflen > 0)
	{
		c = in_buffer[0];
		memcpy(&in_buffer[0], &in_buffer[1], --in_buflen);
	}
	return c;
}

void CSerial::in_write(char c)
{
	CSerial::in_buffer[in_buflen] = c;
	if (++in_buflen >= 1024)
	{
		in_buflen--;
	}
}

char CSerial::out_read()
{
	char c = 0;
	if (out_buflen > 0)
	{
		c = out_buffer[0];
		memcpy(&out_buffer[0], &out_buffer[1], --out_buflen);
	}
	return c;
}

void CSerial::out_write(char c)
{
	CSerial::out_buffer[out_buflen] = c;
	if (++out_buflen >= 1024)
	{
		in_buflen--;
	}
}

void CSerial::out_write(char* str, size_t len)
{
	for (int i = 0; i < len; i++)
	{
		out_write(str[i]);
	}
}


size_t CSerial::out_readInto(char* buffer, size_t len)
{
	int i = 0;
	while (out_buflen)
	{
		buffer[i++] = out_read();
	}
	return i;
}

//--------------------------------------------------------------------
// Main
//--------------------------------------------------------------------

int main(int, char**)
{
	setup();
	for (;;)
	{
		if (_kbhit())
		{
			Serial.in_write((char)_getch());
		}
		loop();
	}
}

#endif
