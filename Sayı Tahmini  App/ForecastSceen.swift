

import UIKit

class ForecastSceen: UIViewController {

    @IBOutlet weak var remainingLifeText: UILabel!
    @IBOutlet weak var clue: UILabel!
    @IBOutlet weak var textFieldNumber: UITextField!
    
    var randomNumber:Int?
    var remainingLifeValue : Int = 5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        randomNumber = Int( arc4random_uniform(100)) // 0 -100 arası rastgele deger uretır.
        print(randomNumber!)
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //incomingValue perform segue dan gelen verı olmuş oluyor.
        if let incomingValue = sender as? Bool {
            
            if segue.identifier == "guesstoresult" {
                
                let pageToGo = segue.destination as! ResultSceen // Bununla dıger sayfadan Nesne Olusturduk
                
                pageToGo.incomingResult = incomingValue
            }
        }
    }
    
    @IBAction func guessButton(_ sender: Any) {
        
        clue.isHidden = false // ipucu gözukmesı ıcın
        remainingLifeValue -= 1
        
        
        if let getValue = textFieldNumber.text {
            if let value = Int(getValue) {
                
                if remainingLifeValue != 0{
                    
                    if value == randomNumber! {
                        print("Kazandınız Sayfa degısımı")
                        
                        let result = true ///Dıger sayfaya gönderılecek olan veri Bilgisi
                        performSegue(withIdentifier: "guesstoresult", sender: result)
                    }
                    
                    if value > randomNumber! {
                        clue.text = " Azalt"
                        remainingLifeText.text = "Kalan Hak : \(remainingLifeValue)"
                        
                        
                    }
                    if value < randomNumber!{
                        clue.text = " Arttır"
                        remainingLifeText.text = "Kalan Hak : \(remainingLifeValue)"
                    }
                    
                }
                else{
                    
                    let result = false ///Dıger sayfaya gönderılecek olan veri Bilgisi
                    performSegue(withIdentifier: "guesstoresult", sender: result)
                }
                
                textFieldNumber.text = "" // Input sılınmesı ıcın yazılır.
            }
        }
    }
    
    

}
