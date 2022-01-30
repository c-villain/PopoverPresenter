//
//  SecondTabView.swift
//  PopoverPresenterDemo
//
//  Created by Alexander Kraev on 29.01.2022.
//

import SwiftUI

struct SecondTabView: View {
    @Environment(\.popoverPresenterKey) var popoverPresenter
    var body: some View {
        Button {
            withAnimation {
                popoverPresenter.currentPopover = AnyView(Text("This is alert!"))
                popoverPresenter.activePopover = .any
            }
        } label: {
            Text("Open popover")
        }
    }
}
