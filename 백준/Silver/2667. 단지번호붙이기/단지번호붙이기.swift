let N = Int(readLine()!)!

let dx = [1, 0, -1, 0], dy = [0, 1, 0, -1]
var map = [[String]]()
var result = [Int]()
var visited = Array(repeating: Array(repeating: false, count: N), count: N)

for _ in 0..<N {
    let arr : [String] = readLine()!.map{String($0)}
    map.append(arr)
}

var location = findNextLocation()

while location != (-1, -1) {
    result.append(bfs(location))
    location = findNextLocation()
}

result.sort(by: <)
print(result.count)
print(result.map{String($0)}.joined(separator: "\n"))

func bfs(_ start: (Int, Int)) -> Int {
    var cnt = 1
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
                cnt += 1
            }
        }
    }
    return cnt
}

func isValid(_ x: Int, _ y: Int) -> Bool {
    return x >= 0 && y >= 0 && x < N && y < N && map[x][y] != "0"
}

func findNextLocation() -> (Int, Int) {
    for i in 0..<N {
        for j in 0..<N {
            if map[i][j] != "0" && !visited[i][j] {
                return (i, j)
            }
        }
    }
    return (-1, -1)
}

