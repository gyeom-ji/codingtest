// 0 : R, 1 : C, 2 : K
let input = readLine()!.split{$0 == " "}.map{Int($0)!}
var map = Array(repeating: Array(repeating: Character(" "), count:0), count: input[0])
var cur = (input[0] - 1, 0)
let target = (0, input[1] - 1)
let dx = [1, -1, 0, 0], dy = [0, 0, 1, -1]
var visited = Array(repeating: Array(repeating: false, count: input[1]), count: input[0])
var anw = 0

// 출발점 방문 설정
visited[cur.0][cur.1] = true

for i in 0..<input[0] {
    map[i] = Array(readLine()!)
}

backTracking(1)
print(anw)

func isValid(_ x: Int, _ y: Int) -> Bool {
    return x >= 0 && x < input[0] && y >= 0 && y < input[1] && map[x][y] != "T"
}

func backTracking(_ distance: Int) {
    // 거리가 K인 경우 (K안에 타겟에 도착하지 못할 경우 무시)
    if distance == input[2] {
        // 현 위치가 타겟인 경우 anw +
        if cur == target {
            anw += 1
        }
        return
    }
    
    for i in 0..<4 {
        let curX = cur.0, curY = cur.1
        let newX = cur.0 + dx[i], newY = cur.1 + dy[i]
        
        // newX, newY 방문 가능 여부 체크, 방문 이력 체크
        if isValid(newX, newY) && !visited[newX][newY] {
            // 방문 설정, cur 변경
            visited[newX][newY] = true
            cur = (newX, newY)
            
            backTracking(distance + 1)
            
            // 초기화
            cur = (curX, curY)
            visited[newX][newY] = false
        }
    }
}

