import TabloidView
import UIKit

final class FlightListTabloidCellView: TabloidCellView {
    
    // MARK: - Properties
    
    public override var viewModel: TabloidCellViewModel! {
        didSet {
            guard let viewModel = viewModel as? FlightListTabloidCellViewModel else { return }
            set(viewModel: viewModel)
        }
    }
    
    private let viewContainer: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .colorBrilliantAzure
        view.layer.cornerRadius = 6.0
        return view
    }()
    
    private let labelTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 19, weight: .medium)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private let labelSubtitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Initialization
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    private func setupViews() {
        selectionStyle = .none
        
        addSubview(viewContainer)
        viewContainer.snp.makeConstraints({ maker in
            maker.left.bottom.right.equalToSuperview().inset(12)
            maker.top.equalToSuperview()
        })
        
        viewContainer.addSubview(labelTitle)
        labelTitle.snp.makeConstraints({ maker in
            maker.left.top.right.equalToSuperview().inset(8)
        })
        
        viewContainer.addSubview(labelSubtitle)
        labelSubtitle.snp.makeConstraints({ maker in
            maker.left.bottom.right.equalToSuperview().inset(8)
            maker.top.equalTo(labelTitle.snp.bottom).offset(8)
        })
    }
    
    // MARK: - Set
    
    private func set(viewModel: FlightListTabloidCellViewModel) {
        labelSubtitle.text = viewModel.model.subtitle
        labelTitle.text = viewModel.model.title
    }
}
