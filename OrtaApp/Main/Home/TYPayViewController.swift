//
//  TYPayViewController.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 23.10.2023.
//

import UIKit
import SnapKit
import PanModal

final class TYPayViewController: UIViewController {

    // MARK: - UI
    private lazy var successImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.successPay.uiImage
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var successPayLabel: UILabel = {
        let label = UILabel()
        label.text = "Оплата прошла"
        label.font = AppFont.extrabold.s34()
        label.textColor = AppColor.blackLabel.uiColor
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()

    private lazy var successEventLabel: UILabel = {
        let label = UILabel()
        label.text =
        "Теперь вы участник события которое \n пройдет 6 июня в 12:00. Мы отправим вам пуш-уведомление до начала события"
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
        button.addTarget(self, action: #selector(didPressedCloseButton), for: .touchUpInside)
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

        [successImageView, successPayLabel,
         successEventLabel, closeButton].forEach {
            view.addSubview($0)
        }
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        successImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.centerX.equalToSuperview()
        }

        successPayLabel.snp.makeConstraints { make in
            make.top.equalTo(successImageView.snp.bottom)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }

        successEventLabel.snp.makeConstraints { make in
            make.top.equalTo(successPayLabel.snp.bottom).offset(16)
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

    // MARK: - Actions
    @objc private func didPressedCloseButton() {
        let controller = PopUpCancellationEventViewController()
        presentPanModal(controller)
    }
}
