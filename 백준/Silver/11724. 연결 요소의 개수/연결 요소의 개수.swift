let input = readLine()!.split{$0 == " "}.map{Int($0)!}
var map = Array(repeating: Array(repeating: 0, count: 0), count: input[0] + 1)
var visited = Array(repeating: false, count: input[0] + 1)
var result = 0

for _ in 0..<input[1] {
    let vertex = readLine()!.split{$0 == " "}.map{Int($0)!}
    map[vertex[0]].append(vertex[1])
    map[vertex[1]].append(vertex[0])
}

for i in 1...input[0] {
    if !visited[i] {
        visited[i] = true
        dfs(i)
        result += 1
    }
}
print(result)


func dfs(_ cur: Int) {
    if map[cur].count == 0 {
        return
    }

    for next in map[cur] where !visited[next] {
        visited[next] = true
        dfs(next)
    }
}