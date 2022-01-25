//
//  ViewController3.swift
//  Sayı Tahmini  App
//
//  Created by asuftech on 12.01.2022.
//

import UIKit

class ResultSceen: UIViewController {

    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var result: UILabel!
    
    
    var incomingResult:Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true

        print(incomingResult!)
        
        if incomingResult! == true {
            image.image = UIImage(named: "smileImage")
            result.text = "Kazandınız"
        }
        else {
            
            image.image = UIImage(named: "sadImage")
            result.text = "Kaybettiniz"
        }
       
    }
    
    @IBAction func againButton(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    

}
