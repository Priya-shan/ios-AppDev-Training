//import Cocoa
//
//var greeting:String = "Hello, playground"
//var integer:Int = 10
//var d:Float = 10.0
//integer = 11
//// var is a variable
//// let is a constant (cannot reassign a new value to it but able to update reference value of variable [need to change internals of the variable])
//let msg = "hello"
//print(msg)
////cannot do operations on different data types
//// var res=integer+d => not possible
//var res = integer + Int(d)  // thsi is possible
//
//var var1, var2, var3 : Double // single line assignment
//
////print(items : any)
//
//print("the sum of \(integer) and \(d) is \(res)")
//
//var myMsg = """
//the name of product
//    is a secret
//        just kidding
//"""
//
//print(myMsg)
//
//var count = 0
////count ++ // not available in swift
////use below method
//count = count+1
//count += 1
//
//var m:String? //maynot be a value
//
//var primes=[2,3,5,7,11,13,17]
//
//
//print(primes)
//print(primes.count)
//print(primes[3...6])
//var ints:[Int]=[]
//var singles:Set<Int> = [2,5,6,7,4,3,2,4,5,6,7]
//print(singles)
//
//var ids = [121:"priya",222:"sneha",999:"murugan"]
//ids.updateValue("shin", forKey: 222)
////print(ids[225]!)
//
//
//var status = (code:500, mess:"msg")
//
//print(status.code)
//
//var optionalValue: Int? = 100
//print(optionalValue!)
//
//if optionalValue != nil{
//    print(optionalValue!)
//}
//
//if let op=optionalValue{
//    print("after unwrapping \(op)")
//}
//
//guard let op1 = optionalValue else {
//    fatalError()
//}
//print("available outside \(op1)")
