# BindBackstop [![Build](https://github.com/fcanas/BindBackstop/actions/workflows/swift.yml/badge.svg?branch=canon)](https://github.com/fcanas/BindBackstop/actions/workflows/swift.yml)

For SwiftUI's Bindings, make a non-optional Binding from an optional one, given a default value.

This is all the code. It's only published here because I've reinvented this too many times.

```swift
extension Binding {
    init(_ source: Binding<Value?>, _ defaultValue: Value) {
        self.init(get: { () -> Value in
            return source.wrappedValue ?? defaultValue
        }) { (value) in
            source.wrappedValue = value
        }
    }
}

extension Binding {
    func with<T>(default v: T) -> Binding<T> where Value == T? {
        return Binding<T>(self, v)
    }
}
```

## License

BindBackstop is available under the [MIT license](LICENSE).
