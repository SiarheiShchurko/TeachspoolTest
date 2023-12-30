
import UIKit

class OnboardingVC: UIViewController {
    
    // Properties
    private let onboardingModel: OnboardingProtocol
    private lazy var currentPage = 0 {
        didSet {
            (onboardingModel.onboardingArray.count - 1) == currentPage ? nextButton.setTitle("Close", for: .normal) : nextButton.setTitle("Next", for: .normal)
        }
    }
    
    // Buttons
    private let nextButton = TemplateButton(text: "Next",
                                             cornerRadius: 10)
    
    // CollectionView
    private let onboardingCollectionView = CaruselCollectionView(scrollDirection: .horizontal,
                                                                 backgroundColor: .lightGray,
                                                                 cellClass: OnboardingCell.self,
                                                                 id: "\(OnboardingCell.self)")
    
    // Init
    init(onboardingModel: OnboardingProtocol) {
        self.onboardingModel = onboardingModel
        super.init(nibName: nil,
                   bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // VC lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        
        addActions()
        
        addSubviews()
        constraints()
    }
}

// MARK: - Private extensions

// SetView
private extension OnboardingVC {
    func setView() {
        view.backgroundColor = .lightGray
        
        onboardingCollectionView.dataSource = self
        onboardingCollectionView.delegate = self
        
        onboardingCollectionView.layer.cornerRadius = 10
        onboardingCollectionView.isUserInteractionEnabled = true
    }
}

// Add subviews & Constraints
private extension OnboardingVC {
    func addSubviews() {
        view.addSubview(onboardingCollectionView)
        view.addSubview(nextButton)
    }
    
    func constraints() {
        NSLayoutConstraint.activate([
            onboardingCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -48),
            onboardingCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            onboardingCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            onboardingCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            nextButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07)
        ])
    }
}

// Targets
private extension OnboardingVC {
    func addActions() {
        // Swipe
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipped))
        swipeGestureRecognizer.direction = .right
        onboardingCollectionView.addGestureRecognizer(swipeGestureRecognizer)
        // NextButton
        let nextButtonAction = UIAction { [ weak self ] _ in
            self?.nextButtonDidTapped()
        }
        nextButton.addAction(nextButtonAction, for: .primaryActionTriggered)
    }
}

// Actions
private extension OnboardingVC {
    func nextButtonDidTapped() {
        switch currentPage {
        case onboardingModel.onboardingArray.count - 1:
            dismiss(animated: true)
        case onboardingModel.onboardingArray.count - 2:
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
        default:
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
        }
    }
    
    @objc func didSwipped() {
        nextButtonDidTapped()
    }
}

// MARK: - CollectionView Extensions
extension OnboardingVC: UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        onboardingModel.onboardingArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(OnboardingCell.self)", for: indexPath) as? OnboardingCell else {
            return UICollectionViewCell()
        }
        let currentSlide = onboardingModel.onboardingArray[indexPath.row]
        cell.set(currentSlide)
        return cell
    }
}

extension OnboardingVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height: Double = collectionView.frame.height
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         0
    }
}

extension OnboardingVC: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
