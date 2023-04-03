//
//  SignUp2.swift
//  GnoMe
//
//  Created by gnome on 3/12/23.
//

import SwiftUI

struct SignUp2: View {
    @State private var username:String = ""
    @State private var FirstName:String = ""
    @State private var LastName:String = ""
    @State private var Pronouns:String = ""
    @State private var PhoneNum:String = ""
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        ZStack{
            Color("tan")
                .ignoresSafeArea()
            VStack{
                HStack{
                    Image("title")
                        .resizable()
                        .frame(width: 120.0, height: 50.0)
                        .position(CGPoint(x:-30,y:15))
                        .padding(.top)
                    Image("circleIcon")
                        .resizable()
                        .frame(width:60.0,height:60.0)
                        .position(CGPoint(x:120,y:15))
                        .padding(.top)
                }
                .fixedSize(horizontal: true, vertical: true)
                
                VStack{
                    Text("Username: ")
                        .position(x:60,y:20)
                    TextField("Username", text: $username)
                        .disableAutocorrection(true)
                        .position(x:180,y:0)
                        .frame(width:360)
                        .background(Color(.white))
                    //error - why is this have extra white space

                    Text("First Name: ")
                        .position(x:60, y:10)
                    TextField("First Name", text: $FirstName)
                        .disableAutocorrection(true)
                        .position(x:180,y:-10)
                        .frame(width:360)

                    Text("Last Name: ")
                        .position(x:60,y:-20)
                    TextField("Last Name", text: $LastName)
                        .disableAutocorrection(true)
                        .position(x:180,y:-40)
                        .frame(width:360)

                    Text("Pronouns: ")
                        .position(x:60,y:-50)
                    TextField("Pronouns", text: $Pronouns)
                        .disableAutocorrection(true)
                        .position(x:180,y:-70)
                        .frame(width:360)

                    Text("Phone Number: ")
                        .position(x:80,y:-80)
                    TextField("Phone Number", text: $PhoneNum)
                        .disableAutocorrection(true)
                        .position(x:180,y:-90)
                        .frame(width:360)
                }
                .textFieldStyle(.roundedBorder)
                NavigationLink(destination: SignUp3()){
                    Text("Continue")
                        .frame(minWidth: 0,maxWidth: 100)
                        .padding()
                        .foregroundColor(.blue)
                        .background(Color("beige"))
                        .cornerRadius(40)
                        .onTapGesture {
                            userData.user1.username = username
                            userData.user1.FName = FirstName
                            userData.user1.LName = LastName
                            userData.user1.pronouns = Pronouns
                            userData.user1.phoneNumber = PhoneNum
                        }
                }
            }
            
        }
    }
}

struct SignUp2_Previews: PreviewProvider {
    static var previews: some View {
        SignUp2()
    }
}
