////
////  SegmentedButtonsView.swift
////  OrtaApp
////
////  Created by Алишер Сайдешев on 22.10.2023.
////
//
//import UIKit
//
//final class SegmentedButtonsView: UIView {
//
//    // MARK: - Properties
//    let cellId = "cellId"
//    let tabNames = ["Орг. и компаний", "События", "Жалобы на посты",
//                      "Жалобы на профили", "Help Center", "Reports"]
//
//    // MARK: - UI
//    lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let collectioView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
//        collectioView.backgroundColor = .white
//        collectioView.dataSource = self
//        collectioView.delegate = self
//        return collectioView
//    }()
//
//
//    // MARK: - Lifecycle
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//
//        addSubview(collectionView)
//
//        let selectedIndexPath = IndexPath(item: 0, section: 0)
//        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .bottom)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//
//
//}
//
//extension MenuBar: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return tabNames.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView,
//                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId,
//                                                      for: indexPath) as! MenuCell
//
//        cell.imageView.image = UIImage(named: tabNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
//        cell.tintColor = AppColor.blue.uiColor
//
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: frame.width / 4, height: frame.height)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//}
//
//final class MenuCell: UIView {
//
//    let imageView: UIImageView = {
//        let iv = UIImageView()
//        iv.image = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
//        iv.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
//        return iv
//    }()
//
//    override var isHighlighted: Bool {
//        didSet {
//            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
//        }
//    }
//
//    override var isSelected: Bool {
//        didSet {
//            imageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
//        }
//    }
//
//    override func setupViews() {
//        super.setupViews()
//
//        addSubview(imageView)
//        addConstraintsWithFormat("H:[v0(28)]", views: imageView)
//        addConstraintsWithFormat("V:[v0(28)]", views: imageView)
//
//        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
//        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
//    }
//
//}
//
