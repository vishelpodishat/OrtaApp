//
//  RegistrationTableViewCell.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 04.10.2023.
//

import UIKit
import SnapKit
import SkyFloatingLabelTextField

final class UserRegistrationTableViewCell: UITableViewCell {

    // MARK: - ID
    public static let cellID = String(describing: UserRegistrationTableViewCell.self)

    // MARK: - UI

    private lazy var customTextField: SkyFloatingLabelTextField = {
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
        textField.errorColor = AppColor.red.uiColor
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
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

    // MARK: Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        customTextField.frame = frame.inset(by: UIEdgeInsets(top: 8,
                                                             left: 0,
                                                             bottom: 0,
                                                             right: 0))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Views

    private func setupViews() {
        contentView.addSubview(customTextField)
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        customTextField.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(56)
        }
    }

    // MARK: - Public Configure

    public func configureCell(with model: RegistrationInfoModel) {
//        customTextField.ima = model.icon
        customTextField.attributedPlaceholder = NSAttributedString(
            string: model.title)
    }
}

extension UserRegistrationTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }

     @objc private func textFieldDidChange(_ textfield: UITextField) {
        if let text = textfield.text {
            if let floatingLabelTextField = textfield as? SkyFloatingLabelTextField {
                if(text.count < 3 || !text.contains("@")) {
                    floatingLabelTextField.errorMessage = "Invalid value"
                }
                else {
                    floatingLabelTextField.errorMessage = ""
                }
            }
        }
    }
}
