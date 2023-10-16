//
//  AppImages.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 02.10.2023.
//

import UIKit

protocol AppImageProtocol {
    var rawValue: String { get }
}

extension AppImageProtocol {

    var uiImage: UIImage? {
        guard let image = UIImage(named: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }

    var systemImage: UIImage? {
        guard let image = UIImage(systemName: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }
}

enum AppImage: String, AppImageProtocol {
    case smsEdit
    case eyeSlash
    case eye
    case building
    case checkmarkBlue
    case personImage
    case arrowLeft
    case profileUsers
    case passwordCheck
    case location
    case link
    case home
    case call
    case calendarTick
    case cake
    case homeTabBar
    case chatTabBar
    case notificationTabBar
    case searchTabBar
    case vacanciesTabBar
    case chatFullTabBar
    case homeFullTabBar
    case notificationFullTabBar
    case searchFullTabBar
    case vacanciesFullTabBar
    case searchVacancies
    case filter
    case addButton
    case adminImageLogo
    case arrowDown
    case timeAdminButton
    case deleteAdminButton
    case checkAdminButton
}

