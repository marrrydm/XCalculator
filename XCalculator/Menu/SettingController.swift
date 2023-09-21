import UIKit

final class SettingController: UIViewController {
    private let labelTitle: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "settings".localize()
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        view.textAlignment = .center

        return view
    }()

    private lazy var imgBack: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "left")
        img.contentMode = .scaleAspectFit
        img.isUserInteractionEnabled = true
        img.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pop)))

        return img
    }()

    private lazy var privacyView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.168, green: 0.168, blue: 0.188, alpha: 1)
        view.layer.cornerRadius = 14
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(policyAction)))

        return view
    }()

    private let privacyViewLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "privacy".localize()
        view.font = .systemFont(ofSize: 17, weight: .regular)

        return view
    }()

    private lazy var termsView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.168, green: 0.168, blue: 0.188, alpha: 1)
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = 14
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(termsAction)))

        return view
    }()

    private let termsViewLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "terms".localize()
        view.font = .systemFont(ofSize: 17, weight: .regular)

        return view
    }()

    private let privacyImg = UIImageView(image: UIImage(named: "right"))
    private let termsImg = UIImageView(image: UIImage(named: "right"))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.22, green: 0.22, blue: 0.251, alpha: 1)

        setupUI()
    }
}

private extension SettingController {
    func setupUI() {
        view.addSubviews(labelTitle, imgBack, privacyView, termsView)
        privacyView.addSubviews(privacyViewLabel, privacyImg)
        termsView.addSubviews(termsViewLabel, termsImg)

        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            labelTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            labelTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5)
        ])

        imgBack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imgBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imgBack.centerYAnchor.constraint(equalTo: labelTitle.centerYAnchor),
            imgBack.widthAnchor.constraint(equalToConstant: 24),
            imgBack.heightAnchor.constraint(equalToConstant: 24)
        ])

        privacyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            privacyView.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 24),
            privacyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            privacyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            privacyView.heightAnchor.constraint(equalToConstant: 50)
        ])

        termsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            termsView.topAnchor.constraint(equalTo: privacyView.bottomAnchor, constant: 1),
            termsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            termsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            termsView.heightAnchor.constraint(equalToConstant: 50)
        ])

        privacyImg.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            privacyImg.trailingAnchor.constraint(equalTo: privacyView.trailingAnchor, constant: -16),
            privacyImg.centerYAnchor.constraint(equalTo: privacyView.centerYAnchor),
            privacyImg.widthAnchor.constraint(equalToConstant: 15),
            privacyImg.heightAnchor.constraint(equalToConstant: 20)
        ])

        termsImg.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            termsImg.trailingAnchor.constraint(equalTo: termsView.trailingAnchor, constant: -16),
            termsImg.centerYAnchor.constraint(equalTo: termsView.centerYAnchor),
            termsImg.widthAnchor.constraint(equalToConstant: 15),
            termsImg.heightAnchor.constraint(equalToConstant: 20)
        ])

        privacyViewLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            privacyViewLabel.leadingAnchor.constraint(equalTo: privacyView.leadingAnchor, constant: 16),
            privacyViewLabel.centerYAnchor.constraint(equalTo: privacyView.centerYAnchor)
        ])

        termsViewLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            termsViewLabel.leadingAnchor.constraint(equalTo: termsView.leadingAnchor, constant: 16),
            termsViewLabel.centerYAnchor.constraint(equalTo: termsView.centerYAnchor)
        ])
    }
}
private extension SettingController {
    @objc func pop() {
        dismiss(animated: false)
    }

    @objc func policyAction() {
        if let url = URL(string: "https://www.freeprivacypolicy.com/live/f043dd2d-3b13-4a96-b1d9-5c0adbdbc0b8"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

    @objc func termsAction() {
        if let url = URL(string: "https://www.freeprivacypolicy.com/live/12043b8e-f70e-4ef8-86cc-e12492390923"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
