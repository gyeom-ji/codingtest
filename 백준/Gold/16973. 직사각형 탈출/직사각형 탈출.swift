let size = readLine()!.split{$0 == " "}.map{Int($0)!}
let N = size[0], M = size[1]
var map = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: M), count: N)

for _ in 0..<N {
    let arr = readLine()!.split{$0 == " "}.map{Int($0)!}
    map.append(arr)
}

let input = readLine()!.split{$0 == " "}.map{Int($0)! - 1}
let H = input[0], W = input[1], Sr = input[2], Sc = input[3], Fr = input[4], Fc = input[5]
let x = [1, -1, 0, 0], y = [0, 0, 1, -1]

bfs()

func bfs() {
    var queue = [(Sr, Sc, 0)]
    visited[Sr][Sc] = true

    while !queue.isEmpty {
        let cur = queue.removeFirst()
        
        if (cur.0, cur.1) == (Fr, Fc) {
            print(cur.2)
            break
        }
        
        for i in 0..<4 {
            let newX = cur.0 + x[i]
            let newY = cur.1 + y[i]
            
            if isValid(newX, newY) && !visited[newX][newY] {
                if !isWall(newX, newY, i) {
                    visited[newX][newY] = true
                    queue.append((newX, newY, cur.2 + 1))
                }
            } else {
                continue
            }
        }
        if queue.isEmpty {
            print(-1)
        }
    }
}

func isWall(_ x: Int, _ y: Int, _ direction: Int) -> Bool {

    switch(direction) {
    case 0: // 아래
        for j in 0...W {
            if map[x + H][y + j] == 1 {
                return true
            }
        }
    case 1: // 위
        for j in 0...W {
            if map[x][y + j] == 1 {
                return true
            }
        }
    case 2: // 오른쪽
        for i in 0...H {
            if map[x + i][y + W] == 1 {
                return true
            }
        }
    case 3: // 왼쪽
        for i in 0...H {
            if map[x + i][y] == 1 {
                return true
            }
        }
    default:
        break
    }
    return false
}

func isValid(_ x: Int, _ y: Int) -> Bool {
    return x + H < N && y + W < M && x >= 0 && y >= 0
}
