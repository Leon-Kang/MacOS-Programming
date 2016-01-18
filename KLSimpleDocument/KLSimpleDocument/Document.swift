//
//  Document.swift
//  KLSimpleDocument
//
//  Created by 康梁 on 16/1/18.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

import Cocoa

class Document: NSDocument {

    @IBOutlet weak var textField: NSTextField!
    
    var text = " "
    
    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }

    override func windowControllerDidLoadNib(aController: NSWindowController) {
        super.windowControllerDidLoadNib(aController)
        
        self.textField.stringValue = self.text
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
        
        self.text = self.textField.stringValue
        
        return self.text.dataUsingEncoding(NSUTF8StringEncoding)!
        
        // throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }

    override func readFromData(data: NSData, ofType typeName: String) throws {
    
        if data.length > 0 {
            self.text = String(data: data, encoding: NSUTF8StringEncoding)!
        } else {
            self.text = ""
        }
        
        
        // throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }


}

