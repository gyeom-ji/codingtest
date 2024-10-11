let T = Int(readLine()!)!
var graph = [[Int]]()
var inDegree = [Int]()
var queue = [Int]()
var dp = [(Int, Int)]()
var anw = ""

for _ in 0..<T {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    graph = Array(repeating: Array(repeating: 0, count: 0), count: input[1] + 1)
    inDegree = Array(repeating: 0, count: input[1] + 1)
    dp = Array(repeating: (0, 0), count: input[1] + 1)
    
    for _ in 0..<input[2] {
        let edge = readLine()!.split{$0 == " "}.map{Int($0)!}
        graph[edge[0]].append(edge[1])
        inDegree[edge[1]] += 1
    }
    
    for i in 1...input[1] {
        if inDegree[i] == 0 {
            dp[i] = (1, 1)
            queue.append(i)
        }
    }
    bfs()
    anw += "\(input[0]) \(dp[input[1]].0)\n"
}

print(anw)

func bfs() {
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        
        for next in graph[cur] {
            inDegree[next] -= 1
            if dp[next].0 == dp[cur].0 {
                dp[next].1 += 1
            } else if dp[next].0 < dp[cur].0 {
                dp[next] = (dp[cur].0, 1)
            }
            
            if inDegree[next] == 0 {
                if dp[next].1 > 1 {
                    dp[next].0 += 1
                }
                queue.append(next)
            }
        }
    }
}
