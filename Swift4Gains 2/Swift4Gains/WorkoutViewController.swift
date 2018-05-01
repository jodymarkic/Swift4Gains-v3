// File Name    : WorkoutViewController.swift
// Description  : This file holds the View Controller for the Workout page of Swift for Gains
//                SET counter and can track their sets.
// Programmer(s): Arindm Sharma, Zivojin Pecin, Jody Markic, Kyle Jensen
// Date         : October 5, 2017
import UIKit

var allWorkouts = [Workout]()

class WorkoutViewController: UITableViewController {

    // Name         : viewDidLoad()
    // Description  : This method is called automatically when the view has loaded. Anything that needs
    //                to happen after the view has loaded must be called here.
    // Parameters   : void.
    // Returns      : void.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set values for what and how the page is displayed
        navigationItem.title = "Workouts"
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
   
    }
    

    // Name         : tableView()
    // Description  : returns the count of items within the table view
    // Parameters   : _ tableView: UITableView, numberOfRowsInSection section: Int.
    // Returns      : Int.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allWorkouts.count
    }
    
    // Name         : tableView()
    // Description  : reuses currently viewable cells to display data
    // Parameters   : _ tableView: UITableView, cellForRowAt indexPath: IndexPath
    // Returns      : UITableViewCell.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let workout = allWorkouts[indexPath.row]
        cell.textLabel?.text = workout.name
        cell.textLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        return cell
    }
    
    // Name         : addNewItem()
    // Description  : Event handle to the add a Workout button
    // Parameters   : _ sender: UIButton
    // Returns      : n/a
    @IBAction func addNewItem(_ sender: UIButton) {
        
        //local variables
        let title = "Add a Workout"
        let message = "Give your new workout a name: "
        
        //assign an alert dialog to newAC
        let newAC = UIAlertController (title: title, message: message, preferredStyle: .alert)
        
        //setup keyboard to the textfield within newAC
        newAC.addTextField { (textField : UITextField) -> Void in
            textField.keyboardType  = .default
            textField.keyboardAppearance = .default
            textField.becomeFirstResponder()
        }
        
        //assign cancel button action to cancelButton
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:
        {(action) -> Void in
            //dismiss keyboard
            newAC.textFields![0].resignFirstResponder()
        })
        //add the cancel button action to newAC
        newAC.addAction(cancelAction)
        
        //assign ok button action to createAction
        let createAction = UIAlertAction(title: "OK", style: .default, handler:
        {(action) -> Void in
            //create and add the newwork to the global array list allWorkouts
            let newWorkout = Workout(name: newAC.textFields![0].text!)
            allWorkouts.append(newWorkout)
            if let index = allWorkouts.index(of: newWorkout) {
                let indexPath = IndexPath(row: index, section: 0)
                self.tableView.beginUpdates()
                self.tableView.insertRows(at: [indexPath], with: .automatic)
                self.tableView.endUpdates()
                //resign the keyboard
                newAC.textFields![0].resignFirstResponder()
            }
        })
        //add the okay button action to newAC
        newAC.addAction(createAction)
        
        //display the alert dialog newAC
        self.present(newAC, animated: true, completion: nil)
    
    }
    
    
    
    // Name         : didRecieveMemoryWarning()
    // Description  : affirms recieving a memory warning
    // Parameters   : n/a
    // Returns      : n/a
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Name         : tableView()
    // Description  : event handle upon deleting an item from the tableView
    // Parameters   : _ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath
    // Returns      : n/a
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //if the editing style to delete is selected
        if editingStyle == .delete {
            //find the workout within allWorkouts that corresponds with the selected index within the tableView
            let workout = allWorkouts[indexPath.row]
            
            //setup delete confirmation message
            let title = "Delete \(workout.name)?"
            let message = "Are you sure you want to delete this item?"
            
            //assign a alert dialog to ac
            let ac = UIAlertController (title: title, message: message, preferredStyle: .actionSheet)
            
            //assign an alert dialog acction to cancelAction
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction) //add the action to ac
            //assign an alert dialog action to deleteAction
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler:
            {(action) -> Void in
                //remove the workout in question upon button click
                self.removeWorkout(workout)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            ac.addAction(deleteAction) //assign the alert dialog action to ac
            present(ac, animated: true, completion: nil) //present ac
        }
    }
    
    // Name         : tableView()
    // Description  : event handle upon moving an item's position within the tableView
    // Parameters   : _ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath
    // Returns      : n/a
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        //move the select item to to the specified index
        if let row = tableView.indexPathForSelectedRow?.row {
            let workout = allWorkouts[row]
            workout.moveExercise(from: sourceIndexPath.row, to: destinationIndexPath.row)
        }
    }
    
    // Name         : moveWorkout()
    // Description  : moves the a workouts index in allWorkouts to the corresponding tableView index
    // Parameters   : rom fromIndex: Int, to toIndex: Int)
    // Returns      : n/a
    func moveWorkout(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        let movedExercise = allWorkouts[fromIndex]
        allWorkouts.remove(at: fromIndex)
        allWorkouts.insert(movedExercise, at: toIndex)
    }
    
    // Name         : removeWorkout()
    // Description  : moves the a workouts at the specified index in allWorkouts
    // Parameters   : _ workout: Workout
    // Returns      : n/a
    func removeWorkout(_ workout: Workout) {
        if let index = allWorkouts.index(of: workout) {
            allWorkouts.remove(at: index)
        }
    }
    
    // Name         : toggleEditingMode()
    // Description  : event handle for when editing is toggled.
    // Parameters   : _ sender: UIButton
    // Returns      : n/a
    @IBAction func toggleEditingMode(_ sender: UIButton){
        //edit a item
        if isEditing {
            sender.setTitle("Edit Exercise", for: .normal)
            
            setEditing(false, animated: true)
            
        } else {
            sender.setTitle("Done", for: .normal)
            
            setEditing(true, animated: true)
        }
    }
    
    // Name         : prepare()
    // Description  : method that executes before segueing to another view
    // Parameters   : for segue: UIStoryboardSegue, sender: Any?
    // Returns      : n/a
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showExercisesSegue"?:
            //pass a workout index to the next view
            if let row = tableView.indexPathForSelectedRow?.row {
                let exerciseViewController = segue.destination as! ExerciseViewController
                exerciseViewController.clasInt = row
            }
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
}

