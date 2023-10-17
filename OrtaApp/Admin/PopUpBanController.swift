//
//  PopUpBanController.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 18.10.2023.
//

import UIKit
import SnapKit
import PanModal

final class PopUpBanController: UIViewController {
    
    // MARK: - UI

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Вы уверены?"
        label.font = AppFont.bold.s19()
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()

    private lazy var sectionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Что хотите забанить этот профиль"
        label.font = AppFont.regular.s17()
        label.textColor = AppColor.blackLabel.uiColor
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()

    private lazy var banButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.backgroundColor = AppColor.red.uiColor
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Забанить", for: .normal)
        return button
    }()

    private lazy var dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.backgroundColor = AppColor.doesnthaveAccount.uiColor
        button.setTitleColor(AppColor.blackLabel.uiColor, for: .normal)
        button.setTitle("Отмена", for: .normal)
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

        [titleLabel, sectionTitleLabel, banButton, dismissButton].forEach {
            view.addSubview($0)
        }
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16.5)
            make.leading.equalToSuperview().offset(16)
        }

        sectionTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16.5)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }

        banButton.snp.makeConstraints { make in
            make.top.equalTo(sectionTitleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(-16)
            make.height.equalTo(64)
        }

        dismissButton.snp.makeConstraints { make in
            make.top.equalTo(banButton.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(-16)
            make.height.equalTo(64)
        }
    }
}
