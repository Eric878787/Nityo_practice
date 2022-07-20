//
//  HeaderView.swift
//  Nityo_practice
//
//  Created by Eric chung on 2022/7/4.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {
    
    let searchBar = UISearchBar()
    
    let addFriendImageView = UIImageView()
    
    var searchHandler: ((String) -> ())?

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: "HeaderView")
        configureSearchBar()
        configureImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not implemented")
    }
    
    private func configureSearchBar() {
        
        searchBar.delegate = self
        searchBar.showsCancelButton = false
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor.white.cgColor
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = "想轉一筆給誰呢？"
        searchBar.sizeToFit()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(searchBar)
        searchBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        searchBar.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 36).isActive = true
        searchBar.widthAnchor.constraint(equalToConstant: 276).isActive = true
        
    }
    
    private func configureImage() {
        addFriendImageView.image = UIImage(named: "icBtnAddFriends")
        addFriendImageView.contentMode = .scaleAspectFit
        addFriendImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(addFriendImageView)
        addFriendImageView.leadingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: 15).isActive = true
        addFriendImageView.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor).isActive = true
        addFriendImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        addFriendImageView.heightAnchor.constraint(equalTo: addFriendImageView.widthAnchor).isActive = true
        addFriendImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
    }

}

extension HeaderView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let searchTerm = searchBar.text ?? ""
        searchHandler?(searchTerm)
        searchBar.resignFirstResponder()
    }
    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        let searchTerm = searchBar.text ?? ""
//        searchHandler?(searchTerm)
//        searchBar.resignFirstResponder()
//    }
}
