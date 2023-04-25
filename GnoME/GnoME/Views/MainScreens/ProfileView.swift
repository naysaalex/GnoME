//
//  ProfileView.swift
//  GnoME
//
//  Created by cashamirica on 4/23/23.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseFirestore

struct ProfileView: View {
    @State private var myProfile: User?
    @AppStorage("log_status") var logStatus: Bool = false
    @State var errorMessage: String = ""
    @State var showError: Bool = false
    @State var isLoading: Bool = false
    var body: some View {
//        ZStack{
//            Color("gnomeBlue")
//                .ignoresSafeArea()
//            VStack{
//                HStack{
//                    Image("title")
//                        .resizable()
//                        .frame(width: 120.0, height: 50.0)
//                    //.padding(, 10)
//                    Spacer()
//                    Image("circleIcon")
//                        .resizable()
//                        .frame(width:60.0,height:60.0)
//                    //.padding(.top)
//                }
//                .padding(.leading, 10)
//                .padding(.horizontal, 10)
                NavigationStack{
                    Color("gnomeBlue")
                        .ignoresSafeArea()
                    VStack{
                        
                        if let myProfile{
                            ReusableProfileContent(user: myProfile)
                                .refreshable {
                                    self.myProfile = nil
                                    await fetchUserData()
                                }
                        }else{
                            ProgressView()
                        }
                    }
                    //            ScrollView(.vertical, showsIndicators: false)
                    //            {
                    //                if let myProfile{
                    //                    Text(myProfile.username)
                    //                }
                    //            }
                    
                    .navigationTitle("My Profile")
                    .toolbar{
                        ToolbarItem(placement: .navigationBarTrailing){
                            Menu{
                                Button("Logout", action: logOutUser)
                                Button("Delete Account", role: .destructive, action: deleteAccount)
                            }label: {
                                Image(systemName: "ellipsis")
                                    .rotationEffect(.init(degrees: 90))
                                    .tint(.black)
                                    .scaleEffect(0.8)
                            }
                        }
                    }
                }
                .overlay{
                    LoadingView(show: $isLoading)
                }
                .alert(errorMessage, isPresented: $showError){
                }
                .task{
                    if myProfile != nil{return}
                    await fetchUserData()
                }
            //}
        //}
    }
    
    func fetchUserData() async{
//        Color("gnomeBlue")
//            .ignoresSafeArea()
        guard let userUID = Auth.auth().currentUser?.uid else{return}
        guard let user = try? await Firestore.firestore().collection("Users").document(userUID).getDocument(as: User.self) else{return}
        await MainActor.run(body: {
            myProfile = user
        })
    }
    
    func logOutUser(){
        try? Auth.auth().signOut()
        logStatus = false
    }
    
    func deleteAccount(){
        isLoading = true
        Task{
            do{
                guard let userUID = Auth.auth().currentUser?.uid else{return}
                let reference = Storage.storage().reference().child("Profile_Images").child(userUID)
                try await reference.delete()
                try await Firestore.firestore().collection("Users").document(userUID).delete()
                try await Auth.auth().currentUser?.delete()
                logStatus = false
            }catch{
                await setError(error)
            }
        }
    }
    
    func setError(_ error: Error) async{
        await MainActor.run(body: {
            isLoading = false
            errorMessage = error.localizedDescription
            showError.toggle()
        })
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
