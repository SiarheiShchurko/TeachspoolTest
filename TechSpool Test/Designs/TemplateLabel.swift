
import UIKit

final class TemplateLabel: UILabel {

    convenience init(text: String = "",
                     textColor: UIColor = .white,
                     font: UIFont = .systemFont(ofSize: 16),
                     textAlign: NSTextAlignment = .left,
                     autoresizingMask: Bool = false,
                     numberOfLines: Int = 0) {
        self.init()
        configure(text: text, textColor: textColor, font: font, textAlign: textAlign, autoresizingMask: autoresizingMask, numberOfLines: numberOfLines)
    }
}

// MARK: - Private extension
private extension TemplateLabel {
    func configure(text: String, textColor: UIColor, font: UIFont, textAlign: NSTextAlignment, autoresizingMask: Bool, numberOfLines: Int) {
        self.text = text
        self.textColor = textColor
        self.font = font
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlign
        self.translatesAutoresizingMaskIntoConstraints = autoresizingMask
    }
}
