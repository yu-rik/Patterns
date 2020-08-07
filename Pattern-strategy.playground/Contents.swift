import UIKit

//создается протокол и классы с разными реализациями методов
protocol SwimBehavior {
    func swim()
}
class StarterSwimmer: SwimBehavior {
    func swim() {
        print("I begin to swim")
    }
}

class ProfSwimmer: SwimBehavior {
     func swim() {
            print("I am professional swimmer")
     }
}

class NonSwimmer: SwimBehavior {
     func swim() {
            print("I cannot swimmer")
     }
}

//--------------------------------------------------------

protocol DiveBehavior {
    func dive()
}
class StarterDiver: DiveBehavior {
    func dive() {
        print("I begin to DIVE")
    }
}

class ProfDiver: DiveBehavior {
     func dive() {
            print("I am professional DIVER")
     }
}
//--------------------------------------------------------

class Human {
//    func swim() {
//        print("Swimming")
//    }
//
//    func dive() {
//        print("diving")
//    }
//
//    func run() {
//        print("running")
//    }

//создаем два свойства
    private var diveBehavior: DiveBehavior
    private var swimBehavior: SwimBehavior
    
    func swimming() {
      swimBehavior.swim()
    }
    
    func diving() {
        diveBehavior.dive()
       }
    
    func setSw(sb: SwimBehavior) {
        self.swimBehavior = sb
    }
    
      func setDw(db: DiveBehavior) {
        self.diveBehavior = db
     }
    
    init(swim: SwimBehavior, dive: DiveBehavior) {
        self.swimBehavior = swim
        self.diveBehavior = dive
    }
    
}

let human = Human(swim: StarterSwimmer(), dive: StarterDiver())
//human.dive()
//human.setSw(sb: NonSwimmer())
//human.swimming()
//
//human.setDw(db: ProfDiver())
//human.diving()
human.setDw(db: ProfDiver())
human.swimming()
human.diving()
