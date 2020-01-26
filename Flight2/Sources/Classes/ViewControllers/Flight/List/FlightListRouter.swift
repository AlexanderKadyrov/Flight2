import UIKit

final class FlightListRouter {
    
    // MARK: - Perform
    
    public func perform(_ value: FlightProtocol, from source: UIViewController) {
        if value is Notice {
            let vc = NoticeDetailViewController()
            vc.viewModel = NoticeDetailViewModel()
            source.navigationController?.pushViewController(vc, animated: true)
        } else if value is Event {
            
        } else if value is Move {
            
        }
    }
}
