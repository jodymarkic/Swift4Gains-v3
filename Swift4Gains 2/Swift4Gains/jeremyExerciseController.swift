// File Name    : WorkoutViewController.swift
// Description  : This file holds the View Controller for the Category page of Swift for Gains
//                SET counter and can track their sets.
// Programmer(s): Arindm Sharma, Zivojin Pecin, Jody Markic, Kyle Jensen
// Date         : October 5, 2017

import UIKit

class jeremyExerciseController: UIViewController
{
    //button outlets
    @IBOutlet weak var btnShoulder: UIButton!    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnTriceps: UIButton!
    @IBOutlet weak var btnBiceps: UIButton!
    @IBOutlet weak var btnChest: UIButton!
    @IBOutlet weak var btnLegs: UIButton!
    
    //local workout index
    var currentIndex: Int!
    //local workout
    var currentWorkout: Workout!
    {
        didSet { navigationItem.title = currentWorkout.name }
    }
    
    //static var tmpExercise = Exercise()
    static var currentExerciseCategory : Exercise.Category = .Shoulder
    
    // Name         : viewDidLoad()
    // Description  : This method is called automatically when the view has loaded. Anything that needs
    //                to happen after the view has loaded must be called here.
    // Parameters   : void.
    // Returns      : void.
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackground()

        btnShoulder.addTarget(self, action: #selector(self.buttonPressed(_:)), for: .touchUpInside)
        btnBack.addTarget(self, action: #selector(self.buttonPressed(_:)), for: .touchUpInside)
        btnTriceps.addTarget(self, action: #selector(self.buttonPressed(_:)), for: .touchUpInside)
        btnBiceps.addTarget(self, action: #selector(self.buttonPressed(_:)), for: .touchUpInside)
        btnChest.addTarget(self, action: #selector(self.buttonPressed(_:)), for: .touchUpInside)
        btnLegs.addTarget(self, action: #selector(self.buttonPressed(_:)), for: .touchUpInside)
    }
    
    // Name         : didRecieveMemoryWarning()
    // Description  : affirms recieving a memory warning
    // Parameters   : n/a
    // Returns      : n/a
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Name         : buttonPresses()
    // Description  : event handle to a button being pressed
    // Parameters   : n_ sender: UIButton
    // Returns      : n/a
    @IBAction func buttonPressed(_ sender: UIButton)
    {
        //get the category  selected
        let category = Exercise.Category(rawValue: sender.tag)
        jeremyExerciseController.currentExerciseCategory = category!
        
        //perform a segue based on the category chosen
        self.performSegue(withIdentifier: "ChooseExercise", sender: sender)
    }
    
    // Name         : prepare()
    // Description  : gets executed before the seque is performed
    // Parameters   : for segue: UIStoryboardSegue, sender: Any?
    // Returns      : n/a
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if(segue.identifier == "ChooseExercise")
        {
            let exerciseViewController = segue.destination as! ExerciseTableView
            exerciseViewController.currentIndex = currentIndex
        }
        else
        {
            preconditionFailure("Unexpected segue identifier")
        }
    }
    
    // Name         : addBackground()
    // Description  : adds background to the application
    // Parameters   : n/a
    // Returns      : n/a
    func addBackground() {
        // screen width and height:
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let firstFrame = CGRect(x:0,y:0, width: width, height: height)
        //let firstView = UIView(frame: firstFrame)
        
        let imageViewBackground = UIImageView(frame: firstFrame)
        imageViewBackground.image = UIImage(named: "builder.png")
        
        // you can change the content mode:
        imageViewBackground.contentMode = UIViewContentMode.scaleAspectFill
        
        view.addSubview(imageViewBackground)
        view.sendSubview(toBack: imageViewBackground)
    }

}
