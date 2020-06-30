//
//  MainTasksTableVC.swift
//  locationToDo
//
//  Created by Damir Lutfullin on 29.06.2020.
//  Copyright © 2020 DamirLutfullin. All rights reserved.
//

import UIKit

class MainTasksTableVC: UITableViewController {
    
    var tasks: [(name: String, description: String)] = []
    
    var pullToAddNewTask: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(addNewTask), for: .valueChanged)
        
        return refresh
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "core"
        self.refreshControl = pullToAddNewTask
        tableView.register(TaskCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none

    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TaskCell
        cell.nameTaskLabel.text = tasks[indexPath.row].name
        cell.descriptionTaskLabel.text = tasks[indexPath.row].description
        return cell
    }
    
    @objc private func addNewTask() {
        let alertController = UIAlertController.init(title: "New task", message: nil, preferredStyle: .alert)
        alertController.addTextField { (ft) in
            ft.placeholder = "print task name"
        }
        alertController.addTextField { (ft) in
            ft.placeholder = "print task description"
        }
        
        let saveNewTaskAction = UIAlertAction(title: "save", style: .default) { (action) in
            guard let name = alertController.textFields?.first?.text, let description = alertController.textFields?.last?.text else { return }
            self.tasks.append((name: name, description: description))
            self.tableView.reloadData()
            self.tableView.refreshControl?.endRefreshing()
        }
        alertController.addAction(saveNewTaskAction)
        present(alertController, animated: true, completion: nil)
    }
}
