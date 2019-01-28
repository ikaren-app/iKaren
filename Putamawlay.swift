//
//  Putamawlay.swift
//  UKaren
//
//  Created by Ehlu Moo on 1/15/19.
//  Copyright © 2019 Ehkalu Moo. All rights reserved.
//

import UIKit

class Putamawlay: UIPageViewController, UIPageViewControllerDataSource {
    lazy var viewControllerList:[UIViewController] = {
        let sb = UIStoryboard(name:"Main", bundle: nil)
        
        let pag1 = sb.instantiateViewController(withIdentifier: "pg1")
        let pag2 = sb.instantiateViewController(withIdentifier: "pg2")
        let pag3 = sb.instantiateViewController(withIdentifier: "pg3")
        let pag4 = sb.instantiateViewController(withIdentifier: "pg4")
        let pag5 = sb.instantiateViewController(withIdentifier: "pg5")
        let pag6 = sb.instantiateViewController(withIdentifier: "pg6")
        let pag7 = sb.instantiateViewController(withIdentifier: "pg7")
        
        
        
        
        return [pag1, pag2, pag3, pag4, pag5, pag6, pag7]
        
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

