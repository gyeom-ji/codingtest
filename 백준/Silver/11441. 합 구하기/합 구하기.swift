let N = Int(readLine()!)!
let arr = readLine()!.split{$0 == " "}.map{Int($0)!}
let M = Int(readLine()!)!
var dp = Array(repeating: 0, count: N + 1)

for i in 1...N {
    dp[i] = dp[i - 1] + arr[i - 1]
}

for _ in 0..<M {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}

    print(dp[input[1]] - dp[input[0] - 1])
}