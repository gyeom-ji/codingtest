let input = readLine()!.split{$0 == " "}.map{Int($0)!}
var map = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: input[1]), count: input[0])
let dx = [-1, 0, 1, 0], dy = [0, 1, 0, -1]
var cnt = 0, width = 0, result = 0

for _ in 0..<input[0] {
    let line = readLine()!.split{$0 == " "}.map{Int($0)!}
    map.append(line)
}

for i in 0..<input[0] {
    for j in 0..<input[1] {
        if map[i][j] == 1 && !visited[i][j]{
            dfs(i,j)
            cnt += 1
            result = max(result, width)
            width = 0
        }
    }
}

print(cnt)
print(result)

func dfs(_ x: Int, _ y: Int){
    if isVaild(x, y) {
        visited[x][y] = true
        width += 1
    } else {
        return
    }

    for i in 0..<4 {
        let newX = x + dx[i]
        let newY = y + dy[i]

        dfs(newX, newY)
    }
}

func isVaild(_ x: Int, _ y: Int) -> Bool {
    return x >= 0 && y >= 0 && x < input[0] && y < input[1] && map[x][y] == 1 && !visited[x][y]
}