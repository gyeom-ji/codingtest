let C = Int(readLine()!)!
var maxCnt = 11
var visitedPerson = Array(repeating: false, count: 11)
var visitedPosition = Array(repeating: false, count: 11)
var maxValue = Int.min
var curValue = 0

for _ in 0..<C {
    var playerInfo = [[Int]]()
    for _ in 0..<maxCnt {
        playerInfo.append(readLine()!.split{$0 == " "}.map{Int($0)!})
    }
    backTracking(0, playerInfo)
    print(maxValue)
    maxValue = Int.min
    curValue = 0
}

func backTracking(_ cnt: Int, _ playerInfo: [[Int]]){
    if cnt == maxCnt {
        maxValue = max(maxValue, curValue)
        return
    }
    
    
    for j in 0..<maxCnt where !visitedPosition[j] {
        if playerInfo[cnt][j] != 0 {
            visitedPosition[j] = true
            curValue += playerInfo[cnt][j]
            
            backTracking(cnt + 1, playerInfo)
            
            visitedPosition[j] = false
            curValue -= playerInfo[cnt][j]
        }
    }
}
