//
//  JinnyInteractor.swift
//  SceneDelegate + RIBs
//
//  Created by Zedd on 2020/01/19.
//  Copyright © 2020 Zedd. All rights reserved.
//

import RIBs
import RxSwift

protocol JinnyRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol JinnyPresentable: Presentable {
    var listener: JinnyPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol JinnyListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class JinnyInteractor: PresentableInteractor<JinnyPresentable>, JinnyInteractable, JinnyPresentableListener {

    weak var router: JinnyRouting?
    weak var listener: JinnyListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: JinnyPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
