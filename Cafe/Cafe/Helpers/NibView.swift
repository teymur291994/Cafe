import UIKit

class NibView: UIView {
    
    // MARK: - override
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        fromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fromNib()
    }
}
