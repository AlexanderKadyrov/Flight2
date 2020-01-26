import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Properties
    
    public var window: UIWindow?
    
    // MARK: - Application
    
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = FlightListViewController()
        vc.viewModel = FlightListViewModel()
        let nv = NavigationController(vc, color: .colorBackground)
        window?.rootViewController = nv
        window?.makeKeyAndVisible()
        window?.tintColor = .white
        return true
    }
}
