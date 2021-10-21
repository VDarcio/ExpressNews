//
//  NewsModel.swift
//  ExpressNews
//
//  Created by VD on 19/10/2021.
//

import Foundation

// MARK: - Welcome
struct News: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {

var author: String?
var title: String?
var description:String?
var url:String?
var urlToImage:String?
var publishedAt:  String?
var content: String?
var source: Source?



}

// MARK: - Source
struct Source: Codable {
    let name: String
}
