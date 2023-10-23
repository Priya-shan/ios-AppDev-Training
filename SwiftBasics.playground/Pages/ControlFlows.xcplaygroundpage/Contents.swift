
var integer = 10

if integer > 10 {
    print("largenumber")
}
else if integer < 0 {
    print("negative number")
}
else{
    print("in last else block")
}

var email = "shan@gmail.com"
var password = "shan"
var phone = "9080888421"

let errorMessage = if email.isEmpty{
    "Please enter email address"
}else if password.isEmpty{
    "please enter password"
}else if phone.count<10{
    "please enter valid phone number"
}else{
    "login success"
}

print(errorMessage)


//switch cases
var vowel:Character = "I"

switch vowel{
case "A", "E", "I": print("it is vowel")
case "U": print("it is E")
default:print("some character")
}

// switch cases donot need break statements
// switch cases need to be exhausted[ must write case for all possible vallues or simply ise default it is must]
//if there is a case, it should have atleast one executable statement that one statement can either be a break statement

var num=3

switch num{
case 0: print("this is 0")
case 1..<10: print("this is single digit")
case 10..<100: print("this is double digit")
default: break
}

// tuple & wildcard

let grahsheetpoint = (1,0)
switch grahsheetpoint{
case (0,0): print("at 0,0")
case (1,_):print("at 1 and something")
default:break
}

switch num {
case 2,3,5,7,11:print("prime")
    fallthrough
default: print("it is an integer")
}

for index in 1..<5{
    print(index)
}
// to -> dont include last
// through -> include last
for index in stride(from: 5, through: 25, by: 5){
    print(index)
}
for index in stride(from: 25, to: 5, by: -5){
    print(index)
}

var number = [2,3,4,5,6,7]

for num in number{
    print(num)
}


var months = [1:"jan",2:"feb",3:"mar"]

for(key,value) in months{
    print("\(key) - \(value)")
}


var x=1
while x<10{
    print(x)
    x+=2
}

var y=10
repeat{
    print(y)
    y-=2
}
while y>1
        
        
var message="this is a string"
print(message.startIndex)
print(message[message.startIndex])
print(message[message.index(before: message.endIndex)])

for index in message.indices{
    print(message[index], terminator: "-")
}

message.insert(".", at: message.endIndex)
print(message)
