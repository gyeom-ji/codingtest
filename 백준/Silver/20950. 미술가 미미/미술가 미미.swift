let N = Int(readLine()!)!
let maxCnt = N > 7 ? 7 : N
var rgbArray = [[Int]]()
var visited = Array(repeating: false, count: N)

for _ in 0..<N {
    rgbArray.append(readLine()!.split{$0 == " "}.map{Int($0)!})
}

let gomdury = readLine()!.split{$0 == " "}.map{Int($0)!}
var mundury = [0, 0, 0]
var anw = Int.max

for i in 2...N {
    if i > 7 {
        break
    }
    backTracking(0, i, 0)
}

print(anw)

func backTracking(_ cur: Int,_ maxCnt: Int,_ cnt: Int) {
    if cnt == maxCnt {
        let r = abs((mundury[0] / maxCnt) - gomdury[0])
        let g = abs((mundury[1] / maxCnt) - gomdury[1])
        let b = abs((mundury[2] / maxCnt) - gomdury[2])
        
        anw = min(r + g + b, anw)
        return
    }
    for i in cur..<N {
        mundury[0] += rgbArray[i][0]
        mundury[1] += rgbArray[i][1]
        mundury[2] += rgbArray[i][2]
        
        backTracking(i + 1, maxCnt, cnt + 1)
        
        mundury[0] -= rgbArray[i][0]
        mundury[1] -= rgbArray[i][1]
        mundury[2] -= rgbArray[i][2]
    }
}
