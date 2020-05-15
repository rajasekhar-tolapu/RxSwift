//
//  ViewController.swift
//  HelloRxSwift
//
//  Created by Rajasekhar on 06/05/20.
//  Copyright © 2020 Rajasekhar. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Just check RxSwift is working or not after Pod Install of RxSwift
        let prices : BehaviorSubject = BehaviorSubject(value: "Hread")
        
        _ = prices
        .asObservable()
            .subscribe(onNext: { (val) in
                print(val)
            }, onError: { (err) in
                
            }, onCompleted: {
                
            }) {
                
        }
        
        _ = Observable.from([1,2,3])
    
    
    }


}

