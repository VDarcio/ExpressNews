//
//  ReadMoreViewController.swift
//  ExpressNews
//
//  Created by VD on 22/10/2021.
//

import UIKit
import WebKit
import ProgressHUD

class ReadMoreViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webview: WKWebView!
    
    var articleURL: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        webview.navigationDelegate = self

      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if articleURL != nil{
             
            guard let url = URL(string: articleURL!) else{return}
            
            let request = URLRequest(url: url)
            ProgressHUD.show()
            webview.load(request)
            ProgressHUD.dismiss()
        }
        
    }
    


}
