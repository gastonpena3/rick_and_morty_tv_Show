//
//  Character.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 15/09/2023.
//

import Foundation

struct Characters: Decodable {
    var info: Info
    var results: [Character]
}

struct Info: Decodable {
    var count: Int?
    var pages: Int?
    var next: String?
    var previous: String?
    
    enum CodingKeys: String, CodingKey {
        case count
        case pages
        case next
        case previous = "prev"
    }
}

struct Character: Decodable, Identifiable, Equatable {
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.name?.lowercased() == rhs.name?.lowercased()
    }
    
    var id: Int
    var name: String?
    var status: String?
    var species:String?
    var gender:String?
    var origin: Data?
    var location: Data?
    var image: String?
    var episode: [String]?
    var url: String?
    var created: String?
    
    func toData() -> [DataModel] {
        return [DataModel(key: "Name", value: self.name), DataModel(key:"Status", value: self.status), DataModel(key:"Species", value: self.species), DataModel(key:"Gender", value: self.gender), DataModel(key:"Origin", value: self.origin?.name), DataModel(key:"Location", value: self.location?.name, isUserInteracionEnable: true), DataModel(key:"Episodes", value: "\(self.episode?.count ?? 0)"), DataModel(key:"Created", value: self.created?.formattedDate())]
        
    }
}

struct Data: Decodable {
    var name: String?
    var url: String?
}

