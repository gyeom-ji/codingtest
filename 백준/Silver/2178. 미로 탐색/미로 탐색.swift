let input = readLine()!.split{$0 == " "}.map{Int($0)!}

let dx = [1, 0, -1, 0], dy = [0, 1, 0, -1]
var map = [[String]]()
var start = (0,0)
var visited = Array(repeating: Array(repeating: false, count: input[1]), count: input[0])

for _ in 0..<input[0] {
    let arr : [String] = readLine()!.map{String($0)}
    map.append(arr)
}

print(bfs((0,0)))

func bfs(_ start: (Int, Int)) -> Int {
    var queue = [(start, 1)]
    visited[start.0][start.1] = true

    while !queue.isEmpty {
        let (cur, cnt) = queue.removeFirst()

        if cur.0 == input[0] - 1 && cur.1 == input[1] - 1 {
            return cnt
        }
        for i in 0..<4 {
            let newX = cur.0 + dx[i]
            let newY = cur.1 + dy[i]

            if isValid(newX, newY) && !visited[newX][newY] {
                visited[newX][newY] = true
                queue.append(((newX, newY), cnt + 1))
            }
        }
    }
    return -1
}

func isValid(_ x: Int, _ y: Int) -> Bool {
    return x >= 0 && y >= 0 && x < input[0] && y < input[1] && map[x][y] != "0"
}