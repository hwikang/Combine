import UIKit

//class B {
//    func test(){
//        print("B")
//    }
//
//    deinit {
//        print("Deinit -B")
//    }
//}
//
//class A : B {
//    override func test() {
//        print("A-1")
//        super.test()
//        print("A-2")
//
//    }
//
//    deinit {
//        print("Deinit -A")
//    }
//}
//
//
//let closure = {
//
//    let a = A()
//    a.test()
//}
//
//closure()


//
struct Actor {

    var name: String

    init(name: String) {
        self.name = name

    }
    
    func printName() {
        print("Name \(self.name)")
    }
}
var actor = Actor(name: "Hwi")
actor.name = "Aldo"


let closure = actor.printName
actor.name = "Simon"
closure()

//
class Test {
    func test() {
        print("Test")
    }
}

class Test2 {

//    init(test:Test){
//        self.test = test
//    }
//
    weak var test: Test?

    func testFunc(){
        print("testFunc")
        test?.test()
    }


}

let test2 = Test2()
test2.test = Test()
test2.testFunc()

//class Test3: Test {
//    func test3Func() {
//
//        let test2 = Test2()
//        test2.test = self
//        test2.testFunc()
//    }
//}
//Test3().test3Func()
