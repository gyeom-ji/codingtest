let N = Int(readLine()!)!
let arr = readLine()!.split{$0 == " "}.map{Int($0)!}
var dp = Array(repeating: 0, count: N + 1)
var result = Int.min

for i in 1...N {
    dp[i] = dp[i - 1] + arr[i - 1]
}

// 1. 채집통 오른쪽
for i in 2..<N {
    let first = dp[N] - dp[1] - arr[i - 1]
    let second = dp[N] - dp[i]

    result = max(result, first + second)
}

// 2. 채집통 왼쪽
for i in 2..<N {
    let first = dp[N - 1] - arr[i - 1]
    let second = dp[i - 1]

    result = max(result, first + second)
}

// 3. 채집통 중앙
for i in 2..<N {
    let first = dp[i] - dp[1]
    let second = dp[N - 1] - dp[i - 1]

    result = max(result, first + second)
}


print(result)
