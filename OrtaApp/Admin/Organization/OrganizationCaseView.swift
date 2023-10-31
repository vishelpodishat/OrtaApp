//
//  OrganizationCaseView.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 31.10.2023.
//

import UIKit
import SnapKit

final class OrganizationCaseView: UIView {

    // MARK: - UI
    private lazy var companyTitleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.bold.s19()
        label.textColor = AppColor.blackLabel.uiColor
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()

    private lazy var moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(AppImage.moreImageView.uiImage, for: .normal)
        button.addTarget(self, action: #selector(didTapMoreButton), for: .touchUpInside)
        return button
    }()

    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        return stackView
    }()

    private lazy var statusImageView: UIImageView = {
        let iconView = UIImageView()
        iconView.contentMode = .scaleAspectFill
        return iconView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.blackLabel.uiColor
        label.font = AppFont.regular.s15()
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()

    // MARK: - LifeCycle
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
        backgroundColor = .white

        [companyTitleLabel, moreButton, infoStackView].forEach {
            self.addSubview($0)
        }

        [statusImageView, titleLabel].forEach {
            infoStackView.addArrangedSubview($0)
        }
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        companyTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
        }

        moreButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalTo(companyTitleLabel.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.size.equalTo(24)
        }

        infoStackView.snp.makeConstraints { make in
            make.top.equalTo(moreButton.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-100)
            make.height.equalTo(18)
        }
        
        statusImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.size.equalTo(18)
        }

        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(statusImageView.snp.trailing).offset(8)
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }

    }

    // MARK: - Public Properites
    public func configure(with model: OrganizationCasesModel) {
        companyTitleLabel.text = model.companyName
        statusImageView.image = model.icon
        titleLabel.text = model.title
    }
}


private extension OrganizationCaseView {

    // MARK: - Actions
    @objc private func didTapMoreButton() {
        //
    }
}
