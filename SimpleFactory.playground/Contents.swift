import UIKit

enum CarType{
    case hugeCar
    case fastCar
}

protocol Car {
    func drive()
}

class HugeCar: Car {
    func drive() {
        print("You drive HUGE car")
    }
}

class FastCar: Car {
    func drive() {
        print("You drive FAST car")
    }
}

//let hugeCar = HugeCar()
//hugeCar.drive()
//let fastCar = FastCar()
//fastCar.drive()

//создание объектов перекладывается на фабрику
class CarFactory {
    //static для того чтоб создавать сразу объекты, а не экземпляры
    static func produceCar(type: CarType) -> Car{
        var car: Car
        switch type {
        case .fastCar:
           car = FastCar()
        case .hugeCar:
           car = HugeCar()
        }
        
        return car
    }
}

let hugeCar1 = CarFactory.produceCar(type: .hugeCar)
let fastCar1 = CarFactory.produceCar(type: .fastCar)

hugeCar1.drive()
fastCar1.drive()
