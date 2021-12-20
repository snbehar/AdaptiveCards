import AdaptiveCards_bridge
import AppKit

protocol ACRTextFieldDelegate: AnyObject {
    func acrTextFieldDidSelectClear(_ textField: ACRTextField)
}

class ACRTextField: NSTextField {
    private enum Mode {
        case text
        case dateTime
        case number
    }
    
    weak var textFieldDelegate: ACRTextFieldDelegate?
    weak var errorMessageHandler: ErrorMessageHandlerDelegate?
    private let config: RenderConfig
    private let inputConfig: InputFieldConfig
    private let isDarkMode: Bool
    private let textFieldMode: Mode
    var lastKnownCursorPosition: Int?
    var inputValidator = ACRInputTextValidator()
    var textFieldShowsError: Bool {
        return layer?.borderColor == inputConfig.errorMessageConfig.borderColor?.cgColor || layer?.backgroundColor == inputConfig.errorMessageConfig.backgroundColor?.cgColor
    }
    var hasMouseInField: Bool = false
    var isValid: Bool {
        return inputValidator.getIsValid(for: stringValue)
    }
    
    init(dateTimeFieldWith config: RenderConfig) {
        self.config = config
        self.inputConfig = config.inputFieldConfig
        textFieldMode = .dateTime
        isDarkMode = config.isDarkMode
        super.init(frame: .zero)
        initialise()
        setupConstraints()
    }
    
    init(config: RenderConfig) {
        self.config = config
        self.inputConfig = config.inputFieldConfig
        textFieldMode = .text
        self.isDarkMode = config.isDarkMode
        super.init(frame: .zero)
        initialise()
        setupConstraints()
    }
    
    init(numericFieldWith config: RenderConfig) {
        self.config = config
        self.inputConfig = config.inputFieldConfig
        textFieldMode = .number
        isDarkMode = config.isDarkMode
        super.init(frame: .zero)
        initialise()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initialise() {
        let customCell = VerticallyCenteredTextFieldCell()
        customCell.drawsBackground = true
        customCell.backgroundColor = .clear
        // 20 points extra padding for calendar/clock icons
        var leftPadding: CGFloat = 0
        if textFieldMode == .dateTime {
            // 20 is image width and 12 is the spacing after image to text
            leftPadding += 32
            if inputConfig.clearButtonImage == nil {
                // Implies old date field, so clear button hugs edge
                leftPadding -= 12
            }
        } else {
            leftPadding += inputConfig.leftPadding
        }
        customCell.setupSpacing(rightPadding: inputConfig.rightPadding, leftPadding: leftPadding, yPadding: inputConfig.yPadding, focusRingCornerRadius: inputConfig.focusRingCornerRadius, wantsClearButton: wantsClearButton, isNumericField: textFieldMode == .number)
        cell = customCell
        font = inputConfig.font
        if wantsClearButton {
            addSubview(clearButton)
            clearButton.isHidden = true
        }
        // Add inintial backgound color to text box
        wantsLayer = true
        layer?.backgroundColor = inputConfig.backgroundColor.cgColor
        layer?.borderWidth = inputConfig.borderWidth
        setupColors(hasFocus: false)
        setupTrackingArea()
    }
    
    private func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: inputConfig.height).isActive = true
        if wantsClearButton {
            clearButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inputConfig.rightPadding).isActive = true
            clearButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        }
    }
    
    private (set) lazy var clearButton: NSButtonWithImageSpacing = {
        let clearImage: NSImage?
        if inputConfig.clearButtonImage == nil, wantsClearButton {
            // displaying old clear button
            let resourceName = isDarkMode ? "clear_18_w" : "clear_18"
            clearImage = BundleUtils.getImage(resourceName, ofType: "png")
        } else {
            clearImage = inputConfig.clearButtonImage
        }
        let view = NSButtonWithImageSpacing(image: clearImage ?? NSImage(), target: self, action: #selector(handleClearAction))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.clear.cgColor
        view.isBordered = false
        view.setAccessibilityTitle(config.localisedStringConfig.clearButtonAccessibilityTitle)
        return view
    }()
    
    private var isEmpty: Bool {
        return stringValue.isEmpty && attributedStringValue.string.isEmpty
    }
    
    override var placeholderString: String? {
        get { return placeholderAttributedString?.string }
        set {
            let placeholderAttrString = NSAttributedString(string: newValue ?? "")
            let range = NSRange(location: 0, length: placeholderAttrString.length )
            let attributedString = NSMutableAttributedString(attributedString: placeholderAttrString)
            attributedString.addAttributes([.foregroundColor: inputConfig.placeholderTextColor, .font: inputConfig.font], range: range)
            placeholderAttributedString = attributedString
        }
    }
    
    @objc private func handleClearAction() {
        self.stringValue = ""
        textFieldDelegate?.acrTextFieldDidSelectClear(self)
        updateClearButton()
    }

    override func textDidChange(_ notification: Notification) {
        super.textDidChange(notification)
        updateLastKnownCursorPosition()
        updateClearButton()
    }
    
    override var attributedStringValue: NSAttributedString {
        didSet {
            updateClearButton()
        }
    }
    
    override var stringValue: String {
        didSet {
            updateClearButton()
        }
    }
    
    override var doubleValue: Double {
        didSet {
            updateClearButton()
        }
    }
    
    private func setupTrackingArea() {
        let trackingArea = NSTrackingArea(rect: bounds, options: [.activeAlways, .inVisibleRect, .mouseEnteredAndExited], owner: self, userInfo: nil)
        addTrackingArea(trackingArea)
    }
    
    override func mouseEntered(with event: NSEvent) {
        super.mouseEntered(with: event)
        if !textFieldShowsError {
            layer?.backgroundColor = inputConfig.highlightedColor.cgColor
        }
        hasMouseInField = true
    }
    
    override func mouseExited(with event: NSEvent) {
        super.mouseExited(with: event)
        if !textFieldShowsError {
            layer?.backgroundColor = inputConfig.backgroundColor.cgColor
        }
        hasMouseInField = false
    }
    
    override func textDidEndEditing(_ notification: Notification) {
        if !textFieldShowsError {
            setupColors(hasFocus: false)
        }
        return super.textDidEndEditing(notification)
    }
    
    override func drawFocusRingMask() {
        if !textFieldShowsError {
            setupColors(hasFocus: true)
        }
        super.drawFocusRingMask()
    }
    
    private func updateClearButton() {
        clearButton.isHidden = isEmpty
    }
    
    private var wantsClearButton: Bool {
        return inputConfig.wantsClearButton || (textFieldMode == .dateTime)
    }
    
    override func becomeFirstResponder() -> Bool {
        let textView = window?.fieldEditor(true, for: nil) as? NSTextView
        textView?.insertionPointColor = isDarkMode ? .white : .black
        return super.becomeFirstResponder()
    }
    
    override func accessibilityChildren() -> [Any]? {
        if wantsClearButton && !clearButton.isHidden {
            var temp = super.accessibilityChildren()
            temp?.append(clearButton)
            return temp
        }
        return super.accessibilityChildren()
    }
    
    private func updateLastKnownCursorPosition() {
        guard let selectedRange = currentEditor()?.selectedRange else {
            lastKnownCursorPosition = nil
            return
        }
        lastKnownCursorPosition = selectedRange.upperBound
    }
    
    func setupColors(hasFocus: Bool) {
        layer?.borderColor = hasFocus && textFieldMode != .dateTime ? config.inputFieldConfig.activeBorderColor.cgColor : config.inputFieldConfig.borderColor.cgColor
        layer?.backgroundColor = hasMouseInField ? inputConfig.highlightedColor.cgColor : inputConfig.backgroundColor.cgColor
    }
    
    func setupErrorColors() {
        guard let borderColor = inputConfig.errorMessageConfig.borderColor, let backgroundColor = inputConfig.errorMessageConfig.backgroundColor else { return }
        layer?.borderColor = borderColor.cgColor
        layer?.backgroundColor = backgroundColor.cgColor
    }
}

 class VerticallyCenteredTextFieldCell: NSTextFieldCell {
    private var rightPadding: CGFloat = 0
    private var leftPadding: CGFloat = 0
    private var yPadding: CGFloat = 0
    private var focusRingCornerRadius: CGFloat = 0
    private var wantsClearButton = false
    private var isNumericField = false

    func setupSpacing(rightPadding: CGFloat = 0, leftPadding: CGFloat = 0, yPadding: CGFloat = 0, focusRingCornerRadius: CGFloat = 0, wantsClearButton: Bool, isNumericField: Bool) {
        self.leftPadding = leftPadding
        self.rightPadding = rightPadding
        self.yPadding = yPadding
        self.focusRingCornerRadius = focusRingCornerRadius
        self.wantsClearButton = wantsClearButton
        self.isNumericField = isNumericField
    }

    override func titleRect(forBounds rect: NSRect) -> NSRect {
        var titleRect = super.titleRect(forBounds: rect)

        let minimumHeight = self.cellSize(forBounds: rect).height
        // Subtract yPadding to remove offset due to to font baseline
        titleRect.origin.y += (titleRect.height - minimumHeight) / 2 - yPadding
        titleRect.size.height = minimumHeight
        titleRect.origin.x += leftPadding
        // 16px is the image size(clear button)
        titleRect.size.width -= rightPadding + leftPadding + (wantsClearButton ? 16 : 0)
        return titleRect
    }

    override func drawInterior(withFrame cellFrame: NSRect, in controlView: NSView) {
        controlView.layer?.cornerRadius = focusRingCornerRadius
        super.drawInterior(withFrame: titleRect(forBounds: cellFrame), in: controlView)
    }

    override func select(withFrame rect: NSRect, in controlView: NSView, editor textObj: NSText, delegate: Any?, start selStart: Int, length selLength: Int) {
        controlView.layer?.cornerRadius = focusRingCornerRadius
        super.select(withFrame: titleRect(forBounds: rect), in: controlView, editor: textObj, delegate: delegate, start: selStart, length: selLength)
    }
    
    override func drawFocusRingMask(withFrame cellFrame: NSRect, in controlView: NSView) {
        let path = NSBezierPath()
        if isNumericField {
            path.move( to: CGPoint(x: cellFrame.midX, y: cellFrame.minY ))
            path.line(to: CGPoint(x: cellFrame.maxX, y: cellFrame.minY ))
            path.line(to: CGPoint(x: cellFrame.maxX, y: cellFrame.maxY ))
            path.line(to: CGPoint(x: cellFrame.minX + focusRingCornerRadius, y: cellFrame.maxY ))
            path.curve(to: CGPoint(x: cellFrame.minX, y: cellFrame.maxY - focusRingCornerRadius ), controlPoint1: CGPoint(x: cellFrame.minX + focusRingCornerRadius, y: cellFrame.maxY ), controlPoint2: CGPoint(x: cellFrame.minX, y: cellFrame.maxY ))
            path.line(to: CGPoint(x: cellFrame.minX, y: cellFrame.minY + focusRingCornerRadius))
            path.curve(to: CGPoint(x: cellFrame.minX + focusRingCornerRadius, y: cellFrame.minY), controlPoint1: CGPoint(x: cellFrame.minX, y: cellFrame.minY + focusRingCornerRadius), controlPoint2: CGPoint(x: cellFrame.minX, y: cellFrame.minY ))
            path.line(to: CGPoint(x: cellFrame.midX, y: cellFrame.minY ))
        } else {
            path.appendRoundedRect(cellFrame, xRadius: focusRingCornerRadius, yRadius: focusRingCornerRadius)
        }
        path.fill()
    }
 }
