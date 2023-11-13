//
//  CommentPostView.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 04.11.2023.
//

import UIKit
import SnapKit

final class CommentPostView: UIView {

    // MARK: - Properties
    private let heightObjects: Int = 32

    // MARK: - UI
    private lazy var arrowUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(AppImage.arrowUp.uiImage, for: .normal)
        return button
    }()

    private lazy var likeNumbersLabel: UILabel = {
        let label = UILabel()
        label.text = "234k"
        label.font = AppFont.regular.s13()
        label.textColor = AppColor.placeholderColor.uiColor
        label.textAlignment = .center
        return label
    }()

    private lazy var arrowDownButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(AppImage.arrowBottom.uiImage, for: .normal)
        return button
    }()

    private lazy var likesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 4
        return stackView
    }()

    private lazy var messageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(AppImage.messages.uiImage, for: .normal)
        return button
    }()

    private lazy var commentsNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "23"
        label.font = AppFont.regular.s13()
        label.textColor = AppColor.placeholderColor.uiColor
        label.textAlignment = .center
        return label
    }()

    private lazy var commentsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 4
        return stackView
    }()

    private lazy var sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(AppImage.sendMessage.uiImage, for: .normal)
        return button
    }()

    private lazy var sendNumbersLabel: UILabel = {
        let label = UILabel()
        label.text = "23"
        label.font = AppFont.regular.s13()
        label.textColor = AppColor.placeholderColor.uiColor
        label.textAlignment = .center
        return label
    }()

    private lazy var sendStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 4
        return stackView
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

        [arrowUpButton, likeNumbersLabel, arrowDownButton].forEach {
            likesStackView.addArrangedSubview($0)
        }

        [messageButton, commentsNumberLabel].forEach {
            commentsStackView.addArrangedSubview($0)
        }

        [sendButton, sendNumbersLabel].forEach {
            sendStackView.addArrangedSubview($0)
        }

        [likesStackView, commentsStackView, sendStackView].forEach {
            addSubview($0)
        }
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        likesStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.height.equalTo(heightObjects)
        }

        commentsStackView.snp.makeConstraints { make in
            make.leading.equalTo(likesStackView.snp.trailing).offset(82)
            make.centerY.equalToSuperview()
            make.height.equalTo(heightObjects)
        }

        sendStackView.snp.makeConstraints { make in
            make.leading.equalTo(commentsStackView.snp.trailing).offset(82)
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.height.equalTo(heightObjects)
        }
    }
}
