//
//  ResultViewController.swift
//  ConvertNumbers
//
//  Created by 杉原大貴 on 2020/09/16.
//  Copyright © 2020 杉原大貴. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func createButton() {
        
        let wrapWidth = view.frame.width
        let wrapHight = view.frame.height
        let timeUpButton = UIButton(type: .system)
        timeUpButton.frame = CGRect(x: 0, y: 0, width: wrapWidth, height: wrapHight)
        timeUpButton.setTitle("TIME UP!", for: .normal)
        timeUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        timeUpButton.contentHorizontalAlignment = .center
        timeUpButton.layer.zPosition = 1002
        timeUpButton.setTitleColor(UIColor.white, for: .normal)
        view.addSubview(timeUpButton)
    }

}
