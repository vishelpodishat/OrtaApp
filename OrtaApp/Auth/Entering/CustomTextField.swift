//
//  EnterAccTextField.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 02.10.2023.
//

import UIKit
import SnapKit

final class CustomTextField: UITextField {

    // MARK: - UI

    private lazy var personPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.smsEdit.uiImage
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    
//    private lazy var eyeClosedButton: UIButton = {
//        if #available(iOS 15.0, *) {
//            var configuration = UIButton.Configuration.plain()
//            configuration.image = AppImage.eye_button.uiImage
//            let button = UIButton(configuration: configuration)
//            button.tintColor = .lightGray
//            return button
//        } else {
//            let button = UIButton(type: .system)
//            button.tintColor = .lightGray
//            button.setImage(AppImage.eye_button.systemImage, for: [])
//            button.contentEdgeInsets = UIEdgeInsets(top: 12,
//                                                    left: 0,
//                                                    bottom: 12,
//                                                    right: 16)
//            return button
//        }
//    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setupConstraints()
        setupUnderLineTextField()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup UnderlineTextField

    private func setupUnderLineTextField() {
        let bottomLayer = CALayer()
        bottomLayer.frame = CGRect(x: 0,
                                   y: self.frame.height,
                                   width: self.frame.width - 24,
                                   height: 1)
        bottomLayer.backgroundColor = AppColor.underLineColor.cgColor
        self.layer.addSublayer(bottomLayer)
    }

    private func setupLeftImageTextField(image: UIImage) {
        self.leftViewMode = .always
        let leftView = UIImageView(frame: CGRect(x: 0,
                                                 y: self.frame.height / 2 - 10,
                                                 width: 28, height: 28))
        leftView.image = image
        self.addSubview(leftView)
    }


    // MARK: - Setup Views

    private func setupViews() {
        addSubview(personPhotoImageView)
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        personPhotoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview().offset(-14)
        }
    }
}
