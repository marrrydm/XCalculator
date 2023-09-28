import UIKit

final class PivotController: UIViewController {
    private let labelTitle: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        view.textAlignment = .center
        view.text = "topic4".localize()

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

    private lazy var segmentFirst: SegmentedControl = {
        let view = SegmentedControl(items: ["standart".localize(), "woodie".localize(), "camarilla".localize(), "demark".localize()])
        view.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)], for: .selected)
        view.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0.6, green: 0.635, blue: 0.678, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)], for: .normal)

        return view
    }()

    private let consecutiveLabel: UILabel = {
        let view = UILabel()
        view.textColor =  UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "low".localize()

        return view
    }()

    private let lossLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "high".localize()

        return view
    }()

    private lazy var consecutiveTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = UIColor(red: 0.118, green: 0.118, blue: 0.129, alpha: 1)
        view.layer.borderColor = UIColor(red: 0.227, green: 0.227, blue: 0.239, alpha: 1).cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.placeholder = "0"
        view.layer.sublayerTransform = CATransform3DMakeTranslation(12, 0, 0)
        view.textColor = .white
        view.keyboardType = .decimalPad

        return view
    }()

    private lazy var lossTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = UIColor(red: 0.118, green: 0.118, blue: 0.129, alpha: 1)
        view.layer.borderColor = UIColor(red: 0.227, green: 0.227, blue: 0.239, alpha: 1).cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.placeholder = "0"
        view.layer.sublayerTransform = CATransform3DMakeTranslation(12, 0, 0)
        view.textColor = .white
        view.keyboardType = .decimalPad

        return view
    }()

    private let openLabel: UILabel = {
        let view = UILabel()
        view.textColor =  UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "Open price".localize()

        return view
    }()

    private let closeLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "Close price".localize()

        return view
    }()

    private lazy var openTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = UIColor(red: 0.118, green: 0.118, blue: 0.129, alpha: 1)
        view.layer.borderColor = UIColor(red: 0.227, green: 0.227, blue: 0.239, alpha: 1).cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.placeholder = "0"
        view.layer.sublayerTransform = CATransform3DMakeTranslation(12, 0, 0)
        view.textColor = .white
        view.keyboardType = .decimalPad

        return view
    }()

    private lazy var closeTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = UIColor(red: 0.118, green: 0.118, blue: 0.129, alpha: 1)
        view.layer.borderColor = UIColor(red: 0.227, green: 0.227, blue: 0.239, alpha: 1).cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.placeholder = "0"
        view.layer.sublayerTransform = CATransform3DMakeTranslation(12, 0, 0)
        view.textColor = .white
        view.keyboardType = .decimalPad

        return view
    }()

    private let title1: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 11, weight: .regular)
        view.textAlignment = .left
        view.text = "level".localize()

        return view
    }()

    private let title4: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 11, weight: .regular)
        view.textAlignment = .left
        view.text = "price".localize()

        return view
    }()

    private let valueNum0: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "---"

        return view
    }()

    private let valueNum1: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "resistance".localize() + " 3"

        return view
    }()

    private let valueNum2: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "resistance".localize() + " 2"

        return view
    }()

    private let valueNum3: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "resistance".localize() + " 1"

        return view
    }()

    private let valueNum4: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "topic4".localize()

        return view
    }()

    private let valueNum5: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "support".localize() + " 1"

        return view
    }()

    private let valueNum6: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "support".localize() + " 2"

        return view
    }()

    private let valueNum7: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "support".localize() + " 3"

        return view
    }()

    private let valueNum8: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "support".localize() + " 4"

        return view
    }()

    private let valueEnd1: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left

        return view
    }()

    private let valueEnd2: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left

        return view
    }()

    private let valueEnd3: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left

        return view
    }()

    private let valueEnd4: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left

        return view
    }()

    private let valueEnd5: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left

        return view
    }()

    private let valueEnd6: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left

        return view
    }()

    private let valueEnd7: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left

        return view
    }()

    private let valueEnd8: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left

        return view
    }()

    private let valueEnd9: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left

        return view
    }()

    private let stackView1: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution  = .fillEqually
        view.alignment = .leading
        view.spacing = 6
        view.isHidden = true
        view.semanticContentAttribute = .forceLeftToRight

        return view
    }()

    private let stackView4: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution  = .fillEqually
        view.alignment = .leading
        view.spacing = 6
        view.isHidden = true
        view.semanticContentAttribute = .forceRightToLeft

        return view
    }()

    private lazy var calculateButton: UIButton = {
        let nextButton = UIButton()
        nextButton.backgroundColor = UIColor(red: 0.392, green: 0.824, blue: 1, alpha: 1)
        nextButton.layer.cornerRadius = 14
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("calc.btn".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        nextButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)

        return nextButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.218, green: 0.218, blue: 0.25, alpha: 1)

        setupUI()
        setupDoneBtn()

        openTextField.delegate = self
        closeTextField.delegate = self
        lossTextField.delegate = self
        consecutiveTextField.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        segmentFirst.selectedSegmentIndex = 0
    }
}

private extension PivotController {
    func setupUI() {
        view.addSubviews(viewBackground, stackView1, stackView4, title1, title4, valueNum0, valueEnd1, calculateButton)
        viewBackground.addSubviews(labelTitle, imgBack, segmentFirst, consecutiveLabel, consecutiveTextField, lossLabel, lossTextField, openLabel, openTextField, closeLabel, closeTextField)
        stackView1.addArrangedSubviews(valueNum1, valueNum2, valueNum3, valueNum4, valueNum5, valueNum6, valueNum7, valueNum8)
        stackView4.addArrangedSubviews(valueEnd2, valueEnd3, valueEnd4, valueEnd5, valueEnd6, valueEnd7, valueEnd8, valueEnd9)

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
            imgBack.widthAnchor.constraint(equalToConstant: 20),
            imgBack.heightAnchor.constraint(equalToConstant: 28)
        ])

        segmentFirst.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentFirst.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            segmentFirst.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            segmentFirst.topAnchor.constraint(equalTo: imgBack.bottomAnchor, constant: 31),
            segmentFirst.heightAnchor.constraint(equalToConstant: 32)
        ])

        consecutiveLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            consecutiveLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            consecutiveLabel.topAnchor.constraint(equalTo: segmentFirst.bottomAnchor, constant: 14)
        ])

        consecutiveTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            consecutiveTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            consecutiveTextField.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -6),
            consecutiveTextField.topAnchor.constraint(equalTo: consecutiveLabel.bottomAnchor, constant: 6),
            consecutiveTextField.heightAnchor.constraint(equalToConstant: 44)
        ])

        lossLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lossLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 6),
            lossLabel.topAnchor.constraint(equalTo: segmentFirst.bottomAnchor, constant: 14)
        ])

        lossTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lossTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            lossTextField.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 6),
            lossTextField.topAnchor.constraint(equalTo: lossLabel.bottomAnchor, constant: 6),
            lossTextField.heightAnchor.constraint(equalToConstant: 44)
        ])

        openLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            openLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            openLabel.topAnchor.constraint(equalTo: lossTextField.bottomAnchor, constant: 14)
        ])

        openTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            openTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            openTextField.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -6),
            openTextField.topAnchor.constraint(equalTo: openLabel.bottomAnchor, constant: 6),
            openTextField.heightAnchor.constraint(equalToConstant: 44)
        ])

        closeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 6),
            closeLabel.topAnchor.constraint(equalTo: lossTextField.bottomAnchor, constant: 14)
        ])

        closeTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            closeTextField.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 6),
            closeTextField.topAnchor.constraint(equalTo: closeLabel.bottomAnchor, constant: 6),
            closeTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
        viewBackground.snp.makeConstraints({ make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(closeTextField.snp.bottom).offset(22)
        })

        title1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            title1.topAnchor.constraint(equalTo: viewBackground.bottomAnchor, constant: 16)
        ])

        title4.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            title4.topAnchor.constraint(equalTo: viewBackground.bottomAnchor, constant: 16)
        ])

        valueNum0.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            valueNum0.leadingAnchor.constraint(equalTo: title1.leadingAnchor),
            valueNum0.topAnchor.constraint(equalTo: title1.bottomAnchor, constant: 8)
        ])

        valueEnd1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            valueEnd1.trailingAnchor.constraint(equalTo: title4.trailingAnchor),
            valueEnd1.topAnchor.constraint(equalTo: title4.bottomAnchor, constant: 8)
        ])

        stackView1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView1.leadingAnchor.constraint(equalTo: title1.leadingAnchor),
            stackView1.topAnchor.constraint(equalTo: valueNum0.bottomAnchor, constant: 8)
        ])

        stackView4.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView4.trailingAnchor.constraint(equalTo: title4.trailingAnchor),
            stackView4.topAnchor.constraint(equalTo: valueEnd1.bottomAnchor, constant: 8)
        ])

        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            calculateButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func setupDoneBtn() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(hideKeyboard))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        lossTextField.inputAccessoryView = toolBar
        consecutiveTextField.inputAccessoryView = toolBar
        openTextField.inputAccessoryView = toolBar
        closeTextField.inputAccessoryView = toolBar
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
        lossTextField.layer.borderColor = UIColor(red: 0.227, green: 0.227, blue: 0.239, alpha: 1).cgColor
        consecutiveTextField.layer.borderColor = UIColor(red: 0.227, green: 0.227, blue: 0.239, alpha: 1).cgColor
        openTextField.layer.borderColor = UIColor(red: 0.227, green: 0.227, blue: 0.239, alpha: 1).cgColor
        closeTextField.layer.borderColor = UIColor(red: 0.227, green: 0.227, blue: 0.239, alpha: 1).cgColor
    }
}

private extension PivotController {
    @objc func calculate() {
        if consecutiveTextField.text != "" && lossTextField.text != "" && openTextField.text != "" && closeTextField.text != "" {
            stackView1.isHidden = false
            stackView4.isHidden = false
            valueNum0.text = "resistance".localize() + " 4"

            let lowPrice = Double(consecutiveTextField.text ?? "0")!
            let highPrice = Double(lossTextField.text ?? "0")!
            let closePrice = Double(closeTextField.text ?? "0")!
            var result = 0.0

            switch segmentFirst.selectedSegmentIndex {
            case 0:
                let pp = (highPrice + lowPrice + closePrice) / 3
                valueEnd1.text = "---"
                valueEnd9.text = "---"
                result = highPrice + 2 * (pp - lowPrice)
                valueEnd2.text = String(format:"%.2f", result)
                result = pp + (highPrice - lowPrice)
                valueEnd3.text = String(format:"%.2f", result)
                result = (2 * pp) - lowPrice
                valueEnd4.text = String(format:"%.2f", result)
                valueEnd5.text = String(format:"%.2f", pp)
                result = (2 * pp) - highPrice
                valueEnd6.text = String(format:"%.2f", result)
                result = pp - (highPrice - lowPrice)
                valueEnd7.text = String(format:"%.2f", result)
                result = lowPrice - 2 * (highPrice - pp)
                valueEnd8.text = String(format:"%.2f", result)
            case 1:
                valueEnd1.text = "---"
                valueEnd2.text = "---"
                valueEnd8.text = "---"
                valueEnd9.text = "---"
                result = ((highPrice + lowPrice) + (closePrice * 2)) / 4
                valueEnd5.text = String(format:"%.2f", result)
                result = (((highPrice + lowPrice) + (closePrice * 2)) / 2) - lowPrice
                valueEnd4.text = String(format:"%.2f", result)
                result = (((highPrice + lowPrice) + (closePrice * 2)) / 4) + highPrice - lowPrice
                valueEnd3.text = String(format:"%.2f", result)
                result = (((highPrice + lowPrice) + (closePrice * 2)) / 2) - highPrice
                valueEnd6.text = String(format:"%.2f", result)
                result = (((highPrice + lowPrice) + (closePrice * 2)) / 4) - highPrice + lowPrice
                valueEnd7.text = String(format:"%.2f", result)
            case 2:
                valueEnd5.text = "---"
                result = ((highPrice - lowPrice) * 1.1) / 2 + closePrice
                valueEnd1.text = String(format:"%.2f", result)
                result = ((highPrice - lowPrice) * 1.1) / 4 + closePrice
                valueEnd2.text = String(format:"%.2f", result)
                result = ((highPrice - lowPrice) * 1.1) / 6 + closePrice
                valueEnd3.text = String(format:"%.2f", result)
                result = ((highPrice - lowPrice) * 1.1) / 12 + closePrice
                valueEnd4.text = String(format:"%.2f", result)
                result = closePrice - ((highPrice - lowPrice) * 1.1) / 12
                valueEnd6.text = String(format:"%.2f", result)
                result = closePrice - ((highPrice - lowPrice) * 1.1) / 6
                valueEnd7.text = String(format:"%.2f", result)
                result = closePrice - ((highPrice - lowPrice) * 1.1) / 4
                valueEnd8.text = String(format:"%.2f", result)
                result = closePrice - ((highPrice - lowPrice) * 1.1) / 2
                valueEnd9.text = String(format:"%.2f", result)
            case 3:
                valueEnd1.text = "---"
                valueEnd2.text = "---"
                valueEnd3.text = "---"
                valueEnd5.text = "---"
                valueEnd7.text = "---"
                valueEnd8.text = "---"
                valueEnd9.text = "---"
                result = ((highPrice - lowPrice) / 2) + closePrice
                valueEnd4.text = String(format:"%.2f", result)
                result = closePrice - ((highPrice - lowPrice) / 2)
                valueEnd6.text = String(format:"%.2f", result)
            default: break
            }
        }
    }

    @objc func pop() {
        dismiss(animated: false)
    }
}

extension PivotController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case consecutiveTextField:
            consecutiveTextField.layer.borderWidth = 1
            consecutiveTextField.layer.borderColor = UIColor(red: 0.392, green: 0.824, blue: 1, alpha: 1).cgColor
            lossTextField.layer.borderWidth = 0
            closeTextField.layer.borderWidth = 0
            openTextField.layer.borderWidth = 0
        case lossTextField:
            lossTextField.layer.borderWidth = 1
            lossTextField.layer.borderColor = UIColor(red: 0.392, green: 0.824, blue: 1, alpha: 1).cgColor
            consecutiveTextField.layer.borderWidth = 0
            closeTextField.layer.borderWidth = 0
            openTextField.layer.borderWidth = 0
        case closeTextField:
            closeTextField.layer.borderWidth = 1
            closeTextField.layer.borderColor = UIColor(red: 0.392, green: 0.824, blue: 1, alpha: 1).cgColor
            consecutiveTextField.layer.borderWidth = 0
            lossTextField.layer.borderWidth = 0
            openTextField.layer.borderWidth = 0
        case openTextField:
            openTextField.layer.borderWidth = 1
            openTextField.layer.borderColor = UIColor(red: 0.392, green: 0.824, blue: 1, alpha: 1).cgColor
            consecutiveTextField.layer.borderWidth = 0
            lossTextField.layer.borderWidth = 0
            closeTextField.layer.borderWidth = 0
        default: break
        }
    }
}
