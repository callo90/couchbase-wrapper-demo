//
//  DemoTableView.swift
//  CouchbaseLiteWrapperDemo
//
//  Created by Koombea on 7/29/21.
//

import UIKit

extension DemoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath)
        configureCell(cell, indexPath: indexPath)
        return cell
    }
    
    func configureCell(_ cell: UITableViewCell, indexPath: IndexPath) {
        let cell = cell as? UserTableViewCell
        let user = users.element(at: indexPath.row)
        cell?.nameLabel?.text = "\(user?.firstName ?? "") \(user?.lastName ?? "")"
    }
}


