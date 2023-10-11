//
//  ConfirmAccViewController.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 06.10.2023.
//

import UIKit
import ImageIO
import SnapKit

final class ConfirmAccViewController: UIViewController {

    // MARK: - UI
    private lazy var registrationSuccessTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Подтверждение аккаунта"
        label.font = AppFont.extrabold.s34()
        label.textColor = AppColor.blackLabel.uiColor
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()

    private lazy var successEmailLabel: UILabel = {
        let label = UILabel()
        label.text = "В данный момент ваш аккаунт под почтой sultanbeksa********@gmail.com проходит модерацию"
        label.font = AppFont.regular.s15()
        label.textColor = AppColor.blackLabel.uiColor
        label.numberOfLines = 3
        label.textAlignment = .left
        return label
    }()

    private lazy var loadingGifImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.gifImageWithName("DoubleRing")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
        setupNavigationBar()
    }

    // MARK: - Setup Navigation Controller
    private func setupNavigationBar() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: AppImage.arrowLeft.uiImage,
            style: .plain,
            target: self,
            action: #selector(didPressedBackButton))
        self.navigationController?.navigationBar.tintColor = AppColor.blue.uiColor
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

//    // MARK: - Timer Action
//    let timer = Timer.scheduledTimer(timeInterval: 3,
//                                     target: nil,
//                                     selector: #selector(showVC),
//                                     userInfo: nil,
//                                     repeats: false)
//
//    @objc private func showVC() {
//        let controller = AuthorizationViewController()
//        self.present(controller, animated: true)
//    }

    // MARK: - Setup Views

    private func setupViews() {
        view.backgroundColor = .white

        [registrationSuccessTitleLabel, successEmailLabel, loadingGifImageView].forEach {
            view.addSubview($0)
        }
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        registrationSuccessTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(8)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }

        successEmailLabel.snp.makeConstraints { make in
            make.top.equalTo(registrationSuccessTitleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }

        loadingGifImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.size.equalTo(100)
        }
    }

    // MARK: - Actions

    @objc private func didPressedBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
}
