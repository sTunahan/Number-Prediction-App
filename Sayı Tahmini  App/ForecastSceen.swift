

import UIKit

class ForecastSceen: UIViewController {

    @IBOutlet weak var remainingLifeText: UILabel!
    @IBOutlet weak var clue: UILabel!
    @IBOutlet weak var textFieldNumber: UITextField!
    
    var randomNumber:Int?
    var remainingLifeValue : Int = 5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        randomNumber = Int( arc4random_uniform(100)) // 0 - 100 random number
        print(randomNumber!)
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Data from incomingValue perform segue
        if let incomingValue = sender as? Bool {
            
            if segue.identifier == "guesstoresult" {
                
                let pageToGo = segue.destination as! ResultSceen
                
                pageToGo.incomingResult = incomingValue
            }
        }
    }
    
    //for page transition
    @IBAction func guessButton(_ sender: Any) {
        
        clue.isHidden = false // for the hint label to appear.
        remainingLifeValue -= 1
        
        
        if let getValue = textFieldNumber.text {
            if let value = Int(getValue) {
                
                if remainingLifeValue != 0{
                    
                    if value == randomNumber! {
                        
                        
                        let result = true ///data to be sent to the other page
                        performSegue(withIdentifier: "guesstoresult", sender: result)
                    }
                    
                    if value > randomNumber! {
                        clue.text = " Azalt"
                        remainingLifeText.text = "remaining life : \(remainingLifeValue)"
                        
                        
                    }
                    if value < randomNumber!{
                        clue.text = " Arttır"
                        remainingLifeText.text = "remaining life : \(remainingLifeValue)"
                    }
                    
                }
                else{
                    
                    let result = false
                    performSegue(withIdentifier: "guesstoresult", sender: result)
                }
                
                textFieldNumber.text = ""
            }
        }
    }
    
    

}
