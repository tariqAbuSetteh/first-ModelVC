//
//  EmployeeCell.swift
//  MVC
//
//  Created by Intern 5 on 3/12/18.
//  Copyright © 2018 Intern 5. All rights reserved.
//we created this view cell in order to control everything about cells
//and we will do this for any interface item that has specififc things

import UIKit

class EmployeeCell: UITableViewCell {

  var employee: Employee? {
    didSet {
      thecellView()
    }
  }
  
  static let reusedeIdentifier = "EmployeeCell"
  
    //it's like videw did load
    override func awakeFromNib() {
        super.awakeFromNib()
        
        thecellView()
        
    }
    
    func thecellView(){
        //we used this code to ascertain to xcode that it have some value
        //we could also use if let
        guard let employee = employee else {
          return
      }
        
        textLabel?.text = employee.name
        detailTextLabel?.text = employee.position
    }

}
