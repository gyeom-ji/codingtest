let N = Int(readLine()!)!
var map = Array(repeating: Array(repeating: (0,0), count: 0), count: N + 1)
var visited = Array(repeating: false, count: N + 1)
var result = Int.min

for _ in 1..<N {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    map[input[0]].append((input[1], input[2]))
    map[input[1]].append((input[0], input[2]))
}

visited[1] = true
dfs(1, 0)

print(result)

func dfs(_ cur: Int, _ val: Int) {
    result = max(result, val)

    for next in map[cur] where !visited[next.0] {
        visited[next.0] = true
        dfs(next.0, val + next.1)
    }
}