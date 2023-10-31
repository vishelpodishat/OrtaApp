//
//  HelpCenterViewController.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 19.10.2023.
//

import UIKit
import SnapKit

final class HelpCenterViewController: UIViewController {

    // MARK: - UI
    private lazy var casesView: HelpCenterView = {
        let view = HelpCenterView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        return view
    }()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }
    // MARK: - Setup Views

    private func setupViews() {
        view.backgroundColor = .systemMint
        
        view.addSubview(casesView)
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        casesView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(186)
        }
    }
}
