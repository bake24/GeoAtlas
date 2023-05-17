//
//  CollectionViewController.swift
//  Atlas
//
//  Created by Бакдаулет Дуйсенбеков on 17.05.2023.
//

import UIKit
import SnapKit

class CountryCollectionViewController: UICollectionViewController {
    private let cellId = "countryCell"
    var countries: [Country] = [
        Country(name: "Germany", capital: "Berlin", flag: UIImage(named: "germany.png")!, population:"19 mln", area: "2.725 km2", currencies: "Tenge(T)(KZT)"),
           Country(name: "France", capital: "Paris", flag: UIImage(named: "germany.png")!, population:"19 mln", area: "2.725 km2", currencies: "Tenge(T)(KZT)"),
           Country(name: "Italy", capital: "Rome", flag: UIImage(named: "germany.png")!, population:"19 mln", area: "2.725 km2", currencies: "Tenge(T)(KZT)"),
           Country(name: "Spain", capital: "Madrid", flag: UIImage(named: "germany.png")!, population:"19 mln", area: "2.725 km2", currencies: "Tenge(T)(KZT)"),
           Country(name: "United Kingdom", capital: "London", flag: UIImage(named: "germany.png")!, population:"19 mln", area: "2.725 km2", currencies: "Tenge(T)(KZT)"),
       ]
    
    init() {
           let layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .vertical
           layout.itemSize = CGSize(width: UIScreen.main.bounds.width-20, height: 100) 
           super.init(collectionViewLayout: layout)
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CountryCell.self, forCellWithReuseIdentifier: "CountryCell")
        collectionView.register(CountryCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CountryCell
        let country = countries[indexPath.row]
        cell.configure(with: country)
        cell.learnMore.addTarget(self, action: #selector(curreLearnTapped), for: .primaryActionTriggered)
        cell.isExpanded = country.isExpanded
        cell.setNeedsUpdateConstraints()
        return cell
    }
    
    @objc func curreLearnTapped() {
        let vc = CountryDetailsViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        countries[indexPath.row].isExpanded.toggle()
        collectionView.reloadItems(at: [indexPath])
    }
}

extension CountryCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if countries[indexPath.row].isExpanded {
            return CGSize(width: view.frame.width, height: 200)
        } else {
            return CGSize(width: view.frame.width, height: 80)
        }
    }
}
