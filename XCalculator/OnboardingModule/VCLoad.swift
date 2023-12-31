import UIKit

final class VCLoad: UIViewController {
    private let imgLogo = UIImageView(image: UIImage(named: "logo"))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.22, green: 0.22, blue: 0.251, alpha: 1)

        setupUI()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: { [self] in
            let vc = MenuController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false)
        })
    }
}

private extension VCLoad {
    func setupUI() {
        view.addSubview(imgLogo)

        imgLogo.translatesAutoresizingMaskIntoConstraints = true
        imgLogo.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
    }
}
