//
//  PostsView.swift
//  GnoME
//
//  Created by cashamirica on 4/24/23.
//

import SwiftUI

struct PostsView: View {
    @State private var createNewPost: Bool = false
    var body: some View {
        ZStack{
            Color("gnomeBlue")
                .ignoresSafeArea()
            VStack{
                HStack{
                    Image("title")
                        .resizable()
                        .frame(width: 120.0, height: 50.0)
                        //.padding(, 10)
                    Spacer()
                    Image("circleIcon")
                        .resizable()
                        .frame(width:60.0,height:60.0)
                    //.padding(.top)
                }
                .padding(.leading, 10)
                .padding(.horizontal, 10)
                
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .hAlign(.center).vAlign(.center)
                    .overlay(alignment: .bottomTrailing){
                        Button{
                            createNewPost.toggle()
                        }label: {
                            Image(systemName: "plus")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(13)
                                .background(.black, in: Circle())
                        }
                        .padding(15)
                    }
                    .fullScreenCover(isPresented: $createNewPost) {
                        CreateNewPost{ post in
                        }
                    }
            }
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}
