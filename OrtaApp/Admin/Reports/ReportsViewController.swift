//
//  ReportsViewController.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 19.10.2023.
//

import UIKit
import SnapKit

final class ReportsViewController: UIViewController {
    
    // MARK: - UI

    private lazy var reportsView: HelpCenterView = {
        let view = HelpCenterView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        view.sizeToFit()
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
        view.backgroundColor = AppColor.backgroundMain.uiColor
        view.addSubview(reportsView)

        reportsView.replyOrderButton.isHidden = true
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        reportsView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(reportsView.replyOrderButton.snp.bottom).offset(-40)
        }
    }
    
}
