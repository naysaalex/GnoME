//
//  RegisterView.swift
//  GnoME
//
//  Created by cashamirica on 4/22/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseStorage
import PhotosUI

struct RegisterView: View{
    @State var emailID: String = ""
    @State var password: String = ""
    @State var username: String = ""
    @State var userBio: String = ""
    @State var userBioLink: String = ""
    @State var userProfilePicData: Data?
    @Environment(\.dismiss) var dismiss
    @State var showImagePicker: Bool = false
    @State var photoItem: PhotosPickerItem?
    @State var showError: Bool = false
    @State var errorMessage: String = ""
    @State var isLoading: Bool = false
    @AppStorage("log_status") var logStatus: Bool = false
    @AppStorage("user_profile_url") var profileURL: URL?
    @AppStorage("user_name") var userNameStored: String = ""
    @AppStorage("user_UID") var userUID: String = ""
    
    var body: some View{
        ZStack{
            Color("gnomeBlue")
                .ignoresSafeArea()
            
            VStack(spacing: 10){
                HStack{
                    Image("title")
                        .resizable()
                        .frame(width: 120.0, height: 50.0)
                        //.padding(.top)
                    Spacer()
                    Image("circleIcon")
                        .resizable()
                        .frame(width:60.0,height:60.0)
                        //.padding(.top)
                }
                .padding(.top, -20)
                
                Text("Register Here")
                    .font(.largeTitle.bold())
                    .hAlign(.leading)
                    .foregroundColor(.white)
                
                Text("Let people Gno you!")
                    .font(.title3)
                    .hAlign(.leading)
                    .foregroundColor(.white)
                
                //for smaller size optimization
                ViewThatFits{
                    ScrollView(.vertical, showsIndicators: false){
                        HelperView()
                    }
                    
                    HelperView()
                }
                
                HStack{
                    Text("Already have an account?")
                        .foregroundColor(.gray)
                    
                    Button("Login Now"){
                        dismiss()
                    }
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                }
                .vAlign(.bottom)
                .font(.callout)
            }
            .vAlign(.top)
            .padding(15)
            .overlay(content:{
                LoadingView(show: $isLoading)
            })
            .photosPicker(isPresented: $showImagePicker, selection: $photoItem)
            .onChange(of: photoItem){ newValue in
                if let newValue{
                    Task{
                        do{
                            guard let imageData = try await newValue.loadTransferable(type: Data.self) else {return}
                            await MainActor.run(body: {
                                userProfilePicData = imageData
                            })
                            
                        }catch{}
                    }
                }
            }
            .alert(errorMessage, isPresented: $showError, actions: {})
        }
    }
    
    @ViewBuilder
    func HelperView()->some View{
        VStack(spacing:12){
            ZStack{
//                if let userProfilePicData, let image = UIImage(data: userProfilePicData){
//                    Image(uiImage: image)
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                } else{
//                    Image("Nullpfp")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                }
                if let imageData = userProfilePicData, let image = UIImage(data: imageData) {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:85, height: 85)
                        .clipShape(Circle())
                        .contentShape(Circle())
                        .onTapGesture {
                            showImagePicker.toggle()
                        }
                        //.padding(.top, 25)
                } else {
                    Image("Nullpfp")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:85, height: 85)
                        .clipShape(Circle())
                        .contentShape(Circle())
                        .onTapGesture {
                            showImagePicker.toggle()
                        }
                        //.padding(.top, 25)
                }
                
            }
            .frame(width:85, height: 85)
            .clipShape(Circle())
            .contentShape(Circle())
            .onTapGesture {
                showImagePicker.toggle()
            }
            //.padding(.top, 25)
            
            TextField("Username", text: $username)
                .textContentType(.emailAddress)
                .border(1, .gray.opacity(0.5))
                .background(Color.white)
                .foregroundColor(Color.black)
            
            TextField("Email", text: $emailID)
                .textContentType(.emailAddress)
                .border(1, .gray.opacity(0.5))
                .background(Color.white)
                .foregroundColor(Color.black)
            
            SecureField("Password", text: $password)
                .textContentType(.emailAddress)
                .border(1, .gray.opacity(0.5))
                .background(Color.white)
                .foregroundColor(Color.black)
            
            TextField("About You", text: $userBio, axis: .vertical)
                .frame(minHeight: 100, alignment: .top)
                .textContentType(.emailAddress)
                .border(1, .gray.opacity(0.5))
                .background(Color.white)
                .foregroundColor(Color.black)
            
            TextField("Bio Link (Optional)", text: $userBioLink)
                .textContentType(.emailAddress)
                .border(1, .gray.opacity(0.5))
                .background(Color.white)
                .foregroundColor(Color.black)
            
            Button(action: registerUser){
                Text("Sign up")
                    .foregroundColor(.black)
                    .fillView(Color("gnomeBeige"))
                    .hAlign(.center)
            }
            .disableWithOpacity(username == "" || userBio == "" || emailID == "" || password == "" || userProfilePicData == nil)
            .padding(.top,10)
        }
    }
    
    func registerUser(){
        isLoading = true
        closeKeyboard()
        Task{
            do{
                //creating firebase account
                try await Auth.auth().createUser(withEmail: emailID, password: password)
                //uploading pfp into storage
                guard let userUID = Auth.auth().currentUser?.uid else{return}
                guard let imageData = userProfilePicData else{return}
                let storageRef = Storage.storage().reference().child("Profile_Images").child(userUID)
                let _ = try await storageRef.putDataAsync(imageData)
                //downloading photo url
                let downloadURL = try await storageRef.downloadURL()
                //creating a user firestore object
                let user = User(username: username, userBio: userBio, userBioLink: userBioLink, userUID: userUID, userEmail: emailID, userProfileURL: downloadURL.absoluteString )
                //saving user doc into firestore database
                //let userRef = db.collection("users").document(user.uid)
                //userRef.setData(user.asDictionary)
                let _ = try Firestore.firestore().collection("Users").document(userUID).setData(user.asDictionary, completion: { error in
                    if error == nil{
                        print("Saved Successfully")
                        userNameStored = username
                        self.userUID = userUID
                        profileURL = downloadURL
                        logStatus = true
                    }
                })
            }catch{
                try await Auth.auth().currentUser?.delete()
                await setError(error)
            }
        }
        
        @Sendable func setError(_ error: Error)async{
            await MainActor.run(body: {
                errorMessage = error.localizedDescription
                showError.toggle()
                isLoading = false
            })
        }
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

extension User {
    var asDictionary: [String: Any] {
        return [
            "username": self.username,
            "userBio": self.userBio,
            "userBioLink": self.userBioLink,
            "userUID": self.userUID,
            "userEmail": self.userEmail,
            "userProfileURL": self.userProfileURL ?? ""
            // Add other properties as needed
        ]
    }
}
