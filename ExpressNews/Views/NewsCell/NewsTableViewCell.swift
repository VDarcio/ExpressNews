//
//  NewsTableViewCell.swift
//  ExpressNews
//
//  Created by VD on 19/10/2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var cellimage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    
    func setup(_ article: Article){
        cellLabel.text = article.title
        cellimage.image = UIImage(named: "Portugal")
        
    }
    
}
