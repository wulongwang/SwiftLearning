//
//  PostList.swift
//  DesignCode
//
//  Created by Meng To on 2020-01-31.
//  Copyright © 2020 Meng To. All rights reserved.
//

import SwiftUI

struct PostList: View {
    @State var posts: [Post] = []
    
    var body: some View {
        List(posts) { post in
            Text(post.title)
        }
        .onAppear {
            Api().getPosts { (posts) in
                self.posts = posts
            }
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
