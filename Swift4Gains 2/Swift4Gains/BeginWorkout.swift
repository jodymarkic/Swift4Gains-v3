// File Name    : BeginWorkout.swift
// Description  : This file handles all of the UI interactions for beginning a workout. The user can start their
//                SET counter and can track their sets.
// Programmer(s): Arindm Sharma, Zivojin Pecin, Jody Markic, Kyle Jensen
// Date         : October 5, 2017

import UIKit

var LanguageSelected = 0

class BeginWorkout: UIViewController, UITextFieldDelegate {
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    var totalSets = 0
    
    @IBOutlet weak var exerciseTimerLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressTextBox: UITextField!
    
    // Name         : viewDidLoad()
    // Description  : This method is called automatically when the view has loaded. Anything that needs
    //                to happen after the view has loaded must be called here.
    // Parameters   : void.
    // Returns      : void.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let langStr = Locale.current.languageCode
        
        if (langStr == "en")
        {
            LanguageSelected = 1
        }
        else
        {
            LanguageSelected = 2
        }
        
        startButton.titleLabel!.adjustsFontSizeToFitWidth = true
        startButton.titleLabel?.minimumScaleFactor = 15
        
        exerciseTimerLabel.text = NSLocalizedString("timerLabel", comment: "Timer for the label")
        
        timerLabel.text = String(counter)
        pauseButton.isEnabled = false
        
        progressLabel.text = "0%"
        progressView.setProgress(0, animated: true)
        
        self.progressTextBox.delegate = self;
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
    
    // Name         : decreaseClick()
    // Description  : This event is called when the decrease button is clicked. It increases the amount of sets
    //                they need to complete and decreases the progress bar.
    // Parameters   : sender: the view that triggered the event.
    // Returns      : void.
    @IBAction func decreaseClick(_ sender: Any)
    {
        let textfieldInt: Int? = Int(progressTextBox.text!)
        
        if (textfieldInt != nil)
        {
        
        totalSets = textfieldInt!
        
        if(totalSets>0)
        {
        let fraction: Float! = Float(1)/Float(textfieldInt!)
        progressView?.progress -= fraction!
        
        let curr: Float! = Float(progressView.progress) * Float(100)
        progressLabel.text = String(curr)+"%"
        }
        }
    }
    
    // Name         : touchesBegan()
    // Description  : resign/getting rid of the keyboard
    // Parameters   : _ touches: Set<UITouch>, with event: UIEvent?
    // Returns      : void.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true);
    }
    
    // Name         : increaseClick()
    // Description  : This event is called when the increase button is clicked. It decreases the amount of sets
    //                they need to complete and increases the progress bar.
    // Parameters   : sender: the view that triggered the event.
    // Returns      : void.
    @IBAction func increaseClick(_ sender: Any)
    {
        
        let textfieldInt: Int? = Int(progressTextBox.text!)
        if(textfieldInt != nil)
        {
            totalSets = textfieldInt!
            if (totalSets>0)
            {
                let fraction: Float! = Float(1)/Float(textfieldInt!)
                progressView?.progress += fraction!
                
                let curr: Float! = Float(progressView.progress) * Float(100)
                progressLabel.text = String(curr) + "%"
            }
        }
        
    }
    
    // Name         : startButtonClick()
    // Description  : This event is called when the start button is clicked. It starts the workout timer.
    // Parameters   : sender: the view that triggered the event.
    // Returns      : void.
    @IBAction func startButtonClick(_ sender: Any)
    {
        if(isPlaying)
        {
            return //if is alredy running do nothing
        }
        
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = false
    }

    // Name         : pausetimerButton()
    // Description  : This event is called when the pause button is clicked. It pauses the workout timer.
    // Parameters   : sender: the view that triggered the event.
    // Returns      : void.
    @IBAction func pausetimerButton(_ sender: Any)
    {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        timer.invalidate()
        isPlaying = false
    }
    
    // Name         : resetTimer()
    // Description  : This event is called when the reset button is clicked. It resets the timer values.
    // Parameters   : sender: the view that triggered the event.
    // Returns      : void.
    @IBAction func resetTimer(_ sender: Any)
    {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        timer.invalidate()
        isPlaying = false
        counter = 0.0
        timerLabel.text = String(counter)
    }
    
    // Name         : SETClick()
    // Description  : This event is called when the SET button is clicked. It updates the progress bar
    //                when they have completed a set.
    // Parameters   : sender: the view that triggered the event.
    // Returns      : void.
    @IBAction func SETClick(_ sender: Any)
    {
        progressTextBox.resignFirstResponder()
        progressView.setProgress(0, animated: true)
        progressLabel.text = String(0)+"%"
        
        
    }
    
    // Name         : UpdateTimer()
    // Description  : This event is called when the timer ticks It updates the timer label value.
    // Parameters   : sender: the view that triggered the event.
    // Returns      : void.
    @objc func UpdateTimer(){
        counter = counter + 0.1
        timerLabel.text = String(format: "%.1f",counter)
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
