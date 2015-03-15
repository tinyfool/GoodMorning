//
//  AppDelegate.swift
//  GoodMorning
//
//  Created by pei hao on 1/23/15.
//  Copyright (c) 2015 pei hao. All rights reserved.
//

import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        var synthesizer = AVSpeechSynthesizer();
        var utterance = AVSpeechUtterance(string: "");
        //synthesizer.speakUtterance(utterance);
        utterance = AVSpeechUtterance(string: "主人，您好，上海今日最低气温1度，最高气温8度，空气质量指数185，不健康，建议戴口罩，不要开窗，尽量不要到户外运动。你有三个预约，最早的是早上10点，离现在还有10分钟。今天你的星座运势为：往前冲的马力加大，行动力就像被升起的炉火般火力十足。 但是另一方面也加强了你的攻击力，要注意别让火力给烧偏了，别将精力给浪费在无意义的玩乐上，有可能引火上身烧伤自己喔。旺盛的精力当然要运用在好的方面，需要好精神去做的事情都趁早去吧。。最新热门新闻有微软发布了Windows10，无人问津，但微软的眼镜获得了大量的追捧。著名演员陈赫，被爆出已于半年前离婚，在微博以及各大网络社区粉丝的声讨声中，他诚挚道歉，并称希望大家不要继续纠缠他的前妻。埃及的局势继续紧张，伊斯兰国仍旧没有释放日本人质。今天早晨的新闻播送完了。");
        utterance.voice = AVSpeechSynthesisVoice(language:"zh-CN");
        utterance.rate = 0.1;
        
//        utterance = AVSpeechUtterance(string: "所有者、こんにちは、上海の今日、1度、8度の最高温度、185の空気品質指数の最低温度は、不健康な、それはウィンドウを開き、アウトドアスポーツにはないしようとしない、マスクを着用することをお勧めします。あなたは最も古い朝の10時は、10分の距離にまだあるある、3の予定を持っている。今日のあなたのホロスコープ：フォワード馬力に行くには、火の上昇のような火の完全なものとして機動性を増加させた。しかし、それはまた、火災が邪魔にまかせるないように注意を払う、あなたの攻撃力を強化し、意味のない遊びに無駄なエネルギーを与えていない、自分がああ火傷があっ焼くことがあります。もちろん、良い面を利用する強力な努力が、あなたは物事ができるだけ早期に行く行うには良い精神を必要とする。 。最新のトップニュースは、MicrosoftがWindows10をリリースしている、誰も気にしないが、Microsoftのガラスは、ホット追求の多くを得る。有名な俳優陳氏は、破産が6ヶ月前に離婚した、マイクロブログネットワークのファンのコミュニティだけでなく、主要な抗議され、彼は心から私たちは彼の元妻に苦労し続けるべきではないと言って、謝罪した。エジプトの緊迫した状況では、日本のイスラム国家はまだ人質を解放されませんし続ける。今朝のニュース放送が終了しました。");
//        utterance.voice = AVSpeechSynthesisVoice(language:"ja-JP");
//        utterance.rate = 0.1;
        //synthesizer.speakUtterance(utterance);

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

