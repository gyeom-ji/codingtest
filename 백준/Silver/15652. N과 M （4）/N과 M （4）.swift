let input = readLine()!.split{$0 == " "}.map{Int($0)!}
var anw = ""
var visited = Array(repeating: false, count: input[0] + 1)

backTracking(1, [])

print(anw)

func backTracking(_ cur: Int, _ arr: [Int]) {
    if arr.count == input[1] {
        anw += "\(arr.map{ String($0) }.joined(separator: " "))\n"
        return
    }
    if cur > input[0] {return}
    
    for i in cur...input[0] {
        backTracking(i, arr + [i])
    }
}
