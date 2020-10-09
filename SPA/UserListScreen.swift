//
//  UserListScreen.swift
//  SPA
//
//  Created by Bokai Li on 10/7/20.
//

import UIKit

class UserListScreen: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var users: [Username]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        users = createArray()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    func createArray() -> [Username]{
        var tempUsers: [Username] = []
        
        let user1 = Username(title:"User1")
        let user2 = Username(title:"User2")
        
        tempUsers.append(user1)
        tempUsers.append(user2)
        return tempUsers
    }
    

}

extension UserListScreen: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as! TableViewCell
        cell.setUser(user: user)
        return cell
    }
}
