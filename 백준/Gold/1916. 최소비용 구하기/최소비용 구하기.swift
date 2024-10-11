
let N = Int(readLine()!)!
let M = Int(readLine()!)!
var graph = Array(repeating: Array(repeating: (0,0), count: 0), count: N + 1)

for _ in 0..<M {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    graph[input[0]].append((input[1], input[2]))
}

let target = readLine()!.split{$0 == " "}.map{Int($0)!}

print(dijkstra(target[0])[target[1]])

func dijkstra(_ cur: Int) -> [Int] {
    var visited = Array(repeating: false, count: N + 1)
    var distance = Array(repeating: Int.max, count: N + 1)
    
    distance[cur] = 0
    
    for _ in 1...N {
        var minVertex = -1
        var minDist = Int.max

        // 미방문 정점 중 distance 값이 최소인 minVertex 찾기
        for j in 1...N {
            if !visited[j] && distance[j] < minDist {
                minDist = distance[j]
                minVertex = j
            }
        }
        
        // 도시가 연결되지 않은 경우 제외
        if minVertex != -1 {
            // 방문 표시
            visited[minVertex] = true
            
            // minVertex에 인접한 각 정점 중
            for (next, cost) in graph[minVertex] {
                // 미방문된 정점에 대해
                if !visited[next] {
                    let curDist = distance[next]
                    let newDist = distance[minVertex] + cost
                    
                    if newDist < curDist {
                        distance[next] = newDist // 간선 완화
                    }
                }
            }
        }
    }
    return distance
}
