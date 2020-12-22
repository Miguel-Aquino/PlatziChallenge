//
//  CatDetailsViewController.swift
//  PlatziChallenge
//
//  Created by Miguel Aquino on 19/12/20.
//

import UIKit

class CatDetailsViewController: UIViewController {
    
    // MARK: - Properties
    let containerView = UIView()
    let bodyView = UIView()
    let catImageView = UIImageView()
    let descriptionView = UIView()
    let descriptionLabel = UITextView()
    var collectionView: UICollectionView!
    
    var catViewModel: CatViewModel?
    var catTraitsViewModel = [CatTraitsViewModel]()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        configureContainerView()
        configureCollectionView()
        configureBodyView()
        configureImageView()
        configureDescriptionView()
        configureDescriptionText()
        setupVC()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        configureBackButton()
        loadCatInfo()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        clearData()
    }
}

//MARK:- VC Extension

extension CatDetailsViewController {
    func configureBackButton(){
        let menuButtonView = configureMenuButton()
        self.view.addSubview(menuButtonView)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(backButtonTapped))
        menuButtonView.isUserInteractionEnabled = true
        menuButtonView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func backButtonTapped(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func configureMenuButton() -> UIView {
        let menuButtonView = UIView()
        
        let offsetY = UIScreen.main.nativeBounds.size.width < 800 ?  35 : 50
        menuButtonView.frame = CGRect(x: 15, y: offsetY, width: 50, height:  50)
        
        let menuImageView = Images.back
        menuImageView.frame = CGRect(x: 5, y: 5, width: 50 - 10, height:  50 - 10)
        menuButtonView.addSubview(menuImageView)
        menuButtonView.layer.shadowColor = UIColor.black.cgColor
        menuButtonView.layer.shadowOpacity = 0.6
        menuButtonView.layer.shadowOffset = CGSize(width: 0, height: 2.5)
        menuButtonView.layer.shadowRadius = 5
        menuButtonView.layer.shouldRasterize = false
        menuButtonView.layer.cornerRadius = menuButtonView.frame.width / 2
        
        return menuButtonView
    }
    
    func configureContainerView() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CatDetailCell.self, forCellWithReuseIdentifier: CatDetailCell.identifier)
        collectionView.backgroundColor = .white
        containerView.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 210)
        ])
    }
    
    func configureBodyView() {
        bodyView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(bodyView)
        
        NSLayoutConstraint.activate([
            bodyView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            bodyView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            bodyView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            bodyView.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -5),
        ])
    }
    
    func configureImageView() {
        containerView.addSubview(catImageView)
        
        catImageView.translatesAutoresizingMaskIntoConstraints = false
        catImageView.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            catImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            catImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            catImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            catImageView.bottomAnchor.constraint(equalTo: collectionView.topAnchor,
                                                 constant: -(self.view.frame.height / 6)),
        ])
    }
    
    func configureDescriptionView() {
        containerView.addSubview(descriptionView)
        
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.backgroundColor = .white
        descriptionView.layer.shadowColor = UIColor.black.cgColor
        descriptionView.layer.shadowOpacity = 0.4
        descriptionView.layer.shadowOffset = CGSize(width: 0, height: 2.5)
        descriptionView.layer.shadowRadius = 5
        descriptionView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            descriptionView.topAnchor.constraint(equalTo: catImageView.bottomAnchor, constant: -30),
            descriptionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            descriptionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            descriptionView.heightAnchor.constraint(equalToConstant: (self.view.frame.height / 5))
        ])
    }
    
    func configureDescriptionText() {
        descriptionView.addSubview(descriptionLabel)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textColor = .darkGray
        descriptionLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -10),
            descriptionLabel.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: -10),
        ])
    }
}

//MARK:- VC Extension & Methods
extension CatDetailsViewController {
    func setupVC() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func loadCatInfo() {
        guard let cat = catViewModel else { return }
        
        CatsService.shared.getCatImage(from: cat.catImageURL) { (image) in
            DispatchQueue.main.async {
                self.catImageView.image = image != nil ? image : Images.noCatImage
            }
        }
        catTraitsViewModel = cat.getCatTraits()
        collectionView.reloadData()
        descriptionLabel.text = cat.description
    }
    
    func clearData() {
        catImageView.image = nil
        descriptionLabel.text = ""
        catTraitsViewModel.removeAll()
        collectionView.reloadData()
    }
}


// MARK: - UICollectionViewDelegate/DataSource
extension CatDetailsViewController:  UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catTraitsViewModel.isEmpty ? 0 : catTraitsViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatDetailCell.identifier, for: indexPath) as! CatDetailCell
        cell.configureCell(catTraits: catTraitsViewModel[indexPath.row])
        
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension CatDetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 170)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5 , left: 8 , bottom: 5, right: 8)
    }
}
