//
//  CatCVCell.swift
//  PlatziChallenge
//
//  Created by Miguel Aquino on 19/12/20.
//

import UIKit

class CatCell: UICollectionViewCell {
    
    //MARK:- Properties
    
    static let identifier = Identifiers.catCell
    
    let containerView = UIView()
    let imageView = UIImageView()
    let labelView = UIView()
    let textLabel = UILabel()
    
    //MARK:- Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCellView()
        configureContainerView()
        configureImageView()
        configureLabelView()
        configureTextLabel()
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
        self.textLabel.textAlignment = .center
    }
    
    private func loadImage(fromURL: String) {
        CatsService.shared.getCatImage(from: fromURL, completed: { (image) in
            DispatchQueue.main.async {
                self.imageView.image = image != nil ? image : Images.emptyCat
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
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
    
    private func configureLabelView() {
        containerView.addSubview(labelView)
        labelView.backgroundColor = .black
        labelView.alpha = 0.7
        labelView.layer.cornerRadius = 5
        labelView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelView.heightAnchor.constraint(equalToConstant: 30),
            labelView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5),
            labelView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            labelView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5)
        ])
    }
    
    private func configureTextLabel() {
        textLabel.textColor = .white
        textLabel.numberOfLines = 0
        textLabel.adjustsFontSizeToFitWidth = true
        textLabel.minimumScaleFactor = 0.5
        textLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        labelView.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: labelView.topAnchor),
            textLabel.bottomAnchor.constraint(equalTo: labelView.bottomAnchor),
            textLabel.leadingAnchor.constraint(equalTo: labelView.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: labelView.trailingAnchor)
        ])
    }
    
    private func configureImageView() {
        containerView.addSubview(imageView)
        imageView.image = Images.emptyCat
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
    }
    
    func configureCell(cat: CatViewModel) {
        textLabel.text = cat.name
        loadImage(fromURL: cat.catImageURL)
    }
}
