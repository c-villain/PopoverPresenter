//
//  ListView.swift
//  PopoverPresenterDemo
//
//  Created by Alexander Kraev on 28.01.2022.
//

import SwiftUI

final class ViewModel: ObservableObject {
    @Published var models: [Model] = []
    
    init() {
        generate()
    }
    
    public func generate() {
        let emojiArray = ["👍🏻", "🤷🏼‍♂️", "🧐", "😃", "👨🏻‍💻"]
        
        for id in 0..<100 {
            models.append(.init(id: id, rating: Int.random(in: 0..<5), emoji: emojiArray.randomElement() ?? "😔"))
        }
    }
}

struct ListView: View {
    @Environment(\.popoverPresenterKey) var popoverPresenter
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.models) { model in
                    SampleRow(id: model.id, emoji: model.emoji, rating: model.rating)
                        .onTapGesture {
                            withAnimation {
                                popoverPresenter.currentPopover = AnyView(SampleRow(id: model.id, emoji: model.emoji, rating: model.rating))
                                
                                popoverPresenter.activePopover = .any
                            }
                        }
                        .frame(maxWidth: .infinity)
                }
            }
        }
    }
}
