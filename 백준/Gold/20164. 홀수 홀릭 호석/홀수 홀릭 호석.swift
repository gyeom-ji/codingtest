let N = Array(readLine()!)
var minCnt = Int.max, maxCnt = Int.min

divideNum(N, countOddNum(N))

print(minCnt, maxCnt)

func divideNum(_ arr: [Character], _ sum: Int) {
   
    if arr.count > 2 {
        for i in 0..<arr.count - 2 {
            for j in i + 1..<arr.count - 1 {
                let first = arr[...i].map {String($0)}.joined()
                let second = arr[(i + 1)...j].map {String($0)}.joined()
                let third = arr[(j + 1)...].map {String($0)}.joined()
                let newArr = Array(String(Int(first)! + Int(second)! + Int(third)!))
                let cnt = countOddNum(newArr)
                
                divideNum(newArr, sum + cnt)
            }
        }
    } else if arr.count == 2 {
        let newArr = Array(String(Int(String(arr[0]))! + Int(String(arr[1]))!))
        let cnt = countOddNum(newArr)
        
        divideNum(newArr, sum + cnt)
        
    } else {
        minCnt = min(minCnt, sum)
        maxCnt = max(maxCnt, sum)
    }
}


func countOddNum(_ arr: [Character]) -> Int {
    var cnt = 0
    for i in 0..<arr.count {
        if Int(String(arr[i]))! % 2 != 0 {
            cnt += 1
        }
    }
    return cnt
}
