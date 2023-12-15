//
//  DetailListVC.swift
//  BerkerAvci_Project
//
//  Created by Berker Avcı on 13.06.2023.
//

import UIKit
import SCLAlertView

class DetailListVC: UIViewController {
    var mCocktail: Cocktailss?
    var name = ""
    var origin = ""
    var category = ""
    var unit1 = ""
    var amount1 = ""
    var ingredient1 = ""
    var unit2 = ""
    var amount2 = ""
    var ingredient2 = ""
    var unit3 = ""
    var amount3 = ""
    var ingredient3 = ""
    var garnish = ""
    var preperation = ""
    
    @IBAction func onClick(_ sender: UIBarButtonItem) {
        SCLAlertView().showNotice("Origin", subTitle: origin)
    }
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    @IBOutlet weak var label10: UILabel!
    @IBOutlet weak var label11: UILabel!
    
    @IBOutlet weak var textarea: UITextView!
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
        
        super.viewDidLoad()
        setGradientBackground()
        label1.text = "Category: \(category)"
        label2.text = amount1 ?? ""
        label3.text = unit1 ?? ""
        label4.text = ingredient1 ?? ""
        label5.text = amount2 ?? ""
        label6.text = unit2 ?? ""
        label7.text = ingredient2 ?? ""
        label8.text = amount3 ?? ""
        label9.text = unit3 ?? ""
        label10.text = ingredient3 ?? ""
        label11.text = garnish ?? ""
        
        textarea.text = preperation ?? ""
        textarea.backgroundColor = UIColor.clear
        
        self.title = name
        if let cocktail = mCocktail{
            label1.text = cocktail.category
            self.title = cocktail.name
            origin = cocktail.origin!
            
            
            /*label1.text = cocktail.category ?? ""
            label2.text = cocktail.unit1 ?? ""
            label3.text = cocktail.amount1 ?? ""
            label4.text = cocktail.ingredient3 ?? ""
            label5.text = cocktail.category ?? ""
            label6.text = cocktail.category ?? ""
            label7.text = cocktail.category ?? ""
            label8.text = cocktail.category ?? ""
            label9.text = cocktail.category ?? ""
            label10.text = cocktail.category ?? ""
            label11.text = cocktail.category ?? ""
            textarea.text = cocktail.preparation ?? ""
             */
            
            // Your array of Ingredient objects

            

            
            textarea.backgroundColor = UIColor.clear
            
            
            
            
            
        }

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
