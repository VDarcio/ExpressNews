//
//  DetailViewController.swift
//  ExpressNews
//
//  Created by VD on 20/10/2021.
//

import UIKit
import Kingfisher
import ProgressHUD

class DetailViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleContent: UILabel!
    
    let dateFormatter = DateFormatter()
    
    var article = Article()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressHUD.show()
       PopulateView()
        ProgressHUD.dismiss()
        
    }
    
    func PopulateView(){
        descriptionLabel.text = article.description ?? ""
        authorLabel.text = article.author ?? ""
       // dateFormatter.dateFormat = "YY/MM/dd"
       //let date = dateFormatter.string(from: article.publishedAt!)
        dateLabel.text = article.publishedAt
        articleImage.kf.setImage(with: article.urlToImage?.asURL)
        articleContent.text = article.content ?? ""
      
        
        
        
    }
    

    

}
