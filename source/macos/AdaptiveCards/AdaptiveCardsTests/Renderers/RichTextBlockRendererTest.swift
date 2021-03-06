@testable import AdaptiveCards
import AdaptiveCards_bridge
import XCTest

class RichTextBlockRendererTests: XCTestCase {
    private var hostConfig: FakeHostConfig!
    private var richTextBlock: FakeRichTextBlock!
    private var richTextBlockRenderer: RichTextBlockRenderer!
    private let sampleText = "Hello world!"
    
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        hostConfig = .make()
        richTextBlock = FakeRichTextBlock.make()
        richTextBlockRenderer = RichTextBlockRenderer()
    }
    
    func testRendererSetsText() {
        let textRun = FakeTextRun.make(text: sampleText)
        
        richTextBlock = .make(textRun: textRun)
        
        let textView = renderTextView()
        XCTAssertEqual(textView.string, sampleText)
    }
    
    func testRendererRightAlignsText() {
        let textRun = FakeTextRun.make(text: sampleText)
        
        richTextBlock = .make(textRun: textRun, horizontalAlignment: ACSHorizontalAlignment.right)
        
        let textView = renderTextView()
        XCTAssertEqual(textView.alignment, NSTextAlignment.right)
    }
    
    func testRendererCenterAlignsText() {
        let textRun = FakeTextRun.make(text: sampleText)
        
        richTextBlock = .make(textRun: textRun, horizontalAlignment: ACSHorizontalAlignment.center)
        
        let textView = renderTextView()
        XCTAssertEqual(textView.alignment, NSTextAlignment.center)
    }
    
    func testRendererDefaultTextColorAlpha() {
        let textRun = FakeTextRun.make(text: sampleText, textColor: ACSForegroundColor.default)

        richTextBlock = .make(textRun: textRun)

        let textView = renderTextView()
        XCTAssertEqual(textView.textColor, NSColor.init(red: 0, green: 0, blue: 0, alpha: 1))
    }
    
    func testRendererSetsUnderline() {
        let textRun = FakeTextRun.make(text: sampleText, underline: true)

        richTextBlock = .make(textRun: textRun)
        let textView = renderTextView()
        
        XCTAssert(isStringAttributePresent(attrString: textView.attributedString(), attr: .underlineStyle))
    }
    
    func testRendererSetsStrikethrough() {
        let textRun = FakeTextRun.make(text: sampleText, strikethrough: true)

        richTextBlock = .make(textRun: textRun)
        let textView = renderTextView()
        
        XCTAssert(isStringAttributePresent(attrString: textView.attributedString(), attr: .strikethroughStyle))
    }
    
    private func isStringAttributePresent(attrString: NSAttributedString, attr: NSAttributedString.Key) -> Bool {
        var isUnderlined: Bool = false
        attrString.enumerateAttributes(in: NSRange(location: 0, length: attrString.length), options: []) { (dict, range, value) in
            if dict.keys.contains(attr) {
                isUnderlined = true
            }
        }
        return isUnderlined
    }
    

    private func renderTextView() -> ACRTextView {
        let view = richTextBlockRenderer.render(element: richTextBlock, with: hostConfig, style: .default, rootView: FakeRootView(), parentView: NSView(), inputs: [])
        
        XCTAssertTrue(view is ACRTextView)
        guard let textView = view as? ACRTextView else { fatalError() }
        return textView
    }
}
