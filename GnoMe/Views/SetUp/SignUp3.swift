//
//  SignUp3.swift
//  GnoMe
//
//  Created by gnome on 3/12/23.
//

import SwiftUI

struct SignUp3: View {
    @State var image = UIImage()
    @State private var showSheet = false
    @State private var bio = ""
    @EnvironmentObject var userData: UserData
    
    var vc = ViewController()
    
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
                
                Text("Profile Picture: ")
                    .position(x:-40,y:30)
                    .fixedSize()
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
                        .position(x:105, y:105)
                    
                    Button("Change photo") {
                        self.showSheet = true
                    }
                        .frame(width:150, height: 50)
                        .background(Color("beige"))
                        .cornerRadius(40)
                        .foregroundColor(.blue)
                        .position(x:90, y:100)
                }
                .sheet(isPresented: $showSheet){
                    ImagePicker(image: self.$image)
                }
                
                VStack{
                    Text("One thing I want people to Gno about me is ...")
                        .position(x:200, y:-40)
                    
                    TextField("Bio", text: self.$bio.max(200))
                        .padding(.all)
                        .background(Color(.white))
                        .frame(width: 350)
                        .cornerRadius(20)
                        .position(x:195, y:-130)
                        .foregroundColor(.black)
                    //error - make this longer downwards
                    
                }
                
                NavigationLink(destination: UserProfile()){
                    Text("Finish")
                        .frame(minWidth: 0,maxWidth: 100)
                        .padding()
                        .foregroundColor(.blue)
                        .background(Color("beige"))
                        .cornerRadius(40)
                        .onTapGesture {
                            userData.user1.pfp = image
                            userData.user1.Bio = bio
                        }
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

class ViewController: UIViewController{
    
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapButton(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")]as? UIImage{
            imageView.image = image
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                parent.image = image
            }

            parent.presentationMode.wrappedValue.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }
}


struct SignUp3_Previews: PreviewProvider {
    static var previews: some View {
        SignUp3()
    }
}
