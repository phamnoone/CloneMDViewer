//
//  ContentViewController.swift
//  CloneMDView
//
//  Created by Phạm Thanh on 3/31/18.
//  Copyright © 2018 Phạm Thanh. All rights reserved.
//

import UIKit
protocol ContentViewDelegate : NSObjectProtocol {
    func viewDidLoad(index : Int )
}

class ContentViewController: UIViewController {

    @IBOutlet weak var contentScrollView: ImageScrollView!
    @IBOutlet weak var contentView =  UIView()
    
    var pageIndex = 0
    weak var delegate:ContentViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        settingMagaImage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.delegate?.viewDidLoad(index: self.pageIndex)
    }
    
    func settingMagaImage(){


        if let image = UIImage(named:"1522038702-" + (self.pageIndex + 25).description + ".jpg") {
            self.contentScrollView.display(image: image)
        }

        
    }
    
    
}
