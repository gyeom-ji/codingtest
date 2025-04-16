let input = readLine()!.split{$0 == " "}.map{Int($0)!}

let dx = [1, 0, -1, 0], dy = [0, 1, 0, -1]
var map = [[String]]()
var start = (0,0)
var visited = Array(repeating: Array(repeating: false, count: input[1]), count: input[0])

for i in 0..<input[0] {
    let arr : [String] = readLine()!.map{String($0)}
    if let exist = arr.firstIndex(of: "I") {
        start = (i, exist)
    }
    map.append(arr)
}

print(bfs(start))

func bfs(_ start: (Int, Int)) -> String {
    var queue = [start]
    var cnt = 0
    visited[start.0][start.1] = true

    while !queue.isEmpty {
        let cur = queue.removeFirst()

        for i in 0..<4 {
            let newX = cur.0 + dx[i]
            let newY = cur.1 + dy[i]

            if isValid(newX, newY) && !visited[newX][newY] {
                if map[newX][newY] == "P" {
                    cnt += 1
                }
                visited[newX][newY] = true
                queue.append((newX, newY))
            }
        }
    }
    return cnt == 0 ? "TT" : "\(cnt)"
}

func isValid(_ x: Int, _ y: Int) -> Bool {
    return x >= 0 && y >= 0 && x < input[0] && y < input[1] && map[x][y] != "X"
}