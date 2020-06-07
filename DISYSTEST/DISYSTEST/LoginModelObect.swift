//
//  LoginModelObect.swift
//  Study Tech
//
//  Created by Mani on 29/07/19.
//  Copyright © 2018 Manikandan. All rights reserved.
//

import UIKit
import Foundation
import ObjectMapper

class LoginModelObject {
    
    var id : String?
    var username : String?
    var status : String?
    var state : String?
    var name : String?
    var mobilenumber : String?
    var message : String?
    var language : String?
    var OSversion : String?
    var Device : String?
    var App_Version : String?
    
    required init?(map: Map) {
        mapping(map: map)
    }
}

extension LoginModelObject : Mappable {
    
    func mapping(map: Map) {
        id       <-      map["id"]
        username      <-      map["username"]
        status  <-      map["status"]
        state       <-      map["state"]
        name      <-      map["name"]
        mobilenumber          <-      map["mobilenumber"]
        message  <-      map["message"]
        language       <-      map["language"]
        OSversion      <-      map["OSversion"]
        Device          <-      map["Device"]
        App_Version  <-      map["App_Version"]
        
    }
}
