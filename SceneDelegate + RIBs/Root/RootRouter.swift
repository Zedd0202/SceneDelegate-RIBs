//
//  RootRouter.swift
//  SceneDelegate + RIBs
//
//  Created by Zedd on 2020/01/14.
//  Copyright © 2020 Zedd. All rights reserved.
//

import RIBs

protocol RootInteractable: Interactable, JinnyListener, ZeddListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    private let jinnyBuilder: JinnyBuildable
    private let zeddBuilder: ZeddBuildable
    init(interactor: RootInteractable,
         viewController: RootViewControllable,
         jinnyBuilder: JinnyBuildable,
         zeddBuilder: ZeddBuildable
         ) {
        self.jinnyBuilder = jinnyBuilder
        self.zeddBuilder = zeddBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        let jinny = self.jinnyBuilder.build(withListener: self.interactor)
        self.attachChild(jinny)
        self.viewController.present(viewController: jinny.viewControllable)
    }
    
    func routeToJinny() {
        
    }
    
    func routeToZedd() {
        
    }
}
