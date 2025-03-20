import Foundation

let input = readLine()!.split{$0 == " "}.map{Int($0)!}
var graph = Array(repeating: Array(repeating: 0, count: 0), count: input[0] + 1)
var visited = Array(repeating: false, count: input[0] + 1)

for _ in 0..<input[1] {
    let vertices = readLine()!.split{$0 == " "}.map{Int($0)!}
    graph[vertices[0]].append(vertices[1])
    graph[vertices[1]].append(vertices[0])
}

graph = graph.map {$0.sorted()}

print(input[2], terminator: " ")
visited[input[2]] = true
dfs(input[2])

print()
print(input[2], terminator: " ")
visited = Array(repeating: false, count: input[0] + 1)
bfs(input[2])

func dfs(_ start: Int) {
    if graph[start].count == 0 {
        return
    }
    
    for next in graph[start] {
        if !visited[next] {
            visited[next] = true
            print(next, terminator: " ")
            dfs(next)
        }
    }
}

func bfs(_ start: Int) {
    var queue = [start]
    visited[start] = true
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        
        for next in graph[cur] {
            if !visited[next] {
                queue.append(next)
                visited[next] = true
                print(next, terminator: " ")
            }
        }
    }
}
