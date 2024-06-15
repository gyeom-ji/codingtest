let input = readLine()!.split{ $0 == " "}.map{ Int(String($0))!}
var dict = [String: [(String, Bool)]]()
var cnt = 0, kind = Set<String>()
var anw = ""

for _ in 0..<input[0] + input[1] {
    let info = readLine()!.split{ $0 == " "}.map{ String($0)}
    dict[info[0], default: []].append((info[1], info[2] == "1" ? true : false))
}

let Q = Int(readLine()!)!

for _ in 0..<Q {
    let info = readLine()!.split{ $0 == "/"}.map{ String($0)}
    getFileCount(info.last!)
    anw += "\(kind.count) \(cnt) \n"

    kind.removeAll()
    cnt = 0
}

print(anw)

func getFileCount(_ start: String) {
    guard let exist = dict[start] else {
        return
    }
    
    for element in exist {
        if element.1 == false {
            kind.insert(element.0)
            cnt += 1
            getFileCount(element.0)
        } else {
            getFileCount(element.0)
        }
    }
    
}