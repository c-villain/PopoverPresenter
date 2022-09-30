//
//  CustomPopover.swift
//
//
//  Created by Alexander Kraev on 29.01.2022.
//

import SwiftUI

struct CustomPopover<Item, PopoverContent>: ViewModifier where Item : Identifiable, PopoverContent: View {
    
    var item: Binding<Item?>
    let onDismiss: (() -> Void)?
    let popoverContent: PopoverContent
    @State var isAlertPresented = false
    
    init(item: Binding<Item?>, onDismiss: (() -> Void)? = nil, @ViewBuilder popoverContent: (Item?) -> PopoverContent) {
        self.item = item
        self.onDismiss = onDismiss
        self.popoverContent = popoverContent(item.wrappedValue)
    }
    
    public func body(content: Content) -> some View {
        let isPopoverPresented = item.wrappedValue != nil
        return ZStack {
            content
                .layoutPriority(1)
                .blur(radius: isPopoverPresented ? 10 : 0)
                .clipped()
                .allowsHitTesting(!isPopoverPresented)
                .zIndex(0)
            if isPopoverPresented {
                /*
                 clear background
                 for closing alert
                 */
                Color.clear
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation {
                            item.wrappedValue = nil
                        }
                    }
                    .zIndex(1)
                
                popoverContent
                    .transition(.asymmetric(insertion: .scale, removal: .move(edge: .bottom)))
                    .clipped()
                    .onDisappear {
                        onDismiss?()
                    }
                    .zIndex(2)
            }
        }
    }
}

public extension View {
    func customPopover<Item, Content>(item: Binding<Item?>,
                                      onDismiss: (() -> Void)? = nil,
                                      @ViewBuilder content: @escaping (Item?) -> Content) -> some View where Item : Identifiable,  Content : View {
        modifier(CustomPopover(item: item, onDismiss: onDismiss, popoverContent: content))
    }
}
