//
//  EventsViewController.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 19.10.2023.
//

import UIKit

final class EventsViewController: UIViewController {

    // MARK: - UI
//    private lazy var collectionView: UICollectionView = {
////        let collectionView = UICollectionView(frame: .zero,
////                                              collectionViewLayout: createCompositionalLayout())
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.register(AdminCollectionViewCell.self,
//                                forCellWithReuseIdentifier: AdminCollectionViewCell.cellID)
//        collectionView.showsHorizontalScrollIndicator = false
//        return collectionView
//    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }
    // MARK: - Setup Views

    private func setupViews() {
        view.backgroundColor = .systemRed
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {

    }
}
