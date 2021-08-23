import AdaptiveCards_bridge
import AppKit

public protocol AdaptiveCardActionDelegate: AnyObject {
    func adaptiveCard(_ adaptiveCard: NSView, didSelectOpenURL urlString: String, actionView: NSView)
    func adaptiveCard(_ adaptiveCard: NSView, didSubmitUserResponses dict: [String: Any], actionView: NSView)
    func adaptiveCard(_ adaptiveCard: NSView, didShowCardWith actionView: NSView, previousHeight: CGFloat, newHeight: CGFloat)
    func adaptiveCard(_ adaptiveCard: NSView, didUpdateBoundsFrom oldValue: NSRect, to newValue: NSRect)
}

public protocol AdaptiveCardResourceResolver: AnyObject {
    func adaptiveCard(_ adaptiveCard: ImageResourceHandlerView, dimensionsForImageWith url: String) -> NSSize?
    func adaptiveCard(_ adaptiveCard: ImageResourceHandlerView, requestImageFor url: String)
    func adaptiveCard(_ adaptiveCard: NSView, attributedStringFor htmlString: String) -> NSAttributedString?
}

enum HostConfigParseError: Error {
    case resultIsNil, configIsNil
}

open class AdaptiveCard {
    public static func from(jsonString: String) -> ACSParseResult {
        return BridgeConverter.parseAdaptiveCard(fromJSON: jsonString)
    }
    
    public static func parseHostConfig(from jsonString: String) -> Result<ACSHostConfig, Error> {
        guard let result = BridgeConverter.parseHostConfig(fromJSON: jsonString) else {
            return .failure(HostConfigParseError.resultIsNil)
        }
        guard result.isValid, let hostConfig = result.config else {
            return .failure(result.error ?? HostConfigParseError.configIsNil)
        }
        return .success(hostConfig)
    }
    
    public static func render(card: ACSAdaptiveCard, with hostConfig: ACSHostConfig, width: CGFloat, actionDelegate: AdaptiveCardActionDelegate?, resourceResolver: AdaptiveCardResourceResolver?, config: RenderConfig = .default) -> NSView {
        return AdaptiveCardRenderer.shared.renderAdaptiveCard(card, with: hostConfig, width: width, config: config, actionDelegate: actionDelegate, resourceResolver: resourceResolver)
    }
}

public struct RenderConfig {
    public static let `default` = RenderConfig(isDarkMode: false, buttonConfig: .default, supportsSchemeV1_3: false, hyperlinkColorConfig: .default)
    let isDarkMode: Bool
    let buttonConfig: ButtonConfig
    // swiftlint:disable identifier_name
    let supportsSchemeV1_3: Bool
    let hyperlinkColorConfig: HyperlinkColorConfig
    
    public init(isDarkMode: Bool, buttonConfig: ButtonConfig, supportsSchemeV1_3: Bool, hyperlinkColorConfig: HyperlinkColorConfig) {
        self.isDarkMode = isDarkMode
        self.buttonConfig = buttonConfig
		self.supportsSchemeV1_3 = supportsSchemeV1_3
        self.hyperlinkColorConfig = hyperlinkColorConfig
    }
}

public struct ButtonColorConfig {
    // buttonColor
    let buttonColor: NSColor
    let selectedButtonColor: NSColor
    let hoverButtonColor: NSColor
    
    // textColor
    let textColor: NSColor
    let selectedTextColor: NSColor
    
    // borderColor
    let borderColor: NSColor
    let selectedBorderColor: NSColor
        
    public init(buttonColor: NSColor, selectedButtonColor: NSColor, hoverButtonColor: NSColor, textColor: NSColor, selectedTextColor: NSColor, borderColor: NSColor, selectedBorderColor: NSColor) {
        self.buttonColor = buttonColor
        self.selectedButtonColor = selectedButtonColor
        self.hoverButtonColor = hoverButtonColor
        self.textColor = textColor
        self.selectedTextColor = selectedTextColor
        self.borderColor = borderColor
        self.selectedBorderColor = selectedBorderColor
    }
}

public struct ButtonConfig {
    public static let `default` = ButtonConfig(positive: .init(buttonColor: .green, selectedButtonColor: .systemGreen, hoverButtonColor: .systemGreen, textColor: .white, selectedTextColor: .white, borderColor: .green, selectedBorderColor: .systemGreen), destructive: .init(buttonColor: .systemRed, selectedButtonColor: .red, hoverButtonColor: .red, textColor: .white, selectedTextColor: .white, borderColor: .systemRed, selectedBorderColor: .red), default: .init(buttonColor: .systemBlue, selectedButtonColor: .blue, hoverButtonColor: .blue, textColor: .white, selectedTextColor: .white, borderColor: .systemBlue, selectedBorderColor: .blue), inline: .init(buttonColor: .clear, selectedButtonColor: .gray, hoverButtonColor: .darkGray, textColor: .black, selectedTextColor: .black, borderColor: .clear, selectedBorderColor: .clear))
    
    let positive: ButtonColorConfig
    let destructive: ButtonColorConfig
    let `default`: ButtonColorConfig
    let inline: ButtonColorConfig
    
    public init(positive: ButtonColorConfig, destructive: ButtonColorConfig, default: ButtonColorConfig, inline: ButtonColorConfig) {
        self.positive = positive
        self.destructive = destructive
        self.default = `default`
        self.inline = inline
    }
}

public struct HyperlinkColorConfig {
    public static let `default` = HyperlinkColorConfig(foregroundColor: .systemBlue, isUnderlined: false, underlineColor: .blue, underlineStyle: .single)
    
    let foregroundColor: NSColor
    let isUnderlined: Bool
    let underlineColor: NSColor
    let underlineStyle: NSUnderlineStyle
    
    public init(foregroundColor: NSColor, isUnderlined: Bool, underlineColor: NSColor, underlineStyle: NSUnderlineStyle) {
        self.foregroundColor = foregroundColor
        self.isUnderlined = isUnderlined
        self.underlineColor = isUnderlined ? underlineColor : .clear
        self.underlineStyle = underlineStyle
    }
}
public struct ChoiceSetButtonConfig {
    public static let `default` = ChoiceSetButtonConfig(checkOnIcon: BundleUtils.getImage("checkOn", ofType: "png"),
                                                        checkOffIcon: BundleUtils.getImage("checkOff", ofType: "png"),
                                                        checkOnHoverIcon: BundleUtils.getImage("checkHoverOn", ofType: "png"),
                                                        checkOffHoverIcon: BundleUtils.getImage("checkHoverOff", ofType: "png"),
                                                        radioOnIcon: BundleUtils.getImage("radioOn", ofType: "png"),
                                                        radioOffIcon: BundleUtils.getImage("radioOff", ofType: "png"),
                                                        radioOnHoverIcon: BundleUtils.getImage("radioHoverOn", ofType: "png"),
                                                        radioOffHoverIcon: BundleUtils.getImage("radioHoverOff", ofType: "png"))
    
    let checkOnIcon: NSImage?
    let checkOffIcon: NSImage?
    let checkOnHoverIcon: NSImage?
    let checkOffHoverIcon: NSImage?
    let radioOnIcon: NSImage?
    let radioOffIcon: NSImage?
    let radioOnHoverIcon: NSImage?
    let radioOffHoverIcon: NSImage?
    
    public init(checkOnIcon: NSImage?, checkOffIcon: NSImage?, checkOnHoverIcon: NSImage?, checkOffHoverIcon: NSImage?, radioOnIcon: NSImage?, radioOffIcon: NSImage?, radioOnHoverIcon: NSImage?, radioOffHoverIcon: NSImage?) {
        self.checkOnIcon = checkOnIcon
        self.checkOffIcon = checkOffIcon
        self.checkOnHoverIcon = checkOnHoverIcon
        self.checkOffHoverIcon = checkOffHoverIcon
        self.radioOnIcon = radioOnIcon
        self.radioOffIcon = radioOffIcon
        self.radioOnHoverIcon = radioOnHoverIcon
        self.radioOffHoverIcon = radioOffHoverIcon
    }
}
