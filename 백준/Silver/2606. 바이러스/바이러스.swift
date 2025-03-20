import Foundation

let N = Int(readLine()!)!
let MAX = Int(readLine()!)!
var cnt = 0
var graph = Array(repeating:Array(repeating: 0, count: 0), count: N + 1)
var visited = Array(repeating: false, count: N + 1)
var result = 0

while cnt < MAX {
    let pair = readLine()!.split{$0 == " "}.map{Int($0)!}
    graph[pair[0]].append(pair[1])
    graph[pair[1]].append(pair[0])
    cnt += 1
}

visited[1] = true
dfs(1)
print(result)

func dfs(_ cur: Int) {

    if graph[cur].count == 0 {
        return
    }
    
    for next in graph[cur] {
        if !visited[next] {
            visited[next] = true
            result += 1
            dfs(next)
        }
    }
}
