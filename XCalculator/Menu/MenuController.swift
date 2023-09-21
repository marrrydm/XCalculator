import UIKit

final class MenuController: UIViewController {
    private let labelTitle: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "title.menu".localize()
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        view.textAlignment = .center
        
        return view
    }()

    private lazy var imgSettings: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "setting")
        img.contentMode = .scaleAspectFit
        img.isUserInteractionEnabled = true
        img.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(settingsTap)))

        return img
    }()

    private lazy var topicFirst: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.168, green: 0.168, blue: 0.188, alpha: 1)
        view.layer.cornerRadius = 18
        view.tag = 1
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
        view.isUserInteractionEnabled = true

        return view
    }()

    private lazy var topicSecond: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.168, green: 0.168, blue: 0.188, alpha: 1)
        view.layer.cornerRadius = 18
        view.tag = 1
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
        view.isUserInteractionEnabled = true

        return view
    }()

    private lazy var topicThird: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.168, green: 0.168, blue: 0.188, alpha: 1)
        view.layer.cornerRadius = 18
        view.tag = 1
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
        view.isUserInteractionEnabled = true

        return view
    }()

    private lazy var topicFourth: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.168, green: 0.168, blue: 0.188, alpha: 1)
        view.layer.cornerRadius = 18
        view.tag = 1
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
        view.isUserInteractionEnabled = true

        return view
    }()

    private let lbl1: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "topic1".localize()
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        view.textAlignment = .left

        return view
    }()

    private let lbl2: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "topic2".localize()
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        view.textAlignment = .left

        return view
    }()

    private let lbl3: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "topic3".localize()
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        view.textAlignment = .left

        return view
    }()

    private let lbl4: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "topic4".localize()
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        view.textAlignment = .left

        return view
    }()

    private var img1: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "right")
        view.contentMode = .scaleAspectFit

        return view
    }()

    private var img2: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "right")
        view.contentMode = .scaleAspectFit

        return view
    }()

    private var img3: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "right")
        view.contentMode = .scaleAspectFit

        return view
    }()

    private var img4: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "right")
        view.contentMode = .scaleAspectFit

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.22, green: 0.22, blue: 0.251, alpha: 1)

        setupUI()
    }
}

private extension MenuController {
    func setupUI() {
        view.addSubviews(labelTitle, imgSettings, topicFirst, topicSecond, topicThird, topicFourth)
        topicFirst.addSubviews(img1, lbl1)
        topicSecond.addSubviews(img2, lbl2)
        topicThird.addSubviews(img3, lbl3)
        topicFourth.addSubviews(img4, lbl4)

        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            labelTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            labelTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5)
        ])

        imgSettings.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imgSettings.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            imgSettings.centerYAnchor.constraint(equalTo: labelTitle.centerYAnchor),
            imgSettings.widthAnchor.constraint(equalToConstant: 24),
            imgSettings.heightAnchor.constraint(equalToConstant: 24)
        ])

        topicFirst.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topicFirst.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            topicFirst.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            topicFirst.topAnchor.constraint(equalTo: imgSettings.bottomAnchor, constant: 37),
            topicFirst.heightAnchor.constraint(equalToConstant: 62)
        ])

        topicSecond.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topicSecond.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            topicSecond.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            topicSecond.topAnchor.constraint(equalTo: topicFirst.bottomAnchor, constant: 12),
            topicSecond.heightAnchor.constraint(equalToConstant: 62)
        ])

        topicThird.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topicThird.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            topicThird.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            topicThird.topAnchor.constraint(equalTo: topicSecond.bottomAnchor, constant: 12),
            topicThird.heightAnchor.constraint(equalToConstant: 62)
        ])

        topicFourth.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topicFourth.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            topicFourth.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            topicFourth.topAnchor.constraint(equalTo: topicThird.bottomAnchor, constant: 12),
            topicFourth.heightAnchor.constraint(equalToConstant: 62)
        ])

        img1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            img1.trailingAnchor.constraint(equalTo: topicFirst.trailingAnchor, constant: -16),
            img1.centerYAnchor.constraint(equalTo: topicFirst.centerYAnchor),
            img1.widthAnchor.constraint(equalToConstant: 15),
            img1.heightAnchor.constraint(equalToConstant: 20)
        ])

        img2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            img2.trailingAnchor.constraint(equalTo: topicSecond.trailingAnchor, constant: -16),
            img2.centerYAnchor.constraint(equalTo: topicSecond.centerYAnchor),
            img2.widthAnchor.constraint(equalToConstant: 15),
            img2.heightAnchor.constraint(equalToConstant: 20)
        ])

        img3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            img3.trailingAnchor.constraint(equalTo: topicThird.trailingAnchor, constant: -16),
            img3.centerYAnchor.constraint(equalTo: topicThird.centerYAnchor),
            img3.widthAnchor.constraint(equalToConstant: 15),
            img3.heightAnchor.constraint(equalToConstant: 20)
        ])

        img4.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            img4.trailingAnchor.constraint(equalTo: topicFourth.trailingAnchor, constant: -16),
            img4.centerYAnchor.constraint(equalTo: topicFourth.centerYAnchor),
            img4.widthAnchor.constraint(equalToConstant: 15),
            img4.heightAnchor.constraint(equalToConstant: 20)
        ])

        lbl1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lbl1.leadingAnchor.constraint(equalTo: topicFirst.leadingAnchor, constant: 16),
            lbl1.centerYAnchor.constraint(equalTo: topicFirst.centerYAnchor)
        ])

        lbl2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lbl2.leadingAnchor.constraint(equalTo: topicSecond.leadingAnchor, constant: 16),
            lbl2.centerYAnchor.constraint(equalTo: topicSecond.centerYAnchor)
        ])

        lbl3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lbl3.leadingAnchor.constraint(equalTo: topicThird.leadingAnchor, constant: 16),
            lbl3.centerYAnchor.constraint(equalTo: topicThird.centerYAnchor)
        ])

        lbl4.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lbl4.leadingAnchor.constraint(equalTo: topicFourth.leadingAnchor, constant: 16),
            lbl4.centerYAnchor.constraint(equalTo: topicFourth.centerYAnchor)
        ])
    }
}

private extension MenuController {
    @objc func settingsTap() {
        let vc = SettingController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }

    @objc func tap(sender: UITapGestureRecognizer) {
        switch sender.view?.tag {
        case 1: break
        case 2: break
        case 3: break
        case 4: break
        default: break
        }
    }
}
