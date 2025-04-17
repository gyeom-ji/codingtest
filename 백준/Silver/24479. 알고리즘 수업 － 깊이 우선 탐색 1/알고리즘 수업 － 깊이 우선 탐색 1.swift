let input = readLine()!.split{$0 == " "}.map{Int($0)!}
var map = Array(repeating: Array(repeating: 0, count: 0), count: input[0] + 1)
var visited = Array(repeating: false, count: input[0] + 1)
var result = Array(repeating: 0, count: input[0])
var cnt = 1

for _ in 0..<input[1] {
    let arr = readLine()!.split{$0 == " "}.map{Int($0)!}
    map[arr[0]].append(arr[1])
    map[arr[1]].append(arr[0])
}

dfs(input[2])

for i in 1...input[0] where !visited[i] {
    result[i - 1] = 0
}

print(result.map{String($0)}.joined(separator: "\n"))

func dfs(_ cur: Int) {
    visited[cur] = true
    result[cur - 1] = cnt
    cnt += 1
    
    for next in map[cur].sorted() where !visited[next] {
        visited[next] = true
        dfs(next)
    }
}