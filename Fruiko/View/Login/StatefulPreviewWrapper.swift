import SwiftUI

struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State private var value: Value
    private let content: (Binding<Value>) -> Content
    
    init(_ initialValue: Value, @ViewBuilder content: @escaping (Binding<Value>) -> Content) {
        _value = State(initialValue: initialValue)
        self.content = content
    }
    
    var body: some View {
        content($value)
    }
}

#Preview {
    StatefulPreviewWrapper("") { text in
        if #available(iOS 17.0, *) {
            TextFieldPhoneNumber(text: text)
        } else {
            // Fallback on earlier versions
        }
    }
}
