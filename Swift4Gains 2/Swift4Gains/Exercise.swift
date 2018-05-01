//
//  Exercise.swift
//  Swift4Gains
//
//  Created by Student on 2017-11-03.
//  Copyright © 2017 Mad4Swift. All rights reserved.
//

import UIKit

class Exercise: NSObject {
    
    var category : Category
    var desc : ExerciseDescription
    var sets: Int
    
    // Name         : init()
    // Description  : initializer for the class.
    // Parameters   : description: ExerciseDescription, category: Category, sets: Int
    // Returns      : void.
    init(description: ExerciseDescription, category: Category, sets: Int) {
        self.desc = description
        self.category = category
        self.sets = sets

        super.init()
    }
    
    // Name         : init()
    // Description  : initializer for the class.
    // Parameters   : n/a
    // Returns      : void.
    convenience override init() {
        
        let desc = ExerciseDescription.getShoulderDescriptions()[0]
        let category = Category.Shoulder;
        let sets = 5

        self.init(description: desc, category: category, sets: sets)
    }
    
    
    enum Category : Int {
        case Shoulder, Chest, Bicep, Tricep, Back, Legs
        
        var name: String {
            get { return String(reflecting: self) }
        }
        
        var exercises: [ExerciseDescription] {
            get
            {
                switch(self)
                {
                case .Shoulder:
                    return ExerciseDescription.getShoulderDescriptions()
                case .Chest:
                    return ExerciseDescription.getChestDescriptions()
                case .Bicep:
                    return ExerciseDescription.getBicepDescriptions()
                case .Tricep:
                    return ExerciseDescription.getTricepDescriptions()
                case .Back:
                    return ExerciseDescription.getBackDescriptions()
                case .Legs:
                    return ExerciseDescription.getLegDescriptions()
                }
            }
        }
    }
}
