//
//  ViewController.swift
//  CarrefourSADesign
//
//  Created by İbrahim on 2.09.2022.
//

import UIKit
import HSCycleGalleryView

class ViewController: UIViewController {

    
    @IBOutlet weak var sonSiparisButton: UIButton!
    @IBOutlet weak var cokSatanButton: UIButton!
    @IBOutlet weak var indirimliUrunButton: UIButton!
    
    @IBOutlet weak var carouselView: UIView!
    @IBOutlet weak var bottomCollectionView: UICollectionView!
    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet weak var threeButtonStackView: UIStackView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    let pager = HSCycleGalleryView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 175))
    
    var categoriesList = [ProductCategory]()
    var recommendedProductList = [RecommendedProduct]()
    var carouseImagelList = [
        UIImage(named: "r1"),
        UIImage(named: "r2"),
        UIImage(named: "r3")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bottomCollectionView.delegate = self
        bottomCollectionView.dataSource = self
        
        prepareMockData()
        setViews()
        
    }
    
    func setViews() {
        
        // Navigaiton Bar
        let logo = UIImage(named: "logo")
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        
        // Collection View
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.minimumInteritemSpacing = 10
        design.minimumLineSpacing = 10
        
        // let width = self.bottomCollectionView.frame.self.width
        let width = UIScreen.main.bounds.width
        
        let cellWidth = (width - 45) / 3
        design.itemSize = CGSize(width: cellWidth, height: cellWidth)
        bottomCollectionView.collectionViewLayout = design
        
        
        // Top StackView
        for product in recommendedProductList {
            let view = buildRecommendedProductView(price: product.price, image: product.image)
            topStackView.addArrangedSubview(view)
        }
        
        makeRoundedButton(button: cokSatanButton)
        makeRoundedButton(button: sonSiparisButton)
        makeRoundedButton(button: indirimliUrunButton)
        
        
        // Carousel
        pager.register(cellClass: CarouselCollectionViewCell.self, forCellReuseIdentifier: "carouselCell")
        pager.delegate = self
        carouselView.addSubview(pager)
        pager.reloadData()
    }
    
    func buildRecommendedProductView(price: String, image: String ) -> UIView {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 75).isActive = true
        view.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .darkGray
        label.font = UIFont(name: "Helvetica Neue", size: 13)
        label.text = "\(price)₺"

        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        let circle = UIView()
        circle.backgroundColor = .clear
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.widthAnchor.constraint(equalToConstant: 60).isActive = true
        circle.heightAnchor.constraint(equalToConstant: 60).isActive = true
        circle.layer.borderWidth = 2
        circle.layer.borderColor = UIColor(named: "blueColor")?.cgColor
        circle.layer.cornerRadius = 29
        
        let imageView = UIImageView()
        let image = UIImage(named: image)!
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true

        imageView.image = image
        circle.addSubview(imageView)
        
        imageView.topAnchor.constraint(equalTo: circle.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: circle.bottomAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: circle.centerXAnchor).isActive = true
        
        view.addSubview(circle)
        circle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        circle.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        
        return view
    }
    
    func makeRoundedButton(button: UIButton) {
        button.layer.borderColor = UIColor(named: "blueColor")?.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
    }
    
    func prepareMockData() {
        let category1 = ProductCategory(title: "Meyve,Sebze", image: "meyve-sebze")
        let category2 = ProductCategory(title: "Et,Balık,Kümes", image: "et")
        let category3 = ProductCategory(title: "Süt,Kahvaltılık", image: "sut")
        let category4 = ProductCategory(title: "Gıda,Şekerleme", image: "gida")
        let category5 = ProductCategory(title: "İçecekler", image: "icecek")
        let category6 = ProductCategory(title: "Bebek Dünyası", image: "bebek")
        let category7 = ProductCategory(title: "Temizlik", image: "temizlik")
        let category8 = ProductCategory(title: "Elektronik", image: "elektronik")
        let category9 = ProductCategory(title: "Kozmetik", image: "kozmetik")
        
        categoriesList.append(category1)
        categoriesList.append(category2)
        categoriesList.append(category3)
        categoriesList.append(category4)
        categoriesList.append(category5)
        categoriesList.append(category6)
        categoriesList.append(category7)
        categoriesList.append(category8)
        categoriesList.append(category9)
        
        let recommendedProd1 = RecommendedProduct(image: "r1", price: "12.99")
        let recommendedProd2 = RecommendedProduct(image: "r2", price: "22.99")
        let recommendedProd3 = RecommendedProduct(image: "r3", price: "41.99")
        let recommendedProd4 = RecommendedProduct(image: "r4", price: "53.99")
        let recommendedProd5 = RecommendedProduct(image: "r5", price: "102.99")
        let recommendedProd6 = RecommendedProduct(image: "r6", price: "2.99")
        let recommendedProd7 = RecommendedProduct(image: "r7", price: "32.99")
        
        recommendedProductList.append(recommendedProd1)
        recommendedProductList.append(recommendedProd2)
        recommendedProductList.append(recommendedProd3)
        recommendedProductList.append(recommendedProd4)
        recommendedProductList.append(recommendedProd5)
        recommendedProductList.append(recommendedProd6)
        recommendedProductList.append(recommendedProd7)

    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoriesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = bottomCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCollectionViewCell
        cell.categoryImageView.image = UIImage(named: categoriesList[indexPath.row].image)
        cell.categoryLabel.text = categoriesList[indexPath.row].title
                
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 10.0
        
        return cell
        
    }
}

extension ViewController: HSCycleGalleryViewDelegate {
    func changePageControl(currentIndex: Int) {
        pageControl.currentPage = currentIndex
    }
    
    func numberOfItemInCycleGalleryView(_ cycleGalleryView: HSCycleGalleryView) -> Int {
        let count = carouseImagelList.count

        pageControl.numberOfPages = count
        pageControl.isHidden = (count > 0) ? false : true
        
        return carouseImagelList.count
    }
    
    func cycleGalleryView(_ cycleGalleryView: HSCycleGalleryView, cellForItemAtIndex index: Int) -> UICollectionViewCell {
        let cell = cycleGalleryView.dequeueReusableCell(withIdentifier: "carouselCell", for: IndexPath(item: index, section: 0)) as! CarouselCollectionViewCell
        cell.backgroundView = UIImageView(image: UIImage(named: "carousel"))
        return cell
    }
}

