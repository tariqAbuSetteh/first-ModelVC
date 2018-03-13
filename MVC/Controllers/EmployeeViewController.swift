//
//  EmployeeViewController.swift
//  MVC
//
//  Created by Intern 5 on 3/12/18.
//  Copyright © 2018 Intern 5. All rights reserved.
//

import UIKit

class EmployeeViewController: UITableViewController,UISearchBarDelegate {

  @IBOutlet weak var search: UISearchBar!
  
    var employee = [Employee](){
      didSet {
        tableView.reloadData()
      }
    }
  
  var filteredEmployee = [Employee]()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //to load
    Employee.fetchEmployee{ [weak self] (employee) in
      self?.employee = employee
    }
    search.delegate = self
    filteredEmployee = employee
  }
  
}

extension EmployeeViewController  {

  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

      return filteredEmployee.count
    
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let employeeCell = tableView.dequeueReusableCell(withIdentifier: EmployeeCell.reusedeIdentifier) as? EmployeeCell else {
      return UITableViewCell()
    }
    
    employeeCell.employee = filteredEmployee[indexPath.row]
    
    return employeeCell
    
  }
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

    guard !searchText.isEmpty else {
      filteredEmployee = employee
      tableView.reloadData()
      return
    }
    filteredEmployee = employee.filter({employees -> Bool in
      employees.name.contains(searchText)
    })
    tableView.reloadData()
  }
  
}
