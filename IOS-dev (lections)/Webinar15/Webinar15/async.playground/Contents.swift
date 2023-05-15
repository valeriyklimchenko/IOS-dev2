import UIKit




protocol CutProto{
    associatedtype C 
    func cut(completion: @escaping (Bool) -> Void)
    func cut2() async -> Bool
}

extension CutProto{
 
    func cut(completion: @escaping (Bool) -> Void){
        print("starting cut \(C.self)")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            print("finished cut")
            completion(true)
            
        }
//        sleep(2)
    
    }
    
    func cut2() async -> Bool {
        print("starting cut \(C.self)")
        sleep(2)
        print("finished cut \(C.self)")
        return true
    }
}
class Tomato: CutProto{
    typealias C = Tomato
    
    let id: Int
    
    init(_ id: Int){
        self.id = id
    }
    
}

class Cucumber: CutProto{
    typealias C = Cucumber
    
    let id: Int
    
    init(_ id: Int){
        self.id = id
    }
    
}



var tomato = Tomato(1)
var cucumber = Cucumber(1)
//tomato.cut(){isTomatoCutted in
//    if(isTomatoCutted){
//        cucumber.cut(){isCucumberCutted in
//
//        }
//    }
//}



Task.init{

    let isTomatoCut = await tomato.cut2()
    let isCucumberCut = await cucumber.cut2()
//    let results = await[isTomatoCut, isCucumberCut]
}


