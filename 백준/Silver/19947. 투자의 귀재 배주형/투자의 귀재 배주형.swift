let input = readLine()!.split{$0 == " "}.map{Int($0)!}
var dp = Array(repeating: 0, count: input[1] + 1)
dp[0] = input[0]

for i in 1...input[1] {

    dp[i] = Int(Double(dp[i - 1]) * 1.05)

    if i >= 3 {
        dp[i] = max(dp[i], Int(Double(dp[i - 3]) * 1.2))
    }
    if i >= 5 {
        dp[i] = max(dp[i], Int(Double(dp[i - 5]) * 1.35))
    }
}

print(dp[input[1]])
