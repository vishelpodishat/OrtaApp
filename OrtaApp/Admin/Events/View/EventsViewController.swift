//
//  EventsViewController.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 19.10.2023.
//

import UIKit

final class EventsViewController: UIViewController {

    // MARK: - UI
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        layout.estimatedItemSize = CGSize(width: view.frame.width,
                                          height: view.frame.height)
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
