import UIKit

open
class View: UIView {

    override
    init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    required public
    init() {
        super.init(frame: .zero)
        initialize()
    }

    required public
    init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open
    func initialize() { }

}
