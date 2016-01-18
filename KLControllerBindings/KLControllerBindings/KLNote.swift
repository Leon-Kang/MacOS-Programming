//
//  KLNote.swift
//  KLControllerBindings
//
//  Created by 康梁 on 16/1/18.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

import Cocoa

class KLNote: NSObject {
    
    var title = "new note" {
        didSet {
            edited = NSDate()
        }
    }
    var text: NSAttributedString = NSAttributedString(string: "new note")
        {
        didSet {
            edited = NSDate()
        }
    }
    
    var created = NSDate()
    var edited = NSDate()
}
