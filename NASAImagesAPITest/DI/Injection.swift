//
//  Injection.swift
//  NASAImagesAPITest
//
//  Created by Akshitha atmakuri on 18/07/23.
//

import Swinject

final class Injection {
    
    static let shared = Injection()
    
    // MARK: - Init
    private init() {}
    
    func makeContainer()-> Container {
        // Container
        let container = Container()
    
        // API
        container.register(NASAServiceProtocol.self) { resolver in
            return NASAService()
        }
        // Factory
        container.register(NASAScreenFactoryProtocol.self) { _ in
            return NASAScreenFactory()
        }
                
        // ViewModel NASA Images
        container.register(NASAImageLibraryListViewViewModel.self) { resolver in
            let viewModel = NASAImageLibraryListViewViewModel(nasaService: resolver.resolve(NASAServiceProtocol.self))
            return viewModel
        }
        
        container.register(AnimationClassProtocol.self) { _ in
            return AnimationClass()
        }
        
        container.register(NASAScreenFactoryProtocol.self) { _ in
            return NASAScreenFactory()
        }
        return container
    }
}
