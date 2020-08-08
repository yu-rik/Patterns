import UIKit

protocol Car {
    func drive()
}

class LittleCar: Car {
    func drive() {
        print("drive a LITTLE car")
    }
}
class MiddleCar: Car {
    func drive() {
        print("drive a MIDDLE car")
    }
}
//-------------------------------------------------
protocol Bus {
    func drive()
}

class LittleBus: Bus{
    func drive() {
        print("drive a little BUS")
        }
}
class MiddleBus: Bus{
    func drive() {
        print("drive a middle BUS")
    }
}
//--------------------------------------------------
protocol Factory {
    func produceBus() -> Bus
    func produceCar() -> Car
}

class LittleSizeFactory: Factory {
    func produceBus() -> Bus {
        print("Little bus was create")
        return LittleBus()
    }
    
    func produceCar() -> Car {
        print("Little car was create")
        return LittleCar()
    }
}
//-------------------------------------------------

class MiddleSizeFactory: Factory {
    func produceBus() -> Bus {
        print("middle bus was create")
        return MiddleBus()
    }
    
    func produceCar() -> Car {
        print("middle car was")
        return MiddleCar()
    }
}
//----------------------------------------------------

let littleFactory = LittleSizeFactory()
littleFactory.produceCar()

let middleFactory = MiddleSizeFactory()
middleFactory.produceBus()
