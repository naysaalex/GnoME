//
//  WelcomeScreen.swift
//  GnoMe
//
//  Created by cashamirica on 3/12/23.
//

import SwiftUI

struct WelcomeScreen: View {
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
                //Spacer()
                Text("Welcome. Ready to let people Gno you?")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .position(x:195,y:50)
                HStack{
                    
                    Button("Sign Up") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .padding()
                    .background(Color("beige"))
                    .clipShape(Capsule())
                    .position(x:109,y:40)
                    Spacer()
                    Button("Log in") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .padding()
                    .background(Color("beige"))
                    .clipShape(Capsule())
                    .position(x:90, y:40)
                }
                Spacer()
            }
            
        }
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
