//
//  ViewController.swift
//  Ikonagram
//
//  Created by Omar on 11/26/15.
//  Copyright © 2015 Kroleo. All rights reserved.
//

import UIKit

class StepOne: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIScrollViewDelegate{
    //Boolean Values
    var doub_left = false
    var doub_right = false
    var single = false
    var pressed = false;
    //Single Image Layout Selection
    @IBOutlet weak var OneImageButtonSelect: UIButton!
    @IBOutlet weak var SingleImage: UIImageView!
    @IBOutlet weak var OneImageScrollView: UIScrollView!
    
    //Double Image Right Layout Selection
    @IBOutlet weak var DoubleRightImage: UIImageView!
    @IBOutlet weak var TwoImageRightSelect: UIButton!
    @IBOutlet weak var TwoImageRightScrollView: UIScrollView!
    //Double Image Left Layout Selection
    
    @IBOutlet weak var DoubleImageLeft: UIImageView!
    @IBOutlet weak var TwoImageLeftSelect: UIButton!
    @IBOutlet weak var TwoImageLeftScrollView: UIScrollView!
    
    @IBAction func gallery_select(sender: UIButton) {
        let imageFromSource = UIImagePickerController()
        imageFromSource.delegate = self
        imageFromSource.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        if(sender == OneImageButtonSelect){
            OneImageButtonSelect.hidden = true
        }else if(sender == TwoImageLeftSelect){
            TwoImageLeftSelect.hidden = true
        }else if(sender == TwoImageRightSelect){
            TwoImageRightSelect.hidden = true
        }
        self.presentViewController(imageFromSource, animated: true, completion: nil)
        
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if(OneImageButtonSelect.hidden){
        SingleImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        }else if(TwoImageRightSelect.hidden){
        DoubleRightImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        }else if(TwoImageLeftSelect.hidden){
            DoubleImageLeft.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func choose_layout(sender: UIButton) {
        
        if(sender.tag == 1 && !pressed){
            OneImageScrollView.hidden = false
            
        }
        if(sender.tag == 2 && !pressed){
            TwoImageRightScrollView.hidden = false
            TwoImageLeftScrollView.hidden = false
            
            
        }
        if(sender.tag == 3 && !pressed){
            
        }
        pressed = true
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        if(scrollView == OneImageScrollView){
            return self.SingleImage
        }else if(scrollView == TwoImageLeftScrollView){
            return self.DoubleImageLeft
        }else{
            return self.DoubleRightImage
        }
    }
}

