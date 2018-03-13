//
//  Employee.swift
//  MVC
//
//  Created by Intern 5 on 3/12/18.
//  Copyright © 2018 Intern 5. All rights reserved.
//

import Foundation

class Employee {
    
    var name = ""
    var position = ""
    var image = ""
  
  static func fetchEmployee(completionHandler: ([Employee]) -> ()) {
   
    let employee1 = Employee()
    employee1.name = "Tariq"
    employee1.position = "Intern"
    
    let employee2 = Employee()
    employee2.name = "Jithin"
    employee2.position = "Intern2"
    
    let employee3 = Employee()
    employee3.name = "Aadel"
    employee3.position = "Intern3"
    
    completionHandler([employee1, employee2, employee3])

  }
  
}
