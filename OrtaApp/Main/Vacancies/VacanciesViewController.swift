//
//  VacanciesViewController.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 11.10.2023.
//

import UIKit
import SnapKit

final class VacanciesViewController: UIViewController {

    // MARK: - UI
    private lazy var navigationView: NavigationView = {
        let view = NavigationView()
        view.backgroundColor = .white
        return view
    }()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }
    // MARK: - Setup Views

    private func setupViews() {
        view.backgroundColor = AppColor.backgroundMain.uiColor

        [navigationView].forEach {
            view.addSubview($0)
        }
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        navigationView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(-47)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }

    // MARK: - Actions

    @objc private func didPressedBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
}
