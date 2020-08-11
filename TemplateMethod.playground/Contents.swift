import UIKit

class DriveTransport {
   //template Method
    final func startTransport() {
        haveASeat()
        useProtection()
        lookTheMirror()
        turnSignal()
        driveForward()
    }
    
    func haveASeat() {
        preconditionFailure("this method should be overriden")
    }
    
    func useProtection() {
        preconditionFailure("this method should be overriden")
    }
    
    func lookTheMirror() {
        preconditionFailure("this method should be overriden")
    }
    
    func turnSignal() {
        preconditionFailure("this method should be overriden")
    }
    
    func driveForward() {
        preconditionFailure("this method should be overriden")
    }
}

class Bicycle: DriveTransport{
   override func haveASeat() {
        print("sit down on a bicycle seat")
    }
    
    override func useProtection() {
       print("wear a helmet")
    }
    
    override func lookTheMirror() {
        print("look at the little mirror")
    }
    
    override func turnSignal() {
        print("sow left hand")
    }
    
    override func driveForward() {
        print("go right")
    }
}

class Car: DriveTransport{
   override func haveASeat() {
        print("sit down on a car seat")
    }
    
    override func useProtection() {
       print("fasten seat belt")
    }
    
    override func lookTheMirror() {
        print("look at the rearview mirror")
    }
    
    override func turnSignal() {
        print("turn on left turn light")
    }
    
    override func driveForward() {
        print("push ")
    }
}
//--------------------------------------------------------

let car = Car()
let bicycle = Bicycle()

car.startTransport()
print("------------------------------")
bicycle.startTransport()

