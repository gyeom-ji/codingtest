let T = Int(readLine()!)!
var anw = ""

for _ in 0..<T {
    let N = Int(readLine()!)!
    var zero = Array(repeating: 0, count: N + 1)
    var one = Array(repeating: 0, count: N + 1)
    
    zero[0] = 1
    
    if N >= 1 {
        one[1] = 1
    }
    if N >= 2 {
        for i in 2...N{
            zero[i] = zero[i - 1] + zero[i - 2]
            one[i] = one[i - 1] + one[i - 2]
        }
    }

    anw += "\(zero[N]) \(one[N])\n"
}
print(anw)
