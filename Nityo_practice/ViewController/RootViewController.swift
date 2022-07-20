//
//  ViewController.swift
//  Nityo_practice
//
//  Created by Eric chung on 2022/7/4.
//

import UIKit

class RootViewController: UIViewController {
    
    var userInfo: UserInfo?
    
    var friendList4: FriendList?
    
    var friendInvitations = FriendList(response: [])
    
    var friendList3: FriendList?
    
    var friendList2: FriendList?
    
    var friendList1: FriendList?
    
    var friendList1plus2 = FriendList(response: [])

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    private func getData() {
        
        let concurrentQueue: DispatchQueue = DispatchQueue(label: "CorrentQueue", attributes: .concurrent)
        let group = DispatchGroup()
        
        group.enter()
        concurrentQueue.async {
            DataProvider.shared.getUserInfo { response in
                self.userInfo = response
                group.leave()
            }
        }
        
        group.enter()
        concurrentQueue.async {
            DataProvider.shared.getFriendList("friend4") { response in
                self.friendList4 = response
                group.leave()
            }
        }
        
        group.enter()
        concurrentQueue.async {
            DataProvider.shared.getFriendList("friend3") { response in
                self.friendList3 = response
                group.leave()
            }
        }
        
        group.enter()
        concurrentQueue.async {
            DataProvider.shared.getFriendList("friend2") { response in
                self.friendList2 = response
                group.leave()
            }
        }
        
        group.enter()
        concurrentQueue.async {
            DataProvider.shared.getFriendList("friend1") { response in
                self.friendList1 = response
                group.leave()
            }
        }
        
        group.notify(queue: concurrentQueue) {
            self.organizeFriendList()
            self.organizeInvitations()
        }
        
    }
    
    private func organizeFriendList() {
        var updateDates: [String] = []
        
        for i in friendList2!.response {
            updateDates.append(i.updateDate.replacingOccurrences(of: "/", with: "", options: NSString.CompareOptions.literal, range: nil))
        }
        
        for j in 0..<updateDates.count {
            friendList2?.response[j].updateDate = updateDates[j]
        }
        
        friendList1plus2.response = friendList1!.response + friendList2!.response
        
        friendList1plus2.response = friendList1plus2.response.sorted(by: { Int($0.updateDate)! > Int($1.updateDate)! })
        
        var alreadyThere = Set<Friend>()
        friendList1plus2.response = friendList1plus2.response.compactMap { (friend) -> Friend? in
            guard !alreadyThere.contains(friend) else { return nil }
            alreadyThere.insert(friend)
            return friend
        }
        
    }
    
    private func organizeInvitations() {
        friendInvitations.response = friendList3!.response.filter{ $0.status == 0}
        let response = friendList3!.response.filter{ $0.status != 0}
        friendList3?.response = response
    }
    
    @IBAction func didTouchNoFriendButton(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "FriendListViewController") as? FriendListViewController else { return }
        vc.userInfo = self.userInfo
        vc.friendlist = self.friendList4
        vc.originalList = self.friendList4
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func didTouchFriendListWithoutinvitation(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "FriendListViewController") as? FriendListViewController else { return }
        vc.userInfo = self.userInfo
        vc.friendlist = self.friendList1plus2
        vc.originalList = self.friendList1plus2
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func didTouchFriendListWithinvitation(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "FriendListViewController") as? FriendListViewController else { return }
        vc.userInfo = self.userInfo
        vc.friendlist = self.friendList3
        vc.originalList = self.friendList3
        vc.friendInvitations = self.friendInvitations
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    


}

