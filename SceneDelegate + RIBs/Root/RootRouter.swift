//
//  RootRouter.swift
//  SceneDelegate + RIBs
//
//  Created by Zedd on 2020/01/14.
//  Copyright © 2020 Zedd. All rights reserved.
//

import RIBs

protocol RootInteractable: Interactable, ChildListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    var childBuilder: ChildBuildable
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable, viewController: RootViewControllable, childBuilder: ChildBuildable) {
        //super.init(interactor: interactor, viewController: viewController, childBuilder: ChildBuildable)
        self.childBuilder = childBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func showChild(with string: String) {
        let child = self.childBuilder.build(withListener: self.interactor)
        self.attachChild(child)
    }
}
