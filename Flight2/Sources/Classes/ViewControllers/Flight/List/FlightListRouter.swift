import UIKit

final class FlightListRouter {
    
    // MARK: - Perform
    
    public func perform(_ value: FlightProtocol, from source: UIViewController) {
        if let value = value as? Notice {
            let vm = NoticeDetailViewModel()
            vm.notice = value
            let vc = NoticeDetailViewController()
            vc.viewModel = vm
            source.navigationController?.pushViewController(vc, animated: true)
        } else if let value = value as? Event {
            //TODO: необходимо будет доделать по мере свободного времени:)
        } else if let value = value as? Move {
            //TODO: необходимо будет доделать по мере свободного времени:)
        }
    }
}
