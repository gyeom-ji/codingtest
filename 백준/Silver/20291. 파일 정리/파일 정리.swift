let N = Int(readLine()!)!
var dict = [String : Int]()

for _ in 0..<N {
    let file = readLine()!.split{ $0 == "." }.map{ String($0) }
    
    if let exist = dict[file[1]] {
        dict[file[1]]! += 1
    } else {
        dict[file[1]] = 1
    }
}

for element in dict.sorted(by: {$0.key < $1.key}) {
    print(element.key, element.value)
}
