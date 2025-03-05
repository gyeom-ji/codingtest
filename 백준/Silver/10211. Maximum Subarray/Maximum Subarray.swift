let K = Int(readLine()!)!

for _ in 0..<K {
    let N = Int(readLine()!)!
    let arr = readLine()!.split{$0 == " "}.map{Int($0)!}
    var dp = Array(repeating: 0, count: N + 1)
    var result = Int.min
    
    for i in 1...N {
        dp[i] = max(dp[i - 1] + arr[i - 1], arr[i - 1])
        result = max(dp[i], result)
    }
    
    print(result)
}
