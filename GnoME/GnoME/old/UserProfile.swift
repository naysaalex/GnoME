//
//  UserProfile.swift
//  GnoMe
//
//  Created by gnome on 3/11/23.
//

import SwiftUI

struct UserProfile: View {
    //@EnvironmentObject var userData: UserData
    let profile: [String: Any] = [
                       "name": "Blake Dolenski",
                       "userName": "blakedolenski_02",
                       "pronouns": "he/him",
                       "mushrooms": 128,
                       "bio": "WaLLeR diDn'T aCtuUally haVe InTErnet unTiL LaSt yEar",
                       "profilePic": "Blake",
                     ]
    
    var body: some View {
            ZStack{
           
                Color(red: 0.19215686274509805, green: 0.3607843137254902, blue: 0.32941176470588235).edgesIgnoringSafeArea(.all)
                //Background
                
                ZStack(alignment: .top) {
                    ScrollView {
                        VStack(spacing: 20) {
                            
                            HStack{
                                VStack{
                                    Image((profile["profilePic"]!) as! String)
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .padding(.leading)
                                Text("You")
                                        .foregroundColor(.white)
                                        .padding(.top, -3.0)
                                }//Pic and You
                                VStack (alignment: .leading) {
                                    HStack (alignment: .bottom) {
                                        Text((profile["name"]!) as! String)
                                            .font(.title)
                                            .foregroundColor(.white)
                                        Text((profile["pronouns"]!) as! String)
                                                                       .foregroundColor(.white)
                                                                   
                                    }//Name and Pronouns
                                    Text("@" + ((profile["userName"]!) as! String))
                                    Divider()
                                        .frame(height: 3)
                                        .background(Color.red)
                                        .padding(.trailing)
                                }//Name and Pronouns and UserName
                               

                            }//end of Pic and Username
                            HStack{
                                Image("Mushroom 1")
                                Text("\(profile["mushrooms"] as! Int)")
                                    .font(.largeTitle)
                               
                            }
                            .padding(.vertical, -30.0)//Mushrooms
                            
                            Divider()
                                .frame(height: 3)
                                .background(Color.red)
                                .padding(.horizontal)
                            VStack{
                                
                                Text("One thing I want people to Gno about me is...\n" + ((profile["bio"]!) as! String))
                                    .font(.title2)
                            }
                            .padding(.horizontal)
                            Divider()
                                .frame(height: 3)
                                .background(Color.red)
                                .padding(.horizontal)
                            //Divider After Bio
                            Old_Post_1()
                            Old_Post_2()
                            Old_Post_3()
                            
                        }
                        .padding(.top, 100) // Leave space for the banner
                    }
                    ZStack{
                        VStack (spacing: 0){
                            Rectangle()
                                .fill(Color(red: 0.9254901960784314, green: 0.9254901960784314, blue: 0.9254901960784314))
                                .frame(height: 70)
                            
                            Rectangle()
                                .fill(Color(red: 0.19215686274509805, green: 0.3607843137254902, blue: 0.32941176470588235))
                                .frame(height: 73)
                        }//Rectangles for Banner
                        .padding(.top, -65)
                        HStack {
                            Image("title")
                            Spacer()
                            Image("Logo")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 65, height: 65)
                        }
                        .padding(.horizontal, 10)
                        .padding(.top, 3)
                    }//End of Banner
                    
                   
            }
                }

        }
    }

struct Old_Post_1: View {
    // Define a variable to hold the post data
    let post: [String: Any] = [
        "question": "What are you looking forward to?",
        "time": "11:00 AM",
        "date": "2023-03-31",
        "answer": "I have an interview on Tuesday and I can't wait to dress to impress",
        "likes": 2,
        "comments": [
            [
                "userName": "Niyati",
                "commentText": "You got this Blake!!!",
                "profilePic": "Niyati"
            ],
            [
                "userName": "Naysa",
                "commentText": "Excited?!! I get so nervous",
                "profilePic": "Naysa"
            ],
            [
                "userName": "Jackson",
                "commentText": "He's basically hired",
                "profilePic": "Jackson"
            ]
        ]
    ]
    
    @State var showComments = false //toggle the comments section
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color(red: 0.8156862745098039, green: 0.8, blue: 0.8))
                    .cornerRadius(15)
                    .padding(.vertical, -20)
                    .frame(width: 370)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.black, lineWidth: 2)
                            .padding(.vertical, -20)
                        )
                    .shadow(radius: 2)
                //.padding(.horizontal, -8)
                
                VStack{
                        Text("\(post["time"] as! String) - \(post["date"] as! String)")
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .padding(.leading, 150)
                            .padding(.bottom, 5)
                               
                    VStack (alignment: .leading) {
                        Text(post["question"] as! String)
                            .font(.title2)
                            .fontWeight(.medium)
                            .padding(.bottom, 4)
                            .padding(.leading)
                        
                        Text(post["answer"] as! String)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.horizontal, 10)
                            .padding(.leading, 35)
                        // Display post answer
                    }
                    
                    HStack {
                        Image("Mushroom 1")
                            .resizable()
                            .frame(width: 49*(5/6), height: 34*(5/6))
                        Text("\(post["likes"] as! Int)")
                        
                        
                        Button(action: {
                            
                            showComments.toggle()
                        }) {
                            Image("Chat")
                        }
                        
                        
                        Text("\((post["comments"]! as AnyObject).count)")
                    }//Comment & Like Count
                    .padding(.leading, 200)
                }
            }//Profile Pic, Name, Date, Time, Answer, Likes, Comments
            
            
            
            if showComments {
                
                VStack {
                    Rectangle()
                        .fill(Color(red: 0.8313725490196079, green: 0.7647058823529411, blue: 0.6941176470588235))
                        .frame(width: 349, height: 50)
                        .padding(.bottom, -40)
                        .padding(.top, -9)
                    ZStack{
                        Rectangle()
                            .fill(Color(red: 0.8313725490196079, green: 0.7647058823529411, blue: 0.6941176470588235))
                            .cornerRadius( 15)
                            .padding(.vertical, -10)
                            .frame(width: 349)
                        VStack (alignment: .leading) {
                            ForEach(post["comments"] as! [[String: String]], id: \.self) { comment in
                                HStack {
                                    HStack (alignment: .center) {
                                        Image(comment["profilePic"]!)
                                            .frame(width: 25, height: 25)
                                        VStack(alignment: .leading) {
                                            Text(comment["userName"]!)
                                                .font(.subheadline)
                                            Text(comment["commentText"]!)
                                                .font(.subheadline)
                                           
                                              
                                        }
                                    }
                                    Spacer()
                                    Image("Mushroom 1")
                                        .frame(width: 100, height: 100, alignment: .trailing)
                                        .padding(.trailing, 25)
                                   

                                }
                                Divider()
                                    .frame(width: 300, height: 2)
                                    .background(Color.black)

                            }
                        }//Comments
                        .padding(.leading, 50)
                      
                       
                    }
                    
                }//Comments with Background
                .padding(.top, 17)
            }
        }
        .padding(.vertical, 20)
    }
}

struct Old_Post_2: View {
    // Define a variable to hold the post data
    let post: [String: Any] = [
        "question": "What's your biggest fear?",
        "time": "11:00 AM",
        "date": "2023-02-31",
        "answer": "Women",
        "likes": 3,
        "comments": [
            [
                "userName": "Niyati",
                "commentText": "I thought you'd be afraid of mirrors",
                "profilePic": "Niyati"
            ],
            [
                "userName": "Naysa",
                "commentText": "The venmo offer still stands",
                "profilePic": "Naysa"
            ],
            [
                "userName": "Jackson",
                "commentText": "Roast him Niya",
                "profilePic": "Jackson"
            ]
        ]
    ]
    
    @State var showComments = false //toggle the comments section
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color(red: 0.8156862745098039, green: 0.8, blue: 0.8))
                    .cornerRadius(15)
                    .padding(.vertical, -20)
                    .frame(width: 370)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.black, lineWidth: 2)
                            .padding(.vertical, -20)
                        )
                    .shadow(radius: 2)
                //.padding(.horizontal, -8)
                
                VStack{
                        Text("\(post["time"] as! String) - \(post["date"] as! String)")
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .padding(.leading, 150)
                            .padding(.bottom, 5)
                               
                    
         VStack (alignment: .leading) {
             Text(post["question"] as! String)
                 .font(.title2)
                 .fontWeight(.medium)
                 .padding(.bottom, 4)
                 .padding(.leading)
             
             Text(post["answer"] as! String)
                 .font(.title)
                 .fontWeight(.bold)
                 .foregroundColor(.black)
                 .padding(.horizontal, 10)
                 .padding(.leading, 35)
             // Display post answer
         }
         
                    
                    HStack {
                        Image("Mushroom 1")
                            .resizable()
                            .frame(width: 49*(5/6), height: 34*(5/6))
                        Text("\(post["likes"] as! Int)")
                        
                        
                        Button(action: {
                            
                            showComments.toggle()
                        }) {
                            Image("Chat")
                        }
                        
                        
                        Text("\((post["comments"]! as AnyObject).count)")
                    }//Comment & Like Count
                    .padding(.leading, 200)
                }
            }//Profile Pic, Name, Date, Time, Answer, Likes, Comments
            
            
            
            if showComments {
                
                VStack {
                    Rectangle()
                        .fill(Color(red: 0.8313725490196079, green: 0.7647058823529411, blue: 0.6941176470588235))
                        .frame(width: 349, height: 50)
                        .padding(.bottom, -40)
                        .padding(.top, -9)
                    ZStack{
                        Rectangle()
                            .fill(Color(red: 0.8313725490196079, green: 0.7647058823529411, blue: 0.6941176470588235))
                            .cornerRadius( 15)
                            .padding(.vertical, -10)
                            .frame(width: 349)
                        VStack (alignment: .leading) {
                            ForEach(post["comments"] as! [[String: String]], id: \.self) { comment in
                                HStack {
                                    HStack (alignment: .center) {
                                        Image(comment["profilePic"]!)
                                            .frame(width: 25, height: 25)
                                        VStack(alignment: .leading) {
                                            Text(comment["userName"]!)
                                                .font(.subheadline)
                                            Text(comment["commentText"]!)
                                                .font(.subheadline)
                                           
                                              
                                        }
                                    }
                                    Spacer()
                                    Image("Mushroom 1")
                                        .frame(width: 100, height: 100, alignment: .trailing)
                                        .padding(.trailing, 25)
                                   

                                }
                                Divider()
                                    .frame(width: 300, height: 2)
                                    .background(Color.black)

                            }
                        }//Comments
                        .padding(.leading, 50)
                      
                       
                    }
                    
                }//Comments with Background
                .padding(.top, 17)
            }
        }
        .padding(.vertical, 20)
    }
}

struct Old_Post_3: View {
    // Define a variable to hold the post data
    let post: [String: Any] = [
        "question": "Do you have a favorite dance move?",
        "time": "11:00 AM",
        "date": "2023-01-31",
        "answer": "No but one time I faked a seizure to get a girl's number",
        "likes": 5,
        "comments": [
            [
                "userName": "Niyati",
                "commentText": "Hardest thing to believe is that you got her number",
                "profilePic": "Niyati"
            ],
            [
                "userName": "Naysa",
                "commentText": "I heard she gave you a fake number",
                "profilePic": "Naysa"
            ]
        ]
    ]
    
    @State var showComments = false //toggle the comments section
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color(red: 0.8156862745098039, green: 0.8, blue: 0.8))
                    .cornerRadius(15)
                    .padding(.vertical, -20)
                    .frame(width: 370)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.black, lineWidth: 2)
                            .padding(.vertical, -20)
                        )
                    .shadow(radius: 2)
                //.padding(.horizontal, -8)
                
                VStack{
                        Text("\(post["time"] as! String) - \(post["date"] as! String)")
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .padding(.leading, 150)
                            .padding(.bottom, 5)
                               
                    VStack (alignment: .leading) {
                        Text(post["question"] as! String)
                            .font(.title2)
                            .fontWeight(.medium)
                            .padding(.bottom, 4)
                            .padding(.leading)
                        
                        Text(post["answer"] as! String)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.horizontal, 10)
                            .padding(.leading, 35)
                        // Display post answer
                    }
                    
                    HStack {
                        Image("Mushroom 1")
                            .resizable()
                            .frame(width: 49*(5/6), height: 34*(5/6))
                        Text("\(post["likes"] as! Int)")
                        
                        
                        Button(action: {
                            
                            showComments.toggle()
                        }) {
                            Image("Chat")
                        }
                        
                        
                        Text("\((post["comments"]! as AnyObject).count)")
                    }//Comment & Like Count
                    .padding(.leading, 200)
                }
            }//Profile Pic, Name, Date, Time, Answer, Likes, Comments
            
            
            
            if showComments {
                
                VStack {
                    Rectangle()
                        .fill(Color(red: 0.8313725490196079, green: 0.7647058823529411, blue: 0.6941176470588235))
                        .frame(width: 349, height: 50)
                        .padding(.bottom, -40)
                        .padding(.top, -9)
                    ZStack{
                        Rectangle()
                            .fill(Color(red: 0.8313725490196079, green: 0.7647058823529411, blue: 0.6941176470588235))
                            .cornerRadius( 15)
                            .padding(.vertical, -10)
                            .frame(width: 349)
                        VStack (alignment: .leading) {
                            ForEach(post["comments"] as! [[String: String]], id: \.self) { comment in
                                HStack {
                                    HStack (alignment: .center) {
                                        Image(comment["profilePic"]!)
                                            .frame(width: 25, height: 25)
                                        VStack(alignment: .leading) {
                                            Text(comment["userName"]!)
                                                .font(.subheadline)
                                            Text(comment["commentText"]!)
                                                .font(.subheadline)
                                           
                                              
                                        }
                                    }
                                    Spacer()
                                    Image("Mushroom 1")
                                        .frame(width: 100, height: 100, alignment: .trailing)
                                        .padding(.trailing, 25)
                                   

                                }
                                Divider()
                                    .frame(width: 300, height: 2)
                                    .background(Color.black)

                            }
                        }//Comments
                        .padding(.leading, 50)
                      
                       
                    }
                    
                }//Comments with Background
                .padding(.top, 17)
            }
        }
        .padding(.vertical, 20)
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
