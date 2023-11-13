//
//  EventsViewController.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 19.10.2023.
//

import UIKit
import SnapKit

final class EventsViewController: UIViewController {

    // MARK: - UI
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
//        layout.minimumInteritemSpacing = 10
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PostsCollectionViewCell.self,
                                forCellWithReuseIdentifier: PostsCollectionViewCell.cellID)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.layer.cornerRadius = 16
        collectionView.layer.maskedCorners = [.layerMinXMinYCorner,
                                              .layerMaxXMinYCorner,
                                              .layerMaxXMaxYCorner,
                                              .layerMinXMaxYCorner]
        return collectionView
    }()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }
    // MARK: - Setup Views

    private func setupViews() {
        view.backgroundColor = AppColor.backgroundMain.uiColor

        view.addSubview(collectionView)
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(390)
        }
    }
}

extension EventsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                                PostsCollectionViewCell.cellID,
                                                            for: indexPath) as? PostsCollectionViewCell else {
            fatalError("Could not cast to RegistrationTableViewCell")
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension EventsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cvRect = collectionView.frame
        return CGSize(width: cvRect.width, height: cvRect.height)
    }
}
