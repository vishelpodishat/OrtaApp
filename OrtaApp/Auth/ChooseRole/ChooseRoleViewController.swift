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

    private lazy var userTitleButton: UIButton = {
        let button = UIButton(type: .system)
        button.configuration = .bordered()
        button.configuration?.baseBackgroundColor = .white
        button.configuration?.baseForegroundColor = .black
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 24
        button.layer.borderWidth = 1
        button.layer.borderColor = AppColor.underLineColor.cgColor
        button.configuration?.image = AppImage.personImage.uiImage
        button.contentHorizontalAlignment = .leading
        button.configuration?.imagePadding = 16
        button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                      leading: 24,
                                                                      bottom: 0,
                                                                      trailing: 16)
        button.configuration?.attributedTitle = AttributedString("Пользователь",
                                                                 attributes:
                                                                    AttributeContainer(
                                                                        [NSAttributedString.Key.font:
                                                                            AppFont.regular.s14()]))
        return button
    }()

    private lazy var organizationTitleButton: UIButton = {
        let button = UIButton(type: .system)
        button.configuration = .bordered()
        button.configuration?.baseBackgroundColor = .white
        button.configuration?.baseForegroundColor = .black
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 24
        button.layer.borderWidth = 1
        button.layer.borderColor = AppColor.underLineColor.cgColor
        button.configuration?.image = AppImage.building.uiImage
        button.contentHorizontalAlignment = .leading
        button.configuration?.imagePadding = 16
        button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                      leading: 24,
                                                                      bottom: 0,
                                                                      trailing: 16)
        button.configuration?.attributedTitle = AttributedString("Организация",
                                                                 attributes:
                                                                    AttributeContainer(
                                                                        [NSAttributedString.Key.font:
                                                                            AppFont.regular.s14()]))
        return button
    }()


    private lazy var continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.backgroundColor = AppColor.blue.uiColor
        button.titleLabel?.font = AppFont.semibold.s17()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Далее", for: .normal)
        button.addTarget(self, action: #selector(didPressedContinueButton), for: .touchUpInside)
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
        view.backgroundColor = .white

        [titleHeaderLabel, chooseRoleLabel, userTitleButton,
         organizationTitleButton, continueButton].forEach {
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

        userTitleButton.snp.makeConstraints { make in
            make.top.equalTo(chooseRoleLabel.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(60)
        }

        organizationTitleButton.snp.makeConstraints { make in
            make.top.equalTo(userTitleButton.snp.bottom).offset(16)
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
        self.navigationController?.popViewController(animated: true)
    }

    @objc private func didPressedContinueButton() {
        let controller = RegistrationUserViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
