application {
	class myCar.myCar
	class SystemLib.Miscellaneous.DeltaTimeService
	class myCar.myDriver
}
schedule {
	startup {
	}
	shutdown {
	}
	task Task0 priority 0 period 10ms delay 0ms {
		process myCar.myCar.calc
		process myCar.myDriver.calc
	}
}