let input = readLine()!.split{$0 == " "}.map{Int($0)!}
var inputArray = readLine()!.split{$0 == " "}.map{Int($0)!}.sorted(by: <)
var anw = Set<String>()
var visited = Array(repeating: false, count: input[0] + 1)

backTracking(0, [])

func backTracking(_ cur: Int, _ arr: [String]) {
    if arr.count == input[1] {
        let checkStr = arr.joined(separator: " ")
        if !anw.contains(checkStr) {
            anw.insert(checkStr)
            print(checkStr)
        }
        return
    }
    if cur > input[0] - 1 {
        return
    }
    
    for i in cur..<input[0] where !visited[i]{
        visited[i] = true
        backTracking(i + 1, arr + ["\(inputArray[i])"])
        visited[i] = false
    }
}
