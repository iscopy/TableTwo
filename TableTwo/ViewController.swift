//
//  ViewController.swift
//  TableTwo
//
//  Created by iscopy on 2022/2/22.
//

import UIKit
 
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //标题输入框
    @IBOutlet weak var etTitle: UITextField!
    //内容输入框
    @IBOutlet weak var etContent: UITextField!
    //确定添加标题、内容
    @IBAction func btnAddData(_ sender: Any) {
        if self.etTitle.text == ""{
            self.alertsOne(contents: "请先输入标题")
            return
        }
        
        if self.etContent.text == ""{
            self.alertsOne(contents: "请先输入内容")
            return
        }
        
        var isExistence = false
        
        for i in 0..<self.listData.count{
            if self.listData[i].title == self.etTitle.text{
                //如果已经有这个标题了，就往这个标题下直接添加内容
                isExistence = true
                self.listData[i].content.append(self.etContent.text!)
            }
        }
        if !isExistence{
            //如果还没有这个标题，就添加标题、内容
            self.listData.append(DataModel.init(title: self.etTitle.text!, content: [self.etContent.text!], isHide: false))
        }
        self.tableView.reloadData()
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
 
    //外部 TableView
    @IBOutlet weak var tableView: UITableView!
    
    var listData:Array = [DataModel]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    var titleCell:TitleCell?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        titleCell = (tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath) as! TitleCell)
        let row = (indexPath as NSIndexPath).row
        titleCell?.tvTitle.text = listData[row].title ?? ""
        titleCell?.tvContentNumber.text = "\(listData[row].content.count)"
        titleCell?.listData = listData[row].content
        titleCell?.sendContent = {(content : String, postion : Int) -> Void in
            //内部的侧滑删除：删除内容
            self.listData[row].content.remove(at:self.listData[row].content.firstIndex(of: content) ?? 0)
            //如果一条内容都没有，就删除标题
            if self.listData[row].content.count == 0{
                self.listData.remove(at: row)
            }
            //刷新数据
            self.tableView.reloadData()
        }
        return titleCell!
    }
    //点击事件-点击展开或隐藏
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = (indexPath as NSIndexPath).row
        if listData[row].isHide{
            listData[row].isHide = false
        }else{
            listData[row].isHide = true
        }
        self.tableView.reloadData()
    }
    //设置为删除模式-当前设置为不能侧滑删除
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    //侧滑删除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.listData.remove(at: (indexPath as NSIndexPath).row)
        self.tableView.deleteRows(at: [indexPath], with: .fade)
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = (indexPath as NSIndexPath).row
        if listData[row].isHide{
            return CGFloat(70 + listData[row].content.count*40)
        }else{
            return 50
        }
    }
    
    
    //MARK: - 单按钮提示框
    func alertsOne(contents:String){
        let alert:UIAlertController = UIAlertController(title: "温馨提示", message: contents, preferredStyle: UIAlertController.Style.alert)
        let yesAction = UIAlertAction(title: "确定", style: .cancel) { (UIAlertAction) in
            
        }
        alert.addAction(yesAction)
        //以模态方式弹出
        self.present(alert, animated: true, completion: nil)
    }
}

