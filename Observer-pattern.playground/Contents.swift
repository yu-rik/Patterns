import UIKit

protocol Subject {
    func add(observer: PropertyObserver)
    func remove(observer: PropertyObserver)
    func notify(withString string: String)
}
//-----------------------------------------------------
//протокол для определения наюлюдателей - реализация всех наблюдателей
protocol PropertyObserver {
    func didGet(newTask task: String)
}
//-----------------------------------------------------
class Teacher: Subject {
    
    //коллекция наблюдателей
    var observerCollection = NSMutableSet()
    var homeTask = "" {
        didSet{
            notify(withString: homeTask)
        }
    }
    
    func add(observer: PropertyObserver) {
        observerCollection.add(observer)
    }
    
    func remove(observer: PropertyObserver) {
        observerCollection.remove(observer)
    }
    
    func notify(withString string: String) {
        for observer in observerCollection{
            //нужно для того чтоб обратиться к методу протокола PropertyObserver
            (observer as! PropertyObserver).didGet(newTask: string)
        }
        
    }
}
//----------------------------------------

class Pupil: NSObject, PropertyObserver { //NSObject нужен чтоб Pupil можно было поместить
   var homeTask = ""
    
    func didGet(newTask task: String) {
        homeTask = task
        print("new homework")
    }
    
    
}
let teacher = Teacher()
let pupil = Pupil()

teacher.add(observer: pupil)
teacher.homeTask = "задача, три параграфа"

pupil.homeTask
