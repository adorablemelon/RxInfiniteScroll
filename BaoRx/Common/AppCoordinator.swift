//
//  AppCoordinator.swift
//  BaoRx
//
//  Created by DC4 on 13/01/2021.
//

import Foundation
import  UIKit
class AppCoordinator{
    private let window: UIWindow
    init(window:UIWindow) {
        self.window = window
    }
    func start(){
        let vc = MainViewController()
        let navigationController = UINavigationController(rootViewController: vc)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

