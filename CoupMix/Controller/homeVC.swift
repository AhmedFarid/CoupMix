//
//  homeVC.swift
//  CoupMix
//
//  Created by farido on 12/13/18.
//  Copyright © 2018 farido. All rights reserved.
//

import UIKit

class homeVC: UIViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var catCollection: UICollectionView!
    @IBOutlet weak var featuresCollection: UICollectionView!
    
    var slider = [sliderData]()
    var category = [cate_list]()
    var featuer = [featureOffers]()
    
    
    var currentIndex = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        featuresCollection.delegate = self
        featuresCollection.dataSource = self
        
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        
        catCollection.dataSource = self
        catCollection.delegate = self
        
        handleRefreshBanner()
        handleRefreshCat()
        handleRefreshOffers()

        
         pageControl.numberOfPages = slider.count
        
        
    }
    
    
//        @objc private func handleRefresh() {
//            APIPOST.Get(url: URLs.slider, parameters: nil, header: nil) { (success,?, slider: [sliderCell]?) in
//                <#code#>
//            }
//    
//        }
    
    @objc private func handleRefreshOffers() {
        
        API_Home.featureOffer { (error: Error?, featuer: [featureOffers]?) in
            if let featuer = featuer {
                self.featuer = featuer
                print("xxx\(self.featuer)")
                self.featuresCollection.reloadData()
            }
        }
    }
    
    @objc private func handleRefreshCat() {
        
        API_Home.category { (error: Error?, category: [cate_list]?) in
            if let category = category {
                self.category = category
                print("xxx\(self.category)")
                self.catCollection.reloadData()
            }
        }
    }
    
    @objc private func handleRefreshBanner() {
        
        API_Home.banner { (error: Error?, slider: [sliderData]?) in
            if let slider = slider {
                self.slider = slider
                print("xxx\(self.slider)")
                self.bannerCollectionView.reloadData()
            }
        }
    }
}


extension homeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
        return slider.count
        }else if collectionView.tag == 1 {
            return category.count
        }else{
            return featuer.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            if let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? sliderCell {
                let banner = slider[indexPath.row]
                cell.configuerCell(prodect: banner)
                return cell
            }else {
                return sliderCell()
            }
        }else if collectionView.tag == 1{
            if let cell = catCollection.dequeueReusableCell(withReuseIdentifier: "CategoriesCell", for: indexPath) as? categCell {
                let cat = category[indexPath.row]
                cell.configuerCell(prodect: cat)
                return cell
            }else {
                return categCell()
            }
        }else {
            if let cell = featuresCollection.dequeueReusableCell(withReuseIdentifier: "FeaturesProductsCell", for: indexPath) as? featureOfferCell {
                let feature = featuer[indexPath.row]
                cell.configuerCell(prodect: feature)
                return cell
            }else {
                return featureOfferCell()
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 0{
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }else if collectionView.tag == 1{
            let screenWidth = UIScreen.main.bounds.width
            var width = (screenWidth-30)/3
            
            width = width < 75 ? 75 : width
            
            return CGSize.init(width: width, height: width)
        }else {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 0 {
            print("no")
        }else if collectionView.tag == 1 {
            performSegue(withIdentifier: "suge", sender: category[indexPath.row])
        }else {
            performSegue(withIdentifier: "suge2", sender: featuer[indexPath.row])
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let search = segue.destination as? searchVC {
            search.singItem = sender as? cate_list
        }else if let brandDetials = segue.destination as? brandDetilasVC {
            brandDetials.singleItem = sender as? featureOffers
        }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentIndex = Int(scrollView.contentOffset.x / bannerCollectionView.frame.size.width)
        pageControl.currentPage = currentIndex
        }
    }
}

