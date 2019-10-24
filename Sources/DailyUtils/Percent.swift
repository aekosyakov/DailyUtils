import UIKit

public
struct Percent {

    public
    let fraction: CGFloat

    public
    var value: CGFloat {
        return fraction * 100
    }

    public
    init(fraction: CGFloat) {
        self.fraction = fraction
    }

    public
    init(value: CGFloat) {
        self.init(fraction: value / 100)
    }

}

postfix operator %

public postfix
func %(percentValue: CGFloat) -> Percent {
    return Percent(value: percentValue)
}


public
extension CGFloat {

    var percent: Percent {
        return Percent(fraction: self)
    }

}
