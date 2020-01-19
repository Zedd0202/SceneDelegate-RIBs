//
//  JinnyBuilder.swift
//  SceneDelegate + RIBs
//
//  Created by Zedd on 2020/01/19.
//  Copyright © 2020 Zedd. All rights reserved.
//

import RIBs

protocol JinnyDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class JinnyComponent: Component<JinnyDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol JinnyBuildable: Buildable {
    func build(withListener listener: JinnyListener) -> JinnyRouting
}

final class JinnyBuilder: Builder<JinnyDependency>, JinnyBuildable {

    override init(dependency: JinnyDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: JinnyListener) -> JinnyRouting {
        let component = JinnyComponent(dependency: dependency)
        let viewController = JinnyViewController()
        let interactor = JinnyInteractor(presenter: viewController)
        interactor.listener = listener
        return JinnyRouter(interactor: interactor, viewController: viewController)
    }
}
