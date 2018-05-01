//
//  Workout.swift
//  Swift4Gains
//
//  Created by Student on 2017-11-03.
//  Copyright © 2017 Mad4Swift. All rights reserved.
//=

import UIKit

class Workout: NSObject {
    var name: String
    var allExercises = [Exercise]()
    
    
    @discardableResult func createExercise(exerciseDesc : ExerciseDescription, exerciseCategory: Exercise.Category, exerciseSets: Int, exerciseReps: Int) -> Exercise {
        let newExercise = Exercise(description: exerciseDesc, category: exerciseCategory, sets: exerciseSets)
        allExercises.append(newExercise)
        
        return newExercise
    }
    
    // Name         : init()
    // Description  : initializer for the class.
    // Parameters   : name:String
    // Returns      : void.
    init(name: String) {
        self.name = name
        //for _ in 0..<5
        //{
        //    createExercise(exerciseName: "Bench Press", exerciseCategory: "Chest", exerciseSets: 5, exerciseReps: 5)
        //}
        super.init()
    }
    
    // Name         : removeExercise()
    // Description  : removes exercies from the list
    // Parameters   : _ exercise: Exercise
    // Returns      : void.
    func removeExercise(_ exercise: Exercise) {
        if let index = allExercises.index(of: exercise) {
            allExercises.remove(at: index)
        }
    }
    
    // Name         : moveExercise()
    // Description  : moves exercises within the list
    // Parameters   : from fromIndex: Int, to toIndex: Int
    // Returns      : N/A
    func moveExercise(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        let movedExercise = allExercises[fromIndex]
        allExercises.remove(at: fromIndex)
        allExercises.insert(movedExercise, at: toIndex)
    }
}
