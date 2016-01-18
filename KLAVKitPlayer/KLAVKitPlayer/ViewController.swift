//
//  ViewController.swift
//  KLAVKitPlayer
//
//  Created by 康梁 on 16/1/13.
//  Copyright © 2016年 kl. All rights reserved.
//

import Cocoa
import AVKit
import AVFoundation

class ViewController: NSViewController {

    @IBOutlet weak var klPlayerView: AVPlayerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.klPlayerView.player = self.addAVPlayer("TestVideo", extention: "m4v")
    }

    override var representedObject: AnyObject? {
        didSet {
        
        }
    }

    func addAVPlayer(name: String, extention: String) -> AVPlayer {
        let url = NSBundle.mainBundle().URLForResource(name, withExtension: extention)
        let player = AVPlayer(URL: url!)
        return player
    }

}

