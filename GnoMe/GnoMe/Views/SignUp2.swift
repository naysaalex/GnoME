//
//  SignUp2.swift
//  GnoMe
//
//  Created by cashamirica on 3/12/23.
//

import SwiftUI

struct SignUp2: View {
    @State private var username:String = ""
    @State private var FirstName:String = ""
    @State private var LastName:String = ""
    @State private var Pronouns:String = ""
    @State private var PhoneNum:String = ""
    var body: some View {
        ZStack{
            Color("tan")
                .ignoresSafeArea()
            VStack{
                HStack{
                    Image("title")
                        .resizable()
                        .frame(width: 120.0, height: 50.0)
                        .position(CGPoint(x:70,y:20))
                    Image("circleIcon")
                        .resizable()
                        .frame(width:60.0,height:60.0)
                        .position(CGPoint(x:140,y:20))
                }
                
                VStack{
                    Text("Username: ")
                        .position(x:60,y:-220)
                    TextField("Username", text: $username)
                        .disableAutocorrection(true)
                        .position(x:180,y:-225)
                        .frame(width:360)
                    
                    Text("First Name: ")
                        .position(x:60, y:-225)
                    TextField("First Name", text: $FirstName)
                        .disableAutocorrection(true)
                        .position(x:180,y:-230)
                        .frame(width:360)
                    
                    Text("Last Name: ")
                        .position(x:60,y:-230)
                    TextField("Last Name", text: $LastName)
                        .disableAutocorrection(true)
                        .position(x:180,y:-235)
                        .frame(width:360)
                    
                    Text("Pronouns: ")
                        .position(x:60,y:-240)
                    TextField("Pronouns", text: $Pronouns)
                        .disableAutocorrection(true)
                        .position(x:180,y:-245)
                        .frame(width:360)
                    
                    Text("Phone Number: ")
                        .position(x:80,y:-250)
                    TextField("Phone Number", text: $PhoneNum)
                        .disableAutocorrection(true)
                        .position(x:180,y:-250)
                        .frame(width:360)
                }
                .textFieldStyle(.roundedBorder)
                
                Button("Continue") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .padding()
                .background(Color("beige"))
                .clipShape(Capsule())
            }
            
        }
    }
}

struct SignUp2_Previews: PreviewProvider {
    static var previews: some View {
        SignUp2()
    }
}
