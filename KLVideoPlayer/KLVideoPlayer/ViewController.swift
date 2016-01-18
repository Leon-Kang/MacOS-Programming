//
//  ViewController.swift
//  KLVideoPlayer
//
//  Created by 康梁 on 16/1/13.
//  Copyright © 2016年 kl. All rights reserved.
//

import Cocoa
import AVFoundation
import Quartz

class ViewController: NSViewController {

    @IBOutlet weak var playerView: NSView!
    
    var player: AVPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = playerWithResource("TestVideo", extention: "m4v")
        let playerLayer = self.playerLayer(player)
        self.playerView.layer?.addSublayer(playerLayer)
        
    }

    override var representedObject: AnyObject? {
        didSet {
        
        }
    }

    func playerWithResource(name: String, extention: String) -> AVPlayer {
        let url = NSBundle.mainBundle().URLForResource(name, withExtension: extention)
        let aPlayer = AVPlayer(URL: url!)
        aPlayer.actionAtItemEnd = AVPlayerActionAtItemEnd.None
        
        return aPlayer
    }
    
    func playerLayer(player:AVPlayer) -> AVPlayerLayer {
        let layer = AVPlayerLayer(player: player)
        layer.frame = playerView.bounds
        layer.autoresizingMask = [CAAutoresizingMask.LayerHeightSizable, .LayerWidthSizable]
        return layer
    }
    
    
    @IBAction func play(sender: AnyObject) {
        self.player.play()
    }
    
    @IBAction func slowPlay(sender: AnyObject) {
        self.player.rate = 0.5
    }

    @IBAction func rewind(sender: AnyObject) {
        self.player.seekToTime(kCMTimeZero)
    }

}

