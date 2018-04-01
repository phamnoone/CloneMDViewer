//
//  ViewController.swift
//  CloneMDView
//
//  Created by Phạm Thanh on 3/31/18.
//  Copyright © 2018 Phạm Thanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var mdView = HorizotalPageViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addChildViewController(mdView)
       
    }
    
      override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gotoPageviewPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "MDView", bundle: nil)
        let vc:MDViewController = storyboard.instantiateViewController(withIdentifier: "MDVC") as! MDViewController
        self.present(vc, animated: true, completion: nil)
    }

   
}
