application {
	class systemTests.D6ST
	class myCar.ControlAccel
	class systemTests.R1ST
	class myCar.myCar
	class systemTests.R5ST
	class systemTests.R4ST
	class systemTests.R3ST
	class SystemLib.Miscellaneous.DeltaTimeService
}
schedule {
	startup {
	}
	shutdown {
	}
	task Task0 priority 0 period 10ms delay 0ms {
		process myCar.ControlAccel.calc
		process myCar.myCar.calc
		process systemTests.D6ST.calc
		process systemTests.R1ST.calc
		process systemTests.R3ST.calc
		process systemTests.R4ST.calc
		process systemTests.R5ST.calc
	}
}