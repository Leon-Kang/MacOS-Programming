//
//  Document.swift
//  KLJsonDocument
//
//  Created by 康梁 on 16/1/18.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

import Cocoa

class Document: NSDocument {

    @IBOutlet weak var textField: NSTextField!
    
    @IBOutlet weak var checkBtn: NSButton!
    
    var text = " "
    var checked = true
    
    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }

    override func windowControllerDidLoadNib(aController: NSWindowController) {
        super.windowControllerDidLoadNib(aController)
        
        self.textField.stringValue = self.text
        self.checkBtn.integerValue = Int(self.checked)
        
    }

    override class func autosavesInPlace() -> Bool {
        return true
    }

    override var windowNibName: String? {
        // Returns the nib file name of the document
        // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this property and override -makeWindowControllers instead.
        return "Document"
    }

    override func dataOfType(typeName: String) throws -> NSData {
        
        let dic = ["text": self.textField.stringValue, "checked": self.checkBtn.integerValue]
        
        let jsonData = try! NSJSONSerialization.dataWithJSONObject(dic, options: [])
        
        return jsonData
        // throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }

    override func readFromData(data: NSData, ofType typeName: String) throws {
    
        let dic = try! NSJSONSerialization.JSONObjectWithData(data, options: [])
        
        self.text = dic["text"] as! String
        let value = dic["checked"] as! Int
        self.checked = Bool(value)
        
        // throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }


}

