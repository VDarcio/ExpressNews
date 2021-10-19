//
//  HomeViewController.swift
//  ExpressNews
//
//  Created by VD on 18/10/2021.
//

import UIKit

class HomeViewController: UIViewController, NewsManagerDelegate {
   
    func articlesRetrieved(_ articles: [Article]) {
        self.news = articles
        tableView.reloadData()
    }
    

    @IBOutlet weak var countryFlag: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var model = NetworkService()
    
    var news : [Article] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: K.NewsCellIdentifier)
        model.delegate = self
        model.request()
        
        
        navigationController?.isNavigationBarHidden = true

    
}
    
    @IBAction func changeCountry(_ sender: Any) {
        
        
    }
    
    @IBAction func changeCategory(_ sender: Any) {
        
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

    
    
    
    
    
}
