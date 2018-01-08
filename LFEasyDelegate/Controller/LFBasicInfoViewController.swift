//
//  Form1ViewController.swift
//  StackTest
//
//  Created by Florian LUDOT on 1/8/18.
//  Copyright © 2018 Florian LUDOT. All rights reserved.
//

import UIKit

protocol LFFormDelegate {
    func didSaveBasicInfoForm(form: LFBasicInfoForm)
    func didSaveQuestionForm(form: LFQuestionForm)
}

class LFBasicInfoViewController: UITableViewController {

    var formDelegate: LFFormDelegate!
        
    var firstNameCell: UITableViewCell = LFStyledTableCell()
    var lastNameCell: UITableViewCell = LFStyledTableCell()
    
    var firstNameText: UITextField = UITextField()
    var lastNameText: UITextField = UITextField()
    
    override func loadView() {
        super.loadView()
        
        title = "Basic info"
        let saveBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(handleSaveInfo))
                navigationItem.rightBarButtonItem = saveBarButtonItem
        
        buildStaticCells()
    
    }
    
    @objc func handleSaveInfo() {
        
        let firstname = firstNameText.text ?? ""
        let lastname = lastNameText.text ?? ""
        
        let formData = LFBasicInfoForm(firstname: firstname, lastname: lastname)
        self.navigationController?.popViewController(animated: true)
        formDelegate.didSaveBasicInfoForm(form: formData)
    }
    
    func buildStaticCells() {
        firstNameText.placeholder = "Enter your firstname"
        firstNameText.frame = CGRect(x: 5, y: 5, width: SCREENW-10, height: firstNameCell.frame.height-10)
        firstNameCell.addSubview(firstNameText)
        
        lastNameText.placeholder = "Enter your lasname"
        lastNameText.frame = CGRect(x: 5, y: 5, width: SCREENW-10, height: lastNameCell.frame.height-10)
        lastNameCell.addSubview(lastNameText)
    }
    
}

extension LFBasicInfoViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0: return firstNameCell
        case 1: return lastNameCell
        default: fatalError("Unknown row number")
        }
    }
    
}
