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
        label.textColor = .colorLabelText
        return label
    }()
    
    private var labelSubtitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 21)
        label.textColor = .colorLabelText
        return label
    }()
    
    // MARK: - View
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        makeToolbar()
        makeViews()
    }
    
    // MARK: - Make
    
    private func makeToolbar() {
        setBarTitle("Notice")
    }
    
    private func makeViews() {
        labelTitle.layer.borderColor = UIColor.colorBrilliantAzure.cgColor
        labelTitle.layer.cornerRadius = 70
        labelTitle.layer.borderWidth = 5
        
        view.addSubview(labelTitle)
        labelTitle.snp.makeConstraints({ maker in
            maker.centerY.equalToSuperview().offset(-64)
            maker.width.height.equalTo(140)
            maker.centerX.equalToSuperview()
        })
        
        view.addSubview(labelSubtitle)
        labelSubtitle.snp.makeConstraints({ maker in
            maker.top.equalTo(labelTitle.snp.bottom).offset(8)
            maker.left.right.equalToSuperview().inset(16)
            maker.height.equalTo(40)
        })
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
