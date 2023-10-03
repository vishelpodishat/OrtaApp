//
//  PasswordTextFieldView.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 02.10.2023.
//

import UIKit
import SnapKit

final class PasswordTextFieldView: UIView {

    // MARK: - UI
    private lazy var smsEditImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.smsEdit.uiImage
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var authorizationTextField: UITextField = {
        let textField = UITextField()
        textField.font = AppFont.regular.s17()
        textField.textColor = AppColor.blackLabel.uiColor
        textField.textAlignment = .left
        textField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                             attributes:
                                                                [NSAttributedString.Key.foregroundColor:
                                                                    AppColor.placeholderColor.uiColor]
        )
        textField.rightViewMode = .always
        textField.rightView = eyeClosedButton
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
            button.contentEdgeInsets = UIEdgeInsets(top: 12,
                                                    left: 0,
                                                    bottom: 12,
                                                    right: 16)
            return button
        }
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Views

    private func setupViews() {
        addSubview(smsEditImageView)
        addSubview(authorizationTextField)
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        smsEditImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        authorizationTextField.snp.makeConstraints { make in
            make.leading.equalTo(smsEditImageView.snp.trailing).offset(16)
//            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
        
        eyeClosedButton.snp.makeConstraints { make in
            make.size.equalTo(28)
        }
    }
}
