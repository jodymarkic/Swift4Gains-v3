// File Name    : ViewController.swift
// Description  : This file is the main view controller for the application. The main view controller handles
//                the background and initializes the application.
// Programmer(s): Arindm Sharma, Zivojin Pecin, Jody Markic, Kyle Jensen
// Date         : October 5, 2017

import UIKit

class ViewController: UIViewController {

    // Name         : viewDidLoad()
    // Description  : This method is called automatically when the view has loaded. Anything that needs
    //                to happen after the view has loaded must be called here
    // Parameters   : void.
    // Returns      : void.
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackground()
    }

    // Name         : didReceiveMemoryWarning()
    // Description  : This method is called automatically when a memory warning is received. We arent
    //                doing anything special here, just calling the parent constructor.
    // Parameters   : void.
    // Returns      : void.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Name         : addBackground()
    // Description  : This method initializes the background and adds it to the scene. It loads the image from
    //                assets and assigns the content of the background image.
    // Parameters   : void.
    // Returns      : void.
    func addBackground() {
        // screen width and height:
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let firstFrame = CGRect(x:0,y:0, width: width, height: height)
        //let firstView = UIView(frame: firstFrame)
        
        let imageViewBackground = UIImageView(frame: firstFrame)
        imageViewBackground.image = UIImage(named: "mainPage.png")
        
        // you can change the content mode:
        imageViewBackground.contentMode = UIViewContentMode.scaleAspectFill
        
        view.addSubview(imageViewBackground)
        view.sendSubview(toBack: imageViewBackground)
    }


}

