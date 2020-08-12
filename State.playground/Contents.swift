import UIKit

//протокол State(состояние) с методами-состояний(определяет какие состояния есть у принтера)
protocol State {
    func on(printer: Printer)
    func off(printer: Printer)
    func printDocument(printer: Printer)
}
//--------------------------------------------------

//класс-состояние ON--------------------------------------------
class On: State{
    //работа метода on при включенном состоянии
    func on(printer: Printer) {
        print("it is already on")
    }
    
     //работа метода off при включенном состоянии
    func off(printer: Printer) {
        print("turning printer off")
        printer.set(state: Off())
    }
    
     //работа метода printDocument при включенном состоянии
    func printDocument(printer: Printer) {
        print("printing")
        //при печати вход в новое состояние
        printer.set(state: Print())
    }
}
//------------------------------------------------------------

//класс-состояние Off-------------------------------------------
class Off: State{
    //работа метода on при выключенном состоянии
    func on(printer: Printer) {
        print("turning ON")
        printer.set(state: On())
    }
    
     //работа метода off при выключенном состоянии
    func off(printer: Printer) {
        print("it is already off")
    }
    
     //работа метода printDocument при выключенном состоянии
    func printDocument(printer: Printer) {
        print("it is off, you can't print")
      }
}
//-------------------------------------------------------------

//класс-состояние Print
class Print: State{
   
    //работа метода on при состоянии Print
    func on(printer: Printer) {
        print("it is already on")
    }
    
     //работа метода off при состоянии Print
    func off(printer: Printer) {
        print("printer off")
        printer.set(state: Off())
    }
    
     //работа метода printDocument при состоянии Print
    func printDocument(printer: Printer) {
        print(" it is already print")
    }
}



//класс Printer
class Printer {
    //свойство состояние
   private var state: State
    
    init() {
        self.state = On() //свойству-состоянию назначаем состояние On при создании
    }
    
    //метод назначения свойству state нового состояния
    func set(state: State) {
        self.state = state
    }
    
    func turnOn()  {
        state.on(printer: self)
    }
    
    func turnOff() {
        state.off(printer: self)
    }
    
    func turnPrint() {
        state.printDocument(printer: self)
    }
}
    
 //----------------------------------------------------------------------------
//создаем принтер

let printerCanon = Printer()
printerCanon.turnPrint()
printerCanon.turnOff()
printerCanon.turnOn()
printerCanon.turnOn()
printerCanon.turnOff()
printerCanon.turnOff()
    
