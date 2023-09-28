import UIKit

final class RiskController: UIViewController {
    private let labelTitle: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        view.textAlignment = .center
        view.text = "topic2".localize()

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

    private let maxTitle: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 13, weight: .regular)
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

    private let winLabel: UILabel = {
        let view = UILabel()
        view.textColor =  UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "win.2".localize()

        return view
    }()

    private let averageLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "average.2".localize()

        return view
    }()

    private lazy var winTextField: UITextField = {
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

    private lazy var averageTextField: UITextField = {
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

    private let riskLabel: UILabel = {
        let view = UILabel()
        view.textColor =  UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "risk.2".localize()

        return view
    }()

    private let numLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "numbers.2".localize()

        return view
    }()

    private lazy var riskTextField: UITextField = {
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

    private lazy var numTextField: UITextField = {
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

    private let riskBalanceTitle: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "risk.drop.2".localize()

        return view
    }()

    private let totalTitle: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "Risk of ruin".localize()

        return view
    }()

    private let riskBalanceValue: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 22, weight: .bold)
        view.textAlignment = .left
        view.text = "13.8%"

        return view
    }()

    private let totalValue: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 22, weight: .bold)
        view.textAlignment = .left
        view.text = "8.1%"

        return view
    }()

    private let viewLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)

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
}

private extension RiskController {
    func setupUI() {
        view.addSubviews(viewBackground, riskBalanceTitle, riskBalanceValue, totalTitle ,totalValue, viewLine, calculateButton)
        viewBackground.addSubviews(labelTitle, imgBack, winLabel, winTextField, averageLabel, averageTextField, riskLabel, riskTextField, maxTitle, maxTextField, numLabel, numTextField)

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

        winLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            winLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            winLabel.topAnchor.constraint(equalTo: imgBack.bottomAnchor, constant: 31)
        ])

        winTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            winTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            winTextField.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -6),
            winTextField.topAnchor.constraint(equalTo: winLabel.bottomAnchor, constant: 6),
            winTextField.heightAnchor.constraint(equalToConstant: 44)
        ])

        averageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            averageLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 6),
            averageLabel.topAnchor.constraint(equalTo: imgBack.bottomAnchor, constant: 31)
        ])

        averageTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            averageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            averageTextField.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 6),
            averageTextField.topAnchor.constraint(equalTo: averageLabel.bottomAnchor, constant: 6),
            averageTextField.heightAnchor.constraint(equalToConstant: 44)
        ])

        maxTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            maxTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            maxTitle.topAnchor.constraint(equalTo: riskTextField.bottomAnchor, constant: 14)
        ])

        maxTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            maxTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            maxTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            maxTextField.topAnchor.constraint(equalTo: maxTitle.bottomAnchor, constant: 6),
            maxTextField.heightAnchor.constraint(equalToConstant: 44)
        ])

        riskLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            riskLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            riskLabel.topAnchor.constraint(equalTo: winTextField.bottomAnchor, constant: 14)
        ])

        riskTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            riskTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            riskTextField.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -6),
            riskTextField.topAnchor.constraint(equalTo: riskLabel.bottomAnchor, constant: 6),
            riskTextField.heightAnchor.constraint(equalToConstant: 44)
        ])

        numLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 6),
            numLabel.topAnchor.constraint(equalTo: averageTextField.bottomAnchor, constant: 14)
        ])

        numTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            numTextField.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 6),
            numTextField.topAnchor.constraint(equalTo: numLabel.bottomAnchor, constant: 6),
            numTextField.heightAnchor.constraint(equalToConstant: 44)
        ])

        viewBackground.snp.makeConstraints({ make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(maxTextField.snp.bottom).offset(22)
        })

        riskBalanceTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            riskBalanceTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            riskBalanceTitle.topAnchor.constraint(equalTo: viewBackground.bottomAnchor, constant: 16)
        ])

        riskBalanceValue.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            riskBalanceValue.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            riskBalanceValue.topAnchor.constraint(equalTo: riskBalanceTitle.bottomAnchor, constant: 6)
        ])

        totalTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            totalTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            totalTitle.topAnchor.constraint(equalTo: viewBackground.bottomAnchor, constant: 16)
        ])

        totalValue.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            totalValue.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            totalValue.topAnchor.constraint(equalTo: totalTitle.bottomAnchor, constant: 6)
        ])

        viewLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewLine.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            viewLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            viewLine.topAnchor.constraint(equalTo: totalValue.bottomAnchor, constant: 16),
            viewLine.heightAnchor.constraint(equalToConstant: 1)
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
        winTextField.inputAccessoryView = toolBar
        averageTextField.inputAccessoryView = toolBar
        riskTextField.inputAccessoryView = toolBar
        numTextField.inputAccessoryView = toolBar
        maxTextField.inputAccessoryView = toolBar
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}

private extension RiskController {
    @objc func calculate() {
        //
    }

    @objc func pop() {
        dismiss(animated: false)
    }
}
