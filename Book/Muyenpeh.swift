//
//  Muyenpeh.swift
//  UKaren
//
//  Created by Ehlu Moo on 1/29/19.
//  Copyright © 2019 Ehkalu Moo. All rights reserved.
//

import UIKit

class Muyenpeh: UIPageViewController, UIPageViewControllerDataSource {
    lazy var viewControllerList:[UIViewController] = {
        let sb = UIStoryboard(name:"Main", bundle: nil)
        
        let peg1 = sb.instantiateViewController(withIdentifier: "pge1")
        let peg2 = sb.instantiateViewController(withIdentifier: "pge2")
        let peg3 = sb.instantiateViewController(withIdentifier: "pge3")
        let peg4 = sb.instantiateViewController(withIdentifier: "pge4")
        let peg5 = sb.instantiateViewController(withIdentifier: "pge5")
        let peg6 = sb.instantiateViewController(withIdentifier: "pge6")
        let peg7 = sb.instantiateViewController(withIdentifier: "pge7")
        
        
        
        
        return [peg1, peg2, peg3, peg4, peg5, peg6, peg7]
        
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

