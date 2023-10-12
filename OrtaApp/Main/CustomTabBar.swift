//
//  CustomTabBar.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 11.10.2023.
//

import UIKit
import SnapKit

final class CustomTabBar: UITabBar {

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    required init?(coder: NSCoder) { nil }

    private func setup() {
        layer.borderColor = UIColor.systemGray6.cgColor
        layer.borderWidth = 1
        layer.masksToBounds = true
        layer.cornerRadius = 20
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}
