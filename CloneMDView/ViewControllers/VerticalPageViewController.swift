//
//  VerticalPageViewController.swift
//  CloneMDView
//
//  Created by Phạm Thanh on 3/31/18.
//  Copyright © 2018 Phạm Thanh. All rights reserved.
//

import UIKit
protocol VerticalPageDelegate : NSObjectProtocol {
    func changeView(index : Int , type : ChangePageViewType )
    func changeView(index : Int)
}
class VerticalPageViewController: UIPageViewController {
    
    var pageIndex = 0
    var contentCount = 0
    var contentIndex = 0
    var contents = [ContentViewController]()
    
    weak var delegatePageView:VerticalPageDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.createListContent()
        self.settingPageView()
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func settingPageView(){
        self.dataSource = self
        self.delegate = self
        self.setViewControllers([self.getContentVc(index: pageIndex)], direction: .forward, animated: false, completion: nil)
        self.view.backgroundColor = UIColor.white
    }
    
    func createListContent(){
        for i in 0...(contentCount-1) {
            let storyboard = UIStoryboard(name: "MDView", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ContentVC") as! ContentViewController
            vc.pageIndex = i
            vc.delegate = self
            self.contents.append(vc)
        }
    }
    
    func getContentVc(index : Int ) -> ContentViewController{
        return self.contents[index]
    }
    
}

extension VerticalPageViewController : UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let pageIndex  = (viewController as? ContentViewController)?.pageIndex {
            if pageIndex == 0{
                return nil // is first page
            }
            // go to next page
            return self.getContentVc(index: pageIndex - 1)
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let pageIndex  = (viewController as? ContentViewController)?.pageIndex {
            if pageIndex + 1 == self.contentCount {
            return nil// is last page
            }
            // goto previous page
            return self.getContentVc(index: pageIndex + 1)
        }
        
        return nil
    }
}

extension VerticalPageViewController : ContentViewDelegate {
    
    func viewDidLoad(index: Int) {
        self.contentIndex = index
    }
}

extension VerticalPageViewController : UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
    
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let vc:ContentViewController = previousViewControllers.first as? ContentViewController {
            print("\(vc.pageIndex)  + \(self.contentIndex)")
            if vc.pageIndex < self.contentIndex {
                self.delegatePageView?.changeView(index: self.contentIndex, type: .Down)
            }
            
            if vc.pageIndex > self.contentIndex {
                self.delegatePageView?.changeView(index: self.contentIndex, type: .Up)
            }
        }
    }
}
