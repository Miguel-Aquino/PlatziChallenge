//
//  CatsHeader.swift
//  PlatziChallenge
//
//  Created by Miguel Aquino on 19/12/20.
//

import UIKit

class CatsHeader: UICollectionReusableView {
    
    //MARK:- Properties
    
    static let identifier = Identifiers.catsHeader
    
    let containerView = UIView()
    let imageSize: CGFloat = 60
    
    let headerImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = Images.cat
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderWidth = 3
        iv.layer.borderColor = UIColor.white.cgColor
        return iv
    }()

    let headerTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .natural
        label.text = Identifiers.appTitle
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .white
        return label
    }()
    
    //MARK:- Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureContainerView()
        configureImageView()
        configureLabel()
    }
    
    func configureContainerView() {
        self.addSubview(containerView)
        containerView.backgroundColor = .mainBlue
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
    
    func configureImageView() {
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(headerImageView)
        headerImageView.layer.cornerRadius = 60 / 2
        headerImageView.anchor(width: 60, height: 60)
        NSLayoutConstraint.activate([
            headerImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 10),
            headerImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                                     constant: self.frame.width / 5)
        ])
    }
    
    func configureLabel() {
        headerTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(headerTitleLabel)
        
        NSLayoutConstraint.activate([
            headerTitleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 10),
            headerTitleLabel.leadingAnchor.constraint(equalTo: headerImageView.trailingAnchor, constant: 10),
            headerTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

