//
//  AdminCollectionViewCell.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 16.10.2023.
//

import UIKit
import SnapKit

final class AdminCollectionViewCell: UICollectionViewCell {

    // MARK: - Public Properties
    static let cellID = String(describing: AdminCollectionViewCell.self)

    // MARK: - States
    override var isSelected: Bool {
        didSet {
            underlineView.isHidden = !isSelected
        }
    }

    // MARK: - UI

    private lazy var collectionLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.medium.s15()
        label.textColor = AppColor.blackLabel.uiColor
        return label
    }()

    private lazy var underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.blue.uiColor
        view.layer.cornerRadius = 5
        view.isHidden = true
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
        contentView.addSubview(collectionLabel)
        contentView.addSubview(underlineView)
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        collectionLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        underlineView.snp.makeConstraints { make in
            make.top.equalTo(collectionLabel.snp.bottom).offset(9)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(4)
        }
    }

    // MARK: Public Properties
    public func configureCell(with model: ItemsSegmentedControl) {
        collectionLabel.text = model.name
    }
}
