import UIKit


open
class Cell: UITableViewCell {

    override
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        initialize()
    }

    required public
    init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public static
    var cellID: String {
        return NSStringFromClass(Self.self)
    }

    func initialize() { }

}
