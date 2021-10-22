//
//  CountriesViewController.swift
//  ExpressNews
//
//  Created by VD on 19/10/2021.
//

import UIKit

class CountriesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    static var session = 0

    @IBOutlet weak var tableView: UITableView!
    let countries : [Country] = [
        .init(name: "PT", flag: UIImage(named: "Portugal")),
        .init(name: "BR", flag: UIImage(named: "Brasil")),
        .init(name: "GB", flag: UIImage(named: "England")),
        .init(name: "ES", flag: UIImage(named: "Spain")),
        .init(name: "US", flag: UIImage(named: "US"))
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.isNavigationBarHidden = false
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountrieCell", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].name
        cell.imageView?.image = countries[indexPath.row].flag
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        HomeViewController.currentCountry = countries[indexPath.row]
        navigationController?.popToRootViewController(animated: true)
        CountriesViewController.session = 1
    }
    

}
