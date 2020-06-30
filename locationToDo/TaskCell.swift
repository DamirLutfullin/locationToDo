//
//  TaskCell.swift
//  locationToDo
//
//  Created by Damir Lutfullin on 29.06.2020.
//  Copyright © 2020 DamirLutfullin. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    
    var nameTaskLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var descriptionTaskLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameTaskLabel)
        contentView.addSubview(descriptionTaskLabel)
        setConstraints()
        print("kjhgfcvbn")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        nameTaskLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        nameTaskLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        nameTaskLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        
        descriptionTaskLabel.topAnchor.constraint(equalTo: nameTaskLabel.bottomAnchor, constant: 4).isActive = true
        descriptionTaskLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
        descriptionTaskLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18).isActive = true
        descriptionTaskLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18).isActive = true

        descriptionTaskLabel.heightAnchor.constraint(equalTo: nameTaskLabel.heightAnchor, multiplier: 0.75).isActive = true
    }


}
