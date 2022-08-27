//
//  ViewController.swift
//  miABC 9-22
//
//  Created by Joey Rubin on 8/27/22.
//

import UIKit

private let reusableIdentifier = "cell"

private var letterSections = [
    ["A", "B", "C", "D", "E", "F", "G", "H", "I"],
    ["J", "K", "L", "M", "N", "O", "P", "Q", "R"],
    ["S", "T", "U", "V", "W", "X", "Y", "Z"]
]
private var letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R","S", "T", "U", "V", "W", "X", "Y", "Z"]

class ViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.setCollectionViewLayout(generateLayout(), animated: false)
    }

    //MARK: - Collection View Layout:
    
    private func generateLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 10
        let itemSpacing: CGFloat = 5
        
        /// Item definition
//        let itemSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .fractionalHeight(1.0)
//        )
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.333),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: itemSpacing)
        
        /// Group definition
//        let groupSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .absolute(70.0)
//        )
//        let group = NSCollectionLayoutGroup.horizontal(
//            layoutSize: groupSize,
//            subitem: item,
//            count: 1)//How many items in group
//        group.contentInsets = NSDirectionalEdgeInsets(
//            top: spacing,
//            leading: 0,
//            bottom: 0,
//            trailing: 0
//        )
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.15)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: 3
        )
        group.contentInsets = NSDirectionalEdgeInsets(
            top: itemSpacing,
            leading: itemSpacing,
            bottom: 0,
            trailing: itemSpacing
        )
        /// Section and layout definition
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: spacing,
            leading: spacing,
            bottom: spacing,
            trailing: spacing
        )
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
        
    }
    
    //MARK: - UIcollectionView Data Source:

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return letterSections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return letterSections[section].count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableIdentifier, for: indexPath) as! CollectionVewCell
        
        cell.cellLabel.text = letterSections[indexPath.section][indexPath.item]
        
        return cell
    }
    
}

