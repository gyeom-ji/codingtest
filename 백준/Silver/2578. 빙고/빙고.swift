var map = [[Int]]()

var anw = 0
var bingoCnt = 0
var bingoJ = Array(repeating: false, count: 5), bingoI = Array(repeating: false, count: 5)
var checkDia = [false, false]
var order = [Int]()

for _ in 0..<5 {
    map.append(readLine()!.split{ $0 == " " }.map{ Int($0)! })
}
for _ in 0..<5 {
    order.append(contentsOf: readLine()!.split{ $0 == " " }.map{ Int($0)! })
}

while bingoCnt < 3 {
    checkNum(order[anw])

    if anw > 4 {
        isColBingo()
        isRowBingo()
        isDiaBingo()
    }
    anw += 1
}

print(anw)

func checkNum(_ num: Int) {
    for i in 0..<5 {
        for j in 0..<5 {
            if map[i][j] == num {
                map[i][j] = -1
            }
        }
    }
}

func isColBingo() {
    for i in 0..<5 where !bingoI[i] {
        for j in 0..<5 {
            if map[i][j] != -1 {
                break
            } else if j == 4 {
                bingoCnt += 1
                bingoI[i] = true
            }
        }
    }
}

func isRowBingo() {
    for j in 0..<5 where !bingoJ[j] {
        for i in 0..<5 {
            if map[i][j] != -1 {
                break
            } else if i == 4 {
                bingoCnt += 1
                bingoJ[j] = true
            }
        }
    }
}

func isDiaBingo() {
    if !checkDia[0] {
        for i in 0..<5 {
            if map[i][i] != -1 {
                break
            } else if i == 4 {
                bingoCnt += 1
                checkDia[0] = true
            }
        }
    }
    if !checkDia[1] {
        for i in 0..<5 {
            if map[i][4 - i] != -1 {
                break
            } else if i == 4 {
                bingoCnt += 1
                checkDia[1] = true
            }
        }
    }
}
