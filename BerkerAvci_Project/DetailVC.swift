//
//  DetailVC.swift
//  BerkerAvci_Project
//
//  Created by Berker Avcı on 10.06.2023.
//

import UIKit
import SCLAlertView

class DetailVC: UIViewController {
    var name = ""
    var origin = ""
    @IBAction func onClick(_ sender: UIBarButtonItem) {
        SCLAlertView().showNotice("Origin", subTitle: origin)
    }
    var mCocktail: Cocktailss?
    @IBOutlet weak var mImageView: UIImageView!
    
    @IBOutlet weak var mTextView2: UITextView!
    @IBOutlet weak var mTextView: UITextView!
    @IBOutlet weak var mLabel5: UILabel!
    @IBOutlet weak var mLabel4: UILabel!
    @IBOutlet weak var mLabel3: UILabel!
    @IBOutlet weak var mLabel2: UILabel!
    @IBOutlet weak var mLabel1: UILabel!
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
        if let cocktail = mCocktail{
            mImageView.image = UIImage(named: cocktail.image!)
            self.title = cocktail.name
            origin = cocktail.origin!
            name = cocktail.name!
            mLabel2.text = "Category: \(cocktail.category ?? "")"
            let ingredients: [Ingredient] = cocktail.ingredients// Your array of Ingredient objects

            let formattedString = ingredients.map { ingredient in
                return "\(ingredient.amount) \(ingredient.unit) of \(ingredient.ingredient)"
            }.joined(separator: "\n")

            mTextView.text = "\(formattedString)"
            mTextView.backgroundColor = UIColor.clear
            mLabel4.text = cocktail.garnish
            mTextView2.text = cocktail.preparation
            mTextView2.backgroundColor = UIColor.clear
            
            
            
            
        }
        mImageView.layer.cornerRadius = mImageView.frame.size.width / 10
        mImageView.layer.masksToBounds = true

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
