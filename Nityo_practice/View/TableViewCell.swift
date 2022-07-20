//
//  TableViewCell.swift
//  Nityo_practice
//
//  Created by Eric chung on 2022/7/4.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var star = UIImageView()
    
    var avatar = UIImageView()
    
    var userName = UILabel()
    
    var stackView = UIStackView()
    
    var transferButton = UIButton()
    
    var inviteButton = UIButton()
    
    var ellipisButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: "TableViewCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
    }
    
    func configureStar(_ isTop: String) {
        star.image = UIImage(named: "icFriendsStar")
        star.contentMode = .scaleAspectFit
        star.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(star)
        star.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 23).isActive = true
        star.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        star.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -23).isActive = true
        if isTop == "0" {
            star.isHidden = true
        } else {
            star.isHidden = false
        }
    }
    
    func configureAvatar() {
        avatar.image = UIImage(named: "imgFriendsFemaleDefault")
        avatar.contentMode = .scaleAspectFit
        avatar.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(avatar)
        avatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        avatar.leadingAnchor.constraint(equalTo: star.trailingAnchor, constant:6).isActive = true
        avatar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    func configureUserName(_ text: String) {
        userName.text = text
        userName.textColor = UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1)
        userName.font = UIFont(name: "PingFangTC-Regular", size: 16)
        userName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(userName)
        userName.centerYAnchor.constraint(equalTo: avatar.centerYAnchor).isActive = true
        userName.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 15).isActive = true
    }
    
    func configureButtons(_ statusCode: Int) {

        transferButton.titleLabel?.font = UIFont(name: "PingFangTC-Medium", size: 14)
        transferButton.setTitleColor(UIColor(red: 235/255, green: 0/255, blue: 140/255, alpha: 1), for: .normal)
        transferButton.layer.borderColor = UIColor(red: 235/255, green: 0/255, blue: 140/255, alpha: 1).cgColor
        transferButton.layer.borderWidth = 1.2
        transferButton.layer.cornerRadius = 2
        transferButton.setTitle("轉帳", for: .normal)
        transferButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(transferButton)
        transferButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        transferButton.widthAnchor.constraint(equalToConstant: 47).isActive = true
        
        inviteButton.titleLabel?.font = UIFont(name: "PingFangTC-Medium", size: 14)
        inviteButton.setTitleColor(UIColor(red: 201/255, green: 201/255, blue: 201/255, alpha: 1), for: .normal)
        inviteButton.layer.borderColor = UIColor(red: 201/255, green: 201/255, blue: 201/255, alpha: 1).cgColor
        inviteButton.layer.borderWidth = 1.2
        inviteButton.layer.cornerRadius = 2
        inviteButton.setTitle("邀請中", for: .normal)
        inviteButton.translatesAutoresizingMaskIntoConstraints = false
        if statusCode == 2 {
        stackView.addArrangedSubview(inviteButton)
        }
        inviteButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        inviteButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        ellipisButton.setImage(UIImage(named: "icFriendsMore"), for: .normal)
        ellipisButton.translatesAutoresizingMaskIntoConstraints = false
        if statusCode != 2 {
        stackView.addArrangedSubview(ellipisButton)
        }
        ellipisButton.heightAnchor.constraint(equalToConstant: 4).isActive = true
        ellipisButton.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        
    }

}
