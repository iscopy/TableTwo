//
//  ContentCell.swift
//  TableTwo
//
//  Created by iscopy on 2022/2/22.
//

import UIKit

class ContentCell: UITableViewCell {
    
    //内容序号
    @IBOutlet weak var tvSerialNumber: UILabel!
    //内容
    @IBOutlet weak var tvContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
 
        // Configure the view for the selected state
    }
 
}


