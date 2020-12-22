//
//  CatsViewController.swift
//  PlatziChallenge
//
//  Created by Miguel Aquino on 19/12/20.
//

import UIKit

class CatsViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    var viewModel = [CatViewModel]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        getCats()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
}

//MARK:- VC Extension

extension CatsViewController {
    func setupCollectionView() {
        collectionView.register(CatsHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: CatsHeader.identifier)
        collectionView.register(CatCell.self, forCellWithReuseIdentifier: CatCell.identifier)
        collectionView.backgroundColor = .white
        collectionView.contentInsetAdjustmentBehavior = .never
    }
    
    func getCats() {
        CatsService.shared.getCats() { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let cats):
                self.viewModel = cats.map({CatViewModel($0)})
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure: break
            }
        }
    }
}

// MARK: - UICollectionViewDelegate/DataSource

extension CatsViewController {
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                     withReuseIdentifier: CatsHeader.identifier, for: indexPath)
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.isEmpty ? 0 : viewModel.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatCell.identifier, for: indexPath) as! CatCell
        cell.configureCell(cat: viewModel[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        VCs.catDetailsVC.catViewModel = viewModel[indexPath.row]
        self.navigationController?.pushViewController(VCs.catDetailsVC, animated: true)
    }
}


//MARK: - UICollectionViewDelegateFlowLayout

extension CatsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width / 3) - 10
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5 , left: 5, bottom: 5, right: 5)
    }
}

