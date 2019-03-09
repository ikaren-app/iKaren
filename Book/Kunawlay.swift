//
//  Kunawlay.swift
//  UKaren
//
//  Created by Ehlu Moo on 1/29/19.
//  Copyright © 2019 Ehkalu Moo. All rights reserved.
//

import UIKit

class Kunawlay: UIPageViewController, UIPageViewControllerDataSource {
    lazy var viewControllerList:[UIViewController] = {
        let sb = UIStoryboard(name:"Main", bundle: nil)
        
        let p1 = sb.instantiateViewController(withIdentifier: "peg1")
        let p2 = sb.instantiateViewController(withIdentifier: "peg2")
        let p3 = sb.instantiateViewController(withIdentifier: "peg3")
        let p4 = sb.instantiateViewController(withIdentifier: "peg4")
        let p5 = sb.instantiateViewController(withIdentifier: "peg5")
        let p6 = sb.instantiateViewController(withIdentifier: "peg6")
        let p7 = sb.instantiateViewController(withIdentifier: "peg7")
        
        
        
        
        return [p1, p2, p3, p4, p5, p6, p7]
        
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

