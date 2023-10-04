//
//  ViewController.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 28.09.2023.
//

import UIKit
import SnapKit
import SkyFloatingLabelTextField

final class AuthorizationViewController: UIViewController {

    // MARK: - UI

    private lazy var backgroundAuthorizationView: AuthorizationBlueHeaderView = {
        let view = AuthorizationBlueHeaderView()
        view.backgroundColor = AppColor.blue.uiColor
        view.layer.cornerRadius = 32
        return view
    }()

    private lazy var authorizationTextField: SkyFloatingLabelTextField = {
        let textField = SkyFloatingLabelTextFieldWithIcon(frame: CGRect(x: 0,
                                                                        y: 0,
                                                                        width: 342,
                                                                        height: 56),
                                                          iconType: .image)
        textField.font = AppFont.regular.s17()
        textField.textColor = AppColor.blackLabel.uiColor
        textField.iconImage = AppImage.smsEdit.uiImage
        textField.iconMarginLeft = 16
        textField.iconWidth = 28
        textField.iconMarginBottom = 7
        textField.selectedTitleColor = AppColor.placeholderColor.uiColor
        textField.selectedLineHeight = 1.0
        textField.selectedLineColor = AppColor.placeholderColor.uiColor
        textField.textAlignment = .left
        textField.attributedPlaceholder = NSAttributedString(string: "Email",
                                                             attributes:
                                                                [NSAttributedString.Key.foregroundColor:
                                                                    AppColor.placeholderColor.uiColor]
        )
        textField.autocorrectionType = .no
        textField.keyboardType = .default
        textField.returnKeyType = .done
        return textField
    }()

    private lazy var passwordTextField: SkyFloatingLabelTextField = {
        let textField = SkyFloatingLabelTextFieldWithIcon(frame: CGRect(x: 0,
                                                                        y: 0,
                                                                        width: 342,
                                                                        height: 56),
                                                          iconType: .image)
        textField.font = AppFont.regular.s17()
        textField.textColor = AppColor.blackLabel.uiColor
        textField.iconImage = AppImage.smsEdit.uiImage
        textField.iconMarginLeft = 16
        textField.iconWidth = 28
        textField.iconMarginBottom = 7
        textField.selectedTitleColor = AppColor.placeholderColor.uiColor
        textField.selectedLineHeight = 1.0
        textField.selectedLineColor = AppColor.placeholderColor.uiColor
        textField.textAlignment = .left
        textField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                             attributes:
                                                                [NSAttributedString.Key.foregroundColor:
                                                                    AppColor.placeholderColor.uiColor]
        )
        textField.rightViewMode = .always
        eyeClosedButton.frame = CGRect(x: 0, y: 7, width: 28, height: 28)
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 28, height: 28))
        textField.rightView?.addSubview(eyeClosedButton)
        textField.autocorrectionType = .no
        textField.keyboardType = .default
        textField.returnKeyType = .done
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
            button.contentEdgeInsets = UIEdgeInsets(top: 0,
                                                    left: -16,
                                                    bottom: 0,
                                                    right: 40)
            return button
        }
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
        button.addTarget(self, action: #selector(didPressedNotHaveAccount), for: .touchUpInside)
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

        [backgroundAuthorizationView, authorizationTextField, passwordTextField,
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

        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(authorizationTextField.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(56)
        }

        enterAccButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(24)
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
        authorizationTextField.snp.makeConstraints { make in
            make.top.equalTo(backgroundAuthorizationView.snp.bottom).offset(80)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(56)
        }

//        passwordTextField.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//        }
    }

    // MARK: - Actions
    @objc private func didPressedNotHaveAccount() {
        let controller = ChooseRoleViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

