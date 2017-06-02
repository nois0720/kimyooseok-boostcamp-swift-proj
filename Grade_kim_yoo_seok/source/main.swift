import Foundation

let fileDir = "\(NSHomeDirectory())/students.json"

if let json = parseJsonFile(dir: fileDir) {
    WriteResultFile(json: json)
} else {
    print("--- Fail to parse json ---")
}
