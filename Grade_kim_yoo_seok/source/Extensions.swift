import Foundation

extension Double {

    /**
     Double's extension funcion
     - parameters:
        - places: 반올림할 자릿 수.
     - returns: rounded double value
     */
    func roundTo(places: UInt) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
