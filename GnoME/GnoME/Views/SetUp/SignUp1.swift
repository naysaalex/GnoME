//
//  SignUp1.swift
//  GnoMe
//
//  Created by gnome on 3/12/23.
//

import SwiftUI


struct SignUp1: View {
    @State private var email:String = ""
    @State private var password:String = ""
    @State private var confirmPass:String = ""
    
    var body: some View {
        //error - why does everything keep shifting
        //error - why can you click certain textbox's but not others
        //error - how to make textboxes material sensitive
        
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
                    TextField("Email", text: $email)
                        .disableAutocorrection(true)
                        .position(x:180,y:200)
                        .frame(width:360)
                        //.fixedSize()
                    TextField("Password", text: $password)
                        .disableAutocorrection(true)
                        .frame(width:360)
                        .position(x:200,y:230)
                        //.fixedSize()
                    TextField("Confirm Password", text: $confirmPass)
                        .disableAutocorrection(true)
                        .frame(width: 360)
                        .position(x:200,y:180)
                        //.fixedSize()
                }
                .textFieldStyle(.roundedBorder)
                
                NavigationLink(destination: SignUp2()){
                    Text("Continue")
                        .frame(minWidth: 0,maxWidth: 100)
                        .padding()
                        .foregroundColor(.blue)
                        .background(Color("beige"))
                        .cornerRadius(40)
                        .position(x:200, y: 270)
                        
                }
            }
            
        }
    }
}

struct SignUp1_Previews: PreviewProvider {
    static var previews: some View {
        SignUp1()
    }
}
