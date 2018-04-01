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

    @IBOutlet weak var mangaImage: UIImageView!
    @IBOutlet weak var titleLb: UILabel!
    
    var pageIndex = 0
    weak var delegate:ContentViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.titleLb.text = pageIndex.description
        if let image = UIImage(named:"1522038702-" + (self.pageIndex + 25).description + ".jpg") {
            self.mangaImage.image = image
        }
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.delegate?.viewDidLoad(index: self.pageIndex)
    }

      
}
