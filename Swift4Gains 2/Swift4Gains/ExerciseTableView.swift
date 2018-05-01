//
//  ExerciseTableView.swift
//  Swift4Gains
//
//  Created by Student on 2017-11-03.
//  Copyright © 2017 Mad4Swift. All rights reserved.
//

import UIKit

class ExerciseTableView: UITableViewController
{
    var currentIndex = 0
    static var newExercise = Exercise()
    
    // Name         : tableView()
    // Description  : returns the count of items within the table view
    // Parameters   : _ tableView: UITableView, numberOfRowsInSection section: Int.
    // Returns      : Int.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return jeremyExerciseController.currentExerciseCategory.exercises.count
    }
    
    // Name         : tableView()
    // Description  : reuses currently viewable cells to display data
    // Parameters   : _ tableView: UITableView, cellForRowAt indexPath: IndexPath
    // Returns      : UITableViewCell.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = jeremyExerciseController.currentExerciseCategory.exercises[indexPath.row].name
        cell.backgroundColor = #colorLiteral(red: 0.1607843137, green: 0.5019607843, blue: 0.7254901961, alpha: 1)
        cell.textLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        return cell
    }
    
    // Name         : tableView()
    // Description  : reuses currently viewable cells to display data
    // Parameters   : _ tableView: UITableView, cellForRowAt indexPath: IndexPath
    // Returns      : n/a
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cellIndex = self.tableView.indexPathForSelectedRow?.row
        let exerciseDesc = jeremyExerciseController.currentExerciseCategory.exercises[cellIndex!]
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ExerciseDescriptionPage") as! ExerciseDescViewController
        vc.exerciseDescription = exerciseDesc
        vc.currentIndex = currentIndex
        vc.allowSet = true
        navigationController?.pushViewController(vc, animated: true)
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
            exerciseViewController.clasInt = 0
            break
        case "unwindToExerciseList"?:
            //NOTE: THIS SEEMS REDUNDANT
            break
            
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
    
    // Name         : viewDidLoad()
    // Description  : This method is called automatically when the view has loaded. Anything that needs
    //                to happen after the view has loaded must be called here.
    // Parameters   : void.
    // Returns      : void.
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
