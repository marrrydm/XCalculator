import UIKit

final class FibonacciController: UIViewController {
    private let labelTitle: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        view.textAlignment = .center
        view.text = "title.3".localize()

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
        let view = SegmentedControl(items: ["control1".localize(), "control2".localize()])
        view.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)], for: .selected)
        view.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0.6, green: 0.635, blue: 0.678, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)], for: .normal)
        
        return view
    }()

    private let consecutiveLabel: UILabel = {
        let view = UILabel()
        view.textColor =  UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.textAlignment = .left
        view.text = "low".localize()

        return view
    }()

    private let lossLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 14, weight: .regular)
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

    private let maxTitle: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.textAlignment = .left
        view.text = "max.2".localize()

        return view
    }()

    private lazy var maxTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = UIColor(red: 0.118, green: 0.118, blue: 0.129, alpha: 1)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.227, green: 0.227, blue: 0.239, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        view.placeholder = "0"
        view.layer.sublayerTransform = CATransform3DMakeTranslation(12, 0, 0)
        view.textColor = .white
        view.keyboardType = .decimalPad

        return view
    }()

    private let trendTitle: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.textAlignment = .left
        view.text = "trend.3".localize()

        return view
    }()

    private lazy var segmentSecond: SegmentedControl = {
        let view = SegmentedControl(items: ["up".localize(), "down".localize()])
        view.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)], for: .selected)
        view.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0.6, green: 0.635, blue: 0.678, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)], for: .normal)

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

    private let valueNum1: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "161.8%"

        return view
    }()

    private let valueNum2: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "138.2%"

        return view
    }()

    private let valueNum3: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "78.6%"

        return view
    }()

    private let valueNum4: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "61.8%"

        return view
    }()

    private let valueNum5: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "50%"

        return view
    }()

    private let valueNum6: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "38.2%"

        return view
    }()

    private let valueNum7: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "23.6%"

        return view
    }()

    private let valueEnd1: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "19,600"

        return view
    }()

    private let valueEnd2: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "19,600"

        return view
    }()

    private let valueEnd3: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "19,600"

        return view
    }()

    private let valueEnd4: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "19,600"

        return view
    }()

    private let valueEnd5: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "19,600"

        return view
    }()

    private let valueEnd6: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "19,600"

        return view
    }()

    private let valueEnd7: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "19,600"

        return view
    }()

    private let stackView1: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution  = .fillEqually
        view.alignment = .leading
        view.spacing = 6
//        view.isHidden = true

        return view
    }()

    private let stackView4: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution  = .fillEqually
        view.alignment = .leading
        view.spacing = 6
//        view.isHidden = true

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
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        segmentFirst.selectedSegmentIndex = 0
        segmentSecond.selectedSegmentIndex = 0
    }
}

private extension FibonacciController {
    func setupUI() {
        view.addSubviews(viewBackground, stackView1, stackView4, title1, title4, valueNum1, valueEnd1, calculateButton)
        viewBackground.addSubviews(labelTitle, imgBack, segmentFirst, consecutiveLabel, consecutiveTextField, lossLabel, lossTextField, maxTitle, maxTextField, trendTitle, segmentSecond)
        stackView1.addArrangedSubviews(valueNum2, valueNum3, valueNum4, valueNum5, valueNum6, valueNum7)
        stackView4.addArrangedSubviews(valueEnd2, valueEnd3, valueEnd4, valueEnd5, valueEnd6, valueEnd7)

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

        trendTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            trendTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            trendTitle.topAnchor.constraint(equalTo: segmentFirst.bottomAnchor, constant: 14)
        ])

        segmentSecond.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentSecond.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            segmentSecond.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            segmentSecond.topAnchor.constraint(equalTo: trendTitle.bottomAnchor, constant: 6),
            segmentSecond.heightAnchor.constraint(equalToConstant: 32)
        ])

        consecutiveLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            consecutiveLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            consecutiveLabel.topAnchor.constraint(equalTo: segmentSecond.bottomAnchor, constant: 14)
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
            lossLabel.topAnchor.constraint(equalTo: segmentSecond.bottomAnchor, constant: 14)
        ])

        lossTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lossTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            lossTextField.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 6),
            lossTextField.topAnchor.constraint(equalTo: lossLabel.bottomAnchor, constant: 6),
            lossTextField.heightAnchor.constraint(equalToConstant: 44)
        ])

        maxTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            maxTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            maxTitle.topAnchor.constraint(equalTo: lossTextField.bottomAnchor, constant: 14)
        ])

        maxTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            maxTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            maxTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            maxTextField.topAnchor.constraint(equalTo: maxTitle.bottomAnchor, constant: 6),
            maxTextField.heightAnchor.constraint(equalToConstant: 44)
        ])

        viewBackground.snp.makeConstraints({ make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(maxTextField.snp.bottom).offset(22)
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

        valueNum1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            valueNum1.leadingAnchor.constraint(equalTo: title1.leadingAnchor),
            valueNum1.topAnchor.constraint(equalTo: title1.bottomAnchor, constant: 8)
        ])

        valueEnd1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            valueEnd1.trailingAnchor.constraint(equalTo: title4.trailingAnchor),
            valueEnd1.topAnchor.constraint(equalTo: title4.bottomAnchor, constant: 8)
        ])

        stackView1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView1.leadingAnchor.constraint(equalTo: title1.leadingAnchor),
            stackView1.topAnchor.constraint(equalTo: valueNum1.bottomAnchor, constant: 8)
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
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}

private extension FibonacciController {
    @objc func calculate() {
        //
    }

    @objc func pop() {
        dismiss(animated: false)
    }
}
