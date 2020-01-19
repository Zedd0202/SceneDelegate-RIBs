//
//  ZeddBuilder.swift
//  SceneDelegate + RIBs
//
//  Created by Zedd on 2020/01/19.
//  Copyright © 2020 Zedd. All rights reserved.
//

import RIBs

protocol ZeddDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class ZeddComponent: Component<ZeddDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol ZeddBuildable: Buildable {
    func build(withListener listener: ZeddListener) -> ZeddRouting
}

final class ZeddBuilder: Builder<ZeddDependency>, ZeddBuildable {

    override init(dependency: ZeddDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: ZeddListener) -> ZeddRouting {
        let component = ZeddComponent(dependency: dependency)
        let viewController = ZeddViewController()
        let interactor = ZeddInteractor(presenter: viewController)
        interactor.listener = listener
        return ZeddRouter(interactor: interactor, viewController: viewController)
    }
}
