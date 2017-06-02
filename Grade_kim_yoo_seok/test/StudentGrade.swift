import Foundation

class StudentGrade {
    /// student's name
    var name: String

    /// Dictionary. key: subject_name, value: score
    var gradeDictionary: Dictionary<String, Int>
    
    /// student's score average. read-only property.
    var avg: Double {
        var sum: Int = 0
        for grade in self.gradeDictionary {
            sum += grade.value
        }
        return Double(sum) / Double(self.gradeDictionary.count)
    }
    
    /// student's average grade. read-only property.
    var grade: Character {
        switch avg{
        case 60..<70:
            return "D"
        case 70..<80:
            return "C"
        case 80..<90:
            return "B"
        case 90..<100:
            return "A"
        default:
            return "F"
        }
    }

    /**
     Constructor.
     - parameters:
     - name : student's name
     */
    init(name : String) {
        self.name = name
        self.gradeDictionary = [String: Int]()
    }
}
