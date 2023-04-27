//
//  ReusablePostsView.swift
//  GnoME
//
//  Created by cashamirica on 4/25/23.
//

import SwiftUI
import Firebase

struct ReusablePostsView: View {
    @Binding var posts: [Post]
    @State var isFetching: Bool = true
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            LazyVStack{
                if isFetching{
                    ProgressView()
                        .padding(.top, 30)
                } else{
                    if posts.isEmpty{
                        //no posts
                        Text("No Post's Found")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.top, 30)
                    }else{
                        //post display
                        Posts()
                    }
                }
            }
            .padding(15)
        }
        .refreshable {
            //scroll to refresh
            isFetching = true
            posts = []
            await fetchPosts()
        }
        .task{
            //fetching for one time
            guard posts.isEmpty else {return}
            await fetchPosts()
        }
    }
    
    //display fetched posts
    @ViewBuilder
    func Posts()->some View{
        ForEach(posts){post in
            PostCardView(post: post) { updatedPost in
                //updating post in the array
                if let index = posts.firstIndex(where: { post in
                    post.id == updatedPost.id
                }){
                    posts[index].likedIDs = updatedPost.likedIDs
                    posts[index].dislikedIDs = updatedPost.dislikedIDs
                }
            } onDelete: {
                //removing post from array
                withAnimation(.easeInOut(duration: 0.25)){
                    posts.removeAll{post.id == $0.id}
                }
            }
            
            Divider()
                .padding(.horizontal, -15)
        }
    }
    
    //fetch post
    func fetchPosts()async{
        do{
            var query: Query!
            query = Firestore.firestore().collection("Posts")
                .order(by: "publishedDate", descending: true)
                .limit(to: 20)
            let docs = try await query.getDocuments()
            let fetchedPosts = docs.documents.compactMap { doc -> Post? in
                try? doc.data(as: Post.self)
            }
            await MainActor.run(body: {
                posts = fetchedPosts
                isFetching = false
            })
        }catch{
            print(error.localizedDescription)
        }
    }
}

struct ReusablePostsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
