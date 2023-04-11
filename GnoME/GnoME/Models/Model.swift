//  Model.swift
//  GnoME usingData
//
//  Created by gnome on 3/31/23.
//

//coredata is a method to store data on your device
//when you need to exchange information, you need a server
//cloudkit - apple framework
//firestore - 3rd party ; authentication

/* Object Graph Persistence Framework - relationship between the different objects you have built
 
 */

import Foundation
import SwiftUI

//class Model:ObservableObject
//{
//    //list of modules
//    @Published var user = [Users]()//creating an instance so you need the () brackets next to the array of Modules
//
//    //current module
//    @Published var currentUser:Users? //question mark is for an optional reference to the structure that you created
//    var currentUserIndex = 0
//
//    init(){
//        //init is for initialization code
//        getLocalDataa()
//    }
//
//    //function getLocalData()
//    //data methods
//    func getLocalDataa()
//    {
//        //want to get the URL for the json file
//        let jsonUrl = Bundle.main.url(forResource: "userSetup", withExtension: "json")
//
//        //want to read that file into the data objects
//        //do-catch is similar to a try-catch --> basically will do it and if there is any error at all, the catch statement will catch it
//        do{
//            let jsonData = try Data(contentsOf: jsonUrl!) //exclamation mark is added as it will force the code to run anyways
//            //decode this content into the data objects
//            let jsonDecoder = JSONDecoder()
//
//            let user = try jsonDecoder.decode([Users].self, from: jsonData)
//
//            //assign the passed modules to module property
//            self.user = user
//        }
//        catch{
//            //log error
//            print("Parsing the json file failed!")
//        }
//
//    }
//
//    //module navigation method
//    func beginModule(_ username: String){
//    //find the index for this module
//        for index in 0..<user.count{ //"0..<" means you are going from 0 to the total count of modules
//            if user[index].username == username{
//                //found the match
//                currentUserIndex = index
//                break
//            }//end of if
//        }//end of for
//
//    //setting the current module
//        currentUser = user[currentUserIndex]
//
//    }//end of func
//}
func getLocalData(){
    guard let url = Bundle.main.url(forResource: "example", withExtension: "json") else {
        fatalError("Unable to find example.json")
    }

    do {
        let data = try Data(contentsOf: url)
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            if let dictionary = json as? [String: Any] {
                // Access the data from the dictionary object here
                if let questions = dictionary["questions"] as? [String: Any] {
                    if let question = questions["question"] as? String {
                        // Access the question text here
                        print(question)
                    }
                    if let date = questions["date"] as? String {
                        // Access the question date here
                        print(date)
                    }
                    if let time = questions["time"] as? String {
                        // Access the question time here
                        print(time)
                    }
                }
                if let selfPost = dictionary["selfPost"] as? [String: Any] {
                    if let profilePic = selfPost["profilePic"] as? String {
                        // Access the profile picture URL here
                        print(profilePic)
                    }
                    if let userName = selfPost["userName"] as? String {
                        // Access the user name here
                        print(userName)
                    }
                    if let time = selfPost["time"] as? String {
                        // Access the post time here
                        print(time)
                    }
                    if let date = selfPost["date"] as? String {
                        // Access the post date here
                        print(date)
                    }
                    if let answer = selfPost["answer"] as? String {
                        // Access the post answer here
                        print(answer)
                    }
                    if let likes = selfPost["likes"] as? Int {
                        // Access the number of likes here
                        print(likes)
                    }
                    if let comments = selfPost["comments"] as? Int {
                        // Access the number of comments here
                        print(comments)
                    }
                }
                if let post = dictionary["post"] as? [String: Any] {
                    if let profilePic = post["profilePic"] as? String {
                        // Access the profile picture URL here
                        print(profilePic)
                    }
                    if let userName = post["userName"] as? String {
                        // Access the user name here
                        print(userName)
                    }
                    if let time = post["time"] as? String {
                        // Access the post time here
                        print(time)
                    }
                    if let date = post["date"] as? String {
                        // Access the post date here
                        print(date)
                    }
                    if let answer = post["answer"] as? String {
                        // Access the post answer here
                        print(answer)
                    }
                    if let likes = post["likes"] as? Int {
                        // Access the number of likes here
                        print(likes)
                    }
                    if let comments = post["comments"] as? Int {
                        // Access the number of comments here
                        print(comments)
                    }
                }
            }
        } catch {
            print("Error parsing JSON: \(error.localizedDescription)")
        }
    } catch {
        print("Error loading data: \(error.localizedDescription)")
    }
}

//struct Users{//}: Decodable, Identifiable{
//    var pfp: UIImage?
//    var email: String
//    var id: UUID
//    var username: String
//    var password: String
//    var FName: String
//    var LName: String
//    var pronouns: String
//    var phoneNumber: String
//    //var Posts: [Post]
//    var Bio: String
//}
//
//struct Post{//}: Decodable, Identifiable{
//    //var question: String
//    var answer: String
//    var mushroom: Int
//    var date: String
//   // var comments: [Comment]
//}
//
//struct Comment{//: Decodable, Identifiable{
//    var userName: String
//    var userPfp: UIImage?
//    var commentMade: String
//    var mushroom: Int
//}
