let N = Int(readLine()!)!
let maxCnt = N > 7 ? 7 : N
var rgbArray = [[Int]]()

for _ in 0..<N {
    rgbArray.append(readLine()!.split{$0 == " "}.map{Int($0)!})
}

let gomdury = readLine()!.split{$0 == " "}.map{Int($0)!}
var mundury = [0, 0, 0]
var anw = Int.max

// 물감은 최소 2개 색 혼합
for i in 2...N {
    // 최대 7개 색 혼합 가능
    if i > 7 {
        break
    }
    backTracking(0, i, 0)
}

print(anw)

func backTracking(_ cur: Int,_ maxCnt: Int,_ cnt: Int) {
    // 현재 물감 갯수 == 최대 물감 갯수
    if cnt == maxCnt {
        // 혼합된 물감의 r, g, b 값을 물감의 개수로 나눠 새로운 r, g, b 값 구함
        // 새로운 r, g, b 값과 곰두리 값의 차이를 구함
        let r = abs((mundury[0] / maxCnt) - gomdury[0])
        let g = abs((mundury[1] / maxCnt) - gomdury[1])
        let b = abs((mundury[2] / maxCnt) - gomdury[2])
        
        // 최솟값으로 anw를 갱신
        anw = min(r + g + b, anw)
        return
    }
    
    for i in cur..<N {
        // 문두리색에 i번째 물감 rgb값 +
        mundury[0] += rgbArray[i][0]
        mundury[1] += rgbArray[i][1]
        mundury[2] += rgbArray[i][2]
        
        backTracking(i + 1, maxCnt, cnt + 1)
        
        // 문두리색에 i번째 물감 rgb값 -
        mundury[0] -= rgbArray[i][0]
        mundury[1] -= rgbArray[i][1]
        mundury[2] -= rgbArray[i][2]
    }
}
