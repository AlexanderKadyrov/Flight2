import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Properties
    
    public var window: UIWindow?
    
    // MARK: - Application
    
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let vc = FlightListViewController()
        let nv = NavigationController(vc, color: .colorOnyx)
        window?.rootViewController = nv
        window?.makeKeyAndVisible()
        window?.tintColor = .white
        return true
    }
}
