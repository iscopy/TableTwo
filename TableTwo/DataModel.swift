//
//  DataModel.swift
//  TableTwo
//
//  Created by iscopy on 2022/2/22.
//

import Foundation
struct DataModel: Encodable{
    //标题
    var title : String!
    //内容列表
    var content : [String]!
    //显示、隐藏
    var isHide : Bool!
 
}

