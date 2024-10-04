let N = Int(readLine()!)!
var numArr = readLine()!.split{$0 == " "}.map{Int($0)!}
// 0 : +, 1 : -, 2 : *, 3 : /
var operation = readLine()!.split{$0 == " "}.map{Int($0)!}
var operationCnt = 4
var maxValue = Int.min, minValue = Int.max
var cur = numArr[0]

backTracking(1)

print(maxValue)
print(minValue)

func backTracking(_ index: Int) {
    if index == N {
        maxValue = max(maxValue, cur)
        minValue = min(minValue, cur)
        return
    }
    
    for i in 0..<operationCnt {
        if operation[i] >= 1 {
            
            operation[i] -= 1
            let beforeCur = cur
            
            switch (i) {
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
            operation[i] += 1
            cur = beforeCur
        } else {
            continue
        }
    }
}

