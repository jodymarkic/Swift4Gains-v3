// File Name    : LoginViewController.swift
// Description  : This file holds the logic to login an existing user.
// Programmer(s): Arindm Sharma, Zivojin Pecin, Jody Markic, Kyle Jensen
// Date         : Jan 1, 2018

import UIKit
import CoreData

class LoginViewController: UIViewController, UITextFieldDelegate{

    
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    // Name         : viewDidLoad()
    // Description  : This method is called automatically when the view has loaded. Anything that needs
    //                to happen after the view has loaded must be called here.
    // Parameters   : void.
    // Returns      : void.
    override func viewDidLoad() {
        super.viewDidLoad()

        UserName.layer.borderColor = UIColor.orange.cgColor;
        UserName.layer.borderWidth = 3.0;
        Password.layer.borderColor = UIColor.orange.cgColor;
        Password.layer.borderWidth = 3.0;
        
        self.UserName.delegate = self;
        self.Password.delegate = self;
        
        Password.isSecureTextEntry = true
        
        // Do any additional setup after loading the view.
    }

    // Name         : didReceiveMemoryWarning()
    // Description  : Dispose of any resources that can be recreated.
    // Parameters   : void.
    // Returns      : void.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // Name         : shouldPerformSegue()
    // Description  : handling user login
    // Parameters   : withIdentifier identifier: String?, sender: Any?
    // Returns      : void.
    override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?) -> Bool {
        
        if let ident = identifier
        {
            if ident == "login"
            {
                let appDelegates = UIApplication.shared.delegate as! AppDelegate
                
                let context = appDelegates.persistentContainer.viewContext
                
                
                let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
                request.returnsObjectsAsFaults = false
                
                var temp = false;
                
                do //use cordata to check if the user exists.
                {
                    let results = try context.fetch(request) //fetch data from the DB
                    if(results.count > 0)
                    {
                        for result in results as! [NSManagedObject]
                        {
                            if let uname = result.value(forKey: "username") as? String
                            {
                                if uname == UserName.text
                                {
                                    temp = true
                                }
                            }
                            if let pname = result.value(forKey: "password") as? String
                            {
                                if pname == Password.text
                                {
                                    if temp
                                    {
                                        return true;
                                    }
                                }
                            }
                        }
                    }
                    
                }
                catch
                {
                    
                    return false //dont execute segue
                }
                
            }
            if ident == "signUp" //execute the signup segue anyways.
            {
                return true
            }
        }
        //show error messages
        UserName.layer.borderColor = UIColor.red.cgColor;
        UserName.text = "incorrect username";
        Password.layer.borderColor = UIColor.red.cgColor;
        Password.text = "incorrect password";
        return false//dont execute segue
    }
    
    // Name         : touchesBegan()
    // Description  : resign/getting rid of the keyboard
    // Parameters   : _ touches: Set<UITouch>, with event: UIEvent?
    // Returns      : void.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true);
    }
    
    // Name         : textFieldShouldReturn()
    // Description  : resign/getting rid of the keyboard on resturn button press.
    // Parameters   : _ touches: Set<UITouch>, with event: UIEvent?
    // Returns      : void.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        UserName.resignFirstResponder();
        Password.resignFirstResponder();
        return true;
    }
    
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue)
    {
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
