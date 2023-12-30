
import UIKit

class CaruselCollectionView: UICollectionView {
    
    init(scrollDirection: UICollectionView.ScrollDirection,
         backgroundColor: UIColor,
         cellClass: AnyClass,
         id: String) {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        super.init(frame: .zero, collectionViewLayout: layout)
        self.backgroundColor = backgroundColor
        
        register(cellClass, forCellWithReuseIdentifier: id)
        isPagingEnabled = true
        showsHorizontalScrollIndicator = false
        isUserInteractionEnabled = false
        
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
