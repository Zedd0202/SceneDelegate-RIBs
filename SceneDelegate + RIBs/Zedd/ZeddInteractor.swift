//
//  ZeddInteractor.swift
//  SceneDelegate + RIBs
//
//  Created by Zedd on 2020/01/19.
//  Copyright © 2020 Zedd. All rights reserved.
//

import RIBs
import RxSwift

protocol ZeddRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol ZeddPresentable: Presentable {
    var listener: ZeddPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol ZeddListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func didMoveToJinny()
}

final class ZeddInteractor: PresentableInteractor<ZeddPresentable>, ZeddInteractable, ZeddPresentableListener {

    weak var router: ZeddRouting?
    weak var listener: ZeddListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: ZeddPresentable) {
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
    
    func moveToJinny() {
        self.listener?.didMoveToJinny()
    }
}
