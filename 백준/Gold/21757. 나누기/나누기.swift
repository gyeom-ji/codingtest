let N = Int(readLine()!)!
let arr = readLine()!.split{$0 == " "}.map{Int($0)!}
var sum = Array(repeating: 0, count: N + 1)
var dp = Array(repeating:0, count: 4)
var result = 0

dp[0] = 1

// 누적합 구하기
for i in 1...N {
    sum[i] = sum[i - 1] + arr[i - 1]
}

// 전체 배열의 합이 4의 배수가 아닌 경우
if sum[N] % 4 != 0 {
    result = 0
    
} else {
    let quotient = sum[N] / 4
    
    // 전체 배열의 합이 0인 경우
    // 마지막 인덱스는 항상 포함됨
    // 마지막 인덱스를 뺀 서로 다른 N-1개에서 3개를 선택
    // (N - 1)C3
    if quotient == 0 {
        result = (N - 1) * (N - 2) * (N - 3) / 6
    } else {
        for i in 1..<N {
            let index = sum[i] / quotient
            // sum[i]가 몫으로 나눠 떨어질 경우
            if sum[i] % quotient == 0 {
                // dp[index] = index 구간까지 나눌 수 있는 경우의 수
                // 현재 index구간을 나눌 수 있는 경우의 수 = (index-1)구간까지 만들 수 있는 경우의 수 + 현재 index번째 구간을 나눌 수 있는 경우의 수
                // dp[index] = dp[index] + dp[index-1]
                dp[index] += dp[index - 1]
            }
        }
        result = dp[3]
    }
}
print(result)
