//
//  FetchNoticeModel.swift
//  VIPER-demo
//
//  Created by Bipin on 6/29/18.
//  Copyright © 2018 Tootle. All rights reserved.
//

import Foundation
import ObjectMapper


class ListInteractor:NSObject,ListInputInteractorProtocol{
   
    
    weak var presenter: ListOutputInteractorProtocol?
    
    var params:[String: Any] = [:]
    
    var ListFinalArray = [AnyObject]()
    var responseDictionary = [String: AnyObject]()
    
    
    func getList(view:UIViewController) {
        
        
        do {
            //--GET API CALL--//
           
            
        }catch (let error as NSError) {
          
        }
    }
    
    func updateList(view: UIViewController, memberInfoString: String) {
        
    }
   
    
}
