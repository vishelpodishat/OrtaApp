//
//  PopUpCancellationEventViewController.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 23.10.2023.
//

import UIKit
import SnapKit
import PanModal

final class PopUpCancellationEventViewController: UIViewController {

    // MARK: - UI

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Вы уверены?"
        label.font = AppFont.bold.s19()
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()

    private lazy var dissmissPopUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(AppImage.closeCircle.uiImage, for: .normal)
        button.addTarget(self, action: #selector(didTappedDissmissPopUpButton), for: .touchUpInside)
        return button
    }()

    private lazy var sectionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Что хотите отменить свое участие?"
        label.font = AppFont.regular.s17()
        label.textColor = AppColor.blackLabel.uiColor
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()

    private lazy var notCancellationButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.backgroundColor = AppColor.blue.uiColor
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Не отменять участие", for: .normal)
        button.titleLabel?.font = AppFont.semibold.s17()
        return button
    }()

    private lazy var dismissEventButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.backgroundColor = AppColor.doesnthaveAccount.uiColor
        button.setTitleColor(AppColor.blackLabel.uiColor, for: .normal)
        button.setTitle("Отменить участие", for: .normal)
        button.titleLabel?.font = AppFont.semibold.s17()
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

        [titleLabel, dissmissPopUpButton, sectionTitleLabel, 
         notCancellationButton, dismissEventButton].forEach {
            view.addSubview($0)
        }
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16.5)
            make.leading.equalToSuperview().offset(16)
        }

        dissmissPopUpButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.trailing.equalToSuperview().offset(-16)
            make.size.equalTo(28)
        }

        sectionTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16.5)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }

        notCancellationButton.snp.makeConstraints { make in
            make.top.equalTo(sectionTitleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(64)
        }

        dismissEventButton.snp.makeConstraints { make in
            make.top.equalTo(notCancellationButton.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(64)
        }
    }

    // MARK: - Actions
    @objc private func didTappedDissmissPopUpButton() {
        self.dismiss(animated: true)
    }
}

// MARK: - Pop Up
extension PopUpCancellationEventViewController: PanModalPresentable {

    var panScrollable: UIScrollView? {
        return nil
    }

    var shortFormHeight: PanModalHeight {
        return .contentHeight(271)
    }

    var longFormHeight: PanModalHeight {
        return .maxHeightWithTopInset(16.5)
    }
}
