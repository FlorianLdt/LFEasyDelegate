//
//  FormCell.swift
//  StackTest
//
//  Created by Florian LUDOT on 1/8/18.
//  Copyright © 2018 Florian LUDOT. All rights reserved.
//

import UIKit

class LFStyledTableCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
