//
//import Foundation
//
//struct Stack<T>{
//    var items:[T] = []
//    mutating func push(_ item: T){
//        items.append(item)
//    }
//    
//    mutating func pop() -> T{
//        items.removeLast()
//        return items[items.endIndex - 1]
//    }
//    
//    mutating func peek() -> T{
//        return items[items.count - 1]
//    }
//    func show(){
//        print(items)
//    }
//}
//
//var integerStack = Stack<Int>()
//integerStack.push(10)
//integerStack.push(20)
//integerStack.show()
//print(integerStack.pop())
//integerStack.show()
////print(integerStack.peek())


class SyncManager{
    var allData: String
    init(str:String){
        allData = str
        print(allData)
    }
    func syncData(str: String){
        print("All data synchronized \(allData)")
    }
}


class TaskManager{
    //lazy only when corres fn is called it will init
    lazy var manager = SyncManager(str:"SyncManagerInitiated")
    func syncData(){
        manager.syncData(str: "sync called")
    }
    func doSomething(){
        print("doing reg")
    }
}

var taskManager = TaskManager()
taskManager.doSomething()
//taskManager.syncData()


//computed properties

class Center{
    var  x = 0.0, y=0.0
}

class Circle{
    var radius: Double
    let pi = 3.14
    //computed prop
    var area:Double{
        2*pi*radius
    }
    var areaExample: Double{
        get {
            2*pi*radius
        }
        set (newArea){
            radius = newArea/(2*pi)
        }
    }
    init(radius:Double){
        self.radius = radius
    }
}

var circle1 = Circle(radius: 5.0)
print(circle1.area)


//property observers


class Health{
    var steps: Int = 0{
        willSet {
            print("\(newValue)")
        }
        didSet{
            print("addn since last \(oldValue)")
        }
    }
}
var myWatch = Health()
myWatch.steps=100
myWatch.steps=300

@propertyWrapper
struct MinContribution{
    private var contribution = 0
    var wrappedValue:Int{
        get{
            contribution
        }
        set{
            contribution=max(newValue,1000)
        }
    }
}

class Test{
    @MinContribution var donation:Int
}

var testingWrapper = Test()
testingWrapper.donation=5000
print(testingWrapper.donation)


//inheritance
//initilization
class Vehicle {

    var speed : Double = 0.0
    var engine: Engine?
    init(){}
    init(_ speed: Double, horsePower: Double, cubicCapacity: Int) {
        self.speed = speed
        self.engine?.horsePower=horsePower
        self.engine?.cubicCapacity=cu
    }
    var whatSpeed : String {
        "the vehicle is moving at \(speed) km / hr"
    }
    func change(){
        print("change")
    }
}
class Car : Vehicle{
    // you can override property only if you have getter / setter
    var make :String
    var model : String

    init(speed:Double , make: String, model: String, engine:Engine) {
        // call parent init at last
        self.engine=engine
        self.make = make
        self.model = model
        super.init(speed)
    }
    override func change() {
    }
    override var whatSpeed: String{
        "car is moving at \(self.speed) km/hr"
    }
}
var engineOne = Engine(horsePower: 200.0, cubicCapacity: 2000)
var carOne = Car(speed:100,make:"VW",model:"polo",engine:engineOne)

print(carOne.engine?.horsePower)

class Engine{
    var horsePower:Double
    var cubicCapacity: Int
    init(horsePower: Double, cubicCapacity: Int) {
            self.horsePower = horsePower
            self.cubicCapacity = cubicCapacity
        }
}






//carOne.whatSpeed
//if let engine = carOne.engine {
//    print("Car engine - Horsepower: \(engine.horsePower), Cubic Capacity: \(engine.cubicCapacity)")
//} else {
//    print("No engine assigned to the car.")
//}


//
//class Student {
//    
//   let name: String
//   let age: Int
//    
//   init(name: String, age: Int) {
//      self.name = name
//      self.age = age
//   }
//    
//    convenience init(name: String) {
//      self.init(name: name, age: 0)
//   }
//    //swift takes care of it automatically
//    deinit{
//        print("car - deinitialized")
//    }
//}
//let alex = Student(name: "Alex Murphy", age: 30)
//let julie = Student(name: "Julie Martin")
//print("Alex age: \(alex.age)")
//print("Julie age: \(julie.age)")

