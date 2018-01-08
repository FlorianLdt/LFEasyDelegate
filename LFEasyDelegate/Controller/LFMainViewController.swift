//
//  ViewController.swift
//  StackTest
//
//  Created by Florian LUDOT on 1/6/18.
//  Copyright © 2018 Florian LUDOT. All rights reserved.
//

import UIKit

let mainReuseIdentifier = "mainReuseIdentifier"

class LFMainViewController : UIViewController {
    
    var basicInfoForm: LFBasicInfoForm! {
        didSet {
            let okAction = UIAlertAction(title: "OK", style: .default)
            let message = "Hello \(basicInfoForm.firstname) \(basicInfoForm.lastname)"
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    var questionForm: LFQuestionForm! {
        didSet {
            let okAction = UIAlertAction(title: "OK", style: .default)
            
            let message: String!
            
            if questionForm.isHuman {
                message = "You are human"
            } else {
                message = "You are not human"
            }
            
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    let tableView: UITableView = {
        let tv = UITableView()
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Patient Info Form"
        
        view.backgroundColor = .white

        view.addSubview(tableView)
        
        tableView.frame = view.frame

        tableView.delegate = self
        tableView.dataSource = self
        
    }
}

extension LFMainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LFStyledTableCell()
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Basic information"
        case 1:
            cell.textLabel?.text = "Question"
        default:
            fatalError("Unknown row number")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let basicInfoVC = LFBasicInfoViewController(style: .grouped)
            basicInfoVC.formDelegate = self
            self.navigationController?.pushViewController(basicInfoVC, animated: true)
        case 1:
            let questionVC = LFQuestionViewController(style: .grouped)
            questionVC.formDelegate = self
            self.navigationController?.pushViewController(questionVC, animated: true)
        default:
            ()
        }
    }
    
}

extension LFMainViewController: LFFormDelegate {
    
    func didSaveBasicInfoForm(form: LFBasicInfoForm) {
        self.basicInfoForm = form
    }
    
    func didSaveQuestionForm(form: LFQuestionForm) {
        self.questionForm = form
    }
}



