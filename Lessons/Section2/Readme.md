
기본적인 Notifivation publisher - subscribe 구현 이다.

```jsx
override func viewDidLoad() {
        super.viewDidLoad()
        let notiName = Notification.Name("Noti")
                //publisher 를 생성
        let publisher = NotificationCenter.default.publisher(for: notiName)
            
                //구독
        let subscribe = publisher.sink { _ in
            print("NotiNoti")
        }
        //이벤트 방출
        NotificationCenter.default.post(name: notiName, object: nil)
        //구독 취소
        subscribe.cancel()
    }
```

### Subscriber 구현

sink 가 아니라 subscriber 구현하여 사용하는 방법이다. 

Input 타입에 이벤트로 받을 타입을 지정해주고 필요한 메소드를 구현해줘야한다.

```jsx
enum MyError: Error{
    case subscriberError
}

class IntSubscriber: Subscriber {
    func receive(subscription: Subscription) {
                //구독 할때 호출됨.

                //지정해준 만큼만 이벤트를 받을수있다. (demand)
                subscription.request(.max(2))
        print("Receive \(subscription)")
    }
    
    func receive(_ input: Int) -> Subscribers.Demand {
                //값을 받으면 호출된다.
        print("Receive input \(input)")
        return .none
    }
    
    func receive(completion: Subscribers.Completion<MyError>) {
        print("Completed")
    }
    
    typealias Input = Int
    typealias Failure = MyError
    
}
////////////////////사용

override func viewDidLoad() {
        super.viewDidLoad()
       
        let publisher = [1,2,3,4,5,6,7,8,9].publisher
        
        publisher.subscribe(IntSubscriber()) //max2 이므로 1,2만 받음
    }

```

### Subject

```jsx
let subscriber = IntSubscriber()

        let subject = PassthroughSubject<Int,MyError>()
//        subject.subscribe(subscriber)
        subject.send(1)
        subject.send(2)
        subject.send(3)
```

Subject는 publisher 와 동시에 subscription 이 될수있다.

send()를 통해 값을 방출할수있고 subscribe or sink를 동해 구독할수있다.

(subscribe 컴파일 에러가 발생하여 문제를 알아보는중)
