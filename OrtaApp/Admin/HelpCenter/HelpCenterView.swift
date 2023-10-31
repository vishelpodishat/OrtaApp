//
//  HelpCenterView.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 31.10.2023.
//

import UIKit
import SnapKit

final class HelpCenterView: UIView {

    // MARK: - UI
    private lazy var personPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.personHelpCenterImage.uiImage
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var personNicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "Geidt"
        label.font = AppFont.regular.s15()
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()

    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 9
        return stackView
    }()

    private lazy var caseCommentLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Help Center (нужно на админку добавить
        функцию просмотра вопросов - где админ
        напишет ответ как решить проблему)
        """
        label.font = AppFont.regular.s15()
        label.textColor = .black
        label.numberOfLines = 3
        label.textAlignment = .left
        return label
    }()

    private lazy var replyOrderButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = AppColor.blue.cgColor
        button.backgroundColor = .white
        button.setTitleColor(AppColor.blue.uiColor, for: .normal)
        button.titleLabel?.font = AppFont.regular.s15()
        button.setTitle("Ответить", for: .normal)
        return button
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
        backgroundColor = .black

        [personPhotoImageView, personNicknameLabel].forEach {
            titleStackView.addArrangedSubview($0)
        }

        [titleStackView, caseCommentLabel, replyOrderButton].forEach {
            addSubview($0)
        }
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        personPhotoImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.size.equalTo(28)
        }

        personNicknameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(personPhotoImageView.snp.trailing).offset(9)
            make.trailing.equalToSuperview()
        }
        
        titleStackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(48)
        }

        caseCommentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleStackView.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }

        replyOrderButton.snp.makeConstraints { make in
            make.top.equalTo(caseCommentLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(40)
        }
    }
}
