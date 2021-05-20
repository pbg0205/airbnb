//
//  ViewController.swift
//  swift-airbnb
//
//  Created by user on 2021/05/18.
//

import UIKit

class mainPageViewController: UIViewController {
    @IBOutlet weak var mainPageCollectionView: UICollectionView!
    var dataSource = mainPageCollectionViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureCollectionViewCell()
        configureCollectionViewLayout()
        self.dataSource.setDataSource(collectionView: mainPageCollectionView)
        self.dataSource.applySnapshot()
    }

    func configureCollectionViewLayout() {
        self.mainPageCollectionView.setCollectionViewLayout(createLayout(), animated: false)
    }

    func configureCollectionViewCell() {
//        let curationCell = UINib(nibName: "CurationCell", bundle: nil)
//        let nearbyDestinationCell = UINib(nibName: "NearbyDestinationCell", bundle: nil)
//        let variousDestinationCell = UINib(nibName: "VariousDestinationCell", bundle: nil)
//        let mainPageHeaderView = UINib(nibName: "MainPageHeaderView", bundle: nil)
        self.mainPageCollectionView.register(CurationCell.nib, forCellWithReuseIdentifier: CurationCell.reuseIdentifier)
        self.mainPageCollectionView.register(NearbyDestinationCell.nib, forCellWithReuseIdentifier: NearbyDestinationCell.reuseIdentifier)
        self.mainPageCollectionView.register(VariousDestinationCell.nib, forCellWithReuseIdentifier: VariousDestinationCell.reuseIdentifier)
        self.mainPageCollectionView.register(MainPageHeaderView.nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MainPageHeaderView.reuseIdentifier)
    }
}

//MARK: create layout of collectionView
extension mainPageViewController {
    private func createLayout() -> UICollectionViewLayout {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            switch sectionIndex {
            case 0:
                return self.createCurationLayout()
            case 1:
                return self.createNearbyDestinationLayout()
            default:
                return self.createVariousDestinationLayout()
            }
        }, configuration: config)
        
        return layout
    }
    
    private func createCurationLayout() -> NSCollectionLayoutSection {
        let curationItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        
        let curationGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)), subitem: curationItem, count: 1)
        
        let curationSection = NSCollectionLayoutSection(group: curationGroup)
        curationSection.orthogonalScrollingBehavior = .groupPaging
        
        return curationSection
    }
    
    private func createNearbyDestinationLayout() -> NSCollectionLayoutSection {
        let destinationItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        destinationItem.contentInsets = NSDirectionalEdgeInsets(top: 24, leading: 0, bottom: 0, trailing: 0)
        
        let destinationGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.3)), subitem: destinationItem, count: 2)
        
        let destinationSection = NSCollectionLayoutSection(group: destinationGroup)
        destinationSection.orthogonalScrollingBehavior = .groupPagingCentered
        
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .estimated(28)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        destinationSection.boundarySupplementaryItems = [sectionHeader]
        
        return destinationSection
    }
    
    private func createVariousDestinationLayout() -> NSCollectionLayoutSection {
        let destinationItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        destinationItem.contentInsets = NSDirectionalEdgeInsets(top: 28, leading: 16, bottom: 0, trailing: 0)
        
        let destinationGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7), heightDimension: .fractionalHeight(0.6)), subitem: destinationItem, count: 1)
        
        let destinationSection = NSCollectionLayoutSection(group: destinationGroup)
        destinationSection.orthogonalScrollingBehavior = .groupPaging
        
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .estimated(56)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        destinationSection.boundarySupplementaryItems = [sectionHeader]
        
        return destinationSection
    }
}