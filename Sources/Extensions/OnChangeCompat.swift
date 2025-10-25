import SwiftUI

public extension View {
    @available(iOS, deprecated: 17.0, message: "Use `onChange(of:initial:_:)` instead.")
    @ViewBuilder
    func onChangeCompat<V>(
        for value: V,
        _ action: @escaping (_ previous: V, _ current: V) -> Void
    ) -> some View where V: Equatable {
        if #available(iOS 17, *) {
            onChange(of: value, action)
        } else {
            onChange(of: value) { [value] newValue in
                action(value, newValue)
            }
        }
    }
}   