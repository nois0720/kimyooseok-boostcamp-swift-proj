import Foundation

let fileDir = "\(NSHomeDirectory())/students.json"

parseJsonFile(dir: fileDir, callback: WriteResultFile)
