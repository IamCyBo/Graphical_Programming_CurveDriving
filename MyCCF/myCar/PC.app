application {
	class myCar.myCar
	class SystemLib.Miscellaneous.DeltaTimeService
	class myCar.myDriver
	class systemTests.R1ST
}
schedule {
	startup {
	}
	shutdown {
	}
	task Task0 priority 0 period 10ms delay 0ms {
		process myCar.myDriver.calc
		process myCar.myCar.calc
		process systemTests.R1ST.calc
	}
}