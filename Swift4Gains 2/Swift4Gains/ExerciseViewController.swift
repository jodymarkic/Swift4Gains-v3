// File Name    : WorkoutViewController.swift
// Description  : This file holds the View Controller for the Exercises page of Swift for Gains
//                SET counter and can track their sets.
// Programmer(s): Arindm Sharma, Zivojin Pecin, Jody Markic, Kyle Jensen
// Date         : October 5, 2017

import UIKit

class ExerciseViewController: UITableViewController {
    
    @IBAction func unwindToExerciseList(segue:UIStoryboardSegue) { }
    
    var clasInt: Int!
    
    @IBAction func addNewItem(_ sender: UIButton) {
        
    }
    
    // Name         : viewDidLoad()
    // Description  : This method is called automatically when the view has loaded. Anything that needs
    //                to happen after the view has loaded must be called here.
    // Parameters   : void.
    // Returns      : void.
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //set values for what and how the page is displayed
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        navigationItem.title = allWorkouts[clasInt].name
    }
    
    // Name         : viewDidAppear()
    // Description  : reload view data
    // Parameters   : _ animated: Bool.
    // Returns      : void.
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // Name         : tableView()
    // Description  : returns the count of items within the table view
    // Parameters   : _ tableView: UITableView, numberOfRowsInSection section: Int.
    // Returns      : Int.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int {
        
        return allWorkouts[clasInt].allExercises.count
    }
    
    // Name         : tableView()
    // Description  : reuses currently viewable cells to display data
    // Parameters   : _ tableView: UITableView, cellForRowAt indexPath: IndexPath
    // Returns      : UITableViewCell.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell", for: indexPath)
        let cellIndex = indexPath.row
        
        print(clasInt!)
        
        let exercise = allWorkouts[clasInt].allExercises[cellIndex]
        cell.textLabel?.text = exercise.desc.name
        cell.detailTextLabel?.text = "Sets: \(exercise.sets)"

        return cell
    }
    
    // Name         : tableView()
    // Description  : reuses currently viewable cells to display data
    // Parameters   : _ tableView: UITableView, cellForRowAt indexPath: IndexPath
    // Returns      : n/a
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cellIndex = self.tableView.indexPathForSelectedRow?.row
        let exerciseDescription = allWorkouts[clasInt].allExercises[cellIndex!].desc
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ExerciseDescriptionPage") as! ExerciseDescViewController
        vc.exerciseDescription = exerciseDescription
        vc.allowSet = false
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // Name         : toggleEditingMode()
    // Description  : event handle for when editing is toggled.
    // Parameters   : _ sender: UIButton
    // Returns      : n/a
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        if isEditing {
            sender.setTitle("Edit", for: .normal)
            setEditing(false, animated: true)
        } else {
            sender.setTitle("Done", for: .normal)
            setEditing(true, animated: true)
        }
    }
    
    // Name         : tableView()
    // Description  : event handle upon deleting an item from the tableView
    // Parameters   : _ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath
    // Returns      : n/a
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //if the editing style to delete is selected
        if editingStyle == .delete {
            //find the workout within allWorkouts that corresponds with the selected index within the tableView
            let exercise = allWorkouts[clasInt].allExercises[indexPath.row]
            
            //setup delete confirmation message
            let title = "Delete \(exercise.desc.name)?"
            let message = "Are you sure you want to delete this exercise?"
            //assign a alert dialog to ac
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            //assign an alert dialog acction to cancelAction
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            //assign an alert dialog action to deleteAction
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler:
            {(action)->Void in
                //delete the exercise
                allWorkouts[self.clasInt].removeExercise(exercise)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            //add delete action to ac
            ac.addAction(deleteAction)
            present(ac, animated: true, completion: nil)//present ac
        }
    }
    
    // Name         : prepare()
    // Description  : method that executes before segueing to another view
    // Parameters   : for segue: UIStoryboardSegue, sender: Any?
    // Returns      : n/a
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "jeremySegue"?:
            let exerciseViewController = segue.destination as! jeremyExerciseController
            exerciseViewController.currentIndex = clasInt
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
    
    // Name         : tableView()
    // Description  : event handle upon moving an item's position within the tableView
    // Parameters   : _ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath
    // Returns      : n/a
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        allWorkouts[clasInt].moveExercise(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
