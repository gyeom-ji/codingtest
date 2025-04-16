let N = Int(readLine()!)!

let dx = [1, 0, -1, 0], dy = [0, 1, 0, -1]
var map = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: N), count: N)
var maxValue = Int.min
var minValue = Int.max
var result = 1

for _ in 0..<N {
    let arr = readLine()!.split{$0 == " "}.map{Int($0)!}
    maxValue = max(arr.max()!, maxValue)
    minValue = min(arr.min()!, minValue)
    map.append(arr)
}

while minValue < maxValue {
    visited = Array(repeating: Array(repeating: false, count: N), count: N)
    var location = findNextLocation()
    var cnt = 0
    while location != (-1, -1) {
        bfs(location)
        cnt += 1
        location = findNextLocation()
    }
    minValue += 1
    result = max(result, cnt)
}

print(result)

func bfs(_ start: (Int, Int)) {
    var queue = [start]
    visited[start.0][start.1] = true

    while !queue.isEmpty {
        let cur = queue.removeFirst()

        for i in 0..<4 {
            let newX = cur.0 + dx[i]
            let newY = cur.1 + dy[i]

            if isValid(newX, newY) && !visited[newX][newY] {
                visited[newX][newY] = true
                queue.append((newX, newY))
            }
        }
    }
}

func isValid(_ x: Int, _ y: Int) -> Bool {
    return x >= 0 && y >= 0 && x < N && y < N && map[x][y] > minValue
}

func findNextLocation() -> (Int, Int) {
    for i in 0..<N {
        for j in 0..<N {
            if map[i][j] > minValue && !visited[i][j] {
                return (i, j)
            }
        }
    }
    return (-1, -1)
}

