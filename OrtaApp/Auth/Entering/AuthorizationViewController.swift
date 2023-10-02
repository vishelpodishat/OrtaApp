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

    private lazy var textFieldView: TextFieldView = {
        let view = TextFieldView()
        view.backgroundColor = .systemBackground
        return view
    }()

    private lazy var passwordView: PasswordTextFieldView = {
        let view = PasswordTextFieldView()
        view.backgroundColor = .systemBackground
        return view
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

        [backgroundAuthorizationView, textFieldView, passwordView,
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

        passwordView.snp.makeConstraints { make in
            make.top.equalTo(textFieldView.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(56)
        }

        enterAccButton.snp.makeConstraints { make in
            make.top.equalTo(passwordView.snp.bottom).offset(24)
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
        textFieldView.snp.makeConstraints { make in
            make.top.equalTo(backgroundAuthorizationView.snp.bottom).offset(80)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(56)
        }
    }
}

