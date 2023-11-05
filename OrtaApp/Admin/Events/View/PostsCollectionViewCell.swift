//
//  PostsCollectionViewCell.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 23.10.2023.
//

import UIKit
import SnapKit

final class PostsCollectionViewCell: UICollectionViewCell {

    // MARK: - Public Properties
    public static let cellID = String(describing: PostsCollectionViewCell.self)

    // MARK: - UI

    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.adminImageLogo.uiImage
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var nicknamePostLabel: UILabel = {
        let label = UILabel()
        label.text = "manro11"
        label.font = AppFont.regular.s15()
        label.textColor = .black
        return label
    }()

    private lazy var hoursAgoLabel: UILabel = {
        let label = UILabel()
        label.text = "4 часа назад"
        label.font = AppFont.regular.s20()
        label.textColor = AppColor.placeholderColor.uiColor
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()

    private lazy var moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(AppImage.moreImageView.uiImage, for: .normal)
        button.addTarget(self, action: #selector(didTapMoreButton), for: .touchUpInside)
        return button
    }()

    private lazy var topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 9
        return stackView
    }()

    private lazy var photoFaceLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Страница после нажатия на пост(ивент),где
        пользыватель сможет написать коменты
        или прочитать их
        """
        label.font = AppFont.regular.s15()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()

    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.postImage.uiImage
        imageView.contentMode = .scaleAspectFit
        return imageView
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
        [postImageView, nicknamePostLabel, hoursAgoLabel, moreButton].forEach {
            topStackView.addSubview($0)
        }

        contentView.addSubview(topStackView)
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        postImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        nicknamePostLabel.snp.makeConstraints { make in
            make.leading.equalTo(postImageView.snp.trailing).offset(9)
            make.centerY.equalToSuperview()
        }

        hoursAgoLabel.snp.makeConstraints { make in
            make.leading.equalTo(nicknamePostLabel.snp.trailing).offset(9)
            make.centerY.equalToSuperview()
        }

        moreButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        topStackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(-16)
        }
    }

    // MARK: - Actions
    @objc private func didTapMoreButton() {
        //
    }
}
