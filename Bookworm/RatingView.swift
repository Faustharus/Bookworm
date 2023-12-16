//
//  RatingView.swift
//  Bookworm
//
//  Created by Damien Chailloleau on 16/12/2023.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label: String = ""
    var maximumRating: Int = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1 ..< maximumRating + 1, id: \.self) { num in
                Button {
                    rating = num
                } label: {
                    image(for: num)
                        .foregroundStyle(num > rating ? offColor : onColor)
                }
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    RatingView(rating: .constant(4))
}

extension RatingView {
    
    func image(for number: Int) -> Image {
        if number > rating {
            offImage ?? onImage
        } else {
            onImage
        }
    }
    
}
