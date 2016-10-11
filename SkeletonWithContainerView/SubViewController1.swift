//
//  SubViewController1.swift
//  SkeletonWithContainerView
//
//  Created by janderton on 10/10/16.
//  Copyright © 2016 Nav Technologies. All rights reserved.
//

import UIKit

class SubViewController1: UIViewController {
    
    @IBAction func handleGoto2(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "goto2", sender: nil)
    }
    
    @IBAction func goto3(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "goto3", sender: nil)
    }

}
