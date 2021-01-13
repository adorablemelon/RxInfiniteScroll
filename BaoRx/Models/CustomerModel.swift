//
//  CustomerModel.swift
//  BaoRx
//
//  Created by DC4 on 13/01/2021.
//

import Foundation
import Foundation
struct customerStruct:Decodable{
    let ID:Int
    let firstName:String
    let lastName:String
    let email:String
    let phone:String
    let source:String
    let status:String
    let createdDate:String
    let updatedDate:String
}

struct customerTestStruct:Decodable{
    let name: String
    let place: String
}
