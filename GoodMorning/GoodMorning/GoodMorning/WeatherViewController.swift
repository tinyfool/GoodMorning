//
//  WeatherViewController.swift
//  GoodMorning
//
//  Created by pei hao on 3/15/15.
//  Copyright (c) 2015 pei hao. All rights reserved.
//

import UIKit
import AVFoundation

class WeatherViewController: UIViewController {

    
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        containerView.layer.cornerRadius = 15
        
        
        
        var synthesizer = AVSpeechSynthesizer();
        var utterance = AVSpeechUtterance(string: "");
        utterance = AVSpeechUtterance(string: "天津市今日，多云，气温16摄氏度，空气质量指数160，轻度污染，建议戴口罩。");
        utterance.voice = AVSpeechSynthesisVoice(language:"zh-CN");
        utterance.rate = 0.1;
        synthesizer.speakUtterance(utterance);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
