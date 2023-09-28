import SnapKit
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
        view.font = .systemFont(ofSize: 13, weight: .regular)
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
        view.layer.sublayerTransform = CATransform3DMakeTranslation(12, 0, 0)
        view.textColor = .white
        view.keyboardType = .decimalPad

        return view
    }()

    private let consecutiveLabel: UILabel = {
        let view = UILabel()
        view.textColor =  UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "loss.1".localize()

        return view
    }()

    private let lossLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 13, weight: .regular)
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
        view.text = "10"
        view.layer.sublayerTransform = CATransform3DMakeTranslation(12, 0, 0)
        view.textColor = .white
        view.keyboardType = .decimalPad
        view.isUserInteractionEnabled = false

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

    private let endBalanceValue: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.textAlignment = .left
        view.text = "---"

        return view
    }()

    private let totalValue: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.textAlignment = .left
        view.text = "---"

        return view
    }()

    private let viewLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)

        return view
    }()

    private let title1: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 11, weight: .regular)
        view.textAlignment = .left
        view.text = "№"

        return view
    }()

    private let title2: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 11, weight: .regular)
        view.textAlignment = .left
        view.text = "start.balance.1".localize()

        return view
    }()

    private let title3: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 11, weight: .regular)
        view.textAlignment = .left
        view.text = "total.1".localize()

        return view
    }()

    private let title4: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        view.font = .systemFont(ofSize: 11, weight: .regular)
        view.textAlignment = .left
        view.text = "end.1".localize()

        return view
    }()

    private let valueNum1: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "1"

        return view
    }()

    private let valueNum2: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "2"

        return view
    }()

    private let valueNum3: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "3"

        return view
    }()

    private let valueNum4: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "4"

        return view
    }()

    private let valueNum5: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "5"

        return view
    }()

    private let valueNum6: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "6"

        return view
    }()

    private let valueNum7: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "7"

        return view
    }()

    private let valueNum8: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "8"

        return view
    }()

    private let valueNum9: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "9"

        return view
    }()

    private let valueNum10: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "10"

        return view
    }()

    private let valueStart1: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "---"

        return view
    }()

    private let valueStart2: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left

        return view
    }()

    private let valueStart3: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left

        return view
    }()

    private let valueStart4: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left

        return view
    }()

    private let valueStart5: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left

        return view
    }()

    private let valueStart6: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left

        return view
    }()

    private let valueStart7: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left

        return view
    }()

    private let valueStart8: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left

        return view
    }()

    private let valueStart9: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left

        return view
    }()

    private let valueStart10: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left

        return view
    }()

    private let valueTotal1: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.text = "---"

        return view
    }()

    private let valueTotal2: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left

        return view
    }()

    private let valueTotal3: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left

        return view
    }()

    private let valueTotal4: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left

        return view
    }()

    private let valueTotal5: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left

        return view
    }()

    private let valueTotal6: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left

        return view
    }()

    private let valueTotal7: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left

        return view
    }()

    private let valueTotal8: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left

        return view
    }()

    private let valueTotal9: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left

        return view
    }()

    private let valueTotal10: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left

        return view
    }()

    private let valueEnd1: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .right
        view.text = "---"

        return view
    }()

    private let valueEnd2: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .right

        return view
    }()

    private let valueEnd3: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .right

        return view
    }()

    private let valueEnd4: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .right

        return view
    }()

    private let valueEnd5: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .right

        return view
    }()

    private let valueEnd6: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .right

        return view
    }()

    private let valueEnd7: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .right

        return view
    }()

    private let valueEnd8: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .right

        return view
    }()

    private let valueEnd9: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .right

        return view
    }()

    private let valueEnd10: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .right

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

    private let stackView2: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution  = .fillEqually
        view.alignment = .leading
        view.spacing = 6
        view.isHidden = true
        view.semanticContentAttribute = .forceLeftToRight

        return view
    }()

    private let stackView3: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution  = .fillEqually
        view.alignment = .leading
        view.spacing = 6
        view.isHidden = true

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

    private var viewForCalculate = [[UILabel]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.218, green: 0.218, blue: 0.25, alpha: 1)

        setupUI()
        setupDoneBtn()

        balanceTextField.delegate = self
        lossTextField.delegate = self
    }
}

private extension DrawController {
    func setupUI() {
        view.addSubviews(viewBackground, endBalanceTitle, totalTitle, endBalanceValue, totalValue, viewLine, stackView1, stackView2, stackView3, stackView4, title1, title2, title3, title4, valueNum1, valueStart1, valueTotal1, valueEnd1, calculateButton)
        viewBackground.addSubviews(labelTitle, imgBack, startBalanceTitle, balanceTextField, consecutiveLabel, consecutiveTextField, lossLabel, lossTextField)
        stackView1.addArrangedSubviews(valueNum2, valueNum3, valueNum4, valueNum5, valueNum6, valueNum7, valueNum8, valueNum9, valueNum10)
        stackView2.addArrangedSubviews(valueStart2, valueStart3, valueStart4, valueStart5, valueStart6, valueStart7, valueStart8, valueStart9, valueStart10)
        stackView3.addArrangedSubviews(valueTotal2, valueTotal3, valueTotal4, valueTotal5, valueTotal6, valueTotal7, valueTotal8, valueTotal9, valueTotal10)
        stackView4.addArrangedSubviews(valueEnd2, valueEnd3, valueEnd4, valueEnd5, valueEnd6, valueEnd7, valueEnd8, valueEnd9, valueEnd10)

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

        startBalanceTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startBalanceTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            startBalanceTitle.topAnchor.constraint(equalTo: imgBack.bottomAnchor, constant: 31)
        ])

        balanceTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            balanceTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            balanceTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            balanceTextField.topAnchor.constraint(equalTo: startBalanceTitle.bottomAnchor, constant: 6),
            balanceTextField.heightAnchor.constraint(equalToConstant: 44)
        ])

        consecutiveLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            consecutiveLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            consecutiveLabel.topAnchor.constraint(equalTo: balanceTextField.bottomAnchor, constant: 14)
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
            lossLabel.topAnchor.constraint(equalTo: balanceTextField.bottomAnchor, constant: 14)
        ])

        lossTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lossTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            lossTextField.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 6),
            lossTextField.topAnchor.constraint(equalTo: lossLabel.bottomAnchor, constant: 6),
            lossTextField.heightAnchor.constraint(equalToConstant: 44)
        ])

        viewBackground.snp.makeConstraints({ make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(consecutiveTextField.snp.bottom).offset(22)
        })

        endBalanceTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            endBalanceTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            endBalanceTitle.topAnchor.constraint(equalTo: viewBackground.bottomAnchor, constant: 16)
        ])

        endBalanceValue.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            endBalanceValue.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            endBalanceValue.topAnchor.constraint(equalTo: endBalanceTitle.bottomAnchor, constant: 6)
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

        title1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            title1.topAnchor.constraint(equalTo: viewLine.bottomAnchor, constant: 16)
        ])

        title2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title2.leadingAnchor.constraint(equalTo: title1.trailingAnchor, constant: 30),
            title2.topAnchor.constraint(equalTo: viewLine.bottomAnchor, constant: 16)
        ])

        title3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title3.trailingAnchor.constraint(equalTo: title4.leadingAnchor, constant: -40),
            title3.topAnchor.constraint(equalTo: viewLine.bottomAnchor, constant: 16)
        ])

        title4.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            title4.topAnchor.constraint(equalTo: viewLine.bottomAnchor, constant: 16)
        ])

        valueNum1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            valueNum1.leadingAnchor.constraint(equalTo: title1.leadingAnchor),
            valueNum1.topAnchor.constraint(equalTo: title1.bottomAnchor, constant: 8)
        ])

        valueStart1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            valueStart1.leadingAnchor.constraint(equalTo: title2.leadingAnchor),
            valueStart1.topAnchor.constraint(equalTo: title2.bottomAnchor, constant: 8)
        ])

        valueTotal1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            valueTotal1.leadingAnchor.constraint(equalTo: title3.leadingAnchor),
            valueTotal1.topAnchor.constraint(equalTo: title3.bottomAnchor, constant: 8)
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

        stackView2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView2.leadingAnchor.constraint(equalTo: title2.leadingAnchor),
            stackView2.topAnchor.constraint(equalTo: valueStart1.bottomAnchor, constant: 8)
        ])

        stackView3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView3.leadingAnchor.constraint(equalTo: title3.leadingAnchor),
            stackView3.topAnchor.constraint(equalTo: valueTotal1.bottomAnchor, constant: 8)
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

        viewForCalculate = [[valueStart2, valueTotal2, valueEnd2],
                            [valueStart3, valueTotal3, valueEnd3],
                            [valueStart4, valueTotal4, valueEnd4],
                            [valueStart5, valueTotal5, valueEnd5],
                            [valueStart6, valueTotal6, valueEnd6],
                            [valueStart7, valueTotal7, valueEnd7],
                            [valueStart8, valueTotal8, valueEnd8],
                            [valueStart9, valueTotal9, valueEnd9],
                            [valueStart10, valueTotal10, valueEnd10]]
    }

    func setupDoneBtn() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(hideKeyboard))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        balanceTextField.inputAccessoryView = toolBar
        lossTextField.inputAccessoryView = toolBar
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
        lossTextField.layer.borderColor = UIColor(red: 0.227, green: 0.227, blue: 0.239, alpha: 1).cgColor
        balanceTextField.layer.borderColor = UIColor(red: 0.227, green: 0.227, blue: 0.239, alpha: 1).cgColor
    }
}

private extension DrawController {
    @objc func calculate() {
        // newBalance = startBalance - ((% / 100) * startBalance)
        // totalLoss = (newBalance * (первоначальный %) / startBalance) + (первоначальный %)
        if balanceTextField.text != "" && lossTextField.text != "" {
            valueStart1.text = balanceTextField.text
            valueTotal1.text = lossTextField.text ?? "0" + "%"
            var newBalance = Double(balanceTextField.text!)! - ((Double(lossTextField.text!)! / 100) * Double(balanceTextField.text!)!)
            var percent = 0.0
            var oldPercent = Double(lossTextField.text!)!
            valueEnd1.text = "\(newBalance)"

            stackView1.isHidden = false
            stackView2.isHidden = false
            stackView3.isHidden = false
            stackView4.isHidden = false

            viewForCalculate.forEach {
                $0[0].text = String(format:"%.2f", newBalance)
                percent = (newBalance * (Double(lossTextField.text!)! / Double(balanceTextField.text!)!)) + oldPercent
                $0[1].text = String(format:"%.2f", percent) + "%"
                oldPercent = percent
                newBalance = newBalance - ((Double(lossTextField.text!)! / 100) * newBalance)
                $0[2].text = String(format:"%.2f", newBalance)
            }

            endBalanceValue.text = String(format:"%.2f", newBalance)
            totalValue.text = String(format:"%.2f", percent) + "%"
        }
    }

    @objc func pop() {
        dismiss(animated: false)
    }
}

extension DrawController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case balanceTextField:
            balanceTextField.layer.borderWidth = 1
            balanceTextField.layer.borderColor = UIColor(red: 0.392, green: 0.824, blue: 1, alpha: 1).cgColor
            lossTextField.layer.borderWidth = 0
        case lossTextField:
            lossTextField.layer.borderWidth = 1
            lossTextField.layer.borderColor = UIColor(red: 0.392, green: 0.824, blue: 1, alpha: 1).cgColor
            balanceTextField.layer.borderWidth = 0
        default: break
        }
    }
}
