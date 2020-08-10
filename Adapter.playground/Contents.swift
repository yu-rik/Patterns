import UIKit

//Adaptee - объект который подстраиваем
class SimpleCar {
    func sound() -> String {
        return "bi-bip"
    }
}

// target
//------------------------------------------------
protocol SuperCarProtocol {
    func makeNoise() -> String
}

class SuperCar: SuperCarProtocol{
    func makeNoise() -> String {
        return "dr-dr-dr"
    }
}
//---------------------------------------------------

//Adapter
//создаем адаптер например для вызова makeNoise класса SuperCar  в классе SimpleCar
class SuperCarAdapter: SuperCarProtocol{
    var simpleCar: SimpleCar
    init(simpleCar: SimpleCar) {
        self.simpleCar = simpleCar
    }
    
    func makeNoise() -> String {
        return simpleCar.sound()
    }
}

//------------------------------------------------------------------------


