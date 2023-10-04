//
//  RegistrationTableViewCell.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 04.10.2023.
//

import UIKit

class RegistrationTableViewCell: UITableViewCell {

    // MARK: - ID

    public static let cellID = String(describing: RegistrationTableViewCell.self)

    // MARK: Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Views

    private func setupViews() {

    }

    // MARK: - Setup Constraints

    private func setupConstraints() {

    }
}
