//
//  ViewController.swift
//  Atlas
//
//  Created by Бакдаулет Дуйсенбеков on 12.05.2023.
//




import UIKit
import SnapKit
class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

//    private var techCollectionView = GeoCollectionView()
  
    
    lazy private var tableView: UITableView = {
    let tableView = UITableView()
    tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseId)
    tableView.backgroundColor = .clear
    tableView.allowsSelection = true
    return tableView
}()
    
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
               
        super.viewDidLoad()
        setupViews()
        setupConstraints()
//        techCollectionView.set(cells: SushiModel.fetchSushi())
        
    }
    
    func setupViews(){
        view.addSubview(tableView)
//        view.addSubview(myLabel)
//        view.addSubview(techCollectionView)
    
    }
    func setupConstraints(){
       
//        techCollectionView.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
//            make.leading.trailing.equalToSuperview().inset(10)
//            make.bottom.equalToSuperview().inset(580)
//
//                }
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview().inset(20)


        }
        
    }
    var cellData = [
            CustomCellData(title: "Caviar"),
            CustomCellData(title: "Camaron"),
            CustomCellData(title: "Salmon"),
            CustomCellData(title: "Jengibire"),
            CustomCellData(title: "Options"),
    ]

    
    
    
//    func tableview(_ tableview: UITableView, cellForItemAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = dequeueReusableCell(withIdentifier: TableViewCell.reuseId, for: indexPath) as! TableViewCell
//        cell.bookPoster.image = cells[indexPath.row].mainImage
//        cell.nameProduct.text = cells[indexPath.row].sushiName
//        cell.descrProduct.text = cells[indexPath.row].smallDescription
//        cell.costLabel.text = "$\(cells[indexPath.row].cost)"
//        return cell
//    }
    
}

extension MainViewController  {
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseId) as! TableViewCell
        cell.sushiType.text = cellData[indexPath.row].title
           return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Number oif cells: ", cellData.count)
        return cellData.count
        }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
             let vc = CountryDetailsViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 500
    }
   
}



struct CustomCellData {
    var title: String
}



