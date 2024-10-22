let N = Int(readLine()!)!
var distance = Array(repeating: Array(repeating: Int.max, count:N), count: N)

for i in 0..<N {
    let info = Array(readLine()!)
    for j in 0..<N {
        if info[j] == "Y" {
            distance[i][j] = 1
        }
    }
}

floydWarshall()

print(countTwoFriends())

func floydWarshall() {
    for k in 0..<N {
        for i in 0..<N {
            for j in 0..<N {
                if i == j { continue }
                if distance[k][j] == Int.max || distance[i][k] == Int.max { continue }
                distance[i][j] = min(distance[i][j], distance[i][k] + distance[k][j])
            }
        }
    }
}


func countTwoFriends() -> Int {
    var maxCnt = 0
    for i in 0..<N {
        maxCnt = max(maxCnt, distance[i].filter{$0 < 3}.count)
    }
    return maxCnt
}

