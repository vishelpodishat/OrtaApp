//
//  TopPostEventsView.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 06.11.2023.
//

import UIKit
import SnapKit

final class TopPostEventsView: UIView {

    // MARK: - Properties
    private let heightObjects: Int = 32

    // MARK: - UI
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.adminImageLogo.uiImage
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var nicknamePostLabel: UILabel = {
        let label = UILabel()
        label.text = "calm"
        label.font = AppFont.regular.s15()
        label.textColor = .black
        return label
    }()

    private lazy var hoursAgoLabel: UILabel = {
        let label = UILabel()
        label.text = "4 часа назад"
        label.font = AppFont.regular.s13()
        label.textColor = AppColor.placeholderColor.uiColor
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

        [profileImageView, nicknamePostLabel, hoursAgoLabel, moreButton].forEach {
            addSubview($0)
        }
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.size.equalTo(28)
        }

        nicknamePostLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(9)
            make.centerY.equalToSuperview()
        }

        hoursAgoLabel.snp.makeConstraints { make in
            make.leading.equalTo(nicknamePostLabel.snp.trailing).offset(9)
            make.centerY.equalToSuperview()
        }

        moreButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}

private extension TopPostEventsView {

    // MARK: - Actions
    @objc private func didTapMoreButton() {
        //
    }
}
