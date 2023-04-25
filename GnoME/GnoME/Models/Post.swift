//
//  Post.swift
//  GnoME
//
//  Created by cashamirica on 4/24/23.
//
//
//import SwiftUI
//import FirebaseFirestoreSwift
//
//struct Post: Identifiable,Codable {
//    @DocumentID var id: String?
//    var text: String
//    var imageURL: URL?
//    var imageReferenceID: String = ""
//    var publishedData: Date = Date()
//    var likedIDs: [String] = []
//    var dislikedIDs: [String] = []
//    var userName: String
//    var userUID: String
//    var userProfileURL: URL
//
//    enum CodingKeys: CodingKey{
//        case id
//        case text
//        case imageURL
//        case imageReferenceID
//        case publishedDate
//        case likedIDs
//        case dislikedIDs
//        case userName
//        case userUID
//        case userProfileURL
//    }
//}

import SwiftUI
import FirebaseFirestoreSwift

struct Post: Identifiable, Codable {
    @DocumentID var id: String?
    var text: String
    var imageURL: URL?
    var imageReferenceID: String = ""
    var publishedDate: Date = Date()
    var likedIDs: [String] = []
    var dislikedIDs: [String] = []
    var userName: String
    var userUID: String
    var userProfileURL: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case text
        case imageURL
        case imageReferenceID
        case publishedDate
        case likedIDs
        case dislikedIDs
        case userName
        case userUID
        case userProfileURL
    }
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        id = try container.decodeIfPresent(String.self, forKey: .id)
//        text = try container.decode(String.self, forKey: .text)
//        imageURL = try container.decodeIfPresent(URL.self, forKey: .imageURL)
//        imageReferenceID = try container.decode(String.self, forKey: .imageReferenceID)
//        publishedDate = try container.decode(Date.self, forKey: .publishedDate)
//        likedIDs = try container.decode([String].self, forKey: .likedIDs)
//        dislikedIDs = try container.decode([String].self, forKey: .dislikedIDs)
//        userName = try container.decode(String.self, forKey: .userName)
//        userUID = try container.decode(String.self, forKey: .userUID)
//        userProfileURL = try container.decode(URL.self, forKey: .userProfileURL)
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encodeIfPresent(id, forKey: .id)
//        try container.encode(text, forKey: .text)
//        try container.encodeIfPresent(imageURL, forKey: .imageURL)
//        try container.encode(imageReferenceID, forKey: .imageReferenceID)
//        try container.encode(publishedDate, forKey: .publishedDate)
//        try container.encode(likedIDs, forKey: .likedIDs)
//        try container.encode(dislikedIDs, forKey: .dislikedIDs)
//        try container.encode(userName, forKey: .userName)
//        try container.encode(userUID, forKey: .userUID)
//        try container.encode(userProfileURL, forKey: .userProfileURL)
//    }
}
