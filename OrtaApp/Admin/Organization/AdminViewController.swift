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
    private var data = [ItemsSegmentedControl]()
    private var buttons = [ButtonsAdminModel]()

    private var bounceOnScroll: Bool = true {
        didSet {
            collectionView.bounces = bounceOnScroll
        }
    }

    // MARK: - SegmentedControll Properties
    private let eventsVC = EventsViewController()
    private let postsReportsVC = PostsReportsViewController()
    private let profileReportsVC = ProfilesReportsViewController()
    private let helpCenterVC = HelpCenterViewController()
    private let reportsVC = ReportsViewController()

    // MARK: - UI
    private lazy var segmentedController: UISegmentedControl = {
        let vcArray = ["Organization", "Events", "Posts Reports",
                       "Profile Reports", "Help Center", "Reports"]
        let segControl = UISegmentedControl(items: vcArray)
        segControl.backgroundColor = .white
        segControl.addTarget(self, action: #selector(segAction(_:)), for: .valueChanged)
        return segControl
    }()

    private lazy var backgroundSafeAreaView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

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

    private lazy var casesCompanyView: OrganizationCaseView = {
        let view = OrganizationCaseView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        return view
    }()

    private lazy var buttonView: AdminMainButtonsView = {
        let view = AdminMainButtonsView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = view.frame.size.width / 2
        return view
    }()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
        navigationBar()
        createData()
        configureCases()
    }

    override func viewDidLayoutSubviews() {
        view.addSubview(segmentedController)
    }

    // MARK: - Setup Nav Bar
    private func navigationBar() {
        navigationItem.leftBarButtonItems = makeLeftBarButtonItems()
        if let destinationVC = destinationVC {
            navigationController?.pushViewController(destinationVC, animated: true)
        }
    }

    // MARK: - Setup Views
    private func setupViews() {
        view.backgroundColor = AppColor.backgroundMain.uiColor

        [backgroundSafeAreaView, collectionView, casesView,
         casesCompanyView, buttonView].forEach {
            view.addSubview($0)
        }
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        backgroundSafeAreaView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(103)
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(44)
        }

        casesView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(48)
        }
        
        casesCompanyView.snp.makeConstraints { make in
            make.top.equalTo(casesView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.height.equalTo(108)
        }

        buttonView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(-35)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(40)
            make.size.equalTo(80)
        }

        adminPhotoImageView.snp.makeConstraints { make in
            make.size.equalTo(40)
        }
    }

    private func setupSegmentedControl() {
        segmentedController.snp.makeConstraints { make in
            make.top.equalTo(backgroundSafeAreaView.snp.bottom)
            make.leading.trailing.equalToSuperview()
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

    // MARK: - Segmented Controll Loader
    private func segmentLoader() {

        [eventsVC, postsReportsVC, profileReportsVC, helpCenterVC, reportsVC].forEach {
            self.addChild($0)
        }

        [eventsVC.view, postsReportsVC.view, profileReportsVC.view,
         helpCenterVC.view, reportsVC.view].forEach {
            self.view.addSubview($0)
        }

        eventsVC.didMove(toParent: self)
        postsReportsVC.didMove(toParent: self)
        profileReportsVC.didMove(toParent: self)
        helpCenterVC.didMove(toParent: self)
        reportsVC.didMove(toParent: self)

        eventsVC.view.frame = self.view.bounds
        postsReportsVC.view.frame = self.view.bounds
        profileReportsVC.view.frame = self.view.bounds
        helpCenterVC.view.frame = self.view.bounds
        reportsVC.view.frame = self.view.bounds
    }

    // MARK: - Actions

    @objc private func didPressedBanButton() {
        let controller = PopUpBanController()
        presentPanModal(controller)
    }

    @objc private func segAction(_ segmentedControll: UISegmentedControl) {
        eventsVC.view.isHidden = true
        postsReportsVC.view.isHidden = true
        profileReportsVC.view.isHidden = true
        helpCenterVC.view.isHidden = true
        reportsVC.view.isHidden = true

        switch segmentedControll.selectedSegmentIndex {
        case 0:
            eventsVC.view.isHidden = false
        case 1:
            postsReportsVC.view.isHidden = false
        case 2:
            profileReportsVC.view.isHidden = false
        case 3:
            helpCenterVC.view.isHidden = false
        case 4:
            reportsVC.view.isHidden = false
        default:
            eventsVC.view.isHidden = false
        }
    }
}

// MARK: - Data Source and Delegates

extension AdminViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }

    func collectionView(_ collectionView: UICollectionView, 
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdminCollectionViewCell.cellID,
                                                      for: indexPath) as? AdminCollectionViewCell
        cell?.configureCell(with: data[indexPath.row])
        return cell ?? UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch items[indexPath.row] {
        case .organization:
            destinationVC = AdminViewController()
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
        [.organization, .events, .posts, .profiles, .help, .reports].forEach {
            items.append($0)
        }
        data.append(
            ItemsSegmentedControl(name: "Орг. и компаний")
        )
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

    // MARK: Configuration Cases

    func configureCases() {
        let cases = OrganizationCasesModel(companyName: "magnum",
                                           title: "magnum@gmail.kz",
                                           icon: AppImage.smsEdit.uiImage)
        casesCompanyView.configure(with: cases)
    }

    // MARK: - Buttons
    func getButtons() {
        buttons.append(
            ButtonsAdminModel(imageName: AppImage.deleteCircle.uiImage,
                              color: AppColor.red.uiColor)
        )
        buttons.append(
            ButtonsAdminModel(imageName: AppImage.clockCircle.uiImage,
                              color: .white)
        )
        buttons.append(
            ButtonsAdminModel(imageName: AppImage.checkCircle.uiImage,
                              color: AppColor.green.uiColor)
        )
    }
}
