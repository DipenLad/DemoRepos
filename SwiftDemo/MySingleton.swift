//
//  MySingleton.swift
//  SwiftDemo
//
//  Created by Infusion Infotech on 8/31/16.
//  Copyright © 2016 Dipen Lad. All rights reserved.
//

import UIKit

class MySingleton: NSObject
{
    //static let sharedInstance = MySingleton()
    
    var strValue : NSString!
    
    class var sharedInstance: MySingleton {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: MySingleton? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = MySingleton()
        }
        return Static.instance!
    }
    
    override init()
    {
        self.strValue = "Dipen"
    }

}
