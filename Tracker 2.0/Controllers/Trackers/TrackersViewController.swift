//
//  TrackersViewController.swift
//  Tracker 2.0
//
//  Created by Юрий Клеймёнов on 31/05/2024.
//

import UIKit

protocol TrackersViewProtocol: AnyObject {
    var isSearching: Bool { get }
    var currentDate: Date { get }
}

final class TrackersViewController: UIViewController {
    // MARK: - Properties
    
    var isFiltering: Bool = false
    var isSearching: Bool {
        searchController.isActive && !searchBarIsEmpty
    }
    
    var currentDate: Date = {
        let calendar = Calendar.current
        let date = calendar.startOfDay(for: Date())
        
        return date
    }()
    
    private var backgroundView = BackgroundView()
    private let searchController = UISearchController(searchResultsController: nil)
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        
        return datePicker
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return collectionView
    }()
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        
        return text.isEmpty
    }
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Private methods
    private func setupView() {
        view.backgroundColor = Assets.Colors.background
        datePicker.date = currentDate
        configureBackgroundView()
        configureCollectionView()
        configureNavigationBar()
        configureSearchBar()
        
    }
    
    private func configureNavigationBar() {
        let addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction))
        addBarButtonItem.tintColor = Assets.Colors.navBarItem
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = addBarButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: datePicker)
        title = "Трекеры"
    }
    
    private func configureSearchBar() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        navigationItem.searchController = searchController
    }
    
    private func configureBackgroundView() {
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundView.widthAnchor.constraint(equalToConstant: 200),
            backgroundView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configureCollectionView() {
        // TODO: - Доделать логику
        setupCollectionViewConstraints()
    }
    
    private func setupCollectionViewConstraints() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .insets),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.insets),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: .bottomInsets, right: 0)
        collectionView.showsVerticalScrollIndicator = false
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    @objc private func addAction() {
        // TODO: - Add logic to presenter
        print("Tracker added")
    }
    
    @objc private func dateChanged() {
        // TODO: - Add logic to presenter
        print("Date changed")
    }
}

private extension CGFloat {
    static let lineSpacing = 9.0
    static let headerHeight = 50.0
    static let cornerRadius = 16.0
    static let insets = 16.0
    static let buttonHeight = 50.0
    static let bottomInsets = 100.0
}

fileprivate struct Constants {
    static let cellsPerRow: CGFloat = 2
    static let insets = 16
    static let cellSpacing: CGFloat = 9
    static let ratio = CGFloat(148) / CGFloat(167)
}

 
