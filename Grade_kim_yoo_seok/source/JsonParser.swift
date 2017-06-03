import Foundation

let fm = FileManager.default

/**
 json 파일을 파싱하여 해당 json을 callback함수의 argument로 전달해주는 함수입니다.
 
 - parameters:
    - dir: 읽어올 json 파일의 디렉터리. ex) "/Home/Users/example.json"
    - callback: 읽은 json 파일이 유효한 경우 호출되는 콜백함수.
 */
func parseJsonFile(dir: String, callback:(([Any]) -> Void)) {
    do {
        if let file = Bundle.main.url(forAuxiliaryExecutable: dir) {
            let data = try Data(contentsOf: file)
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            
            if let object = json as? [Any] {
                callback(object)
            } else {
                print("It is invalid Json format")
            }
        } else {
            print("File does not exist")
        }
    } catch {
        print(error.localizedDescription)
    }
}

/**
 argument로 받은 json의 데이터를 Users/user_name/result.txt에 write하는 함수입니다.
 
 - parameters:
    - json: 저장할 json 데이터
 */
func WriteResultFile(json: [Any]){
    var studentGrades: Array<StudentGrade> = Array<StudentGrade>()
    
    for subJson in json {
        if let obj = subJson as? [String: Any],
            let name = obj["name"] as? String,
            let grades = obj["grade"] as? [String: Any] {
            let studentGrade = StudentGrade(name: name)
            
            for grade in grades {
                if let score = grade.value as? Int {
                    studentGrade.gradeDictionary[grade.key] = score
                }
            }
            
            studentGrades.append(studentGrade)
        }
    }
    
    // sort orderby name alphabetically
    studentGrades.sort{$0.name < $1.name}
    
    let path = "\(NSHomeDirectory())/result.txt"
    
    //writing
    do {
        let resultTxt = makeResultText(sgs: studentGrades)
        try resultTxt.write(toFile: path,
                            atomically: false,
                            encoding: String.Encoding.utf8)
        print("success to write \(path)")
    }
    catch {
        print("error writing to path:", path, error)
    }
}

/**
 result.txt에 저장할 text 내용을 만들어주는 함수입니다.
 
 - parameters:
    - sgs: 내용을 만들기 위한 StudentGrade의 Array입니다.
 - returns: 저장을 위한 text 내용
 */
func makeResultText(sgs: Array<StudentGrade>) -> String {
    var avg: Double = 0
    
    for sg in sgs {
        avg += sg.avg
    }
    
    avg /= (Double)(sgs.count)
    avg = avg.roundTo(places: 2)
    
    var text = "성적결과표" +
        "\n\n전체 평균 : \(avg)" +
    "\n\n개인별 학점\n"
    
    for sg in sgs {
        text.append("\(sg.name) \t: \(sg.grade)\n")
    }
    
    text.append("\n수료생\n")
    for sg in sgs {
        if sg.avg >= 70 {
            text.append("\(sg.name), ")
        }
    }
    
    for _ in 0..<2 {
        text.remove(at: text.index(before: text.endIndex))
    }
    
    print(text)
    return text
}
