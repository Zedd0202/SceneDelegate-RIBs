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
    
    var jinny: ViewableRouting?
    var zedd: ViewableRouting?
    
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
        self.routeToJinny()
    }
    
    func routeToJinny() {
        if let zedd = self.zedd {
            self.detachChild(zedd)
            self.viewController.dismiss(viewController: zedd.viewControllable)
            self.zedd = nil
        }
        let jinny = self.jinnyBuilder.build(withListener: self.interactor)
        self.jinny = jinny
        self.attachChild(jinny)
        self.viewController.present(viewController: jinny.viewControllable)
    }
    
    func routeToZedd() {
        if let jinny = self.jinny {
            self.detachChild(jinny)
            self.viewController.dismiss(viewController: jinny.viewControllable)
            self.jinny = nil
        }
        let zedd = self.zeddBuilder.build(withListener: self.interactor)
        self.zedd = zedd
        self.attachChild(zedd)
        self.viewController.present(viewController: zedd.viewControllable)
    }
}
