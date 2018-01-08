//
//  QuestionViewController.swift
//  StackTest
//
//  Created by Florian LUDOT on 1/8/18.
//  Copyright © 2018 Florian LUDOT. All rights reserved.
//

import UIKit

class LFQuestionViewController: UITableViewController {
    
    var formDelegate: LFFormDelegate!

    var areYouARobotCell: UITableViewCell = LFStyledTableCell()
    
    var areYouARobotSwitch: UISwitch = UISwitch()
    
    
    override func loadView() {
        super.loadView()
        
        title = "Question"
        
        let saveBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(handleSaveInfo))
        navigationItem.rightBarButtonItem = saveBarButtonItem
        
        buildStaticCells()

    }
    
    @objc func handleSaveInfo() {
        let areYouHuman = areYouARobotSwitch.isOn
        let formData = LFQuestionForm(isHuman: areYouHuman)
        self.navigationController?.popViewController(animated: true)
        formDelegate.didSaveQuestionForm(form: formData)
    }
    
    @objc func handleSwitch() {
        print(areYouARobotSwitch.isOn)
    }
    
    func buildStaticCells() {
        areYouARobotSwitch.isOn = false
        areYouARobotSwitch.frame.origin = CGPoint(x: SCREENW-70, y: 7)
        areYouARobotCell.addSubview(areYouARobotSwitch)
    }
    
}

extension LFQuestionViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = areYouARobotCell
            cell.textLabel?.text = "Are you human?"
            return cell
        default: fatalError("Unknown row number")
        }
    }
    
}
