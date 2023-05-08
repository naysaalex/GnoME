//
//  ReusablePostsView.swift
//  GnoME
//
//  Created by cashamirica on 4/25/23.
//

import SwiftUI
import Firebase

struct ReusablePostsView: View {
    var basedOnUID: Bool = false
    var uid: String = ""
    @Binding var posts: [Post]
    @State private var isFetching: Bool = true
    //pagination
    @State private var paginationDoc: QueryDocumentSnapshot?
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
            //disabling refresh for UID based post's
            guard basedOnUID else{return}
            isFetching = true
            posts = []
            //resetting pagination doc
            paginationDoc = nil
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
            .onAppear{
                //when last post appears, fetch new post(if there)
                if post.id == posts.last?.id && paginationDoc != nil{
                    Task{await fetchPosts()}
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
            //implementing pagination
            if let paginationDoc{
                query = Firestore.firestore().collection("Posts")
                    .order(by: "publishedDate", descending: true)
                    .start(afterDocument: paginationDoc)
                    .limit(to: 20)
            }else{
                query = Firestore.firestore().collection("Posts")
                    .order(by: "publishedDate", descending: true)
                    .limit(to: 20)
            }
            
            //new query for uid based document fetch
            //simplify fitler the post's which is not belongs to this UID
            if basedOnUID{
                query = query
                    .whereField("userUID", isEqualTo: uid)
            }
            
            let docs = try await query.getDocuments()
            let fetchedPosts = docs.documents.compactMap { doc -> Post? in
                try? doc.data(as: Post.self)
            }
            await MainActor.run(body: {
                posts.append(contentsOf: fetchedPosts)
                paginationDoc = docs.documents.last
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
