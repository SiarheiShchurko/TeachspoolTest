import UIKit

final class OnboardingCell: UICollectionViewCell {
    
    // Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubviews()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Labels
    private let mainLabel = TemplateLabel(text: "",
                                          textColor: .secondaryLabel,
                                          textAlign: .center)
    
    private let secondaryLabel = TemplateLabel(text: "",
                                               textColor: .secondaryLabel,
                                               textAlign: .center)
    
    // ImageView
    private let mainImage = TemplateImageView(imageName: "",
                                              contentMode: .scaleAspectFit,
                                              autoresizingMask: false)
}

// MARK: - Private extensions

// Add subviews & Constraints
private extension OnboardingCell {
    
    func addSubviews() {
        addSubview(mainImage)
        addSubview(mainLabel)
        addSubview(secondaryLabel)
    }
    
    func constraints() {
        NSLayoutConstraint.activate([
            
            mainImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.85),
            mainImage.topAnchor.constraint(equalTo: topAnchor),
            mainImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            mainLabel.centerYAnchor.constraint(equalTo: mainImage.bottomAnchor),
            mainLabel.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor),
            mainLabel.trailingAnchor.constraint(equalTo: mainImage.trailingAnchor),
            
            secondaryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            secondaryLabel.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor),
            secondaryLabel.trailingAnchor.constraint(equalTo: mainImage.trailingAnchor)
        ])
        layer.cornerRadius = 10
        clipsToBounds = true
    }
}

// MARK: Internal Extensions

// Set cell
extension OnboardingCell {
    func set(_ slide: OnboardingModel) {
        mainImage.image = UIImage(named: slide.imageName)
        mainLabel.text = slide.slideText
        secondaryLabel.text = slide.secondaryText
    }
}
