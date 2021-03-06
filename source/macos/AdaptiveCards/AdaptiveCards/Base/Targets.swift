import AdaptiveCards_bridge
import AppKit

class ActionOpenURLTarget: NSObject, TargetHandler {
    weak var delegate: TargetHandlerDelegate?
    let url: String
    
    init(element: ACSOpenUrlAction, delegate: TargetHandlerDelegate) {
        self.url = element.getUrl() ?? ""
        self.delegate = delegate
    }
    
    func configureAction(for button: NSButton) {
        button.target = self
        button.action = #selector(handleButtonAction(_:))
    }
    
    func handleSelectionAction(for actionView: NSView) {
        delegate?.handleOpenURLAction(actionView: actionView, urlString: url)
    }
    
    @objc private func handleButtonAction(_ sender: NSButton) {
        delegate?.handleOpenURLAction(actionView: sender, urlString: url)
    }
}
    
class ActionSubmitTarget: NSObject, TargetHandler {
    weak var delegate: TargetHandlerDelegate?
    let dataJson: String?
    
    init(element: ACSSubmitAction, delegate: TargetHandlerDelegate) {
        self.delegate = delegate
        self.dataJson = element.getDataJson()
    }
    
    func configureAction(for button: NSButton) {
        button.target = self
        button.action = #selector(handleButtonAction(_:))
    }
    
    func handleSelectionAction(for actionView: NSView) {
        delegate?.handleSubmitAction(actionView: actionView, dataJson: self.dataJson)
    }
    
    @objc private func handleButtonAction(_ sender: NSButton) {
        delegate?.handleSubmitAction(actionView: sender, dataJson: self.dataJson)
    }
}

class ActionShowCardTarget: NSObject, TargetHandler {
    weak var delegate: TargetHandlerDelegate?
    let showCard: ACSAdaptiveCard

    init(element: ACSAdaptiveCard, delegate: TargetHandlerDelegate) {
        self.showCard = element
        self.delegate = delegate
    }
    
    func configureAction(for button: NSButton) {
        button.target = self
        button.action = #selector(handleButtonAction(_:))
    }
    
    func handleSelectionAction(for actionView: NSView) { }
    
    @objc private func handleButtonAction(_ sender: NSButton) {
        delegate?.handleShowCardAction(button: sender, showCard: showCard)
    }
}
