//
//  NavigationView.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 12.10.2023.
//

import UIKit
import SnapKit

final class NavigationView: UIView {

    // MARK: - UI
    private lazy var vacanciesTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Вакансии"
        label.font = AppFont.bold.s19()
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()

    private lazy var addVacancyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(AppImage.addButton.uiImage, for: .normal)
        button.addTarget(self, action: #selector(didPressedAddVacancyButton), for: .touchUpInside)
        return button
    }()

    private lazy var filterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(AppImage.filter.uiImage, for: .normal)
        button.addTarget(self, action: #selector(didPressedFilterButton), for: .touchUpInside)
        return button
    }()

    private lazy var searchVacancyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(AppImage.searchVacancies.uiImage, for: .normal)
        button.addTarget(self, action: #selector(didPressedSearchVacancyButton), for: .touchUpInside)
        return button
    }()

    private lazy var stackViewButtons: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.spacing = 24
        return stackView
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Views

    private func setupViews() {
        [addVacancyButton, filterButton, searchVacancyButton].forEach {
            stackViewButtons.addArrangedSubview($0)
        }

        [vacanciesTitleLabel, stackViewButtons].forEach {
            addSubview($0)
        }
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        vacanciesTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16.5)
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16.5)
        }

        addVacancyButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }

        filterButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(addVacancyButton.snp.trailing).offset(24)
        }

        searchVacancyButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(filterButton.snp.trailing).offset(24)
        }

        stackViewButtons.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.leading.equalTo(vacanciesTitleLabel.snp.trailing).offset(134)
        }

        setupSize()
    }

    private func setupSize() {
        addVacancyButton.snp.makeConstraints { make in
            make.size.equalTo(28)
        }

        filterButton.snp.makeConstraints { make in
            make.size.equalTo(28)
        }

        searchVacancyButton.snp.makeConstraints { make in
            make.size.equalTo(28)
        }
    }

    // MARK: - Actions
    @objc private func didPressedAddVacancyButton() {
        //
    }

    @objc private func didPressedFilterButton() {
        //
    }

    @objc private func didPressedSearchVacancyButton() {
        //
    }
}
