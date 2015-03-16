//
//  ContainerPageViewController.swift
//  GoodMorning
//
//  Created by pei hao on 3/15/15.
//  Copyright (c) 2015 pei hao. All rights reserved.
//

import UIKit

class ContainerPageViewController: UIPageViewController,UIPageViewControllerDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        self.dataSource = self
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let welcomeView = storyboard.instantiateViewControllerWithIdentifier("WelcomeViewController") as WelcomeViewController
//        var weatherView = storyboard.instantiateViewControllerWithIdentifier("WeatherViewController") as WeatherViewController

        var viewArray = [welcomeView]
        self.setViewControllers(viewArray, direction: .Forward, animated: true ) { (Bool) -> Void in
            
        }
        
        
        //主人，您好。
        //上海今日最低气温1度，最高气温8度，空气质量指数185，不健康，建议戴口罩，不要开窗，尽量不要到户外运动。
        //你有三个预约，最早的是早上10点，离现在还有10分钟。
        //今天你的星座运势为：往前冲的马力加大，行动力就像被升起的炉火般火力十足。 但是另一方面也加强了你的攻击力，要注意别让火力给烧偏了，别将精力给浪费在无意义的玩乐上，有可能引火上身烧伤自己喔。旺盛的精力当然要运用在好的方面，需要好精神去做的事情都趁早去吧。
        //最新热门新闻有微软发布了Windows10，无人问津，但微软的眼镜获得了大量的追捧。著名演员陈赫，被爆出已于半年前离婚，在微博以及各大网络社区粉丝的声讨声中，他诚挚道歉，并称希望大家不要继续纠缠他的前妻。埃及的局势继续紧张，伊斯兰国仍旧没有释放日本人质。
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
    
        return nil
    }
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
    
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var weatherView2 = storyboard.instantiateViewControllerWithIdentifier("WeatherViewController") as WeatherViewController

        return weatherView2
    }

    func presentationCountForPageViewController(pageViewController: UIPageViewController!) -> Int {
        return 2
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
