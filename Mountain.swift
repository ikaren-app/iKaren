//
//  Mountain.swift
//  UKaren
//
//  Created by Ehlu Moo on 2/17/19.
//  Copyright © 2019 Ehkalu Moo. All rights reserved.
//

import UIKit

class Mountain: UIPageViewController, UIPageViewControllerDataSource {
    lazy var viewControllerList:[UIViewController] = {
        let sb = UIStoryboard(name:"Main", bundle: nil)
        
        let p1 = sb.instantiateViewController(withIdentifier: "pa1")
        let p2 = sb.instantiateViewController(withIdentifier: "pa2")
        let p3 = sb.instantiateViewController(withIdentifier: "pa3")
        let p4 = sb.instantiateViewController(withIdentifier: "pa4")
        let p5 = sb.instantiateViewController(withIdentifier: "pa5")
        let p6 = sb.instantiateViewController(withIdentifier: "pa6")
       
        
        
        return [p1, p2, p3, p4, p5, p6]
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        if let firstViewController = viewControllerList.first{
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
        // Do any additional setup after loading the view.
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewControllerList.index(of: viewController) else {return nil}
        
        let previousIndex = vcIndex - 1
        guard previousIndex >= 0 else  {return nil}
        guard viewControllerList.count > previousIndex else {return nil}
        return viewControllerList [previousIndex]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewControllerList.index(of: viewController) else {return nil}
        
        let nextIndex = vcIndex + 1
        guard viewControllerList.count != nextIndex else {return nil}
        guard viewControllerList.count > nextIndex else {return nil}
        return viewControllerList [nextIndex]
    }
}

//override func didReceiveMemoryWarning() {
//   super.didReceiveMemoryWarning()
// Dispose of any resources that can be recreated.
//}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */



