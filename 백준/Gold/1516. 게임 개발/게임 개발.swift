
let N = Int(readLine()!)!
var graph = Array(repeating: Array(repeating: 0, count: 0), count: N + 1)
var inDegree = Array(repeating: 0, count: N + 1)
var time = Array(repeating: 0, count: N + 1)
var queue = [Int]()
var dp = Array(repeating: 0, count: N + 1)

for i in 1...N {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    if input.count > 2 {
        for j in 1..<input.count - 1 {
            inDegree[i] += 1
            graph[input[j]].append(i)
        }
    }
    time[i] = input[0]
}

for i in 1...N {
    if inDegree[i] == 0 {
        queue.append(i)
        dp[i] = time[i]
    }
}
bfs()

for i in 1...N {
    print(dp[i])
}

func bfs() {
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        
        for next in graph[cur] {
            inDegree[next] -= 1
            
            if inDegree[next] == 0 {
                queue.append(next)
            }
            // dp[next] 값과 dp[cur] + time[next] 값 중 더 큰 값을 dp[next]에 저장
            dp[next] = max(dp[next], dp[cur] + time[next])
        }
    }
}

/// ex
/// 3
/// 5 -1
/// 2 -1
/// 1 1 2 -1
/// 의 경우 5 2 6 이 정답이 되어야 함
