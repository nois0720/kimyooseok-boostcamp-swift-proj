import Foundation

extension Double {

    /**
     Double extension funcion으로 'n'번째 자릿수에서 반올림하는 함수입니다.
     - parameters:
        - places: 반올림할 자릿 수.
     - returns: rounded double value
     */
    func roundTo(places: UInt) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
