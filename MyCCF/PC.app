application {
	class myCar.myCar
	class myCar.Control
	class SystemLib.Miscellaneous.DeltaTimeService
	class systemTests.D6ST
	class systemTests.R1ST
	class systemTests.R3ST
	class systemTests.R4ST
	class systemTests.R5ST
}
schedule {
	startup {
	}
	shutdown {
	}
	task Task0 priority 0 period 10ms delay 0ms {
		process myCar.Control.calc
		process myCar.myCar.calc
		process systemTests.R1ST.calc
		process systemTests.R3ST.calc
		process systemTests.R4ST.calc
		process systemTests.R5ST.calc
		process systemTests.D6ST.calc
	}
}