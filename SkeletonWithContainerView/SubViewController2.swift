//
//  SubViewController2.swift
//  SkeletonWithContainerView
//
//  Created by janderton on 10/10/16.
//  Copyright © 2016 Nav Technologies. All rights reserved.
//

import UIKit
var subViewController2Count = 0
class SubViewController2: UIViewController, ButtonTappedDelegate {
    
    @IBOutlet weak var closureButton: Button!
    @IBOutlet weak var handlerButton: Button!
    @IBOutlet weak var closureWithWeakSelfButton: Button!
    
    override func viewDidLoad() {
        subViewController2Count += 1
        print("subViewController2Count added to heap: \(subViewController2Count)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    deinit {
        subViewController2Count -= 1
        print("subViewController2Count removed from heap: \(subViewController2Count)")
    }
    
    @IBAction func handleCloseWithWeakSelfTapped(_ sender: Button) {
        sender.completionHandler = { [weak self] in
            guard let strongSelf = self else { return }
            print("handleCloseWithWeakSelfTapped")
            strongSelf.closureWithWeakSelfButton.setTitle("Tapped", for: .normal)
        }
        sender.completionHandler()
    }

    @IBAction func handleClosureTapped(_ sender: Button) {
        sender.completionHandler = {_ in
            print("handleClosureTapped")
            self.closureButton.setTitle("Tapped", for: .normal)
        }
        sender.completionHandler()
    }
    
    
    
    
    @IBAction func handleHandlerTapped(_ sender: Button) {
        ButtonTapper.tapTheButton(completionHandler: self)
    }
    
    func buttonDidTap() {
        self.handlerButton.setTitle("tapped", for: .normal)
        print("buttonDidTap Fired")
    }
}

class Button: UIButton {
    var completionHandler:()->Void = {
        print("Button.completionHandler executed")
        
    }
}

class ButtonTapper {
    static func tapTheButton(completionHandler: ButtonTappedDelegate) {
        completionHandler.buttonDidTap()
    }
}

protocol ButtonTappedDelegate {
    func buttonDidTap()
}

