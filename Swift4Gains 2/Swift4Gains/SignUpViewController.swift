// File Name    : SignUpViewController.swift
// Description  : This file holds all the funcitonalty needed in order to create a new user.
// Programmer(s): Arindm Sharma, Zivojin Pecin, Jody Markic, Kyle Jensen
// Date         : Jan 1, 2018

import UIKit
import CoreData

class SignUpViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var myImage: UIImageView!
    
    
    // Name         : viewDidLoad()
    // Description  : This method is called automatically when the view has loaded. Anything that needs
    //                to happen after the view has loaded must be called here.
    // Parameters   : void.
    // Returns      : void.
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let tapRecognizer
            = UITapGestureRecognizer(target: self, action: #selector(addAnnotation(press:)))
        
 
        
        myImage.addGestureRecognizer(tapRecognizer)

        UserName.layer.borderColor = UIColor.orange.cgColor;
        UserName.layer.borderWidth = 3.0;
        password.layer.borderColor = UIColor.orange.cgColor;
        password.layer.borderWidth = 3.0;
        confirmPassword.layer.borderColor = UIColor.orange.cgColor;
        confirmPassword.layer.borderWidth = 3.0;
        // Do any additional setup after loading the view.
        
        self.UserName.delegate = self;
        self.password.delegate = self;
        self.confirmPassword.delegate = self;
  
        password.isSecureTextEntry = true
        confirmPassword.isSecureTextEntry = true
    }

    // Name         : addAnnotation()
    // Description  : handler for the tap gesture on the imageview
    // Parameters   : press: UITapGestureRecognizer
    // Returns      : void.
    func addAnnotation(press: UITapGestureRecognizer)
    {
        //make this the firstresponder
        becomeFirstResponder()
        
        let point = press.location(in: press.view)
        
        let menu = UIMenuController.shared
        
        //add the lauchCamera method to the menuitems.
        let spawnCamera = UIMenuItem(title: "change image",action: #selector(SignUpViewController.launchCamera(_:)))
        
        menu.menuItems = [spawnCamera]
        menu.setTargetRect(CGRect(x: point.x,y: point.y, width:20,height:10), in: press.view!)
        menu.setMenuVisible(true, animated: true)

    }
    
    // Name         : launchCamera()
    // Description  : launch the camera
    // Parameters   : _ sender: AnyObject
    // Returns      : void.
    func launchCamera(_ sender: AnyObject)
    {
        //launch the camera here
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerControllerSourceType.camera
        
        
        self.present(image,animated: true)
        {
            
        }
        
    }
    
    
    // Name         : imagePickerController()
    // Description  : to set image to the image view
    // Parameters   : _ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]
    // Returns      : void.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            myImage.image = image
        }
        else
        {
            print("error")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    // Name         : canBecomeFirstResponder()
    // Description  : to make the page the first responder
    // Parameters   : void
    // Returns      : bool
    override var canBecomeFirstResponder: Bool {
        
        return true
    }
    
    // Name         : canPerformAction()
    // Description  : to execute the camera launch
    // Parameters   : _ action: Selector, withSender sender: Any?
    // Returns      : void.
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(SignUpViewController.launchCamera(_:)) {
            return true
        }
        
        return false
    }
    
    // Name         : didReceiveMemoryWarning()
    // Description  : Dispose of any resources that can be recreated.
    // Parameters   : void.
    // Returns      : void.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    // Name         : textFieldShouldReturn()
    // Description  : resign/getting rid of the keyboard on resturn button press.
    // Parameters   : _ touches: Set<UITouch>, with event: UIEvent?
    // Returns      : void.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        UserName.resignFirstResponder();
        password.resignFirstResponder();
        confirmPassword.resignFirstResponder();
        return true;
    }

    // Name         : touchesBegan()
    // Description  : resign/getting rid of the keyboard
    // Parameters   : _ touches: Set<UITouch>, with event: UIEvent?
    // Returns      : void.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true);
    }
    
    // Name         : touchesBegan()
    // Description  : handle user addition to the DB.
    // Parameters   : _ touches: Set<UITouch>, with event: UIEvent?
    // Returns      : void.
    override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?) -> Bool {
        
        
        if let ident = identifier
        {
            if ident == "unwind"
            {
                if(UserName.text == "") || (confirmPassword.text == "") || (password.text == "") //check for empty fields.
                {
                    //show respective error messages
                    if(UserName.text == "")
                    {
                        UserName.text = "*required";
                        UserName.layer.borderColor = UIColor.red.cgColor;
                    }
                    if (confirmPassword.text == "")
                    {
                        confirmPassword.text = "*required";
                        confirmPassword.layer.borderColor = UIColor.red.cgColor;
                    }
                    if (password.text == "")
                    {
                        password.text = "*required";
                        password.layer.borderColor = UIColor.red.cgColor;
                    }
                    return false;
                }
                else
                {
                    if(password.text == confirmPassword.text)
                    {
                        //create and insert users.
                        let appDelegates = UIApplication.shared.delegate as! AppDelegate
                        
                        let context = appDelegates.persistentContainer.viewContext
                        
                        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
                        
                        newUser.setValue(UserName.text, forKey: "username")
                        newUser.setValue(password.text, forKey: "password")
                        
                        do
                        {
                            try context.save() //save the user to the DB
                            return true;
                        }
                        catch
                        {
                            UserName.text = "saving error!"
                        }
                    }
                }
                
            }
            else
            {
                //provide error messages for non matching passwords.
                confirmPassword.layer.borderColor = UIColor.red.cgColor;
                password.layer.borderColor = UIColor.red.cgColor;
                confirmPassword.text = "match passwords"
                password.text = "match passwords"
            }
            
        
        }
        return false;
    }
 

}
