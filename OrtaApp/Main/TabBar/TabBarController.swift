//
//  TabBarController.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 11.10.2023.
//

import UIKit

final class TabBarController: UITabBarController {

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
    }

    private func setupTabBar() {
        setValue(CustomTabBar(), forKey: "tabBar")
        view.backgroundColor = .white
        let main = UINavigationController(rootViewController: HomeMainViewController())
        let search = UINavigationController(rootViewController: SearchViewController())
        let chats = UINavigationController(rootViewController: ChatsViewController())
        let notification = UINavigationController(rootViewController: NotificationsViewController())
        let vacancies = UINavigationController(rootViewController: VacanciesViewController())
        main.tabBarItem = tabItem(for: .main)
        search.tabBarItem = tabItem(for: .search)
        chats.tabBarItem = tabItem(for: .chats)
        notification.tabBarItem = tabItem(for: .notification)
        vacancies.tabBarItem = tabItem(for: .vacancies)
        setViewControllers([main, search, chats, notification, vacancies], animated: true)
    }

    private func tabItem(for type: TabItem) -> UITabBarItem {
        let item = UITabBarItem(title: nil,
                     image: type.image,
                     selectedImage: type.selectedImage)
        item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        return item
    }
}
