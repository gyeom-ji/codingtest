let N = Int(readLine()!)!
var arr = readLine()!.split{$0 == " "}.map{Int($0)!}
var dp = Array(repeating: 1001, count: 1001)
dp[0] = 0

for i in 0..<N {
    if arr[i] > 0 {
        for j in 1...arr[i] where i + j < N {
            dp[i + j] = min(dp[i] + 1, dp[i + j])
        }
    }
}
if dp[N - 1] == 1001 {
    print(-1)
} else {
    print(dp[N - 1])
}
