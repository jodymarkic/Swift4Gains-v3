// File Name    : ExerciseDescViewController.swift
// Description  : This file holds the logic for displaying the exercise descriptions
// Programmer(s): Arindm Sharma, Zivojin Pecin, Jody Markic, Kyle Jensen
// Date         : Jan 1, 2018

import UIKit

class ExerciseDescViewController: UIViewController,UITextFieldDelegate
{
    @IBOutlet weak var lblExerciseName: UILabel!
    @IBOutlet weak var lblDifficulty: UILabel!
    @IBOutlet weak var txtRequired: UITextView!
    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var imgExercise: UIImageView!
    @IBOutlet weak var lblSets: UILabel!
    @IBOutlet weak var txtSets: UITextField!
    @IBOutlet weak var btnAddExercise: UIButton!
    
   

    var currentIndex = 0
    var exerciseDescription = ExerciseDescription()
    var allowSet : Bool = true
    
    // Name         : viewDidLoad()
    // Description  : This method is called automatically when the view has loaded. Anything that needs
    //                to happen after the view has loaded must be called here.
    // Parameters   : void.
    // Returns      : void.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblExerciseName.text = exerciseDescription.name
        lblDifficulty.text = "Difficulty: " + String(exerciseDescription.difficulty)
        
        for required in exerciseDescription.required
        {
            txtRequired.text!.append("- " + required + "\n")
        }
        
        txtDescription.text = exerciseDescription.description
        imgExercise.image = exerciseDescription.image
        
        if(allowSet)
        {
            lblSets?.isHidden = false
            btnAddExercise?.isHidden = false
            txtSets?.isHidden = false
        }
        
        self.txtSets.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
                self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtSets.resignFirstResponder()
        return (true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Name         : prepare()
    // Description  : method that executes before segueing to another view
    // Parameters   : for segue: UIStoryboardSegue, sender: Any?
    // Returns      : n/a
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue.identifier!)
        switch segue.identifier {
        case "Back"?:
            let exerciseViewController = segue.destination as! ExerciseViewController
            exerciseViewController.clasInt = self.currentIndex //possibly causing problems
            break
        case "unwindToExerciseList"?:
            break
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
    
    // Name         : addExercise()
    // Description  : This method is used to add exercises to the exercise list before calling unwind segue
    // Parameters   : _ sender: UIButton
    // Returns      : void.
    @IBAction func addExercise(_ sender: UIButton)
    {
        let sets : String = txtSets.text!
        if(!sets.isEmpty && Int(sets) != nil)
        {
            let newExercise = Exercise()
            newExercise.sets = Int(sets)!
            newExercise.category = jeremyExerciseController.currentExerciseCategory
            newExercise.desc = exerciseDescription
            allWorkouts[self.currentIndex].allExercises.append(newExercise)

            self.performSegue(withIdentifier: "unwindToExerciseList", sender: self)
            
            
        }
        else
        {
            let alertController = UIAlertController(title: "Error", message:
                "Must choose a valid number of sets", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        //txtSets.resignFirstResponder();
    }
}

