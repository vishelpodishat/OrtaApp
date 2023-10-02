//
//  ViewController.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 28.09.2023.
//

import UIKit
import SnapKit

final class AuthorizationViewController: UIViewController {

    // MARK: - UI

    private lazy var backgroundAuthorizationView: AuthorizationBlueHeaderView = {
        let view = AuthorizationBlueHeaderView()
        view.backgroundColor = AppColor.blue.uiColor
        view.layer.cornerRadius = 32
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }

    // MARK: - Setup Views

    private func setupViews() {
        view.backgroundColor = .white

        [backgroundAuthorizationView].forEach {
            view.addSubview($0)
        }
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        backgroundAuthorizationView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(4)
            make.trailing.equalToSuperview().offset(-4)
            make.height.equalTo(217)
        }
    }
}

