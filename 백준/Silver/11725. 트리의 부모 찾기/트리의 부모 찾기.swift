let input = Int(readLine()!)!
var map = Array(repeating: Array(repeating: 0, count: 0), count: input + 1)
var visited = Array(repeating: false, count: input + 1)
var result = Array(repeating: 0, count: input + 1)

for _ in 1..<input {
    let vertex = readLine()!.split{$0 == " "}.map{Int($0)!}
    map[vertex[0]].append(vertex[1])
    map[vertex[1]].append(vertex[0])
}

for i in 1...input where !visited[i]{
    visited[i] = true
    dfs(i)
}

for i in 2...input {
    print(result[i])
}

func dfs(_ cur: Int) {
    if map[cur].count == 0 {
        return
    }

    for next in map[cur] where !visited[next] {
        visited[next] = true
        if result[next] == 0 {
            result[next] = cur
        }
        dfs(next)
    }
}