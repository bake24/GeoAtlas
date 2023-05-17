////
////  GeoCollectionViewCell.swift
////  Atlas
////
////  Created by Бакдаулет Дуйсенбеков on 12.05.2023.
////
//
//
import UIKit
import SnapKit

class CountryCell: UICollectionViewCell {
    
    var isExpanded: Bool = false {
        didSet {
            population.isHidden = !isExpanded
            area.isHidden = !isExpanded
            currencies.isHidden = !isExpanded
            learnMore.isHidden = !isExpanded
            updateConstraintsIfNeeded()
        }
    }
    
    let flagImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 40
        return imageView
    }()
    
    let countryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let capitalLabel: UILabel = {
        let label = UILabel()
        //        label.isHidden = true
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .gray
        return label
    }()
    let population: UILabel = {
        let label = UILabel()
        //        label.isHidden = true
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    let area: UILabel = {
        let label = UILabel()
        //        label.isHidden = true
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    let currencies: UILabel = {
        let label = UILabel()
        //        label.isHidden = true
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    let learnMore: UIButton = {
        let learnMoreLabel = UIButton()
        learnMoreLabel.translatesAutoresizingMaskIntoConstraints = false
        learnMoreLabel.setTitle("Learn more", for: .normal)
        learnMoreLabel.tintColor = .black
        learnMoreLabel.setTitleColor(UIColor.blue, for: .normal)
        learnMoreLabel.backgroundColor = UIColor(red: 247/255, green: 248/255, blue: 249/255, alpha: 1)
        return learnMoreLabel
    }()
    
   
    private lazy var moreDetailsButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.down")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 247/255, green: 248/255, blue: 249/255, alpha: 1)
        layer.cornerRadius = 20
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews() {
        addSubview(flagImageView)
        addSubview(countryLabel)
        addSubview(capitalLabel)
        addSubview(moreDetailsButton)
        addSubview(population)
        addSubview(area)
        addSubview(currencies)
        addSubview(learnMore)
        
        
        moreDetailsButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
        flagImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(20)
            make.width.height.equalTo(50)
        }
        
        countryLabel.snp.makeConstraints { make in
            make.top.equalTo(flagImageView)
            make.leading.equalTo(flagImageView.snp.trailing).offset(30)
            make.trailing.equalToSuperview().inset(10)
        }
        
        capitalLabel.snp.makeConstraints { make in
            make.top.equalTo(countryLabel.snp.bottom).offset(5)
            make.leading.trailing.equalTo(countryLabel)
        }
    }
    
    func configure(with country: Country) {
        flagImageView.image = country.flag
        countryLabel.text = country.name
        
        capitalLabel.text = country.capital
        
        population.isHidden = !isExpanded
        population.text = "Population: \(country.population)"
        
        area.isHidden = !isExpanded
        area.text = "Area: \(country.area)"
        
        currencies.isHidden = !isExpanded
        currencies.text = "Currencies: \(country.currencies)"
        
        
    }
    
    
    override func updateConstraints() {
        super.updateConstraints()
        
        if isExpanded {
            //                   // Здесь установите констрейнты для расширенного состояния
            population.snp.makeConstraints { make in
                make.top.equalTo(flagImageView.snp.bottom).offset(5)
                make.leading.equalToSuperview().inset(20)
            }
            area.snp.makeConstraints { make in
                make.top.equalTo(population.snp.bottom).offset(5)
                make.leading.equalToSuperview().inset(20)
            }
            currencies.snp.makeConstraints { make in
                make.top.equalTo(area.snp.bottom).offset(5)
                make.leading.equalToSuperview().inset(20)
            }
            moreDetailsButton.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.trailing.equalToSuperview().inset(20)
                make.bottom.equalToSuperview().inset(50)
            }
            learnMore.snp.makeConstraints { make in
                make.top.equalTo(currencies.snp.bottom).offset(15)
                make.leading.trailing.equalToSuperview().inset(50)
            }
        } else {
            population.snp.removeConstraints()
        }
    }
    
}

