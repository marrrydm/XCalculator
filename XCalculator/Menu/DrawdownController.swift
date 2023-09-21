import UIKit

final class DrawController: UIViewController {
    private let labelTitle: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        view.textAlignment = .center
        view.text = "topic1".localize()

        return view
    }()

    private lazy var imgBack: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "left")
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pop)))

        return view
    }()

    private let viewBackground: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.168, green: 0.168, blue: 0.188, alpha: 1)
        view.layer.cornerRadius = 10

        return view
    }()

    private let startBalanceTitle: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.textAlignment = .left
        view.text = "start.balance.1".localize()

        return view
    }()

    private lazy var balanceTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = UIColor(red: 0.118, green: 0.118, blue: 0.129, alpha: 1)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.227, green: 0.227, blue: 0.239, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        view.placeholder = "0"

        return view
    }()

    private let consecutiveLabel: UILabel = {
        let view = UILabel()
        view.textColor =  UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.textAlignment = .left
        view.text = "loss.1".localize()

        return view
    }()

    private let lossLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.textAlignment = .left
        view.text = "precent.1".localize()

        return view
    }()

    private lazy var consecutiveTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = UIColor(red: 0.118, green: 0.118, blue: 0.129, alpha: 1)
        view.layer.borderColor = UIColor(red: 0.227, green: 0.227, blue: 0.239, alpha: 1).cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.placeholder = "0"

        return view
    }()

    private lazy var lossTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = UIColor(red: 0.118, green: 0.118, blue: 0.129, alpha: 1)
        view.layer.borderColor = UIColor(red: 0.227, green: 0.227, blue: 0.239, alpha: 1).cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.placeholder = "0"

        return view
    }()

    private let endBalanceTitle: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.textAlignment = .left
        view.text = "end.1".localize()

        return view
    }()

    private let totalTitle: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.textAlignment = .left
        view.text = "total.1".localize()

        return view
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.218, green: 0.218, blue: 0.25, alpha: 1)

        setupUI()
    }
}

private extension DrawController {
    func setupUI() {
        view.addSubviews(viewBackground, endBalanceTitle, totalTitle)
        viewBackground.addSubviews(labelTitle, imgBack, startBalanceTitle, balanceTextField, consecutiveLabel, consecutiveTextField, lossLabel, lossTextField)
    }
}

private extension DrawController {
    @objc func pop() {
        dismiss(animated: false)
    }
}
