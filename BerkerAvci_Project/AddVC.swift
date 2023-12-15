//
//  AddTaskVC.swift
//  BerkerAvci_Project
//
//  Created by Berker Avcı on 9.06.2023.
//

import UIKit
import CoreData

protocol AddVCDelegate: AnyObject {
    func sendDataToListVC(controller: AddVC,name: String, category: String, unit1: String, amount1: String,ingredient1:String,unit2: String, amount2: String,ingredient2:String,unit3: String, amount3: String,ingredient3:String,garnish:String,origin:String,preperation:String)
}

class AddVC: UIViewController {
    weak var delegate: AddVCDelegate?
    
    @IBOutlet weak var nametf: UITextField!
    
    @IBOutlet weak var categorytf: UITextField!
    
    @IBOutlet weak var ingredient1tf: UITextField!
    @IBOutlet weak var amount1tf: UITextField!
    @IBOutlet weak var unit1tf: UITextField!
    @IBOutlet weak var ingredient2tf: UITextField!
    @IBOutlet weak var amount2tf: UITextField!
    @IBOutlet weak var unit2tf: UITextField!
    @IBOutlet weak var ingredient3tf: UITextField!
    @IBOutlet weak var amount3tf: UITextField!
    @IBOutlet weak var unit3tf: UITextField!
    
    
    @IBOutlet weak var pretf: UITextView!
    @IBOutlet weak var garnishtf: UITextField!
    @IBOutlet weak var origintf: UITextField!
    
           
    
    
    @IBAction func dataSave(_ sender: UIBarButtonItem) {
        let name = nametf.text ?? ""
        let category = categorytf.text ?? ""
        let unit1 = unit1tf.text ?? ""
        let amount1 = amount1tf.text ?? ""
        let ingredient1 = ingredient1tf.text ?? ""
        let unit2 = unit2tf.text ?? ""
        let amount2 = amount2tf.text ?? ""
        let ingredient2 = ingredient2tf.text ?? ""
        let unit3 = unit3tf.text ?? ""
        let amount3 = amount3tf.text ?? ""
        let ingredient3 = ingredient3tf.text ?? ""
        let origin = origintf.text ?? ""
        let garnish = garnishtf.text ?? ""
        let preperation = pretf.text ?? ""
        delegate?.sendDataToListVC(controller: self,name: name, category: category, unit1: unit1, amount1: amount1,ingredient1:ingredient1,unit2: unit2, amount2: amount2,ingredient2:ingredient2,unit3: unit3, amount3: amount3,ingredient3:ingredient3,garnish:garnish,origin:origin,preperation:preperation)
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    
    
    
    func setGradientBackground() {        // Create a CAGradientLayer
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        // Define the gradient colors
        gradientLayer.colors = [UIColor.brown.cgColor, UIColor.orange.cgColor]
        
        // Set the gradient direction
        gradientLayer.startPoint = CGPoint(x: 0.6, y: 0.7)
        gradientLayer.endPoint = CGPoint(x: 0.2, y: 0.3)
        
        // Add the gradient layer to the view's layer
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    override func viewDidLoad() {
        setGradientBackground()
        super.viewDidLoad()
        for case let textField as UITextField in view.subviews {
            textField.backgroundColor = UIColor.white
        }
        pretf.backgroundColor = UIColor.white
        
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
