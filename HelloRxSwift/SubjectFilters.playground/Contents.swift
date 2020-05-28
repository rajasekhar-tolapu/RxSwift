import UIKit
import PlaygroundSupport
import RxSwift

print("Filters")

let disposeBag = DisposeBag()

let ignoreSub = PublishSubject<String>()
ignoreSub.ignoreElements()
    .subscribe { (event) in
        print("Subscription called \(event)")
}.disposed(by: disposeBag)

ignoreSub.onNext("A")
ignoreSub.onNext("B")
ignoreSub.onNext("C")

ignoreSub.onCompleted()

let elementAtSub = PublishSubject<String>()
elementAtSub.elementAt(2)
    .subscribe(onNext: { (element) in
        print("Subscription called \(element)")
    }).disposed(by: disposeBag)

elementAtSub.onNext("Element At 0")
elementAtSub.onNext("Element At 1")
elementAtSub.onNext("Element At 2")
elementAtSub.onNext("Element At 3")
elementAtSub.onNext("Element At 4")
elementAtSub.onNext("Element At 5")

//Filter
Observable.of(1,2,3,4,5,6,7,8)
    .filter { (num) -> Bool in
        num % 2 == 0
    }.subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

let filterSub = PublishSubject<String>()
filterSub.filter { (str) -> Bool in
    return str.hasPrefix("H")
}.subscribe { (event) in
    print(event)
}

filterSub.onNext("Hello")
filterSub.onNext("Tello")


Observable.of("A", "B", "C", "D", "E", "F")
.skip(3)
.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)


Observable.of("A1", "B1", "C1", "D1", "E1", "F1")
.skipWhile({ (str) -> Bool in
    str != "D1"
})
.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)

//
let subject = PublishSubject<String>()
let trigger = PublishSubject<String>()

subject.skipUntil(trigger)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

subject.onNext("A")

trigger.onNext("X")

subject.onNext("B")
subject.onNext("C")


Observable.of(11,22,33,44,55)
    .take(3)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

Observable.of(24,26,9,12,20)
    .takeWhile { (num) -> Bool in
        num % 2 == 0
    }.subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)


let sub1 = PublishSubject<String>()
let tri1 = PublishSubject<String>()

sub1.takeUntil(tri1)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

sub1.onNext("AA")
sub1.onNext("BB")
sub1.onNext("C")

tri1.onNext("X")
sub1.onNext("D")
