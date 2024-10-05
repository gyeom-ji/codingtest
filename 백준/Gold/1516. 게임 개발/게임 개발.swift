
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
            let maxTime = max(time[cur], dp[cur])
            inDegree[next] -= 1
            if inDegree[next] == 0 {
                queue.append(next)
            }
            dp[next] = max(dp[next], maxTime + time[next])
        }
    }
}
