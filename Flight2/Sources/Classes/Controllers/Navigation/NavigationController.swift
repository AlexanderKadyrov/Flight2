import UIKit

class NavigationController: UINavigationController {
    
    // MARK: - Initialization
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    public init(_ rootViewController: UIViewController, color: UIColor = .white) {
        super.init(rootViewController: rootViewController)
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = color
    }
}
