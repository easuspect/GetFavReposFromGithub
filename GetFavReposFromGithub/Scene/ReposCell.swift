//
//  ReposCell.swift
//  GetFavReposFromGithub
//
//  Created by NewMac on 11/28/22.
//

import UIKit
import Kingfisher

final class ReposCell: UITableViewCell {
    
    lazy var image: UIImageView = {
        let image = UIImageView.init()
        return image
    }()
    
    lazy var label: UILabel = {
        let label = UILabel.init()
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: GithubRepo) {
        label.text = model.name
        if let url = URL.init(string: model.owner.avatar_url) {
            image.kf.setImage(with: url)
        }
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
        image.image = nil
    }
}

private extension ReposCell {
    func setupLayout() {
        contentView.addSubview(image)
        contentView.addSubview(label)
        image.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        image.heightAnchor.constraint(equalToConstant: 50).isActive = true
        image.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        label.centerYAnchor.constraint(equalTo: image.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        
        image.clipsToBounds = true
        image.layer.cornerRadius = 25
    }
}
