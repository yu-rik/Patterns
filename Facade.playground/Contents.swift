import UIKit

class FruitShop {
    func buyFruits() -> String {
        return "FRUITS"
    }
}

class MeatShop {
    func buyMeat() -> String {
        return "FRUITS"
    }
}

class MilkShop {
    func buyMilk() -> String {
        return "MILK"
    }
}

class SweetShop {
    func buySweet() -> String {
        return "SWEETS"
    }
}

class BreadShop {
    func buyBread() -> String {
        return "BREAD"
    }
}
//Создаем Facade
class Supermarket {
   // объекты можно передать в инициализатор
    private let fruitshop = FruitShop()
    private let meatshop = MeatShop()
    private let milshop = MilkShop()
    private let sweetshop = SweetShop()
    private let breadshop = BreadShop()
    
    //
    func buyProduct() -> String {
        var products = ""
        products += fruitshop.buyFruits() + ", "
        products += meatshop.buyMeat() + ", "
        products += milshop.buyMilk() + ", "
        products += sweetshop.buySweet() + ", "
        products += breadshop.buyBread() + "!!!"
        
        
        return "I bought: "+products
    }
}

//--------------------------------------------------
let sm = Supermarket()
sm.buyProduct()

