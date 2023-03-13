//
//  SignUp3.swift
//  GnoMe
//
//  Created by cashamirica on 3/12/23.
//

import SwiftUI


struct SignUp3: View {
    @State private var image = UIImage()
    @State private var showSheet = false
    @State private var bio = ""
    
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
                
                Text("Profile Picture: ")
                    .position(x:70,y:-130)
                HStack{
                    Image(uiImage: self.image)
                        .resizable()
                        .cornerRadius(50)
                        .padding(.all, 4)
                        .frame(width:150, height:150)
                        .background(Color.black.opacity(0.2))
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .padding(8)
                        .position(x:95, y:-265)
                    
                    Text("Change photo")
                        .frame(width:150, height: 50)
                        .background(Color("beige"))
                        .cornerRadius(40)
                        .foregroundColor(.blue)
                        .position(x:80, y:-270)
                }
                
                VStack{
                    Text("One thing I want people to Gno about me is ...")
                        .position(x:195, y:-200)
                    
                    TextField("Bio", text: self.$bio.max(200))
                        .padding()

                    
                }
                
                NavigationLink(destination: UserProfile()){
                    Text("Finish")
                        .frame(minWidth: 0,maxWidth: 100)
                        .padding()
                        .foregroundColor(.blue)
                        .background(Color("beige"))
                        .cornerRadius(40)
                }
            }
            
        }
    }
}

extension Binding where Value == String {
    func max(_ limit: Int) -> Self{
        if self.wrappedValue.count > limit {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.dropLast())
            }
        }
        return self
    }
}

struct ImagePicker:UIViewControllerRepresentable{
    @Environment(\.presentationMode) private var presentationMode
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var selectedImage: UIImage
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
        
        var parent:ImagePicker
        
        init(_ parent: ImagePicker){
            self.parent = parent
        }
        
        func imagePickerController(_ picker:UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any])
        {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                parent.selectedImage = image
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct SignUp3_Previews: PreviewProvider {
    static var previews: some View {
        SignUp3()
    }
}
