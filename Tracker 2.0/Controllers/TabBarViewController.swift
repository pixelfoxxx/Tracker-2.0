//
//  TabBarViewController.swift
//  Tracker 2.0
//
//  Created by Юрий Клеймёнов on 15/06/2024.
//

import UIKit

final class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
}

extension TabBarViewController {
    private func setupTabBar() {
        tabBar.backgroundColor = Assets.Colors.background
        
        let trackersVC = TrackersViewController()
        trackersVC.tabBarItem = UITabBarItem(title: "Трекеры", image: UIImage(systemName: "record.circle"), selectedImage: UIImage(systemName: "record.circle.fill"))
        
        let statsVC = StatsViewController()
        statsVC.tabBarItem = UITabBarItem(title: "Статистика", image: UIImage(systemName: "hare.fill"), selectedImage: UIImage(systemName: "hare.fill"))
        
        let trackerNavController = UINavigationController(rootViewController: trackersVC)
        let statsNavController = UINavigationController(rootViewController: statsVC)
        
        viewControllers = [trackerNavController, statsNavController]
    }
}
