//
//  AppColor.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 02.10.2023.
//

import UIKit

protocol AppColorProtocol {
    var rawValue: String { get }
}

extension AppColorProtocol {

    var uiColor: UIColor {
        UIColor.init(named: rawValue) ?? .white
    }

    var cgColor: CGColor {
        return uiColor.cgColor
    }
}

enum AppColor: String, AppColorProtocol {
    case blue
    case blackLabel
    case placeholderColor
    case doesnthaveAccount
    case underLineColor
    case red
}
