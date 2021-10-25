//
//  ViewController.swift
//  CouchbaseLiteWrapperDemo
//
//  Created by Koombea on 7/13/21.
//

import UIKit

class DemoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView?
    
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //UserStore.deleteAll()
        fetchData()
    }
    
    func fetchData() {
        users.removeAll()
        users += UserStore.fetchUsers()
        tableView?.reloadData()
    }
    
    @IBAction func addNewUser() {
        let alertController = UIAlertController(title: "Add New Name", message: "", preferredStyle: .alert)
        alertController.addTextField { $0.placeholder = "FirstName" }
        alertController.addTextField { $0.placeholder = "LastName"
        }
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let firstNameTextField = alertController.textFields?.first else { return }
            guard let lastNameTextField = alertController.textFields?[1] else { return }
            self.saveUser(firstNameTextField.text ?? "", lastName: lastNameTextField.text ?? "")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    private func saveUser(_ firstName: String, lastName: String) {
        guard let user = User(JSON: ["first_name": firstName, "last_name": lastName]) else { return }
        UserStore.saveUser(user)
        fetchData()
    }
}

