//
//  BaseViewController.swift
//  GoodMorning
//
//  Created by pei hao on 3/16/15.
//  Copyright (c) 2015 pei hao. All rights reserved.
//

import UIKit
import AVFoundation

class BaseViewController: UIViewController,AVSpeechSynthesizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func speak(words:String) {
    
        var synthesizer = AVSpeechSynthesizer();
        var utterance = AVSpeechUtterance(string: "");
        utterance = AVSpeechUtterance(string:words);
        utterance.voice = AVSpeechSynthesisVoice(language:"zh-CN");
        utterance.rate = 0.1;
        synthesizer.delegate = self
        synthesizer.speakUtterance(utterance);
    }
    
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer!, didFinishSpeechUtterance utterance: AVSpeechUtterance!) {
    
        //self.parentViewController
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
