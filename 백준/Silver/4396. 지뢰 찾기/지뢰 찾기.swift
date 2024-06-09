let N = Int(readLine()!)!
var originMap = [[Character]]()
var openMap = [[Character]]()
var anw = Array(repeating: Array(repeating: ".", count: N), count: N)
let dx = [-1,-1,-1,0,0,1,1,1], dy = [-1,0,1,-1,1,-1,0,1]
var isLandMineOpen = false

for i in 0..<N {
    originMap.append(Array(readLine()!))
}

for i in 0..<N {
    openMap.append(Array(readLine()!))
}

setMap()
if isLandMineOpen {
    setLandMine()
}
printMap()

func setMap() {
    for i in 0..<N {
        for j in 0..<N {
            var cnt = 0
            if openMap[i][j] == "x" {
                if originMap[i][j] == "*" || isLandMineOpen {
                    isLandMineOpen = true
                }
                for k in 0..<8 {
                    if isPossible(i + dx[k], j + dy[k]) {
                        if originMap[i + dx[k]][j + dy[k]] == "*" {
                            cnt += 1
                        }
                    }
                }
                anw[i][j] = String(cnt)
            }
        }
    }
}

func setLandMine() {
    for i in 0..<N {
        for j in 0..<N {
            if originMap[i][j] == "*" {
                anw[i][j] = "*"
            }
        }
    }
}

func printMap() {
    for i in 0..<N {
        for j in 0..<N {
            print(anw[i][j], terminator: "")
        }
        print()
    }
}

func isPossible(_ r: Int, _ c: Int) -> Bool {
    return r >= 0 && r < N && c >= 0 && c < N
}
