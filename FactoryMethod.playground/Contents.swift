import UIKit

protocol Transport {
    func drive()
}

class Car: Transport {
    func drive() {
        print("drive a car")
    }
}
class Truck: Transport {
    func drive() {
        print("drive a truck")
    }
}
class Bus: Transport {
    func drive() {
        print("drive a bus")
    }
}

//------------------------------
protocol FactoryTransport{
    func produce() -> Transport
}

class CarFactory: FactoryTransport {
    func produce() -> Transport {
        print("Car was create")
        return Car()
    }
}
class TruckFactory: FactoryTransport {
    func produce() -> Transport {
        print("Truck was create")
        return Truck()
    }
}
class BusFactory: FactoryTransport {
    func produce() -> Transport {
        print("Bus was create")
        return Bus()
    }
}

let carFactory = CarFactory()
carFactory.produce()

let truckFactory = TruckFactory()
truckFactory.produce()
