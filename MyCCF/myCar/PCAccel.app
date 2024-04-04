application {
	class myCar.ControlAccel
	class myCar.myCar
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
	}
}