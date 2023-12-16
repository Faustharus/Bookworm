//
//  DetailView.swift
//  Bookworm
//
//  Created by Damien Chailloleau on 16/12/2023.
//

import SwiftUI

struct DetailView: View {
    let book: Book
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    DetailView(book: Book(title: "Inferno", author: "Dan Brown", genre: "Thriller", review: "The last book of Dan Brown has been retranscribed as a movie", rating: 5))
}
