import UIKit

final class TemplateImageView: UIImageView {
    
    convenience init(imageName: String,
                     contentMode: ContentMode,
                     autoresizingMask: Bool = false,
                     cornerRadius: CGFloat = 0.0,
                     clipToBounds: Bool = false) {
        self.init()
        configure(imageName: imageName, contentMode: contentMode ,autoresizingMask: autoresizingMask, clipToBounds: clipToBounds, cornerRadius: cornerRadius)
    }
    
    convenience init(image: UIImage,
                     contentMode: ContentMode,
                     autoresizingMask: Bool,
                     cornerRadius: CGFloat = 0.0,
                     clipToBounds: Bool = false) {
        self.init()
        configure(image: image, contentMode: contentMode ,autoresizingMask: autoresizingMask, clipToBounds: clipToBounds, cornerRadius: cornerRadius)
    }
}

// MARK: - Private extension
private extension TemplateImageView {
    func configure(imageName: String, contentMode: ContentMode, autoresizingMask: Bool, clipToBounds: Bool, cornerRadius: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = autoresizingMask
        self.contentMode = contentMode
        self.image = UIImage(named: imageName)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = clipToBounds
    }
    
    func configure(image: UIImage, contentMode: ContentMode, autoresizingMask: Bool, clipToBounds: Bool, cornerRadius: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = autoresizingMask
        self.contentMode = contentMode
        self.image = image
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = clipToBounds
    }
}

