//
//  FriendListViewController.swift
//  Nityo_practice
//
//  Created by Eric chung on 2022/7/4.
//

import UIKit

class FriendListViewController: UIViewController {
    
    // MARK: Data
    var userInfo: UserInfo?
    
    var friendlist: FriendList?
    
    var originalList: FriendList?
    
    var friendInvitations: FriendList?
    
    // MARK: UI Components
    @IBOutlet weak var tableView: UITableView!
    
    private let userName = UILabel()
    
    private let settingButton = UIButton()
    
    private let userAvatar = UIImageView()
    
    private let friendButton = UIButton()
    
    private let chatButton = UIButton()
    
    private let baseLine = UIView()
    
    private let slidingBar = UIView()
    
    private var slidingBarAlignment = NSLayoutConstraint()
    
    private let baseImageView = UIImageView()
    
    private let baseTitle = UILabel()
    
    private let baseText = UILabel()
    
    private let customButton = CustomButton()
    
    private let baseButtonImageView = UIImageView()
    
    private let baseFooterText = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePersonalInfo()
        
        guard let friendlist = friendlist else {
            return
        }
        
        if friendlist.response == [] {
            configureBaseView()
        } else {
            configureTableView()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        slidingBar.layer.cornerRadius = slidingBar.bounds.height / 2
        customButton.layer.cornerRadius = customButton.bounds.height / 2
    }
    
    private func configureNavigationBar() {
    }
    
    private func configurePersonalInfo() {
        
        guard let userInfo = userInfo else {
            return
        }
        
        userName.textColor = UIColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1)
        userName.font = UIFont(name: "PingFangTC-Medium", size: 17)
        userName.text = "\(userInfo.response[0].name)"
        userName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userName)
        userName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35).isActive = true
        userName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        
        settingButton.titleLabel?.font = UIFont(name: "PingFangTC-Regular", size: 13)
        settingButton.setTitleColor(UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1), for: .normal)
        settingButton.setTitle("\(userInfo.response[0].kokoid)", for: .normal)
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(settingButton)
        settingButton.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 8).isActive = true
        settingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        
        userAvatar.image = UIImage(named:"imgFriendsFemaleDefault")
        userAvatar.contentMode = .scaleAspectFit
        userAvatar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userAvatar)
        userAvatar.topAnchor.constraint(equalTo: userName.topAnchor).isActive = true
        userAvatar.bottomAnchor.constraint(equalTo: settingButton.bottomAnchor).isActive = true
        userAvatar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        userAvatar.widthAnchor.constraint(equalTo: userAvatar.heightAnchor).isActive = true
        
        friendButton.titleLabel?.font = UIFont(name: "PingFangTC-Medium", size: 13)
        friendButton.setTitleColor(UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1), for: .normal)
        friendButton.setTitle("好友", for: .normal)
        friendButton.addTarget(self, action: #selector(didTouchFriendButton), for: .touchUpInside)
        friendButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(friendButton)
        friendButton.topAnchor.constraint(equalTo: settingButton.bottomAnchor, constant: 30).isActive = true
        friendButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        
        chatButton.titleLabel?.font = UIFont(name: "PingFangTC-Regular", size: 13)
        chatButton.setTitleColor(UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1), for: .normal)
        chatButton.setTitle("聊天", for: .normal)
        chatButton.addTarget(self, action: #selector(didTouchChatButton), for: .touchUpInside)
        chatButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(chatButton)
        chatButton.topAnchor.constraint(equalTo: settingButton.bottomAnchor, constant: 30).isActive = true
        chatButton.leadingAnchor.constraint(equalTo: friendButton.trailingAnchor, constant: 36).isActive = true
        
        baseLine.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
        baseLine.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(baseLine)
        baseLine.topAnchor.constraint(equalTo: friendButton.bottomAnchor, constant: 9).isActive = true
        baseLine.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        baseLine.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        baseLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        slidingBar.backgroundColor = UIColor(red: 236/255, green: 0/255, blue: 140/255, alpha: 1)
        slidingBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slidingBar)
        slidingBar.bottomAnchor.constraint(equalTo: friendButton.bottomAnchor, constant: 9).isActive = true
        slidingBarAlignment = NSLayoutConstraint(item: slidingBar, attribute: .centerX, relatedBy: .equal, toItem: friendButton, attribute: .centerX, multiplier: 1, constant: 0)
        slidingBarAlignment.isActive = true
        slidingBar.widthAnchor.constraint(equalToConstant: 20).isActive = true
        slidingBar.heightAnchor.constraint(equalToConstant: 4).isActive = true
        
    }
    
    private func configureBaseView() {
        
        baseImageView.image = UIImage(named:"imgFriendsEmpty")
        baseImageView.contentMode = .scaleAspectFit
        baseImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(baseImageView)
        baseImageView.topAnchor.constraint(equalTo: baseLine.bottomAnchor, constant: 30).isActive = true
        baseImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 65).isActive = true
        baseImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -65).isActive = true
        
        baseTitle.textColor = UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1)
        baseTitle.font = UIFont(name: "PingFangTC-Medium", size: 21)
        baseTitle.text = "就從加好友開始吧：）"
        baseTitle.textAlignment = .center
        baseTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(baseTitle)
        baseTitle.topAnchor.constraint(equalTo: baseImageView.bottomAnchor, constant: 41).isActive = true
        baseTitle.centerXAnchor.constraint(equalTo: baseImageView.centerXAnchor).isActive = true
        baseTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 44).isActive = true
        baseTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -44).isActive = true
        
        baseText.textColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
        baseText.font = UIFont(name: "PingFangTC-Regular", size: 14)
        baseText.textAlignment = .center
        baseText.numberOfLines = 0
        baseText.text = "與好友們一起用 KOKO 聊起來！還能互相收付款、發紅包喔：）"
        baseText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(baseText)
        baseText.topAnchor.constraint(equalTo: baseTitle.bottomAnchor, constant: 8).isActive = true
        baseText.centerXAnchor.constraint(equalTo: baseTitle.centerXAnchor).isActive = true
        baseText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 68).isActive = true
        baseText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -68).isActive = true
        
        customButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(customButton)
        customButton.topAnchor.constraint(equalTo: baseText.bottomAnchor, constant: 25).isActive = true
        customButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 92).isActive = true
        customButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -92).isActive = true
    
        
        baseButtonImageView.image = UIImage(named: "icAddFriendWhite")
        baseButtonImageView.contentMode = .scaleAspectFit
        baseButtonImageView.translatesAutoresizingMaskIntoConstraints = false
        customButton.addSubview(baseButtonImageView)
        baseButtonImageView.topAnchor.constraint(equalTo: customButton.topAnchor, constant: 8).isActive = true
        baseButtonImageView.trailingAnchor.constraint(equalTo: customButton.trailingAnchor, constant: -8).isActive = true
        baseButtonImageView.bottomAnchor.constraint(equalTo: customButton.bottomAnchor, constant: -8).isActive = true
        
        baseFooterText.textColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
        baseFooterText.font = UIFont(name: "PingFangTC-Regular", size: 13)
        baseFooterText.textAlignment = .center
        baseFooterText.numberOfLines = 0
        let text = NSMutableAttributedString(string: "幫助好友更快找到你？設定KOKO ID", attributes: [NSAttributedString.Key.font:UIFont(name: "PingFangTC-Regular", size: 13)!])
        text.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 236/255, green: 0/255, blue: 140/255, alpha: 1), range: NSRange(location:10,length:9))
        text.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location:10,length:9))
        baseFooterText.attributedText = text
        baseFooterText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(baseFooterText)
        baseFooterText.topAnchor.constraint(equalTo: customButton.bottomAnchor, constant: 37).isActive = true
        baseFooterText.centerXAnchor.constraint(equalTo: baseTitle.centerXAnchor).isActive = true
        baseFooterText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43).isActive = true
        baseFooterText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -43).isActive = true
        
    }
    
    private func configureTableView() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: baseLine.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.register(UINib(nibName: "InvitationTableViewCell", bundle: nil), forCellReuseIdentifier: "InvitationTableViewCell")
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: "HeaderView")
    }
    
    @objc private func didTouchFriendButton() {
        
        self.view.layoutIfNeeded()
        slidingBarAlignment.isActive = false
        slidingBarAlignment = NSLayoutConstraint(item: slidingBar, attribute: .centerX, relatedBy: .equal, toItem: friendButton, attribute: .centerX, multiplier: 1, constant: 0)
        slidingBarAlignment.isActive = true
        chatButton.titleLabel?.font = UIFont(name: "PingFangTC-Regular", size: 13)
        friendButton.titleLabel?.font = UIFont(name: "PingFangTC-Medium", size: 13)
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc private func didTouchChatButton() {
        
        self.view.layoutIfNeeded()
        slidingBarAlignment.isActive = false
        slidingBarAlignment = NSLayoutConstraint(item: slidingBar, attribute: .centerX, relatedBy: .equal, toItem: chatButton, attribute: .centerX, multiplier: 1, constant: 0)
        chatButton.titleLabel?.font = UIFont(name: "PingFangTC-Medium", size: 13)
        friendButton.titleLabel?.font = UIFont(name: "PingFangTC-Regular", size: 13)
        slidingBarAlignment.isActive = true
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }
    
}

extension FriendListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if friendInvitations != nil {
            return 2
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let friendlist = friendlist else { return 0}
        if friendInvitations != nil {
            guard let friendInvitations = friendInvitations else { return 0 }
            if section == 0 {
                return friendInvitations.response.count
            } else {
                return friendlist.response.count
            }
        } else {
            return friendlist.response.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendlist = friendlist else { return UITableViewCell()}
        if friendInvitations != nil {
            if indexPath.section == 0 {
                guard let friendInvitations = friendInvitations else { return UITableViewCell()}
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "InvitationTableViewCell", for: indexPath) as? InvitationTableViewCell else { return UITableViewCell()}
                cell.configureName(friendInvitations.response[indexPath.row].name)
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell()}
                cell.configureStar(friendlist.response[indexPath.row].isTop)
                cell.configureAvatar()
                cell.configureUserName(friendlist.response[indexPath.row].name)
                cell.configureButtons(friendlist.response[indexPath.row].status)
                return cell
            }
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell()}
            cell.configureStar(friendlist.response[indexPath.row].isTop)
            cell.configureAvatar()
            cell.configureUserName(friendlist.response[indexPath.row].name)
            cell.configureButtons(friendlist.response[indexPath.row].status)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as? HeaderView else { return UIView() }
        header.searchHandler = { [weak self] searchTerm in
            var filteredList: [Friend] = []
            filteredList = (self?.friendlist?.response.filter{$0.name.contains(searchTerm)})!
            if filteredList != [] {
                self?.friendlist?.response = filteredList
            } else if searchTerm == "" {
                self?.friendlist?.response = (self?.originalList!.response)!
            } else {
                self?.friendlist?.response = []
            }
            tableView.reloadData()
        }
        
        if friendInvitations != nil {
            if section == 0 {
                return nil
            } else {
                return header
            }
        } else {
            return header
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if friendInvitations != nil {
            if section == 0 {
                return 0
            } else {
                return 50
            }
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}

extension UIButton {
    
    func applyGradient(colors: [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
