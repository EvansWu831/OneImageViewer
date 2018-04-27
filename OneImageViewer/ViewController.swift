//
//  ViewController.swift
//  OneImageViewer
//
//  Created by Evans Wu on 2018/4/27.
//  Copyright © 2018年 Evans Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate {
    
    
    
//    @available(iOS 3.0, *)
//    open var zoomScale: CGFloat// default is 1.0
//
//    @available(iOS 3.0, *)
//    open func setZoomScale(_ scale: CGFloat, animated: Bool)
//
//    @available(iOS 3.0, *)
//    open func zoom(to rect: CGRect, animated: Bool)
//
//
//    open var bouncesZoom: Bool
//    default is YES. if set, user can go past min/max zoom while gesturing and the zoom will animate to the min/max value at gesture end
//
//
//    open var isZooming: Bool { get }
    // returns YES if user in zoom gesture
//
//    open var isZoomBouncing: Bool { get }
//    returns YES if we are in the middle of zooming back to the min/max value

    //scrollView
    var scrollView: UIScrollView!
    func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor(red: 43/255, green: 43/255, blue: 43/255, alpha: 1)
        scrollView.delegate = self
        scrollView.frame = CGRect(x: 0, y: 0, width: 375, height: 590)
        scrollView.contentSize = CGSize(width: 2000, height: 2000)
        scrollView.minimumZoomScale = 1.0  //縮放最小限界
        scrollView.maximumZoomScale = 2.0  //縮放最大限界

        
        
    }

    //imageView
    var imageView: UIImageView!
    func setupImageView() {
//        let image: UIImage = UIImage(named:"icon_photo")!
        imageView = UIImageView()
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        imageView.image = UIImage(named: "icon_photo")
        imageView.frame = CGRect(x: 0, y: 0, width: 375, height: 590)
        imageView.backgroundColor = UIColor(red: 43/255, green: 43/255, blue: 43/255, alpha: 1)
        
    }
    //View
    var yellowView: UIView!
    func setupView() {
        yellowView = UIView()
        yellowView.backgroundColor = UIColor(red: 249/255, green: 223/255, blue: 23/255, alpha: 1)
        yellowView.frame = CGRect(x: 0, y: 590, width: 375, height: 77)
    }
    //button
    var button: UIButton!
    func setupButton() {
        button = UIButton(type: UIButtonType.system)
        button.backgroundColor = UIColor(red: 43/255, green: 43/255, blue: 43/255, alpha: 1)
        button.frame = CGRect(x: 98, y: 17, width: 180, height: 44)
        button.setTitle("Pick an Image", for: UIControlState.normal)
        button.setTitleColor(UIColor.white, for: UIControlState.normal)
        button.addTarget(self, action: #selector(action(sender:)), for: UIControlEvents.touchUpInside)
    }
    //buttonAction
    @objc func action(sender: Any) {
        let picker: UIImagePickerController = UIImagePickerController()
        if  UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            picker.allowsEditing = true
            picker.delegate = self
            self.present(picker, animated: true, completion: nil)
        }
    }
    //相簿選取Action
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        self.imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    //viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        //show scrollView
        setupScrollView()
        view.addSubview(scrollView)
        //show imageView in scrollView
        setupImageView()
        scrollView.addSubview(imageView)
        //show View
        setupView()
        view.addSubview(yellowView)
        //show button in View
        setupButton()
        yellowView.addSubview(button)
        
        //test
//        layout()
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    //test
//    func layout() {
//        let leading = NSLayoutConstraint(item: scrollView, attribute: .leading, relatedBy: .equal,
//                                         toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 50.0)
//
//        let trailing = NSLayoutConstraint(item: scrollView, attribute: .trailing, relatedBy: .equal,
//                                          toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -50.0)
//
//        let top = NSLayoutConstraint(item: scrollView, attribute: .top, relatedBy: .equal,
//                                     toItem: self.view, attribute: .top, multiplier: 1.0, constant: 100.0)
//
//        let height = NSLayoutConstraint(item: scrollView, attribute: .height, relatedBy: .equal,
//                                        toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 120.0)
//
//        self.view.addConstraint(leading)
//        self.view.addConstraint(trailing)
//        self.view.addConstraint(top)
//        self.view.addConstraint(height)
//    }

}

