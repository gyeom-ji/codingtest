let N = Int(readLine()!)!
var numArr = readLine()!.split{$0 == " "}.map{Int($0)!}
var operation = readLine()!.split{$0 == " "}.map{Int($0)!}
var minValue = Int.max, maxValue = Int.min
var cur = numArr[0]

backTracking(1)

print(maxValue)
print(minValue)

func backTracking(_ index: Int) {
    if index == N {
        minValue = min(minValue, cur)
        maxValue = max(maxValue, cur)
        return
    }
    
    for i in 0..<4 {
        if operation[i] >= 1 {
            operation[i] -= 1
            let beforeCur = cur
            
            switch(i) {
            case 0:
                cur += numArr[index]
            case 1:
                cur -= numArr[index]
            case 2:
                cur *= numArr[index]
            case 3:
                if numArr[index] < 0 {
                    cur /= abs(numArr[index])
                    cur *= -1
                } else {
                    cur /= numArr[index]
                }
            default:
                break
            }
            backTracking(index + 1)
            cur = beforeCur
            operation[i] += 1
        }
    }
}
