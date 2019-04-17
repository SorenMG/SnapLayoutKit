//
//  ViewController.swift
//  iOS-Example
//
//  Created by Søren Møller Gade Hansen on 16/04/2019.
//  Copyright © 2019 Søren Møller Gade Hansen. All rights reserved.
//

import UIKit
import SnapLayoutKit

class ViewController: UIViewController {
    
    let greenView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.green.cgColor
        return view
    }()
    
    let redView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.red.cgColor
        return view
    }()
    
    let blueView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.blue.cgColor
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(greenView)
        greenView.exec()
            .safe()
            .snap(to: view)
        
        view.addSubview(redView)
        redView
            .exec()
            .centerY(to: greenView)
            .snapRight(view, offset: -100)
            .size(.init(width: 100, height: 100))

        view.addSubview(blueView)
        blueView
            .exec()
            .center(to: redView)
            .size(.init(width: 50, height: 50))
    }
}

