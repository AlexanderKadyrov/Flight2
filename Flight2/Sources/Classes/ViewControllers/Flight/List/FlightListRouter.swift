import UIKit

fileprivate let message = "Данный экран в процессе разработки. Пока можно глянуть структуру Notice, тапнув по ней:)"
fileprivate let title = "Сообщение"

final class FlightListRouter {
    
    // MARK: - Perform
    
    public func perform(_ value: FlightProtocol, from source: UIViewController) {
        if let value = value as? Notice {
            let vm = NoticeDetailViewModel()
            vm.notice = value
            let vc = NoticeDetailViewController()
            vc.viewModel = vm
            source.navigationController?.pushViewController(vc, animated: true)
        } else if let _ = value as? Event {
            //TODO: необходимо будет доделать по мере свободного времени:)
            source.show(title: title, message: message)
        } else if let _ = value as? Move {
            //TODO: необходимо будет доделать по мере свободного времени:)
            source.show(title: title, message: message)
        }
    }
}
