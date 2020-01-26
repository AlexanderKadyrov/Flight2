import ReactiveSwift
import ReactiveCocoa
import TabloidView
import SnapKit
import UIKit

fileprivate extension Reactive where Base: FlightListViewController {
    var select: BindingTarget<TabloidCellViewModel> {
        return makeBindingTarget { base, value in
            guard let value = value as? FlightListTabloidCellViewModel else { return }
            base.router.perform(value.model, from: base)
        }
    }
}

final class FlightListViewController: BaseViewController {
    
    // MARK: - Properties
    
    public lazy var refreshControl: UIRefreshControl = {
        let view = UIRefreshControl()
        view.addTarget(self, action: #selector(loadData), for: .valueChanged)
        view.tintColor = .colorRefreshControl
        return view
    }()
    
    public lazy var tabloidView: TabloidView = {
        let view = TabloidView(viewModel: viewModel.tabloidViewModel)
        view.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 12))
        return view
    }()
    
    public var viewModel: FlightListViewModel!
    public var router: FlightListRouter!
    
    // MARK: - View
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        makeTableView()
        makeToolbar()
        loadData()
    }
    
    // MARK: - Make
    
    private func makeTableView() {
        reactive.select <~ viewModel.tabloidViewModel.pipeDidSelectItem.output
        view.addSubview(tabloidView)
        tabloidView.snp.makeConstraints({ maker in
            maker.edges.equalToSuperview()
        })
        makeRefreshControl()
    }
    
    private func makeRefreshControl() {
        refreshControl.reactive.isRefreshing <~ viewModel.actionFetchFlightList.isExecuting
        if #available(iOS 10.0, *) {
            tabloidView.refreshControl = refreshControl
        } else {
            tabloidView.addSubview(refreshControl)
        }
    }
    
    private func makeToolbar() {
        setBarTitle("flight_navigation_bar_title".localized() + " " + "App")
    }
    
    // MARK: - Load
    
    @objc private func loadData() {
        viewModel.actionFetchFlightList.apply().start()
    }
}
