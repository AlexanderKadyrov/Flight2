import UIKit

final class FlightListViewController: BaseViewController {
    
    // MARK: - Properties
    
    public var viewModel: FlightListViewModel!
    
    // MARK: - View
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        makeToolbar()
    }
    
    // MARK: - Make
    
    private func makeToolbar() {
        setBarTitle("flight_navigation_bar_title".localized() + " " + "App")
    }
}
