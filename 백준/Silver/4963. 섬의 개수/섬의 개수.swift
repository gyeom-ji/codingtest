let dx = [1, -1, 0, 0, -1, -1, 1, 1], dy = [0, 0, 1, -1, -1, 1, -1, 1]
var map = [[Int]]()
var visited = [[Bool]]()

while true {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    var result = 0
    if input == [0, 0] {
        break
    }
    
    visited = Array(
        repeating: Array(repeating: false, count: input[0]),
        count: input[1]
    )
    map = [[Int]]()
    
    for _ in 0..<input[1] {
        let arr = readLine()!.split{$0 == " "}.map{Int($0)!}
        map.append(arr)
    }
    
    for i in 0..<input[1] {
        for j in 0..<input[0] {
            if map[i][j] == 1 && !visited[i][j] {
                bfs((i,j))
                result += 1
                
            }
        }
    }

    print(result)

}

func bfs(_ start: (Int, Int)) {
    var queue = [(start.0, start.1)]
    visited[start.0][start.1] =  true
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        
        for i in 0..<8 {
            let newX = dx[i] + cur.0
            let newY = dy[i] + cur.1
            
            if isValid(newX, newY) {
                visited[newX][newY] = true
                queue.append((newX, newY))
            }
        }
    }
}

func isValid(_ x: Int, _ y: Int) -> Bool {
    return x >= 0 && x < map.count && y >= 0 && y < map[x].count && map[x][y] == 1 && !visited[x][y]
}
