let N = Int(readLine()!)!
let arr = readLine()!.split{$0 == " "}.map{Int($0)!}
var dp = Array(repeating: 0, count: N + 1)

for i in 1..<N {
    dp[i] = dp[i - 1]
    if arr[i - 1] > arr[i] {
        dp[i] += 1
    }
}

let Q = Int(readLine()!)!
for _ in 0..<Q {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    let i = input[0], j = input[1]
    print(dp[j - 1] - dp[i - 1])
}
