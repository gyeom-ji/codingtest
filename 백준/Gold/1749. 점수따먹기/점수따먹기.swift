let input = readLine()!.split{$0 == " "}.map{Int($0)!}
var dp = Array(repeating: Array(repeating: 0, count: input[1] + 1), count: input[0] + 1)
var result = Int.min

for i in 1...input[0] {
    let arr = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    for j in 1...input[1] {
        dp[i][j] = dp[i - 1][j] + dp[i][j - 1] + arr[j - 1] - dp[i - 1][j - 1]
    }
}

for i in 1...input[0] {
    for j in 1...input[1] {
        for x in i...input[0] {
            for y in j...input[1] {
                result = max(result, dp[x][y] - dp[i - 1][y] - dp[x][j - 1] + dp[i - 1][j - 1])
            }
        }
    }
}
print(result)
