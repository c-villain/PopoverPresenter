# PopoverPresenter

[![Latest release](https://img.shields.io/github/v/release/c-villain/PopoverPresenter?color=brightgreen&label=version)](https://github.com/c-villain/PopoverPresenter/releases/latest)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fc-villain%2FPopoverPresenter%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/c-villain/PopoverPresenter)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fc-villain%2FPopoverPresenter%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/c-villain/PopoverPresenter)
[![](https://img.shields.io/badge/SPM-supported-DE5C43.svg?color=brightgreen)](https://swift.org/package-manager/)
![](https://img.shields.io/github/license/c-villain/PopoverPresenter)

[![contact: @lexkraev](https://img.shields.io/badge/contact-%40lexkraev-blue.svg?style=flat)](https://t.me/lexkraev)
[![Telegram Group](https://img.shields.io/endpoint?color=brightgreen&url=https%3A%2F%2Ftg.sumanjay.workers.dev%2Fswiftui_dev)](https://telegram.dog/swiftui_dev)

👨🏻‍💻 Feel free to subscribe to channel **[SwiftUI dev](https://t.me/swiftui_dev)** in telegram.

Demo project with tutorial how to customize alerts or popovers in SwiftUI based on [this article](https://medium.com/@ihamadfuad/swiftui-present-sheet-from-anywhere-using-environment-6104b2bd7d4e).

Before starting highly recommended to read [SwiftUI Custom Environment Values](https://useyourloaf.com/blog/swiftui-custom-environment-values/).

<p align="center">
<img src="popover_demo.gif" alt="demo" height="600" width="280">
</p>

## Installation

To use PopoverPresenter with a project targeting iOS 13, simply copy folder `Source` into your project.

#### Swift Package Manager

To integrate PopoverPresenter into your project using SwiftPM add the following to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/c-villain/PopoverPresenter", from: "0.1.0"),
],
```

## Quick start

1. Import library to your root-file view:
```swift
import PopoverPresenter
```
2. Init instance in root view:
```swift
@StateObject var popoverPresenter = PopoverPresenter()
```
3. Add modifier to root-object view:
```swift
.environment(\.popoverPresenterKey, popoverPresenter)
.customPopover(item: $popoverPresenter.activePopover) { popover in
    switch popover {
    default:
        popoverPresenter.currentPopover
    }
}
```
4. In child view create link to environment key:
```swift
@Environment(\.popoverPresenterKey) var popoverPresenter
```
5. In child view create view with alert:
```swift
popoverPresenter.currentPopover = AnyView(Text("This is alert!"))
popoverPresenter.activePopover = .any
```

You may look iOS example in package for guide steps above.
