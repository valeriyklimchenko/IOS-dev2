import UIKit


func addNumber<T: AdditiveArithmetic>(_ f: T, _ s: T) -> T{
    return f + s
}

//func addNumber(_ f: Double, _ s: Double) -> Double{
//    return f + s
//}

print(addNumber(1,2))
