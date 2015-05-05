//
//  ViewController.swift
//  Bigbang
//
//  Created by 小池春枝 on 2015/04/20.
//  Copyright (c) 2015年 harue. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer:AVAudioPlayer?
    @IBOutlet var button:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 再生する audio ファイルのパスを取得
        let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("dress", ofType: "m4a")!)
        
        // auido を再生するプレイヤーを作成する
        var audioError:NSError?
        audioPlayer = AVAudioPlayer(contentsOfURL: audioPath, error:&audioError)
        
        // エラーが起きたとき
        if let error = audioError {
            println("Error \(error.localizedDescription)")
        }
        
        audioPlayer!.delegate = self
        audioPlayer!.prepareToPlay()
        
    }
    
    // ボタンがタップされた時の処理
    @IBAction func buttonTapped(sender : AnyObject) {
        if ( audioPlayer!.playing ){
            audioPlayer!.stop()
            button?.setTitle("Stop", forState: UIControlState.Normal)
        }
        else{
            audioPlayer!.play()
            button?.setTitle("Play", forState: UIControlState.Normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}