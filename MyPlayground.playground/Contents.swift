import UIKit
import PlaygroundSupport

//--1
let round = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 250))
round.backgroundColor = .magenta
PlaygroundPage.current.liveView = round


extension UIView {
    func bounceOut(duration: TimeInterval) {
        UIView.animate(withDuration: duration) { [weak self] in
            self?.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        }
    }
}

let view = UIView(frame: CGRect(x: 150, y: 25, width: 200, height: 200))
view.layer.cornerRadius = 100
view.backgroundColor = .tintColor
round.addSubview(view)
view.bounceOut(duration: 1.0)


//--2

extension Int {
    func times(action: () -> Void) {
        guard self > 0 else { return }
        for _ in 0 ..< self {
            action()
        }
    }
}

5.times {
    print("Hello!")
}

//--3

extension Array where Element: Comparable {
    mutating func removeItem(item: Element) {
        if let index = self.firstIndex(of: item) {
            self.remove(at: index)
        }
    }
}

var list = ["yellow", "blue", "blue", "red", "black"]
list.removeItem(item: "blue")
print(list)
