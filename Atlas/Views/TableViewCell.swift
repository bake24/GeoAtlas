//
//  TableViewCell.swift
//  Atlas
//
//  Created by Бакдаулет Дуйсенбеков on 12.05.2023.
//


import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    static let reuseId = "TableViewCell"
    
    var sushiPoster: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "sushi2")
        image.backgroundColor = .orange
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        return image
    }()
    
    lazy var sushiType: UILabel = {
        let label = UILabel()
        label.text = "  "
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    lazy private var bookRunning: UILabel = {
        let label = UILabel()
        label.text = " rice, caviar, fish "
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return label
    }()
    
    lazy private var heartButton: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .red
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TableViewCell {
    
    func setupViews() {
        contentView.addSubview(sushiPoster)
        contentView.addSubview(sushiType)
        contentView.addSubview(bookRunning)
        contentView.addSubview(heartButton)
    }
    
    func setupConstraints() {
        sushiPoster.snp.makeConstraints({ make in
            make.top.leading.bottom.equalToSuperview().inset(10)
            
            make.width.equalTo(100)
            make.height.equalTo(100)
            
        })
        sushiType.snp.makeConstraints({ make in
            make.leading.equalTo(sushiPoster.snp.trailing).offset(10)
            make.top.equalToSuperview().inset(10)
        })
        bookRunning.snp.makeConstraints({ make in
            make.top.equalTo(sushiType.snp.bottom).offset(5)
            make.leading.equalTo(sushiPoster.snp.trailing).offset(10)
        })
        heartButton.snp.makeConstraints({ make in
            make.top.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(20)
        })
    }
}


