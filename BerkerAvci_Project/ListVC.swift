//
//  ListVC.swift
//  BerkerAvci_Project
//
//  Created by Berker Avcı on 13.06.2023.
//

import UIKit
import CoreData

class ListVC: UIViewController,UITableViewDelegate,UITableViewDataSource,AddVCDelegate {
    
    
    
    @IBOutlet weak var mTableView: UITableView!
    var mCocktail = [Cocktail]()
    
    func sendDataToListVC(controller: AddVC, name: String, category: String, unit1: String, amount1: String, ingredient1: String, unit2: String, amount2: String, ingredient2: String, unit3: String, amount3: String, ingredient3: String, garnish: String, origin: String, preperation: String) {
        
        let name = name
        let category = category
        let unit1 = unit1
        let amount1 = amount1
        let ingredient1 = ingredient1
        let unit2 = unit2
        let amount2 = amount2
        let ingredient2 = ingredient2
        let unit3 = unit3
        let amount3 = amount3
        let ingredient3 = ingredient3
        let origin = origin
        let preperation = preperation
        
        
        self.saveNewItem(name, category: category, unit1: unit1, amount1: amount1,ingredient1:ingredient1,unit2: unit2, amount2: amount2,ingredient2:ingredient2,unit3: unit3, amount3: amount3,ingredient3:ingredient3,garnish:garnish,origin:origin,preperation:preperation)
        
        
        
        self.mTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mCocktail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Recommended way
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        // Get the Student for this index
        let cocktail = mCocktail[indexPath.row]
        
        cell.textLabel?.text = "\(indexPath.row)"
        cell.textLabel?.text = cocktail.name!
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    
    func fetchData() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cocktail")
        
        // Create a sort descriptor object that sorts on the "surname"
        // property of the Core Data object
        let sortDescriptor1 = NSSortDescriptor(key: "name", ascending: true)
        let sortDescriptor2 = NSSortDescriptor(key: "category", ascending: true)
        
        // Set the list of sort descriptors in the fetch request,
        // so it includes the sort descriptor
        fetchRequest.sortDescriptors = [sortDescriptor1, sortDescriptor2]
        
        // NSPredicate performs search operation
        // https://nspredicate.xyz
        let search = "ay"
        let mPredicate = NSPredicate(format: "name contains[c] %@", search)
        
        //fetchRequest.predicate = mPredicate
        
        do {
            let results = try context.fetch(fetchRequest)
            mCocktail = results as! [Cocktail]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
    }
    
    
    func saveNewItem(_ name: String, category: String, unit1: String, amount1: String, ingredient1: String, unit2: String, amount2: String, ingredient2: String, unit3: String, amount3: String, ingredient3: String, garnish: String, origin: String, preperation: String) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let newCocktailItem = Cocktail.createInManagedObjectContext(context,
                                                                    name: name, category: category, unit1: unit1, amount1: amount1,ingredient1:ingredient1,unit2: unit2, amount2: amount2,ingredient2:ingredient2,unit3: unit3, amount3: amount3,ingredient3:ingredient3,garnish:garnish,origin:origin,preperation:preperation)
        
        self.fetchData()
        
        if let newCocktailIndex = mCocktail.firstIndex(of: newCocktailItem) {
           
            let newCocktailItemIndexPath = IndexPath(row: newCocktailIndex, section: 0)
            
            mTableView.insertRows(at: [ newCocktailItemIndexPath ], with: .automatic)
            
            save()
        }
    }
    func save() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            try context.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "add" {
            let vc = segue.destination as! AddVC
          
            vc.delegate = self
        }
        else{
            if let indexPath = getIndexPathForSelectedRow() {
                
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cocktail")
                let sortDescriptor1 = NSSortDescriptor(key: "name", ascending: true)
                let sortDescriptor2 = NSSortDescriptor(key: "category", ascending: true)
                
                
                fetchRequest.sortDescriptors = [sortDescriptor1, sortDescriptor2]
                
               
                
                let search = "ay"
                let mPredicate = NSPredicate(format: "name contains[c] %@", search)
                
                
                
                do {
                    let fetchResults = try context.fetch(fetchRequest)
                    mCocktail = fetchResults as! [Cocktail]
                    let detailViewController = segue.destination as! DetailListVC
                    
                    detailViewController.category = mCocktail[indexPath.row].category!
                    detailViewController.unit1 = mCocktail[indexPath.row].unit1!
                    detailViewController.unit2 = mCocktail[indexPath.row].unit2!
                    detailViewController.unit3 = mCocktail[indexPath.row].unit3!
                    detailViewController.amount3 = mCocktail[indexPath.row].amount3!
                    detailViewController.amount2 = mCocktail[indexPath.row].amount2!
                    detailViewController.amount1 = mCocktail[indexPath.row].amount1!
                    detailViewController.ingredient1 = mCocktail[indexPath.row].ingredient1!
                    detailViewController.ingredient3 = mCocktail[indexPath.row].ingredient3!
                    detailViewController.ingredient2 = mCocktail[indexPath.row].ingredient2!
                    detailViewController.garnish = mCocktail[indexPath.row].garnish!
                    detailViewController.preperation = mCocktail[indexPath.row].preperation!
                    detailViewController.name = mCocktail[indexPath.row].name!
                    detailViewController.origin = mCocktail[indexPath.row].origin!
                    
                    
                    
                    
                    
                } catch let error as NSError {
                    print("Could not fetch \(error), \(error.userInfo)")
                }

            }
            
        }

        
        
            
        
    }
    
    func getIndexPathForSelectedRow() -> IndexPath? {
        var indexPath: IndexPath?
        
        if mTableView.indexPathsForSelectedRows!.count > 0 {
            indexPath = mTableView.indexPathsForSelectedRows![0] as IndexPath
        }
        
        return indexPath
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
        mTableView.backgroundColor = UIColor.clear
        mTableView
        super.viewDidLoad()
        save()
        self.fetchData()
        
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
