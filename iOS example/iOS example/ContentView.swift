//
//  ContentView.swift
//  PopoverPresenterDemo
//
//  Created by Alexander Kraev on 27.01.2022.
//

import SwiftUI
import PopoverPresenter

struct ContentView: View {
    @StateObject var popoverPresenter = PopoverPresenter()
    @StateObject var viewModel = ViewModel()
    var body: some View {
        TabView {
            ListView(viewModel: viewModel)
                .tabItem {
                    Label("List", systemImage: "list.dash")
                }
            
            SecondTabView()
                .tabItem {
                    Label("Button", systemImage: "text.bubble")
                }
        }
        .environment(\.popoverPresenterKey, popoverPresenter)
        .customPopover(item: $popoverPresenter.activePopover) { popover in
            switch popover {
            default:
                popoverPresenter.currentPopover
            }
        }
        .ignoresSafeArea()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
