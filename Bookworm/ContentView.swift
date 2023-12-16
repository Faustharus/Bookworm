//
//  ContentView.swift
//  Bookworm
//
//  Created by Damien Chailloleau on 12/12/2023.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]
    
    @State private var isShowingAddScreen: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Book", systemImage: "plus") {
                        isShowingAddScreen.toggle()
                    }
                }
            }
            .navigationDestination(for: Book.self, destination: { book in
                // TODO: Book Detail View
            })
            .sheet(isPresented: $isShowingAddScreen) {
                AddBookView()
            }
        }
    }
}

#Preview {
    ContentView()
}
