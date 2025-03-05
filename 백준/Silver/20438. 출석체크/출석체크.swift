let input = readLine()!.split{$0 == " "}.map{Int($0)!}
let N = input[0], K = input[1], Q = input[2], M = input[3]
let sleepArr = readLine()!.split{$0 == " "}.map{Int($0)!}.sorted(by: <)
let codeArr = readLine()!.split{$0 == " "}.map{Int($0)!}.sorted(by: <)
var check = Array(repeating: 1, count: N + 3)
var dp = Array(repeating: 0, count: N + 3)

for i in 0..<K {
    check[sleepArr[i]] = -1
}

for i in 0..<Q {
    var codeNum = codeArr[i]
    var val = 2
    
    if check[codeNum] != -1 {
        while codeNum <= N + 2 {
            check[codeNum] = check[codeNum] == -1 ? -1 : 0
            codeNum = codeArr[i] * val
            val += 1
        }
    }
}

for i in 3..<N+3 {
    let value = check[i] == -1 ? 1 : check[i]
    dp[i] = dp[i - 1] + value
}

for _ in 0..<M {
    let range = readLine()!.split{$0 == " "}.map{Int($0)!}

    print(dp[range[1]] - dp[range[0] - 1])
}



