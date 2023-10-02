//
//  ViewController.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 28.09.2023.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {

    // MARK: - UI

    private lazy var backgroundAuthorizationView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.blue.uiColor
        view.layer.cornerRadius = 12
        return view
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
    }

    // MARK: - Setup Views

    private func setupViews() {

    }

    // MARK: - Setup Constraints

    private func setupConstraints() {

    }
}

