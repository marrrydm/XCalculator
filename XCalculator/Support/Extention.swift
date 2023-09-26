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

public extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}

class SegmentedControl: UISegmentedControl {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 10
        layer.masksToBounds = true
        backgroundColor = UIColor(red: 0.168, green: 0.168, blue: 0.188, alpha: 1)
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 0.227, green: 0.227, blue: 0.239, alpha: 1).cgColor
        selectedSegmentTintColor = UIColor(red: 0.353, green: 0.784, blue: 0.98, alpha: 1)
    }
}
