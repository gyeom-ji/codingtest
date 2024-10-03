let input = readLine()!.split{$0 == " "}.map{Int($0)!}
var inputArray = readLine()!.split{$0 == " "}.map{Int($0)!}.sorted(by: <)
var anw = ""

backTracking(0, [])

print(anw)

func backTracking(_ cur: Int, _ arr: [Int]) {
    if arr.count == input[1] {
        anw += "\(arr.map{ String($0) }.joined(separator: " "))\n"
        return
    }
    
    if cur > input[0] - 1 {return}
    
    for i in cur..<input[0] {
        if !arr.contains(inputArray[i]){
            backTracking(i + 1, arr + [inputArray[i]])
        }
    }
}
