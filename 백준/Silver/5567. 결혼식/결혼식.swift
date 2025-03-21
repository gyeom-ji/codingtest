let N = Int(readLine()!)!
let M = Int(readLine()!)!
var map = Array(repeating: Array(repeating: 0, count: 0), count: N + 1)
var visited = Array(repeating: false, count: N + 1)

for _ in 0..<M {
    let info = readLine()!.split{$0 == " "}.map{Int($0)!}
    map[info[0]].append(info[1])
    map[info[1]].append(info[0])
}

print(bfs(1))

func bfs(_ start: Int) -> Int {
    var queue = [(start, 0)]
    var result = 0
    visited[start] = true
    
    while !queue.isEmpty {
        let (cur, depth) = queue.removeFirst()
        
        for next in map[cur] {
            if !visited[next] {
                if depth < 2 {
                    queue.append((next, depth + 1))
                    visited[next] = true
                    result += 1
                }
            }
        }
    }
    return result
}
