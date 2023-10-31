//
//  BanCaseView.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 16.10.2023.
//

import UIKit
import SnapKit

final class BanCaseView: UIView {

    // MARK: - UI
    private lazy var caseTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Осталось кейсов"
        label.font = AppFont.regular.s17()
        label.textColor = AppColor.blackLabel.uiColor
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()

    private lazy var caseNumbersLabel: UILabel = {
        let label = UILabel()
        label.text = "12"
        label.font = AppFont.regular.s17()
        label.textColor = AppColor.blackLabel.uiColor
        label.numberOfLines = 1
        label.textAlignment = .center
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

        addSubview(caseTitleLabel)
        addSubview(caseNumbersLabel)
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        caseTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.centerY.equalToSuperview()
        }

        caseNumbersLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-24)
            make.centerY.equalToSuperview()
        }
    }
}
