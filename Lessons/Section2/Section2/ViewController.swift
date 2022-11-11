//
//  ViewController.swift
//  Section2
//
//  Created by 슈퍼 on 2022/11/09.
//

import UIKit
import Combine

enum MyError: Error{
    case subscriberError
}
class IntSubscriber: Subscriber {
    func receive(subscription: Subscription) {
        print("Receive \(subscription)")
        subscription.request(.max(2))
    }
    
    func receive(_ input: Int) -> Subscribers.Demand {
        print("Receive input \(input)")
        return .none
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("Completed")
    }
    
    typealias Input = Int
    typealias Failure = Never
    
}




class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let subscriber = IntSubscriber()
        let subject = PassthroughSubject<Int,MyError>()
//        subject.subscribe(subscriber)
        subject.send(1)
        subject.send(2)
        subject.send(3)
    }


}
