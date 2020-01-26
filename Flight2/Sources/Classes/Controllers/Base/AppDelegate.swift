import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Properties
    
    public var window: UIWindow?
    
    // MARK: - Application
    
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.launch()
        return true
    }
}

fileprivate extension UIWindow {
    func launch() {
        let vc = FlightListViewController()
        vc.viewModel = FlightListViewModel()
        vc.router = FlightListRouter()
        let nv = NavigationController(vc, color: .colorBackground)
        rootViewController = nv
        makeKeyAndVisible()
        tintColor = .white
    }
}
