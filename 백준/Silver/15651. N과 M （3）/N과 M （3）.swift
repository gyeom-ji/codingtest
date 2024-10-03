let input = readLine()!.split{$0 == " "}.map{Int($0)!}
var anw = ""

backTracking(1, [])

print(anw)

func backTracking(_ cur: Int, _ arr: [Int]) {
    if arr.count == input[1] {
        anw += "\(arr.map{ String($0) }.joined(separator: " "))\n"
        return
    }
    for i in 1...input[0] {
        backTracking(i + 1, arr + [i])
    }
}
