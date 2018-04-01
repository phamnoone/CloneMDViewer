//
//  MDViewController.swift
//  CloneMDView
//
//  Created by Phạm Thanh on 4/1/18.
//  Copyright © 2018 Phạm Thanh. All rights reserved.
//

import UIKit

protocol MDViewControllerDelegate : NSObjectProtocol {
    
}

class MDViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    var mdPageView : HorizotalPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settingPageView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func settingPageView(){
        let opption = [UIPageViewControllerOptionInterPageSpacingKey : 25]
        self.mdPageView = HorizotalPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options : opption)
        self.mdPageView.contentCount = 20
        self.contentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        self.contentView.addSubview(mdPageView.view)
        self.mdPageView.didMove(toParentViewController: self)
    }

   
}
