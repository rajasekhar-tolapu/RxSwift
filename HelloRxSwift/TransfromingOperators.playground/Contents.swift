import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

print("Transforming Operators")

let disposeBag = DisposeBag()


//// To Array
//Observable.of(1,2,3,4,5)
//    .toArray()
//    .subscribe(onSuccess: { (transformedArray) in
//        print(transformedArray)
//    })
//
//
//// Map
//
//Observable.of(1,2,3,4,5)
//    .map {
//        $0 * $0
//    }.subscribe(onNext: {
//        print($0)
//    })

// Flat Map

//struct Student {
//    var score : BehaviorRelay<Int>
//}
//
//let raj = Student(score: BehaviorRelay(value: 35))
//let sekhar = Student(score: BehaviorRelay(value: 40))
//
//let student = PublishSubject<Student>()

//student.asObservable()
//    .flatMap {
//        $0.score.asObservable()
//    }.subscribe {
//        print($0)
//    }
