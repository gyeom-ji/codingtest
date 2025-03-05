let input = readLine()!.split{$0 == " "}.map{Int($0)!}
var dp = Array(repeating: Array(repeating: 0, count: input[1] + 1), count: input[0] + 1)
var result = [Int]()

for i in 1...input[0] {
    let inputLine = readLine()!.split{$0 == " "}.map{Int($0)!}

    for j in 1...input[1] {
        dp[i][j] = dp[i - 1][j] + dp[i][j - 1] - dp[i - 1][j - 1] + inputLine[j - 1]
    }
}

let K = Int(readLine()!)!
for _ in 0..<K {
    let inputLine = readLine()!.split{$0 == " "}.map{Int($0)!}
    let i = inputLine[0], j = inputLine[1], x = inputLine[2], y = inputLine[3]
    
    result.append(dp[x][y] - dp[x][j - 1] - dp[i - 1][y] + dp[i - 1][j - 1])
}

print(result.map{String($0)}.joined(separator: "\n"))
