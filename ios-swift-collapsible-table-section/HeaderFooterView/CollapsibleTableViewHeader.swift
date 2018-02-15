import UIKit
protocol CollapsibleTableViewHeaderDelegate {
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int)
}
class CollapsibleTableViewHeader: UIView {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var arrowLabel: UILabel!
    
    static func loadNib()-> CollapsibleTableViewHeader{
        return UINib(nibName: "CollapsibleTableViewHeader", bundle: nil).instantiate(withOwner: nil, options: nil).first as! CollapsibleTableViewHeader
    }
    var delegate: CollapsibleTableViewHeaderDelegate?
    var section: Int = 0


    override func awakeFromNib() {
        self.backgroundColor =  UIColor(hex: 0x2E3944)
        arrowLabel.textColor = UIColor.white
        titleLabel.textColor = UIColor.white
        titleLabel.numberOfLines = 0
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CollapsibleTableViewHeader.tapHeader(_:))))
    }

    //
    // Trigger toggle section when tapping on the header
    //
    func tapHeader(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? CollapsibleTableViewHeader else {
            return
        }
        delegate?.toggleSection(self, section: cell.section)
    }

    func setCollapsed(_ collapsed: Bool) {
        arrowLabel.rotate(collapsed ? 0.0 : .pi / 2)//Animation
    }
}
