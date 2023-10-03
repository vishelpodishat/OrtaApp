//
//  ChooseRoleViewController.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 03.10.2023.
//

import UIKit
import SnapKit

final class ChooseRoleViewController: UIViewController {

    // MARK: - UI
    private lazy var titleHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Кто вы"
        label.font = AppFont.extrabold.s34()
        label.textColor = AppColor.blackLabel.uiColor
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()

    private lazy var chooseRoleLabel: UILabel = {
        let label = UILabel()
        label.text = "Выберите роль в приложений"
        label.font = AppFont.regular.s15()
        label.textColor = AppColor.blackLabel.uiColor
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()

    private lazy var userBackgroundView: UserView = {
        let view = UserView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        view.layer.borderWidth = 1
        view.layer.borderColor = AppColor.underLineColor.cgColor
        return view
    }()

    private lazy var organzationBackgroundView: OrganizationView = {
        let view = OrganizationView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        view.layer.borderWidth = 1
        view.layer.borderColor = AppColor.underLineColor.cgColor
        return view
    }()

    private lazy var continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.backgroundColor = AppColor.blue.uiColor
        button.titleLabel?.font = AppFont.semibold.s17()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Далее", for: .normal)
        return button
    }()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
        setupNavigationBar()
    }

    // MARK: - Setup Navigation Controller
    private func setupNavigationBar() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: AppImage.arrowLeft.uiImage,
            style: .plain,
            target: self,
            action: #selector(didPressedBackButton))
        self.navigationController?.navigationBar.tintColor = AppColor.blue.uiColor
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    // MARK: - Setup Views

    private func setupViews() {
        view.backgroundColor = .systemBackground

        [titleHeaderLabel, chooseRoleLabel, userBackgroundView,
         organzationBackgroundView, continueButton].forEach {
            view.addSubview($0)
        }
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        titleHeaderLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(111)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }

        chooseRoleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleHeaderLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }

        userBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(chooseRoleLabel.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(60)
        }

        organzationBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(userBackgroundView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(60)
        }

        continueButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(16)
            make.height.equalTo(64)
        }
    }

    // MARK: - Actions

    @objc private func didPressedBackButton() {
        let controller = AuthorizationViewController()
        self.navigationController?.popViewController(animated: true)
    }
}
