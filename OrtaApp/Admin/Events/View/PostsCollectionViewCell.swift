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
    static let cellID = String(describing: PostsCollectionViewCell.self)
    private let heightObjects: Int = 48

    // MARK: - UI

    private lazy var topPostView: TopPostEventsView = {
        let view = TopPostEventsView()
        view.backgroundColor = .white
        return view
    }()

    private lazy var postEventLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Страница после нажатия на пост(ивент),где
        пользыватель сможет написать коменты или
        прочитать их
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

    private lazy var commentsView: CommentPostView = {
        let view = CommentPostView()
        view.backgroundColor = .white
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
        [topPostView, postEventLabel, postImageView, commentsView].forEach {
            contentView.addSubview($0)
        }
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        topPostView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(heightObjects)
        }

        postEventLabel.snp.makeConstraints { make in
            make.top.equalTo(topPostView.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }

        postImageView.snp.makeConstraints { make in
            make.top.equalTo(postEventLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
//            make.height.equalTo(220)
        }
        
        commentsView.snp.makeConstraints { make in
            make.top.equalTo(postImageView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(heightObjects)
        }
    }
}
