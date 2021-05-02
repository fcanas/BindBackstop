import SwiftUI

public extension Binding {
    init(_ source: Binding<Value?>, _ defaultValue: Value) {
        self.init(get: { () -> Value in
            return source.wrappedValue ?? defaultValue
        }) { (value) in
            source.wrappedValue = value
        }
    }
}

public extension Binding {
    func with<T>(default v: T) -> Binding<T> where Value == T? {
        return Binding<T>(self, v)
    }
}
