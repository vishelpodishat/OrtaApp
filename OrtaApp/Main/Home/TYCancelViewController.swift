//
//  TYCancelViewController.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 23.10.2023.
//

import UIKit
import SnapKit

final class TYCancelViewController: UIViewController {

    // MARK: - UI
    private lazy var teaIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.teaIcon.uiImage
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var cancelSuccessLabel: UILabel = {
        let label = UILabel()
        label.text = "Отмена прошла успешно"
        label.font = AppFont.extrabold.s34()
        label.textColor = AppColor.blackLabel.uiColor
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()

    private lazy var moneyBackLabel: UILabel = {
        let label = UILabel()
        label.text = 
        "Ваши средства будут возвращены в течении 3-5 рабочих дней на вашу банковскую карту mastercard・3425"
        label.font = AppFont.regular.s15()
        label.textColor = AppColor.blackLabel.uiColor
        label.numberOfLines = 3
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

        [teaIconImageView, cancelSuccessLabel,
         moneyBackLabel, closeButton].forEach {
            view.addSubview($0)
        }
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        teaIconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.centerX.equalToSuperview()
        }

        cancelSuccessLabel.snp.makeConstraints { make in
            make.top.equalTo(teaIconImageView.snp.bottom)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }

        moneyBackLabel.snp.makeConstraints { make in
            make.top.equalTo(cancelSuccessLabel.snp.bottom).offset(16)
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
