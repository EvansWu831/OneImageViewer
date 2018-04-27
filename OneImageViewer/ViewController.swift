//
//  ViewController.swift
//  OneImageViewer
//
//  Created by Evans Wu on 2018/4/27.
//  Copyright © 2018年 Evans Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    var imageView: UIImageView!
    func setupImageView() {
        let image: UIImage = UIImage(named:"image-landing")!
        imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
    }
    
    var button: UIButton!
    func setupButton() {
        button = UIButton(type: UIButtonType.system)
        button.bounds = CGRect(x: 0, y: 0, width: view.bounds.width / 2, height: 50)
        button.center = CGPoint(x: view.bounds.width / 2, y: 650)
        button.backgroundColor = UIColor(red: 43/255, green: 43/255, blue: 43/255, alpha: 0.5)
        button.setTitle("Pick an Image", for: UIControlState.normal)
        button.setTitleColor(UIColor.white, for: UIControlState.normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(action(sender:)), for: UIControlEvents.touchUpInside)
    }
    @objc func action(sender: Any) {
        print("111")
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        setupButton()
        view.addSubview(button)
        setupImageView()
        view.addSubview(imageView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

