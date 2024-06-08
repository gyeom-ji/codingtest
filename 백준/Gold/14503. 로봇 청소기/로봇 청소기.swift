var input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let N = input[0], M = input[1]

input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
var curR = input[0], curC = input[1]
var d = input[2]

var arr = [[Int]]()
var anw = 0
let dx = [1, -1, 0, 0], dy = [0, 0, 1, -1]

for _ in 0..<N {
    arr.append(readLine()!.split{ $0 == " " }.map{ Int($0)! })
}


roop:
while true {
    
    if arr[curR][curC] == 0 {
        anw += 1
        arr[curR][curC] = 2
    }
    
    for i in 0..<4 {
        if isPossible(curR + dx[i],curC + dy[i]) && arr[curR + dx[i]][curC + dy[i]] == 0 {
            
            if d == 0 {
                d = 3
            } else {
                d -= 1
            }
            let newCoordinate = moveForward(curR, curC)
            
            curR = newCoordinate.0
            curC = newCoordinate.1
            
            break
            
        } else if i == 3 {
            let newCoordinate = movebackward(curR, curC)
            
            if newCoordinate != (-1, -1) {
                curR = newCoordinate.0
                curC = newCoordinate.1
            } else {
                break roop
            }
        }
    }
}
print(anw)

func isPossible(_ r: Int, _ c: Int) -> Bool {
    return r >= 0 && r < N && c >= 0 && c < M
}

func moveForward(_ r: Int, _ c: Int) -> (Int, Int) {
    
    while true {
        switch(d) {
        case 0: // 북
            if (r - 1) >= 0 && arr[r - 1][c] != 1 && arr[r - 1][c] != 2 {
                return (r - 1, c)
            }
            d = 3
        case 1: // 동
            if (c + 1) < M && arr[r][c + 1] != 1 && arr[r][c + 1] != 2 {
                return (r, c + 1)
            }
            d -= 1
        case 2: // 남
            if (r + 1) < N && arr[r + 1][c] != 1 && arr[r + 1][c] != 2 {
                return (r + 1, c)
            }
            d -= 1
        case 3: // 서
            if (c - 1) >= 0 && arr[r][c - 1] != 1 && arr[r][c - 1] != 2 {
                return (r, c - 1)
            }
            d -= 1
        default:
            break
        }
    }
}

func movebackward(_ r: Int, _ c: Int) -> (Int, Int) {
    switch(d) {
        case 0: // 북
            if (r + 1) < N && arr[r + 1][c] != 1 {
                return (r + 1, c)
            }
        case 1: // 동
            if (c - 1) >= 0 && arr[r][c - 1] != 1 {
                return (r, c - 1)
            }
        case 2: // 남
            if (r - 1) >= 0 && arr[r - 1][c] != 1 {
                return (r - 1, c)
            }
        case 3: // 서
            if (c + 1) < M && arr[r][c + 1] != 1 {
                return (r, c + 1)
            }
        default:
            break
    }
    return (-1, -1)
}
