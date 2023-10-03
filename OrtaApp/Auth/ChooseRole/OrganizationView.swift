//
//  OrganizationView.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 03.10.2023.
//

import UIKit
import SnapKit

final class OrganizationView: UIView {

    // MARK: - UI
    private lazy var buildingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.building.uiImage
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var organizationTitleButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBackground
        button.setTitleColor(AppColor.blackLabel.uiColor, for: .normal)
        button.setTitle("Организация", for: .normal)
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
        addSubview(buildingImageView)
        addSubview(organizationTitleButton)
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        buildingImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.centerY.equalToSuperview()
        }

        organizationTitleButton.snp.makeConstraints { make in
            make.leading.equalTo(buildingImageView.snp.trailing).offset(16)
            make.centerY.equalToSuperview()
        }
    }
}
