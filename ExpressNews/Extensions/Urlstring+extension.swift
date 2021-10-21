//
//  Urlstring+extension.swift
//  ExpressNews
//
//  Created by VD on 19/10/2021.
//

import Foundation

//extension to turn URL into a string

extension String{
    var  asURL : URL?{
        return URL(string: self)
    }
}
