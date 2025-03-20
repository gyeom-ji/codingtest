import Foundation

let N = Int(readLine()!)!
let target = readLine()!.split{$0 == " "}.map{Int($0)!}
let M = Int(readLine()!)!
var graph = Array(repeating: Array(repeating: 0, count: 0), count: N + 1)
var visited = Array(repeating: false, count: N + 1)

for _ in 0..<M {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}

    graph[input[0]].append(input[1])
    graph[input[1]].append(input[0])
}

print(bfs(target[0]))

func bfs(_ start: Int) -> Int {
    var queue = [(start, 0)]
    visited[start] = true
    
    while !queue.isEmpty {
        let (cur, depth) = queue.removeFirst()
        
        if cur == target[1] {
            return depth
        }
        
        for next in graph[cur] {
            if !visited[next] {
                visited[next] = true
                queue.append((next, depth + 1))
            }
        }
    }
      return -1
}
