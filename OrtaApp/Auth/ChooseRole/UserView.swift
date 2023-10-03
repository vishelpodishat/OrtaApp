//
//  UserView.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 03.10.2023.
//

import UIKit
import SnapKit

final class UserView: UIView {

    // MARK: - UI
    private lazy var personIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.personImage.uiImage
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var userTitleButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBackground
        button.setTitleColor(AppColor.blackLabel.uiColor, for: .normal)
        button.setTitle("Пользователь", for: .normal)
        return button
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setupConstraints()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Views

    private func setupViews() {
        addSubview(personIconImageView)
        addSubview(userTitleButton)
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        personIconImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.centerY.equalToSuperview()
        }

        userTitleButton.snp.makeConstraints { make in
            make.leading.equalTo(personIconImageView.snp.trailing).offset(16)
            make.centerY.equalToSuperview()
        }
    }
}
