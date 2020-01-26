import TabloidView
import SnapKit
import UIKit

final class FlightListViewController: BaseViewController {
    
    // MARK: - Properties
    
    public lazy var tabloidView: TabloidView = {
        let view = TabloidView(viewModel: viewModel.tabloidViewModel)
        view.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 12))
        view.backgroundColor = .clear
        return view
    }()
    
    public var viewModel: FlightListViewModel!
    
    // MARK: - View
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        makeTableView()
        makeToolbar()
        loadData()
    }
    
    // MARK: - Make
    
    private func makeTableView() {
        view.addSubview(tabloidView)
        tabloidView.snp.makeConstraints({ maker in
            maker.edges.equalToSuperview()
        })
    }
    
    private func makeToolbar() {
        setBarTitle("flight_navigation_bar_title".localized() + " " + "App")
    }
    
    // MARK: - Load
    
    private func loadData() {
        viewModel.actionFetchFlightList.apply().start()
    }
}
