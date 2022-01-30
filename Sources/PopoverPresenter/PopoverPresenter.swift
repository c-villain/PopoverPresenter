import SwiftUI

public struct PopoverPresenterKey: EnvironmentKey {

    public static let defaultValue = PopoverPresenter()
}

public extension EnvironmentValues {

    var popoverPresenterKey: PopoverPresenter {
        get { return self[PopoverPresenterKey.self] }
        set { self[PopoverPresenterKey.self] = newValue }
    }
}

public enum PopoverType: String, Identifiable {

    case any

    public var id: String {
        rawValue
    }
}

final public class PopoverPresenter: ObservableObject {
    
    public init() {}

    @Published public var isPopoverPresented = false
    @Published public var currentPopover: AnyView? = nil
    @Published public var activePopover: PopoverType? = nil {
        willSet {
            isPopoverPresented = newValue != nil
        }
    }
}
