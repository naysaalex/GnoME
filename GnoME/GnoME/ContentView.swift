//
//  ContentView.swift
//  GnoMe
//
//  Created by cashamirica on 4/6/23.
//

import SwiftUI

struct NavigationButton: View {
    let iconName: String
    let pageIndex: Int
    @Binding var selectedPageIndex: Int
    
    var body: some View {
        Button(action: {
            self.selectedPageIndex = self.pageIndex
        }, label: {
            if selectedPageIndex == pageIndex {
                Image("\(iconName)-Selected")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            } else {
                Image(iconName)
                    .font(.system(size: 30))
                    .foregroundColor(.gray)
            }
        })
        .frame(width: 80, height: 80)
    }
}

struct ContentView: View {
    @State private var selectedPage = 0
    
    var body: some View {
        
        VStack(spacing: 0) {
            Spacer()
            getPageView()
            ZStack{
                Rectangle()
                    .foregroundColor(Color(red: 0.17647058823529413, green: 0.30980392156862746, blue: 0.3568627450980392))
                    .frame(height: 80)
                
                HStack {
                    NavigationButton(iconName: "Game", pageIndex: 1, selectedPageIndex: $selectedPage)
                    
                    NavigationButton(iconName: "Home", pageIndex: 0, selectedPageIndex: $selectedPage)
                        .padding(.horizontal)

                    NavigationButton(iconName: "Profile", pageIndex: 2, selectedPageIndex: $selectedPage)
                    
                  
                }
                
            }//End of Naviation Bar
        }.edgesIgnoringSafeArea(.bottom)
    }
    
    
    private func getPageView() -> AnyView {
        switch selectedPage {
        case 0:
            return AnyView(HomeScreen())
        case 1:
            return AnyView(LeaderBoard())
        case 2:
            return AnyView(UserProfile())
        default:
            return AnyView(HomeScreen())
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
