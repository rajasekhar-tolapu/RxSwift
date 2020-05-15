import UIKit
import RxSwift
import RxCocoa

let disposeBag = DisposeBag()

// Observables - just , of, from
let observable1 = Observable.just(1)

let observable2 = Observable.of([1,2])

let observable3 = Observable.of(1,2)

let observable4 = Observable.from([1,2,3,4,5])

// Subscribers
observable1.subscribe(onNext : { (value) in
    print("observable1")
    print(value)
})

observable2.subscribe(onNext : { val in
    print("observable2")
    print(val)
})

observable3.subscribe(onNext : { val in
    print("observable3")
    print(val)
})

let subscripton4 = observable4.subscribe(onNext : { val in
    print("observable4")
    print(val)
})

// Dispose bag
subscripton4.disposed(by: disposeBag)


// Observable with Subscribe with Dispose bag
Observable
    .of("A", "B", "C")
    .subscribe(onNext : { next in
        print(next)
    })
.disposed(by: disposeBag)

// Create Observers
Observable<String>.create { observer in
    observer.onNext("E")
    observer.onCompleted()
    observer.onNext("D")
    return Disposables.create()
}.subscribe(onNext: {print($0)}, onError: {print($0)}, onCompleted: {print("Completed")}, onDisposed: {print("Disposed")})
    


// *** Subjects ***

// Publish Subjects

print("*********PublishSubject**********************")

let subject = PublishSubject<String>()

subject.onNext("Issue 0")

subject.subscribe { (event) in
    print(event)
}

subject.onNext("Issue 1")
subject.onNext("Issue 2")
subject.onNext("Issue 3")
subject.dispose()

subject.onCompleted()

subject.dispose()

print("************BehaviorSubject*******************")
let behaviourSub = BehaviorSubject(value: "Initial Value")
behaviourSub.onNext("Issue 0")
behaviourSub.subscribe { (event) in
    print(event)
}

behaviourSub.onNext("Issue 1")


print("************ReplaySubject*******************")
let replaySub = ReplaySubject<String>.create(bufferSize: 2)

replaySub.onNext("Issue 1")
replaySub.onNext("Issue 2")
replaySub.onNext("Issue 3")
replaySub.onNext("Issue 4")

replaySub.subscribe { (event) in
    print(event)
}

replaySub.onNext("Issue A")
replaySub.onNext("Issue B")
replaySub.onNext("Issue C")


print("**Subcription 2**")
replaySub.subscribe { (event) in
    print(event)
}

replaySub.onNext("Issue Beta") // Called two times because replaySub is subscibed two times

print("************Variable*******************")

let variable = Variable(String())

variable.value = "Hello"

variable.asObservable()
    .subscribe { (event) in
        print(event)
}
variable.value.append(" World")
//variable.value.append("World")
//variable.value.remove(at: 0)


//'Variable' is deprecated: Variable is deprecated. Please use `BehaviorRelay` as a replacement.
print("************Behaviour Relay*******************")

// String
let relay = BehaviorRelay(value: "Initial Value")
relay.accept(relay.value + " Hello")
relay.asObservable()
    .subscribe { (event) in
        print(event)
}

// Array
let relay2 = BehaviorRelay(value: [String]())

relay2.accept(["Item 1"])

relay2.accept(relay2.value + ["Item 2"])

var value = relay2.value
value.append("Item 3")
value.append("Item 4")

relay2.accept(value)

relay2.asObservable()
    .subscribe { (event) in
        print(event)
}

