//
//  AdminViewController.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 16.10.2023.
//

import UIKit
import SnapKit
import PanModal

final class AdminViewController: UIViewController {

    // MARK: - Properties
    private var items: [AdminCollectionType] = []
    private var selectedIndexPath: IndexPath?
    private var destinationVC: UIViewController?
    private var data: [ItemsSegmentedControl] = []

    // MARK: - UI
    private lazy var adminPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.adminImageLogo.uiImage
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "alish123"
        label.font = AppFont.bold.s19()
        label.textColor = AppColor.blackLabel.uiColor
        return label
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: createCompositionalLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(AdminCollectionViewCell.self,
                                forCellWithReuseIdentifier: AdminCollectionViewCell.cellID)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    private lazy var casesView: BanCaseView = {
        let view = BanCaseView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var deleteAdminButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(AppImage.deleteAdminButton.uiImage, for: .normal)
        button.addTarget(self, action: #selector(didPressedBanButton), for: .touchUpInside)
        return button
    }()

    private lazy var timeAdminButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(AppImage.timeAdminButton.uiImage, for: .normal)
        return button
    }()

    private lazy var checkAdminButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(AppImage.checkAdminButton.uiImage, for: .normal)
        return button
    }()

    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 40
        return stackView
    }()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
        navigationBar()
        createData()
    }

    // MARK: - Setup Nav Bar
    private func navigationBar() {
        navigationItem.leftBarButtonItems = makeLeftBarButtonItems()
    }

    // MARK: - Setup Views

    private func setupViews() {
        view.backgroundColor = .white
        
        [deleteAdminButton, timeAdminButton, checkAdminButton].forEach {
            buttonsStackView.addArrangedSubview($0)
        }

        [collectionView, casesView, buttonsStackView].forEach {
            view.addSubview($0)
        }
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(44)
        }

        casesView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }

        buttonsStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(35)
            make.trailing.equalToSuperview().offset(-35)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(40)
            make.height.equalTo(80)
        }
        
        deleteAdminButton.snp.makeConstraints { make in
            make.size.equalTo(80)
        }

        timeAdminButton.snp.makeConstraints { make in
            make.size.equalTo(80)
        }

        checkAdminButton.snp.makeConstraints { make in
            make.size.equalTo(80)
        }

        adminPhotoImageView.snp.makeConstraints { make in
            make.size.equalTo(40)
        } 
    }

    // MARK: Create CompositionalLayout

    private func createCompositionalLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 152, height: 36)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        return layout
    }

    // MARK: - Actions

    @objc private func didPressedBanButton() {
        let controller = PopUpBanController()
        presentPanModal(controller)
    }
}

// MARK: - Data Source and Delegates

extension AdminViewController: UICollectionViewDelegate, UICollectionViewDataSource {

//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }

    func collectionView(_ collectionView: UICollectionView, 
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdminCollectionViewCell.cellID,
                                                      for: indexPath) as? AdminCollectionViewCell
        return cell ?? UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        

        switch items[indexPath.row] {
        case .events:
            destinationVC = EventsViewController()
        case .posts:
            destinationVC = PostsReportsViewController()
        case .profiles:
            destinationVC = ProfilesReportsViewController()
        case .help:
            destinationVC = HelpCenterViewController()
        case .reports:
            destinationVC = ReportsViewController()
        }

        if let previousIndexPath = selectedIndexPath {
            collectionView.deselectItem(at: previousIndexPath, animated: false)
            if let cell = collectionView.cellForItem(at: previousIndexPath) as? AdminCollectionViewCell {
                cell.isSelected = false
            }
        }

        selectedIndexPath = indexPath

        if let cell = collectionView.cellForItem(at: indexPath) as? AdminCollectionViewCell {
            cell.isSelected = true
        }
    }
}

// MARK: - Nav Bar
private extension AdminViewController {
    func makeLeftBarButtonItems() -> [UIBarButtonItem] {
        let logoBarButtonItem = UIBarButtonItem(customView: adminPhotoImageView)
        let nameBarButtonItem = UIBarButtonItem(customView: nameLabel)
        let dropDownButtonItem = UIBarButtonItem(title: nil,
                                                 image: AppImage.arrowDown.uiImage,
                                                 target: self,
                                                 action: nil,
                                                 menu: makeDropDownMenu())
        return [logoBarButtonItem, nameBarButtonItem, dropDownButtonItem]
    }

    func makeDropDownMenu() -> UIMenu {
        let subsItem = UIAction(title: "Подписки", image: UIImage(systemName: "person.2")) { _ in
            print("Subs")
        }
        let favsItem = UIAction(title: "Избранное", image: UIImage(systemName: "star")) { _ in
            print("Favourites")
        }
        return UIMenu(title: "", children: [subsItem, favsItem])
    }
}

// MARK: - Data
private extension AdminViewController {
    func createData() {
        [.events, .posts, .profiles, .help, .reports].forEach {
            items.append($0)
        }
        data.append(
            ItemsSegmentedControl(name: "События")
        )
        data.append(
            ItemsSegmentedControl(name: "Жалобы на посты")
        )
        data.append(
            ItemsSegmentedControl(name: "Жалобы на профили")
        )
        data.append(
            ItemsSegmentedControl(name: "Help Center")
        )
        data.append(
            ItemsSegmentedControl(name: "Reports")
        )
    }
}
