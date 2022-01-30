//
//  SampleRow.swift
//  PopoverPresenterDemo
//
//  Created by Alexander Kraev on 28.01.2022.
//

import SwiftUI

struct SampleRow: View {
    let id: Int
    let emoji: String
    let rating: Int
    
    var body: some View {
        VStack {
            Text("Row \(id)")
            Text("Random emoji: \(emoji)")
            RatingView(rating: rating)
        }
        .frame(height: 100)
        .padding()
    }
}

struct RatingView: View {
    var rating: Int
    var body: some View {
        HStack {
            ForEach(0..<5) { starIndex in
                StarImage(isFilled: rating > starIndex)
            }
        }
    }
}

struct StarImage: View {
    var isFilled: Bool
    
    var body: some View {
        Image(systemName: "star.fill").foregroundColor( isFilled ? .yellow : .gray)
    }
}
