//
//  RegistrationTableViewCell.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 04.10.2023.
//

import UIKit
import SnapKit
import SkyFloatingLabelTextField

class RegistrationTableViewCell: UITableViewCell {

    // MARK: - ID
    public static let cellID = String(describing: RegistrationTableViewCell.self)

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
        }
    }
}

extension RegistrationTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
