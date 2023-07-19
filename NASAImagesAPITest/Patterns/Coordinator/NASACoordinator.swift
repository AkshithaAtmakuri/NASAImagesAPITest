//
//  NASACoordinator.swift
//  NASAImagesAPITest
//
//  Created by Akshitha atmakuri on 18/07/23.
//

import UIKit

class NASACoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    var children: [Coordinator]?
    
    func eventOccured(with type: Event) {
        switch type {
        case .startButtonWasClicked:
            var vc: UIViewController & Coordinating = NASATabBarController(
                nasaService: Injection.shared.makeContainer().resolve(NASAServiceProtocol.self),
                animation: Injection.shared.makeContainer().resolve(AnimationClassProtocol.self),
                factory: Injection.shared.makeContainer().resolve(NASAScreenFactoryProtocol.self)
            )
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func start() {
        var vc: UIViewController & Coordinating = NASAStartViewController()
        vc.coordinator = self
        navigationController?.setViewControllers([vc],
                                                 animated: false)
    }
}
