//import Foundation
//
//
//func myfunc(){
//    print("func called")
//}
//
//myfunc()
//
//func greet(person: String){
//    print("Welcome \(person)")
//}
//
//greet(person: "raghu")
//
//func diff(a:Int, b:Int)->Int{
//    return a-b
//}
//
//print(diff(a:5,b:3))
//
////func minMax(array:[Int] -> (min:Int,max:Int)){
////    return(10,200)
////}
////var minMaxvalues = minMax(array:[2,3,4,5])
////print(minMaxvalues.min, minMaxvalues.max)
////
//
//// function to swap 2 numbers
//
//var num1 = 10
//var num2 = 20
//
//func swap(num1:inout Int,num2:inout Int){
//    let temp = num1
//    num1 = num2
//    num2 = temp
//}
//
//print("num1 \(num1)")
//print("num2 \(num2)")
//
//swap(num1:&num1,num2:&num2)
//
//print("num1 \(num1)")
//print("num2 \(num2)")
//
//
////closures
////map functions
////reduce
//
//let celcius = [21.1,33.8,44.9,18.9]
////apply filter to celcius and filter out warm temp values[more than 30]
//let warmTemp = celcius.filter{$0>30.0}
//print(warmTemp)
//
//
//let integers = [2,5,6,8,9,22,33,90,6]
////apply filter on integers to filter out even numbers
//let evenNum = integers.filter{$0%2==0}
//print(evenNum)
//
