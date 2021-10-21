//
//  NewsTableViewCell.swift
//  ExpressNews
//
//  Created by VD on 19/10/2021.
//

import UIKit
import Kingfisher




class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var cellimage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    
    func setup(_ article: Article){
        cellLabel.text = article.title
        cellimage.kf.setImage(with: article.urlToImage?.asURL)
        
    
   
    }
    }

    
    
    

