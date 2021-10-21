//
//  HomeViewController.swift
//  ExpressNews
//
//  Created by VD on 18/10/2021.
//

import UIKit
import ProgressHUD
import Kingfisher

class HomeViewController: UIViewController, NewsManagerDelegate {
    
    static var currentCountry = Country(name: "PT", flag: UIImage(named: "Portugal"))
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var GeneralButton: UIButton!
    @IBOutlet weak var sportsButton: UIButton!
    @IBOutlet weak var TechnologyButton: UIButton!
    @IBOutlet weak var EntertainmntButton: UIButton!
    var CurrentButton = UIButton()
    

    @IBOutlet weak var countryFlag: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var model = NetworkService()
    
    var news : [Article] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressHUD.show()
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: K.NewsCellIdentifier)
        model.delegate = self
        model.request(category: "General", country: "pt")
        GeneralButton.alpha = 1
        navigationController?.isNavigationBarHidden = true
}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.isNavigationBarHidden = true
        ProgressHUD.show()
        model.request(category: "General", country: HomeViewController.currentCountry.name!)
        CurrentButton = GeneralButton
        setupButtons()
        countryFlag.image = HomeViewController.currentCountry.flag
        tableView.reloadData()
        ProgressHUD.dismiss()
    }
    
  
    
    
    func setupButtons(){
        //CurrentButton = GeneralButton
        
        GeneralButton.alpha = GeneralButton == CurrentButton ? 1.1 : 0.5
        sportsButton.alpha = sportsButton == CurrentButton ? 1.1 : 0.5
        TechnologyButton.alpha = TechnologyButton == CurrentButton ? 1.1 : 0.5
        EntertainmntButton.alpha = EntertainmntButton == CurrentButton ? 1.1 : 0.5
    }
    
    func articlesRetrieved(_ articles: [Article]) {
        self.news = articles
        tableView.reloadData()
        ProgressHUD.dismiss()
        
    }
    
 
  
    
    
    @IBAction func categoryTapped(_ sender: UIButton) {
        ProgressHUD.show()
        CurrentButton = sender
        categoryLabel.text = sender.titleLabel?.text
        setupButtons()
        model.request(category: (sender.titleLabel?.text)!, country: HomeViewController.currentCountry.name!)
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        ProgressHUD.dismiss()
        
    }
    
    
    @IBAction func changeCountries(_ sender: Any) {
        let countriesVc = storyboard?.instantiateViewController(withIdentifier: "CountriesVC") as! CountriesViewController
        
        navigationController?.pushViewController(countriesVc, animated: true)
    }
    
    
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
        
}


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.NewsCellIdentifier, for: indexPath) as! NewsTableViewCell
        cell.setup(news[indexPath.row])
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        detailVC.article = news[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }

    
    
    
    
    
}
