//
//  CatDetailCell.swift
//  PlatziChallenge
//
//  Created by Miguel Aquino on 21/12/20.
//

import UIKit

class CatDetailCell: UICollectionViewCell {
    
    //MARK:- Properties
    
    static let identifier = Identifiers.catDetailCell
    
    let containerView = UIView()
    let imageView = UIImageView()
    let labelView = UIView()
    let scoreLabel = UILabel()
    let titleLabel = UILabel()
    
    //MARK:- Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCellView()
        configureContainerView()
        configureImageView()
        configureLabelView()
        configureTitleLabel()
        configureScoreLabel()
        self.reset()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Methods
    override func prepareForReuse() {
        super.prepareForReuse()
        self.reset()
    }
    
    func reset() {
        self.scoreLabel.textAlignment = .center
    }
    
    private func loadImage(fromURL: String) {
        CatsService.shared.getCatImage(from: fromURL, completed: { (image) in
            DispatchQueue.main.async {
                self.imageView.image = image != nil ? image : Images.childFriendly
            }
        })
    }
    
    private func configureCellView(){
        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 4.0
    }
    
    private func configureContainerView(){
        self.addSubview(containerView)
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 10
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5)
        ])
    }
    
    private func configureLabelView() {
        containerView.addSubview(labelView)
        labelView.backgroundColor = .black
        labelView.alpha = 0.5
        labelView.layer.cornerRadius = 5
        labelView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelView.heightAnchor.constraint(equalToConstant: 40),
            labelView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5),
            labelView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            labelView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5)
        ])
    }
    
    private func configureScoreLabel() {
        scoreLabel.textColor = .white
        scoreLabel.numberOfLines = 0
        scoreLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        labelView.addSubview(scoreLabel)
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: labelView.topAnchor),
            scoreLabel.bottomAnchor.constraint(equalTo: labelView.bottomAnchor),
            scoreLabel.leadingAnchor.constraint(equalTo: labelView.leadingAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: labelView.trailingAnchor)
        ])
    }
    
    private func configureTitleLabel() {
        titleLabel.textColor = .darkGray
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.5
        
        containerView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10)
        ])
    }
    
    private func configureImageView() {
        containerView.addSubview(imageView)
        imageView.image = Images.childFriendly
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant:  10),
            imageView.heightAnchor.constraint(equalToConstant: 35),
            imageView.widthAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    func configureCell(catTraits: CatTraitsViewModel) {
        scoreLabel.text = "\(catTraits.score)"
        titleLabel.text = catTraits.type.value
        containerView.backgroundColor = catTraits.color.value
        imageView.image = catTraits.image
    }
}
