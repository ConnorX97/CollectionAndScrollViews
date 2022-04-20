//
//  HomeViewController.swift
//  CollectionAndScrollViews
//
//  Created by Sherzod Fayziev on 2022/04/20.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    

    @IBOutlet weak var collectionView: UICollectionView!
    let numberOfColums: CGFloat = 2
    var items: Array <Items> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }


    // MARK: - Methods
    func initViews() {
        navBarSettings()
        addScrollButton()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.collectionView.register(UINib(nibName: "itemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCell")
        
        if let flowlayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            let screensize: CGRect = UIScreen.main.bounds
            let cellWidth = screensize.width / numberOfColums - 15
            flowlayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
            
            }
        
        items.append(Items(image: "", title: "PDP"))
        items.append(Items(image: "", title: "PDP"))
        items.append(Items(image: "", title: "PDP"))
        items.append(Items(image: "", title: "PDP"))
        items.append(Items(image: "", title: "PDP"))
        items.append(Items(image: "", title: "PDP"))
        items.append(Items(image: "", title: "PDP"))
        items.append(Items(image: "", title: "PDP"))
        items.append(Items(image: "", title: "PDP"))
        items.append(Items(image: "", title: "PDP"))
        }

    
    
    func navBarSettings() {
        title = "Collection View"
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
    
    func addScrollButton() {
        let scroll = UIImage(systemName: "rectangle.portrait.and.arrow.right.fill")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: scroll, style: .plain, target: self, action: #selector(openScroll))
    }
    
    @objc func openScroll() {
        let vc = ScrollViewController(nibName: "ScrollViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

    // MARK: - Actions
    
    
    
    // MARK: - Collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! itemCollectionViewCell
        
        return cell
    }


}
