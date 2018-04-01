//
//  ViewController.swift
//  CloneMDView
//
//  Created by Phạm Thanh on 3/31/18.
//  Copyright © 2018 Phạm Thanh. All rights reserved.
//

import UIKit

class HorizotalPageViewController: UIPageViewController {

    var contentCount = 0
    var pageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
    
        self.setViewControllers([getVerticalPageVc(index : 0)], direction: .forward, animated: false, completion: nil)
        self.view.backgroundColor = UIColor.white

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    func getVerticalPageVc(index : Int ) -> VerticalPageViewController{
        let storyboard = UIStoryboard(name: "MDView", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VerticalPageVC") as! VerticalPageViewController
        vc.pageIndex = index
        vc.contentCount = self.contentCount
        vc.delegatePageView = self
        return vc
    }

   
}

extension HorizotalPageViewController : UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController,  viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vc:VerticalPageViewController  = viewController as! VerticalPageViewController
        var index = vc.pageIndex
        if (index == 0 || index == NSNotFound){
            return nil
        }
        index -= 1
        return self.getVerticalPageVc(index : index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vc:VerticalPageViewController  = viewController as! VerticalPageViewController
        var index = vc.pageIndex
        if (index == NSNotFound){
            return nil;
        }
        
        index += 1;
        if (index == self.contentCount){
            return nil;
        }

        return self.getVerticalPageVc(index : index)
    }
}

extension HorizotalPageViewController : VerticalPageDelegate {
    func changeView(index: Int, type : ChangePageViewType) {
        DispatchQueue.main.async {
            self.setViewControllers([self.getVerticalPageVc(index: index)], direction: .reverse, animated: false, completion: { completed in
                if !completed { return }
                self.dataSource = nil
                self.dataSource = self
            })
        }
    }
    
    func changeView(index: Int) {
    }
}

