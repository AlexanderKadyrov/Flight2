import UIKit

final class NoticeDetailViewController: BaseViewController {
    
    // MARK: - Properties
    
    public var viewModel: NoticeDetailViewModel! {
        didSet {
            set(viewModel: viewModel)
        }
    }
    
    private let labelTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 51, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private var labelSubtitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 21)
        label.textColor = .white
        return label
    }()
    
    // MARK: - View
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        makeToolbar()
        makeItems()
        setData()
    }
    
    // MARK: - Make
    
    private func makeToolbar() {
        setBarTitle("Notice")
    }
    
    private func makeItems() {
        labelTitle.layer.borderColor = UIColor.colorBrilliantAzure.cgColor
        labelTitle.layer.cornerRadius = 70
        labelTitle.layer.borderWidth = 5
    }
    
    // MARK: - Set
    
    private func set(viewModel: NoticeDetailViewModel) {
        guard let notice = viewModel.notice else { return }
        if let gate = notice.gate, !gate.isEmpty {
            labelTitle.text = gate
        }
        if let flightDate = notice.flightDate {
            labelSubtitle.text = flightDate.toString(.formatterDate)
        }
    }
}
