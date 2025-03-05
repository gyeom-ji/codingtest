let input = readLine()!.split{$0 == " "}.map{ Int($0)! }
let arr = readLine()!.split{$0 == " "}.map{Int($0)!}

var result = Int.min
var dp = Array(repeating: 0, count: input[0] + 1)

dp[0] = 0
dp[1] = arr[0]


for i in 1..<input[0] {
    dp[i + 1] = dp[i] + arr[i]
}

for i in 0..<input[0] - input[1] + 1{
    result = max(result, dp[i + input[1]] - dp[i])
}



print(result)
