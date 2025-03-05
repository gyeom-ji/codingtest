let input = readLine()!.split{$0 == " "}.map{Int($0)!}
let N = input[0], M = input[1]
var dp = Array(repeating: Array(repeating: 0, count: M + 1), count: N + 1)

for i in 1...N {
    let arr = readLine()!.split{$0 == " "}.map{Int($0)!}
    for j in 1...M {
        dp[i][j] = dp[i][j - 1] + dp[i - 1][j] - dp[i - 1][j - 1] + arr[j - 1]
    }
}

let K = Int(readLine()!)!

for _ in 0..<K {
    let range = readLine()!.split{$0 == " "}.map{Int($0)!}
    let i = range[0], j = range[1], x = range[2], y = range[3]
    
    print(dp[x][y] - dp[i - 1][y] - dp[x][j - 1] + dp[i - 1][j - 1])
}
