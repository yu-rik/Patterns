import UIKit

protocol Porshe {
    func getPrice() -> Double
    func getDescription() -> String
}

//класс-автомобиль
class Boxter: Porshe{
    func getPrice() -> Double {
        return 120
    }
    
    func getDescription() -> String {
        return "Porshe Boxter"
    }
}

//абстрактый-класс декоратор чтоб добавлять опций классу-автомобилю
class PorsheDecorator: Porshe {
    
    // в свойтсво передается класс-автомобиль для которого используются дополнительные опции
   private let decoratorPorshe: Porshe
    
    //обязятельный инициализатор для подклассов
    required init(dp: Porshe) {
        self.decoratorPorshe = dp
    }
    
    func getPrice() -> Double {
        return decoratorPorshe.getPrice()
    }
    
    func getDescription() -> String {
        return decoratorPorshe.getDescription()
    }
}

//класс дополнительных опций для класса автомобиля
class PremiumAudioSystem: PorsheDecorator{
    required init(dp: Porshe) {
        super.init(dp: dp)
    }
    override func getPrice() -> Double {
        return super.getPrice() + 30
    }
    override func getDescription() -> String {
        return super.getDescription() + " with premium audio System"
    }
}
class PanoramicRoof: PorsheDecorator {
    required init(dp: Porshe) {
        super.init(dp: dp)
    }
    override func getPrice() -> Double {
        return super.getPrice() + 40
    }
    override func getDescription() -> String {
        return super.getDescription() + " with panoramic roof"
    }
}


var porsheBoxter: Porshe = Boxter()
porsheBoxter.getPrice()
porsheBoxter.getDescription()

porsheBoxter = PremiumAudioSystem(dp: porsheBoxter)
porsheBoxter.getPrice()
porsheBoxter.getDescription()

porsheBoxter = PanoramicRoof(dp: porsheBoxter)
porsheBoxter.getPrice()
porsheBoxter.getDescription()
