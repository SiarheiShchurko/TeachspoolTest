import UIKit

final class StartVC: UIViewController {
    
    // Buttons
    private let startButton = TemplateButton(text: "Start",
                                             cornerRadius: 10)
    // VC lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        addActions()
        
        addSubviews()
        constraints()
    }
}

// MARK: - Private extensions

// Targets
private extension StartVC {
    func addActions() {
        let startButtonAction = UIAction { [ weak self ] _ in
            self?.startButtonDidTapped()
        }
        startButton.addAction(startButtonAction, for: .primaryActionTriggered)
    }
}

// Actions
private extension StartVC {
    func startButtonDidTapped() {
        let nextVC = OnboardingVC(onboardingModel: OnboardingVM())
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true)
    }
}

// Add subviews & Constraints
private extension StartVC {
    func addSubviews() {
        view.addSubview(startButton)
    }
    
    func constraints() {
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            startButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07)
        ])
    }
}
