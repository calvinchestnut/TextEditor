import SwiftUI
import UIKit

@available(iOS 13.0, *)
public struct TextEditor: View {
    @Binding public var text: String
    
    public var body: some View {
        TextField_UI(text: $text)
    }
}

@available(iOS 13.0, *)
extension Font.TextStyle {
    static var allValues: [Font.TextStyle: Font] {
        return [
            .largeTitle: .largeTitle,
            .title: .title,
            .headline: .headline,
            .subheadline: .subheadline,
            .body: .body,
            .callout: .callout,
            .footnote: .footnote,
            .caption: .caption
        ]
    }
    var style_ui: UIFont.TextStyle {
        switch self {
        case .largeTitle: return .largeTitle
        case .title: return .title1
        case .headline: return .headline
        case .subheadline: return .subheadline
        case .callout: return .callout
        case .footnote: return .footnote
        case .caption: return .caption1
        default: return .body
        }
    }
}
@available(iOS 13.0, *)
extension Font {
    var font_ui: UIFont {
        return UIFont.preferredFont(forTextStyle: assertStyle().style_ui)
    }
    private func assertStyle(_ fallback: TextStyle = .body) -> TextStyle {
        guard let key = TextStyle.allValues.filter({ self == $0.value }).map({ $0.key }).first else { return fallback }
        return key
    }
}

@available(iOS 13.0, *)
struct TextField_UI : UIViewRepresentable {
    typealias UIViewType = UITextView
    
    @Binding var text: String
    @State var font: Font = .body
    var onEditingChanged: ((String) -> Void)?
    var onCommit: (() -> Void)?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.backgroundColor = nil
        textView.text = text
        if let font = context.environment.font {
            textView.font = font.font_ui
        } else {
            textView.font = .preferredFont(forTextStyle: .body)
        }
        textView.textContainerInset = .zero
        
        textView.delegate = context.coordinator
        
        return textView
    }
    
    func updateUIView(_ textView: UITextView, context: Context) {
        if let font = context.environment.font, font.font_ui != textView.font {
            textView.font = font.font_ui
        }
        textView.text = text
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var field: TextField_UI
        
        init(_ field: TextField_UI) {
            self.field = field
        }
        
        func textViewDidChange(_ textView: UITextView) {
            print(textView.text ?? "Nil")
        }
    }
}

#if DEBUG
@available(iOS 13.0, *)
struct TextEditor_Previews : PreviewProvider {
    static var previews: some View {
        TextEditor(text: .constant("Hello TextField"))
            .font(.largeTitle)
    }
}
#endif
