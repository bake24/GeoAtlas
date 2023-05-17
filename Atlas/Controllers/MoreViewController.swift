////
////  MoreViewController.swift
////  Atlas
////
////  Created by Бакдаулет Дуйсенбеков on 12.05.2023.
////
//
//import UIKit
//import SnapKit
//
//
//class MoreViewController: UIViewController {
//
//
//
//    lazy private var image: UIImageView = {
//            let image = UIImageView()
//            image.image = UIImage(named: "germany.png")
//
//            return image
//        }()
//    lazy private var region: UILabel = {
//    let label = UILabel()
//        label.text = "Region"
//        label.font = UIFont.systemFont(ofSize: 20)
//        label.textColor = .black
//    return label
//    }()
//
//    lazy private var capital: UILabel = {
//    let label = UILabel()
//        label.text = "Capital"
//        label.font = UIFont.systemFont(ofSize: 20)
//        label.textColor = .black
//    return label
//    }()
//
//    lazy private var capitalCoord: UILabel = {
//    let label = UILabel()
//        label.text = "Capital Coordinates"
//        label.font = UIFont.systemFont(ofSize: 20)
//        label.textColor = .black
//    return label
//    }()
//    lazy private var population: UILabel = {
//    let label = UILabel()
//        label.text = "Population"
//        label.font = UIFont.systemFont(ofSize: 20)
//        label.textColor = .black
//    return label
//    }()
//    lazy private var area: UILabel = {
//    let label = UILabel()
//        label.text = "Area"
//        label.font = UIFont.systemFont(ofSize: 20)
//        label.textColor = .black
//    return label
//    }()
//    lazy private var currency: UILabel = {
//    let label = UILabel()
//        label.text = "Currency"
//        label.font = UIFont.systemFont(ofSize: 20)
//        label.textColor = .black
//    return label
//    }()
//    lazy private var timezone: UILabel = {
//    let label = UILabel()
//        label.text = "Timezone"
//        label.font = UIFont.systemFont(ofSize: 20)
//        label.textColor = .black
//    return label
//    }()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setupViews()
//        setupConstraints()
//    }
//
//    func setupViews(){
//
//        view.addSubview(image)
//        view.addSubview(region)
//        view.addSubview(capital)
//        view.addSubview(capitalCoord)
//        view.addSubview(population)
//        view.addSubview(area)
//        view.addSubview(currency)
//        view.addSubview(timezone)
//
//
//    }
//
//    func setupConstraints(){
//
//    image.snp.makeConstraints { make in
//        make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
//        make.leading.trailing.equalToSuperview().inset(20)
//        make.width.height.equalTo(200)
//
//        }
//        region.snp.makeConstraints { make in
//            make.top.equalTo(image.snp.bottom)
//            make.leading.equalToSuperview().inset(20)
//            make.bottom.equalToSuperview().inset(400)
//
//        }
//        capital.snp.makeConstraints { make in
//            make.top.equalTo(region.snp.bottom)
//            make.leading.equalToSuperview().inset(20)
//            make.bottom.equalToSuperview().inset(380)
//
//        }
//        capitalCoord.snp.makeConstraints { make in
//            make.top.equalTo(capital.snp.bottom)
//            make.leading.equalToSuperview().inset(20)
//            make.bottom.equalToSuperview().inset(250)
//
//        }
//        population.snp.makeConstraints { make in
//            make.top.equalTo(capitalCoord.snp.bottom)
//            make.leading.equalToSuperview().inset(20)
//            make.bottom.equalToSuperview().inset(200)
//
//        }
//        area.snp.makeConstraints { make in
//            make.top.equalTo(population.snp.bottom)
//            make.leading.equalToSuperview().inset(20)
//            make.bottom.equalToSuperview().inset(150)
//
//        }
//        currency.snp.makeConstraints { make in
//            make.top.equalTo(area.snp.bottom)
//            make.leading.equalToSuperview().inset(20)
//            make.bottom.equalToSuperview().inset(100)
//
//        }
//        timezone.snp.makeConstraints { make in
//            make.top.equalTo(currency.snp.bottom)
//            make.leading.equalToSuperview().inset(20)
//            make.bottom.equalToSuperview().inset(50)
//
//        }
//    }
//
//}
//

import UIKit
import SnapKit

class CountryDetailsViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let flagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let regionLabel = UILabel()
    let capitalLabel = UILabel()
    //... other labels
    
    var countryCode: String? = "co"
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            setupUI()
            
            fetchCountryDetails()
        }
        
        // ... существующие методы
        
        private func fetchCountryDetails() {
            guard let countryCode = countryCode else { return }
            let urlString = "https://restcountries.com/v3.1/alpha/\(countryCode)"
            
            guard let url = URL(string: urlString) else { return }
            
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else {
                    print("Не удалось получить данные")
                    return
                }
                
                do {
                    if let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [[String: Any]], let countryDetails = jsonResult.first {
                        DispatchQueue.main.async {
                            self?.updateUI(with: countryDetails)
                        }
                    }
                } catch {
                    print("Не удалось разобрать JSON: \(error)")
                }
            }
            task.resume()
        }
        
        private func updateUI(with countryDetails: [String: Any]) {
            if let flagURLString = (countryDetails["flags"] as? [String: Any])?["png"] as? String,
               let flagURL = URL(string: flagURLString) {
                // Fetching image data asynchronously
                DispatchQueue.global().async {
                    if let flagImageData = try? Data(contentsOf: flagURL),
                       let flagImage = UIImage(data: flagImageData) {
                        DispatchQueue.main.async {
                            self.flagImageView.image = flagImage
                        }
                    }
                }
            }

            regionLabel.text = "Регион: \((countryDetails["region"] as? String) ?? "N/A")"
            if let capital = (countryDetails["capital"] as? [String])?.first {
                capitalLabel.text = "Столица: \(capital)"
            }
            // ... обновите другие метки
        }
    
    private func setupUI() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(flagImageView)
        contentView.addSubview(regionLabel)
        contentView.addSubview(capitalLabel)
        //... add other labels to contentView
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.edges.equalTo(scrollView)
        }
        
        flagImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(200)
        }
        
        regionLabel.snp.makeConstraints { make in
            make.top.equalTo(flagImageView.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(20)
        }
        
        capitalLabel.snp.makeConstraints { make in
            make.top.equalTo(regionLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(20)
        }
        
        //... setup constraints for other labels
    }
    
}
