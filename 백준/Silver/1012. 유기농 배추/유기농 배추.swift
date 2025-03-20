import Foundation

let T = Int(readLine()!)!
var cnt = 0
var map = [[Int]]()
var visited = [[Bool]]()
let dx = [1, -1, 0, 0], dy = [0, 0, 1, -1]


while cnt < T {
    var result = 0
    var cabbageArr = [(Int, Int)]()
    let info = readLine()!.split{$0 == " "}.map{Int($0)!}
    map = Array(repeating: Array(repeating:0, count: info[1]), count: info[0])
    visited = Array(repeating: Array(repeating: false, count: info[1]), count: info[0])
    
    for _ in 0..<info[2] {
        let input = readLine()!.split{$0 == " "}.map{Int($0)!}
        map[input[0]][input[1]] = 1
        cabbageArr.append((input[0], input[1]))
    }
    
    for i in 0..<cabbageArr.count {
        if !visited[cabbageArr[i].0][cabbageArr[i].1] {
            bfs((cabbageArr[i].0, cabbageArr[i].1))
            result += 1
        }
    }
    cnt += 1
    
    print(result)
}

func bfs(_ start: (Int, Int)) {
    var queue = [start]
    visited[start.0][start.1] = true
    
    while !queue.isEmpty {
        let (x, y) = queue.removeFirst()
        
        for i in 0..<4 {
            let newX = dx[i] + x
            let newY = dy[i] + y
            
            if isValid(newX, newY){
                visited[newX][newY] = true
                queue.append((newX, newY))
            }
        }
    }
}

func isValid(_ x: Int, _ y : Int) -> Bool {
    return x >= 0 && x < map.count && y >= 0 && y < map[x].count && map[x][y] == 1 && !visited[x][y]
}
