#pragma once

#include "types.h"
#include "Arduino.h"
#include "SerialReader.h"
#include "Program.h"
#include "Script.h"
#include "EEPROMWearLevelingWriter.h"
#include "EEPROMWearLevelingReader.h"

enum MonitorState
{
	DISCONNECTED,
	CONNECTION_REQUESTED,
	CONNECTED
};

class Monitor 
{
public: 
	void loadInstalledProgram(Program** program);
	void initSerial();
	void checkForIncomingMessages(Program** program, GPIO* io);
	void sendOutgoingMessages(Program* program, GPIO* io);
	void sendError(uint8 errorCode);

	void serialWrite(uint8 value);

private:
	SerialReader stream;

	uint8 state = DISCONNECTED;
	uint8 handshake = 0;

	uint8 reporting = 0;
	uint32 lastTimeReport = 0;
	uint32 lastTimeKeepAlive = 0;

	uint8 profiling = 0;
	uint32 lastTimeProfile = 0;
	uint16 tickCount = 0;

	void connectionRequest();
	void acceptConnection();

	void executeCommand(Program** program, GPIO* io);
	void executeSetProgram(Program** program, GPIO* io);
	void executeSetValue(GPIO* io);
	void executeSetMode(GPIO* io);
	void executeStartReporting();
	void executeStopReporting();
	void executeSetReport(GPIO* io);
	void executeSaveProgram();
	void executeKeepAlive();
	void executeProfile();
	void executeSetGlobal(Program* program);
	void executeSetGlobalReport(Program* program);
	void executeSetBreakCount(Program* program);

	void sendError(uint8 coroutineIndex, uint8 errorCode);
	void sendReport(GPIO* io, Program* program);
	void checkKeepAlive();
	void sendProfile();
	void sendVMState(Program* program);
	void sendPinValues(GPIO* io);
	void sendGlobalValues(Program* program);
	void sendTickingScripts(Program* program);
	void sendFreeRAM();

	void loadProgramFromReader(Reader* reader, Program** program);
};

void trace(const char*);
