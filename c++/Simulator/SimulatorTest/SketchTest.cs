﻿using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Simulator;

namespace SimulatorTest
{
    [TestClass]
    public class SketchTest
    {
        private Sketch sketch = Sketch.Current;

        [TestInitialize]
        public void Setup()
        {
            sketch.Setup();
            TurnOffAllPins();
        }

        [TestMethod]
        public void TestTurnOnBytecode()
        {
            sketch.WriteSerial(new byte[]
            {
                /*
                program := Uzi
                    program: [:p | p
	                    script: #test
	                    ticking: true
	                    delay: 0
	                    bytecodes: [:s | s
		                    turnOn: 13]].
                UziProtocol new run: program
                */
                0, 1, 0, 128, 0, 0, 0, 1, 13
            });
            Assert.AreEqual(0, sketch.GetPinValue(13));
            sketch.Loop();
            Assert.AreEqual(1023, sketch.GetPinValue(13));
        }

        [TestMethod]
        public void TestTurnOffBytecode()
        {
            sketch.WriteSerial(new byte[]
            {
                /*
                program := Uzi 
                    program: [:p | p
	                    script: #test
	                    ticking: true
	                    delay: 0
	                    bytecodes: [:s | s
		                    turnOff: 13]].
                UziProtocol new run: program
                */
                0, 1, 0, 128, 0, 0, 0, 1, 45
            });
            sketch.SetPinValue(13, 1023);
            Assert.AreEqual(1023, sketch.GetPinValue(13));
            sketch.Loop();
            Assert.AreEqual(0, sketch.GetPinValue(13));
        }

        [TestMethod]
        public void TestReadWriteBytecode()
        {
            sketch.WriteSerial(new byte[]
            {
                /*
                program := Uzi 
                    program: [:p | p
	                    script: #test
	                    ticking: true
	                    delay: 0
	                    bytecodes: [:s | s
		                    read: 15;
		                    write: 13]].
                UziProtocol new run: program
                */
                0, 1, 0, 128, 0, 0, 0, 2, 111, 77
            });
            sketch.SetPinValue(15, 512);
            Assert.AreEqual(0, sketch.GetPinValue(13));
            sketch.Loop();
            Assert.AreEqual(512, sketch.GetPinValue(13));
        }

        private void TurnOffAllPins()
        {
            for (int i = 0; i < 19; i++)
            {
                sketch.SetPinValue(i, 0);
            }
        }
    }
}
