let input = Int(readLine()!)!
var arr = readLine()!.split{$0 == " "}.map{Int($0)!}
var smaller = Array(repeating: 0, count: input)
var bigger = Array(repeating: 0, count: input)

for i in 1..<input {
    smaller[i] = smaller[i - 1] + 1
    bigger[i] = bigger[i - 1] + 1
    
    if arr[i - 1] < arr[i] {
        bigger[i] = 0
    } else if arr[i] < arr[i - 1]{
        smaller[i] = 0
    }
}

var smallMax = smaller.max()!
var bigMax = bigger.max()!

print(max(smallMax, bigMax) + 1)

