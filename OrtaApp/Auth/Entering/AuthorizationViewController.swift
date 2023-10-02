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

    private lazy var smsEditImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.smsEdit.uiImage
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var authorizationLoginTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.font = AppFont.regular.s17()
        textField.textColor = AppColor.blackLabel.uiColor
        textField.textAlignment = .left
        textField.attributedPlaceholder = NSAttributedString(string: "Email",
                                                             attributes:
                                                                [NSAttributedString.Key.foregroundColor:
                                                                AppColor.placeholderColor.uiColor]
        )
        textField.leftView = smsEditImageView
        textField.leftViewMode = .always
        return textField
    }()

    private lazy var eyeClosedButton: UIButton = {
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.image = AppImage.eye.uiImage
            let button = UIButton(configuration: configuration)
            button.tintColor = .lightGray
            return button
        } else {
            let button = UIButton(type: .system)
            button.tintColor = .lightGray
            button.setImage(AppImage.eye.systemImage, for: [])
            button.contentEdgeInsets = UIEdgeInsets(top: 12,
                                                    left: 0,
                                                    bottom: 12,
                                                    right: 16)
            return button
        }
    }()

    private lazy var authorizationPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.font = AppFont.regular.s17()
        textField.textColor = AppColor.blackLabel.uiColor
        textField.textAlignment = .left
        textField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                             attributes:
                                                                [NSAttributedString.Key.foregroundColor:
                                                                AppColor.placeholderColor.uiColor]
        )
        textField.rightView = eyeClosedButton
        textField.rightViewMode = .always
//        textField.leftView = smsEditImageView
//        textField.leftViewMode = .always
        textField.isSecureTextEntry = false
        return textField
    }()

    private lazy var enterAccButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.backgroundColor = AppColor.blue.uiColor
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = AppFont.semibold.s17()
        button.setTitle("Войти", for: .normal)
        return button
    }()

    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(AppColor.blue.uiColor, for: .normal)
        button.titleLabel?.font = AppFont.regular.s15()
        button.setTitle("Забыли пароль?", for: .normal)
        return button
    }()

    private lazy var notHaveAccButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.backgroundColor = AppColor.doesnthaveAccount.uiColor
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = AppFont.semibold.s17()
        button.setTitle("У меня нету аккаунта", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }

    // MARK: - Setup Views

    private func setupViews() {
        view.backgroundColor = .white

        [backgroundAuthorizationView, smsEditImageView, authorizationLoginTextField,
         authorizationPasswordTextField,
         enterAccButton, forgotPasswordButton, notHaveAccButton].forEach {
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

        authorizationPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(authorizationLoginTextField.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(56)
        }

        enterAccButton.snp.makeConstraints { make in
            make.top.equalTo(authorizationPasswordTextField.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(64)
        }

        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(enterAccButton.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(18)
        }

        notHaveAccButton.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(183)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(64)
        }

        setupTextFieldConstraints()
    }

    private func setupTextFieldConstraints() {
        smsEditImageView.snp.makeConstraints { make in
            make.top.equalTo(backgroundAuthorizationView.snp.bottom).offset(80)
            make.trailing.equalTo(authorizationLoginTextField.snp.leading).offset(-16)
        }

        authorizationLoginTextField.snp.makeConstraints { make in
            make.top.equalTo(backgroundAuthorizationView.snp.bottom).offset(80)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(56)
        }
    }
}

