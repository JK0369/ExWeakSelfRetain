//
//  ViewController.swift
//  ExWeakSelfRetain
//
//  Created by 김종권 on 2023/11/01.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var b: B? = B()
        b = nil
    }
}

class A {
    private var closureEscaper: ((String) -> ())?

    func escape(closure: @escaping (String) -> ()) {
        closureEscaper = closure
    }
}

class B {
    var name = "Jake"
    let a = A()

    init() {
        a.escape { string in
            self.name = string
        }
    }

    deinit {
        print("DEINIT: B")
    }
}
