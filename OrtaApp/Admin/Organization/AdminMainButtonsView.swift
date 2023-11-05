//
//  AdminMainButtonsView.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 04.11.2023.
//

import UIKit
import SnapKit

final class AdminMainButtonsView: UIView {

    // MARK: - UI
    private lazy var adminButton: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()

    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = view.frame.size.width / 2
        return view
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
        addSubview(backgroundView)
        backgroundView.addSubview(adminButton)
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        adminButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    // MARK: - Configure Buttons
    public func configure(with model: ButtonsAdminModel) {
        adminButton.setImage(model.imageName, for: .normal)
        backgroundView.backgroundColor = model.color
    }
}
