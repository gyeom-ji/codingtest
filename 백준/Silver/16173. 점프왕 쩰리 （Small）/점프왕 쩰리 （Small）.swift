let N = Int(readLine()!)!
var map = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: N), count: N)

for _ in 0..<N {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    map.append(input)    
}

print(bfs((0,0), map[0][0]))

func bfs(_ start: (Int, Int), _ val: Int) -> String {
    var queue = [(start, val)]
    visited[start.0][start.1] = true

    while !queue.isEmpty {
        let (cur, val) = queue.removeFirst()
        
        if map[cur.0][cur.1] == -1 {
            return "HaruHaru"
        }
        
        for i in 0..<2 {
            let newX = i == 0 ? cur.0 : cur.0 + val
            let newY = i == 0 ? cur.1 + val : cur.1

            if isVaild(newX, newY) && !visited[newX][newY] {
                visited[newX][newY] = true
                queue.append(((newX, newY), map[newX][newY]))
            }
        }
    }
    return "Hing"
}

func isVaild(_ x: Int, _ y: Int) -> Bool {
    return x >= 0 && y >= 0 && x < N && y < N
}