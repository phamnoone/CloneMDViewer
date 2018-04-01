//
//  PageViewManager.swift
//  CloneMDView
//
//  Created by Phạm Thanh on 3/31/18.
//  Copyright © 2018 Phạm Thanh. All rights reserved.
//

import UIKit



class PageViewManager: NSObject {
    static let shareManager = PageViewManager()
    
    
    var xAxis = 0
    var yAxis = 0

    var mode = true // japan read styles
    
    private var contentIndex = 0
    var contentCount = 0

    private override init() { }
    
    
    private func actionNext(){
        if self.contentIndex < self.contentCount {
            self.contentIndex += 1
        }
           }
    
    private func actionBack(){
        if self.contentIndex > 0 {
            self.contentIndex -= 1
        }
    }
    
    // MARK: Init page func
    func getCurrentContentIndex() -> Int{
        return self.contentIndex
    }
    
    func setPageCount (count : Int) {
        self.contentCount = count
        
    }
    
    
    //MARK: Coordinates func 
    func getxAxisMax() -> Int{
        return self.contentCount
    }
    
    func getyAxisMax() -> Int{
        return self.contentCount
    }
    
    // MARK: view action func
    
    func chageState (state : ChangePageViewType ){
//        self.state = state
//        switch state {
//        case .Left:
//            print("Left")
//            self.actionBack()
//            break
//        case .Right:
//            print("Right")
//            self.actionNext()
//            break
//        case .Up:
//            print("Up")
//            self.actionBack()
//            break
//        case .Down:
//            print("Down")
//            self.actionNext()
//            break
//        default: break
        }
    
    func setXaxis(value : Int ) {
        self.xAxis = value
    }
    
    func changeXaxis(value : Int ) {
        if self.xAxis < value {
            self.chageState(state: .Left)
        } else if self.xAxis > value {
            self.chageState(state: .Right)
        }
    }
    
    func setYaxis(value : Int ) {
        self.yAxis = value
    }
    
    func changeYaxis(value : Int ) {
        if self.yAxis < value {
            self.chageState(state: .Up)
        } else if self.yAxis > value {
            self.chageState(state: .Down)
        }
    }

    
    func getContentViewController(index : Int) -> ContentViewController{
        let storyboard = UIStoryboard(name: "MDView", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ContentVC") as! ContentViewController
        vc.pageIndex = index
        return vc
    }
    
    func getHorizotalPageController(index : Int ) -> HorizotalPageViewController{
        let storyboard = UIStoryboard(name: "MDView", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HorizotalPageVC") as! HorizotalPageViewController
        vc.pageIndex = index
        return vc
    }

    func getVerticalPageViewController(index : Int ) -> VerticalPageViewController{
        let storyboard = UIStoryboard(name: "MDView", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VerticalPageVC") as! VerticalPageViewController
        vc.pageIndex = index
        return vc
    }

    


}
