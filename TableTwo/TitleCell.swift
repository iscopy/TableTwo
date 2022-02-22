//
//  TitleCell.swift
//  TableTwo
//
//  Created by iscopy on 2022/2/22.
//

import UIKit
 
class TitleCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {
    //标题
    @IBOutlet weak var tvTitle: UILabel!
    //内容数量
    @IBOutlet weak var tvContentNumber: UILabel!
    //内部内容 TableView
    @IBOutlet weak var contentTable: UITableView!
    //声明数据传输接口
    var sendContent:SendContent?
    
    var listData:Array = [String]()
    //内层数据数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    //内部Cell
    var contentCell:ContentCell?
    //设置内层数据
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        contentCell = (tableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath) as! ContentCell)
        let row = (indexPath as NSIndexPath).row
        //设置序号
        contentCell?.tvSerialNumber.text = "\(row + 1)"
        //设置内容
        contentCell?.tvContent.text = listData[row]
        return contentCell!
    }
    //点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let row = (indexPath as NSIndexPath).row
        //sendContent!(listData[row], row)
    }
    //设置为删除模式
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    //侧滑删除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let row = (indexPath as NSIndexPath).row
        sendContent!(listData[row], row)
        //self.listData.remove(at: (indexPath as NSIndexPath).row)
        //self.codeTable.deleteRows(at: [indexPath], with: .fade)
        //self.codeTable.reloadData()
    }
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
        
    //设置每条内容的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        contentTable.reloadData()
        // Configure the view for the selected state
    }
 
}

