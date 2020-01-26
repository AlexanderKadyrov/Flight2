import TabloidView
import UIKit

final class FlightListTabloidCellViewModel: TabloidCellViewModel {
    
    // MARK: - Properties
    
    public let model: FlightProtocol
    
    // MARK: - Initialization
    
    public init(model: FlightProtocol) {
        self.model = model
        super.init(cellIdentifier: "FlightListTabloidCellView")
    }
}
