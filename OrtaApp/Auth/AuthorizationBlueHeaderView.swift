//
//  AuthorizationBlueHeaderView.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 02.10.2023.
//

import UIKit
import SnapKit

final class AuthorizationBlueHeaderView: UIView {

    // MARK: - UI

    private lazy var authorizationHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать в Orta!"
        label.font = AppFont.extrabold.s34()
        label.textColor = .white
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
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
        addSubview(authorizationHeaderLabel)
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        authorizationHeaderLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-24)
        }
    }
}
