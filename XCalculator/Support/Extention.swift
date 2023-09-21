import UIKit

extension String {
    func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
}

public extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
