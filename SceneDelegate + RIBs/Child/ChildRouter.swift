//
//  ChildRouter.swift
//  SceneDelegate + RIBs
//
//  Created by Zedd on 2020/06/24.
//  Copyright © 2020 Zedd. All rights reserved.
//

import RIBs

protocol ChildInteractable: Interactable {
    var router: ChildRouting? { get set }
    var listener: ChildListener? { get set }
}

protocol ChildViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ChildRouter: ViewableRouter<ChildInteractable, ChildViewControllable>, ChildRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: ChildInteractable, viewController: ChildViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
