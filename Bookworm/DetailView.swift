//
//  DetailView.swift
//  Bookworm
//
//  Created by Damien Chailloleau on 16/12/2023.
//

import SwiftData
import SwiftUI

struct DetailView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var showingDeleteAlert: Bool = false
    
    let book: Book
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre.uppercased())
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.black)
                    .background(.white)
                    .clipShape(.rect(cornerRadius: 10))
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)
            
            Text(book.review)
                .font(.headline)
                .padding()
            
            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
            
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete this book", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive) { deleteBook() }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure ?")
        }
        .scrollBounceBehavior(.basedOnSize)
        .toolbar {
            Button("Delete this book", systemImage: "trash") {
                showingDeleteAlert = true
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Inferno", author: "Dan Brown", genre: "Thriller", review: "The last book of Dan Brown has been retranscribed as a movie", rating: 5)
        
        return DetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}

// MARK: Functions
extension DetailView {
    
    func deleteBook() {
        modelContext.delete(book)
        dismiss()
    }
    
}
