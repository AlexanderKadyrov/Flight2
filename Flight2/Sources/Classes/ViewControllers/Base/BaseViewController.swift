import UIKit

public class BaseViewController: UIViewController {
    
    // MARK: - Initialization
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init() {
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    // MARK: - View
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Set
    
    func setBarTitle(_ text: String) {
        let navigationTitleFont = UIFont.boldSystemFont(ofSize: 21)
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: navigationTitleFont,
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        self.title = text
    }
}