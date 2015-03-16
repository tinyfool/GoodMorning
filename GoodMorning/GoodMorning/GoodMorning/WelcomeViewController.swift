//
//  WelcomeViewController.swift
//  GoodMorning
//
//  Created by pei hao on 3/16/15.
//  Copyright (c) 2015 pei hao. All rights reserved.
//

import UIKit
import AVFoundation
 
class WelcomeViewController: BaseViewController {

    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        containerView.layer.cornerRadius = 15
        
        self.speak("主人，您好。今天是2015年3月16日 星期一。")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func speechSynthesizer(synthesizer: AVSpeechSynthesizer!, didFinishSpeechUtterance utterance: AVSpeechUtterance!) {
        
        var pageVC = self.parentViewController as UIPageViewController
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var weatherView = storyboard.instantiateViewControllerWithIdentifier("WeatherViewController") as WeatherViewController
        pageVC.setViewControllers([weatherView], direction: .Forward, animated: true, completion: nil)
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
