//
//  TwitterViewController.swift
//  NavBar
//
//  Created by Anirudha on 24/07/17.
//  Copyright © 2017 Anirudha Mahale. All rights reserved.
//

import UIKit

class TwitterViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var header: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let offset_HeaderStop:CGFloat = 40.0 // At this offset the Header stops its transformations
    // let offset_B_LabelHeader:CGFloat = 95.0 // At this offset the Black label reaches the Header
    // let distance_W_LabelHeader:CGFloat = 35.0 // The distance between the bottom of the Header and the top of the White Label
    
    override func viewDidLoad() {
        super.viewDidLoad()
        header.alpha = 0
        scrollView.delegate = self
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        var headerTransform = CATransform3DIdentity
        
        // PULL DOWN -----------------
        if offset < 0 {
            
            let headerScaleFactor:CGFloat = -(offset) / header.bounds.height
            print("offf is less")
            header.alpha = headerScaleFactor
            let headerSizevariation = ((header.bounds.height * (1.0 + headerScaleFactor)) - header.bounds.height)/2.0
            headerTransform = CATransform3DTranslate(headerTransform, 0, headerSizevariation, 0)
            headerTransform = CATransform3DScale(headerTransform, 1.0 + headerScaleFactor, 1.0 + headerScaleFactor, 0)
        } else {
            // Header -----------
            print("offf is more")
            headerTransform = CATransform3DTranslate(headerTransform, 0, max(-offset_HeaderStop, -offset), 0)
        }
        
        // Apply Transformations
        header.layer.transform = headerTransform
    }
    

}
