//
//  NASATabBarController.swift
//  NASAImagesAPITest
//
//  Created by Akshitha atmakuri on 18/07/23.
//

import UIKit
import SDWebImage

final class NASATabBarController: UITabBarController, Coordinating {
    
    private let nasaService: NASAServiceProtocol?
    private let animation: AnimationClassProtocol?
    private let factory: NASAScreenFactoryProtocol?
    
    var coordinator: Coordinator?
    
    private let button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = button.frame.width / 2
        button.clipsToBounds = true
        return button
    }()
    private var isStart: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        UITabBar.appearance().tintColor = UIColor.black
        view.backgroundColor = .systemBackground
        SetUpTabs()
//        createMiddleButton()
    }
    
    // MARK: - Init
    init(nasaService: NASAServiceProtocol?, animation: AnimationClassProtocol?, factory: NASAScreenFactoryProtocol?) {
        self.nasaService = nasaService
        self.animation = animation
        self.factory = factory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Override selectedViewController for User initiated changes
    override var selectedViewController: UIViewController? {
        didSet {
            tabChangedTo(selectedIndex: selectedIndex)
        }
    }
    // Override selectedIndex for Programmatic changes
    override var selectedIndex: Int {
        didSet {
            tabChangedTo(selectedIndex: selectedIndex)
        }
    }
    
    func tabChangedTo(selectedIndex: Int) {
        UserDefaults.standard.set(selectedIndex, forKey: "index")
        switch selectedIndex {
        case 0:
            break
        default:
            break
        }
    }
    
    private func SetUpTabs() {
        
//        guard let imageCategoriesVC = factory?.createNASAScreens(screen: .imagecategories) else {return}
        
        guard let imageCategoriesVC = factory?.createImageCategoriesScreens(screen: .nasaimages) else {return}
    
        setViewControllers([imageCategoriesVC], animated: true)
    }
    
    private func createMiddleButton() {
        button.setImage(UIImage(named: "NASA"), for: .normal)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 32
        button.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        button.center = CGPoint(x: tabBar.frame.width / 2, y: tabBar.frame.height / 2 - 10)
        button.addTarget(self, action: #selector(VoiceCommands), for: .touchUpInside)
        tabBar.addSubview(button)
    }
    
    @objc private func VoiceCommands(_ sender: UIButton) {
        
    }
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        animation?.TabBarItemAnimation(item: item)
    }
}
