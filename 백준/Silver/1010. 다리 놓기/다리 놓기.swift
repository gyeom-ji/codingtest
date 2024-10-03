/// 중복이 없고 순서와 상관 없이 선택 하는 경우의 수 = 조합 nCr

let T = Int(readLine()!)!
/// dp[n][r] = nCr
var dp = Array(repeating: Array(repeating: 0, count: 31), count: 31)

for n in 0...30 {
    for r in 0...n {
        /// 초기값
        /// nC0 = 1, nCn = 1
        if n == r || r == 0 {
            dp[n][r] = 1
            continue
        }
        /// 점화식
        /// nCr = n-1Cr-1 + n-1Cr
        dp[n][r] = dp[n - 1][r - 1] + dp[n - 1][r]
    }
}

for _ in 0..<T {
    let info = readLine()!.split{$0 == " "}.map{Int($0)!}
    let n = info[1], r = info[0]
    print(dp[n][r])
}
