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

        let raisedYPosition = frame.origin.y - 20
        let raisedFrame = CGRect(x: frame.origin.x,
                                 y: raisedYPosition,
                                 width: frame.size.width,
                                 height: frame.size.height + 20)

        setup()
        //        setupConstraints()
    }

    required init?(coder: NSCoder) { nil }

    private func setup() {
        layer.borderColor = UIColor.systemGray6.cgColor
        layer.borderWidth = 1
        layer.masksToBounds = true
        layer.cornerRadius = 20
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        //        frame = CGRect(x: 10, y: 10, width: 348, height: 56)
    }
}
