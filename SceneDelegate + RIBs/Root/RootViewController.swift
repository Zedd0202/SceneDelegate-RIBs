//
//  RootViewController.swift
//  SceneDelegate + RIBs
//
//  Created by Zedd on 2020/01/14.
//  Copyright © 2020 Zedd. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol RootPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class RootViewController: UIViewController, RootPresentable, RootViewControllable {

    weak var listener: RootPresentableListener?
    
    override func viewDidLoad() {
         super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
     }
}
