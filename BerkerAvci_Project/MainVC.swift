//
//  MainVC.swift
//  BerkerAvci_Project
//
//  Created by Berker Avcı on 9.06.2023.
//

import UIKit
import AVFoundation

class MainVC: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    let m = DataSource()
    
    @IBOutlet weak var mCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return m.numbeOfItemsInEachSection(section)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        //return mDataSource.groups.count
        return m.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! CustomCollectionReusableView
        
        headerView.mLabel1.text = m.getSectionLabelAtIndex(indexPath.section)
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        
        let coctails: [Cocktailss] = m.cocktailsInSection(indexPath.section)
        let coctail = coctails[indexPath.row]
        
        
        
        cell.mImageView.image = UIImage(named: coctail.image ?? "")
        cell.mLabel2.text = coctail.name
        
        
        return cell
    }
    
    func getIndexPathForSelectedCell() -> IndexPath? {
        var indexPath: IndexPath?
        
        if mCollectionView.indexPathsForSelectedItems!.count > 0 {
            indexPath = mCollectionView.indexPathsForSelectedItems![0] as IndexPath
        }
        
        return indexPath
    }
    func highlightCell(_ indexPath : IndexPath, flag: Bool) {
        
        let cell = mCollectionView.cellForItem(at: indexPath)
        
        if flag {
            cell?.contentView.backgroundColor = UIColor.magenta
        }
        else {
            //cell?.contentView.backgroundColor = nil
            cell?.contentView.backgroundColor = UIColor.clear
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = getIndexPathForSelectedCell() {
            
            let cocktail = m.cocktailsInSection(indexPath.section)[indexPath.row]
            
            let mDetailVC = segue.destination as! DetailVC
            
            mDetailVC.mCocktail = cocktail
        }
    }
    func setGradientBackground() {        // Create a CAGradientLayer
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        // Define the gradient colors
        gradientLayer.colors = [UIColor.brown.cgColor, UIColor.orange.cgColor]
        
        // Set the gradient direction
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        
        // Add the gradient layer to the view's layer
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mCollectionView.backgroundColor = UIColor.clear
        setGradientBackground()
        m.populateData()
        
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
