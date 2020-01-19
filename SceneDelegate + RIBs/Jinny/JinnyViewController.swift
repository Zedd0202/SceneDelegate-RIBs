//
//  JinnyViewController.swift
//  SceneDelegate + RIBs
//
//  Created by Zedd on 2020/01/19.
//  Copyright © 2020 Zedd. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol JinnyPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class JinnyViewController: UIViewController, JinnyPresentable, JinnyViewControllable {

    weak var listener: JinnyPresentableListener?
}
