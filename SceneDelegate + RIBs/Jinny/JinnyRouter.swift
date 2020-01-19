//
//  JinnyRouter.swift
//  SceneDelegate + RIBs
//
//  Created by Zedd on 2020/01/19.
//  Copyright © 2020 Zedd. All rights reserved.
//

import RIBs

protocol JinnyInteractable: Interactable {
    var router: JinnyRouting? { get set }
    var listener: JinnyListener? { get set }
}

protocol JinnyViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class JinnyRouter: ViewableRouter<JinnyInteractable, JinnyViewControllable>, JinnyRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: JinnyInteractable, viewController: JinnyViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
