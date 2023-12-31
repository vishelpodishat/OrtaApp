//
//  RegistrationCompanyViewController.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 07.10.2023.
//

import UIKit
import SnapKit

final class RegistrationCompanyViewController: UIViewController {

    // MARK: Private Properties

    private var data: [RegistrationInfoModel] = []

    // MARK: - UI
    private lazy var registrationTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация"
        label.font = AppFont.extrabold.s34()
        label.textColor = AppColor.blackLabel.uiColor
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CompanyRegistrationTableViewCell.self,
                           forCellReuseIdentifier: CompanyRegistrationTableViewCell.cellID)
        tableView.backgroundColor = .white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 56
        tableView.separatorStyle = .none
        return tableView
    }()

    private lazy var registrationButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.backgroundColor = AppColor.blue.uiColor
        button.titleLabel?.font = AppFont.semibold.s17()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Зарегистрироваться", for: .normal)
        button.addTarget(self, action: #selector(didPressedContinueButton), for: .touchUpInside)
        return button
    }()

    private lazy var iHaveAccButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.backgroundColor = AppColor.doesnthaveAccount.uiColor
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = AppFont.semibold.s17()
        button.setTitle("У меня нету аккаунта", for: .normal)
        button.addTarget(self, action: #selector(didPressedIHaveAccount), for: .touchUpInside)
        return button
    }()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
        setupNavigationBar()
        hideKeyboardWhenTappedAround()
        createData()
    }

    // MARK: - Setup Navigation Controller
    private func setupNavigationBar() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: AppImage.arrowLeft.uiImage,
            style: .plain,
            target: self,
            action: #selector(didPressedBackButton))
        self.navigationController?.navigationBar.tintColor = AppColor.blue.uiColor
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    // MARK: - Setup Views

    private func setupViews() {
        view.backgroundColor = .white

        [registrationTitleLabel, tableView,
         registrationButton, iHaveAccButton].forEach {
            view.addSubview($0)
        }
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        registrationTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(8)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(registrationTitleLabel.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(440)
        }

        registrationButton.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(64)
        }

        iHaveAccButton.snp.makeConstraints { make in
            make.top.equalTo(registrationButton.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(64)
        }
    }

    // MARK: - Actions

    @objc private func didPressedBackButton() {
        self.navigationController?.popViewController(animated: true)
    }

    @objc private func didPressedContinueButton() {
        let controller = ConfirmAccViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @objc private func didPressedIHaveAccount() {
        let controller = AuthorizationViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: - Delegate
extension RegistrationCompanyViewController: UITableViewDelegate {

}

// MARK: - Data Source
extension RegistrationCompanyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
                                                        CompanyRegistrationTableViewCell.cellID,
                                                       for: indexPath) as?
                CompanyRegistrationTableViewCell else {
            fatalError("Could not cast to RegistrationTableViewCell")
        } 
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
}

private extension RegistrationCompanyViewController {
    func createData() {
        data.append(
            RegistrationInfoModel(
                icon: AppImage.personImage.uiImage,
                title: "Имя")
        )
        data.append(
            RegistrationInfoModel(
                icon: AppImage.profileUsers.uiImage,
                title: "Фамилия")
        )
        data.append(
            RegistrationInfoModel(
                icon: AppImage.cake.uiImage,
                title: "Дата рождения")
        )
        data.append(
            RegistrationInfoModel(
                icon: AppImage.smsEdit.uiImage,
                title: "Почта")
        )
        data.append(
            RegistrationInfoModel(
                icon: AppImage.passwordCheck.uiImage,
                title: "Пароль")
        )
        data.append(
            RegistrationInfoModel(
                icon: AppImage.passwordCheck.uiImage,
                title: "Подтверждение пароля")
        )
        data.append(
            RegistrationInfoModel(
                icon: AppImage.call.uiImage,
                title: "Номер телефона")
        )
        data.append(
            RegistrationInfoModel(
                icon: AppImage.home.uiImage,
                title: "Город проживания")
        )
        data.append(
            RegistrationInfoModel(
                icon: AppImage.location.uiImage,
                title: "Город обучения")
        )
        data.append(
            RegistrationInfoModel(
                icon: AppImage.calendarTick.uiImage,
                title: "Год окончания")
        )
        data.append(
            RegistrationInfoModel(
                icon: AppImage.link.uiImage,
                title: "Ссылка на linkedin")
        )
    }
}

// MARK: - Hide Keyboard when screen Tapped
extension RegistrationCompanyViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(RegistrationCompanyViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

