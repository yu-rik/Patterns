import UIKit

class Safe {
    var money = 0
    static let shared = Safe()
    //совсем синглтон
    private init() {}
}

let safe = Safe.shared
safe.money += 1000
