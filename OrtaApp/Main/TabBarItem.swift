//
//  TabBarItem.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 11.10.2023.
//

import UIKit

enum TabItem: Int {
    case main
    case search
    case chats
    case notification
    case vacancies

    var image: UIImage? {
        switch self {
        case .main: return AppImage.homeTabBar.uiImage
        case .search: return AppImage.searchTabBar.uiImage
        case .chats: return AppImage.chatTabBar.uiImage
        case .notification: return AppImage.notificationTabBar.uiImage
        case .vacancies: return AppImage.vacanciesTabBar.uiImage
        }
    }

    var selectedImage: UIImage? {
        switch self {
        case .main: return AppImage.homeFullTabBar.uiImage
        case .search: return AppImage.searchFullTabBar.uiImage
        case .chats: return AppImage.chatFullTabBar.uiImage
        case .notification: return AppImage.notificationFullTabBar.uiImage
        case .vacancies: return AppImage.vacanciesFullTabBar.uiImage
        }
    }
}
