//
//  PhoneChangeSuccessController.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 02.11.2023.
//

import UIKit
import SnapKit

final class PhoneChangeSuccessController: UIViewController {

    // MARK: - UI
    private lazy var successImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.successPay.uiImage
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var successPhoneTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Номер телефона успешно изменен"
        label.font = AppFont.extrabold.s34()
        label.textColor = AppColor.blackLabel.uiColor
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()

    private lazy var successPhoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text =
        """
        Ваш новый номер в приложений
        +7(384) 324 32 12
        """
        label.font = AppFont.regular.s15()
        label.textColor = AppColor.blackLabel.uiColor
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()

    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.backgroundColor = AppColor.blue.uiColor
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = AppFont.semibold.s17()
        button.setTitle("Закрыть", for: .normal)
//        button.addTarget(self, action: #selector(didPressedCloseButton), for: .touchUpInside)
        return button
    }()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }
    // MARK: - Setup Views

    private func setupViews() {
        view.backgroundColor = .white

        [successImageView, successPhoneTitleLabel,
         successPhoneNumberLabel, closeButton].forEach {
            view.addSubview($0)
        }
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        successImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.centerX.equalToSuperview()
        }

        successPhoneTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(successImageView.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }

        successPhoneNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(successPhoneTitleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }

        closeButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(64)
        }
    }
}

