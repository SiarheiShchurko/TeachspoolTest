
import UIKit

final class TemplateButton: UIButton {
    
    convenience init(text: String = "",
                     fillColor: UIColor = .orange,
                     tintColor: UIColor = .white,
                     font: UIFont = .systemFont(ofSize: 15),
                     cornerRadius: CGFloat = 0.0,
                     isEnabled: Bool = true) {
        self.init(type: .system)

        configure(with: text, and: fillColor, and: tintColor, and: font, and: cornerRadius, and: isEnabled)
    }
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                layer.opacity = 1
            } else {
                layer.opacity = 0.7
            }
        }
    }
}

// MARK: - Private extension
private extension TemplateButton {
    func configure(with text: String, and fillColor: UIColor, and tintColor: UIColor, and font: UIFont, and cornerRadius: CGFloat, and isEnable: Bool) {
        isEnabled = isEnable
        backgroundColor = fillColor
        setTitle(text, for: .normal)
        titleLabel?.font = font
        setTitleColor(tintColor, for: .normal)
        setTitleColor(tintColor.withAlphaComponent(0.5), for: .disabled)
        layer.cornerRadius = cornerRadius
        translatesAutoresizingMaskIntoConstraints = false
    }
}
