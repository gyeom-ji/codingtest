let input = readLine()!.split{$0 == " "}.map{Int($0)!}
let arr = readLine()!.split{$0 == " "}.map{Int($0)!}
var dp = Array(repeating:0, count: input[0] + 1)
var count = Array(repeating:0, count: input[1])
var result = 0

for i in 1...input[0] {
    dp[i] = dp[i - 1] + arr[i - 1]
    count[dp[i] % input[1]] += 1
}

for i in 0..<input[1] {
    result += (count[i] * (count[i] - 1)) / 2
}

print(result + count[0])

