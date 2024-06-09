let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let R = input[0], C = input[1]
var T = input[2]
var map = [[Int]]()
let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

for _ in 0..<R {
    map.append(readLine()!.split{ $0 == " " }.map{ Int($0)! })
}

var airPurifier = findAirPurifier()

while T > 0 {
    spreadOfFineDust()
    workAirPurifier()
    T -= 1
}

print(countDust())

func findAirPurifier() -> (Int, Int){
    for i in 0..<R {
        if map[i][0] == -1 {
            return (i, i + 1)
        }
    }
    return (0, 0)
}

func spreadOfFineDust() {
    var newMap = map
    
    for i in 0..<R {
        for j in 0..<C {
            if map[i][j] != 0 && map[i][j] != -1 {
                var cnt = 0
                let amount = map[i][j] / 5
                for k in 0..<4 {
                    if isPossible(i + dx[k], j + dy[k]) && map[i + dx[k]][j + dy[k]] != -1 {
                        newMap[i + dx[k]][j + dy[k]] += amount
                        cnt += 1
                    }
                }
                newMap[i][j] -= (amount * cnt)
            }
        }
    }
    map = newMap
}

func isPossible(_ r: Int, _ c: Int) -> Bool {
    return r >= 0 && r < R && c >= 0 && c < C
}

func workAirPurifier() {
    var pre = map[airPurifier.0][1]
    map[airPurifier.0][1] = 0
    
    // airPurifier.0
    for j in 2..<C {
       let cur = map[airPurifier.0][j]
       map[airPurifier.0][j] = pre
       pre = cur
    }
    
    for i in (0..<airPurifier.0).reversed() {
        let cur = map[i][C - 1]
        map[i][C - 1] = pre
        pre = cur
    }
    
    for j in (0..<C - 1).reversed() {
       let cur = map[0][j]
       map[0][j] = pre
       pre = cur
    }
    
    for i in (1..<airPurifier.0) {
        let cur = map[i][0]
        map[i][0] = pre
        pre = cur
    }

    // airPurifier.1
    pre = map[airPurifier.1][1]
    map[airPurifier.1][1] = 0
    
    for j in 2..<C {
       let cur = map[airPurifier.1][j]
       map[airPurifier.1][j] = pre
       pre = cur
    }
    
    for i in airPurifier.1 + 1..<R {
        let cur = map[i][C - 1]
        map[i][C - 1] = pre
        pre = cur
    }
    
    for j in (0...C - 2).reversed() {
       let cur = map[R - 1][j]
       map[R - 1][j] = pre
       pre = cur
    }

    for i in (airPurifier.1 + 1..<R - 1).reversed() {
        let cur = map[i][0]
        map[i][0] = pre
        pre = cur
    }
}


func countDust() -> Int {
    var dCnt = 2
    
    for i in 0..<R {
        for j in 0..<C {
            dCnt += map[i][j]
        }
    }
    return dCnt
}
