let N = Int(readLine()!)!
var scheduleArr = [(Int, Int)]()
var maxEnd = Int.min

for _ in 0..<N {
    let schedule = readLine()!.split{ $0 == " " }.map{Int(String($0))!}
    scheduleArr.append((schedule[0], schedule[1]))
    maxEnd = max(maxEnd, schedule[1])
}

scheduleArr.sort(by: {
    if $0.0 == $1.0 {
        return $0.1 > $1.1
    }
    return $0.0 < $1.0
})

var arr = Array(repeating: Array(repeating: -1, count: N), count: maxEnd + 1)
var anw = [Int]()
var start = scheduleArr[0].0, end = scheduleArr[0].1, maxIndex = 0
for i in 0..<N {
    let index = maxIndex(scheduleArr[i].0, scheduleArr[i].1)
    if end == scheduleArr[i].0 - 1 || end >= scheduleArr[i].0 {
        end = max(end, scheduleArr[i].1)
    } else {
        anw.append(((end - start) + 1) * (maxIndex + 1))
        start = scheduleArr[i].0
        end = scheduleArr[i].1
        maxIndex = 0
    }
    maxIndex = max(maxIndex, index)
   
    for j in scheduleArr[i].0...scheduleArr[i].1 {
        arr[j][index] = i
    }
}
anw.append(((end - start) + 1) * (maxIndex + 1))
print(anw.reduce(0, +))

func maxIndex(_ curStart: Int, _ curEnd: Int) -> Int {
    var index = 0
    for i in curStart...curEnd {
        for j in 0..<N {
            if arr[i][j] == -1 {
                index = max(j, index)
                break
            }
        }
    }
    return index
}
