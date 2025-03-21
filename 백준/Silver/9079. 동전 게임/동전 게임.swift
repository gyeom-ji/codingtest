let T = Int(readLine()!)!
var cnt = 0
let cases = [[0, 1, 2], [3, 4, 5], [6, 7, 8], // 가로
             [0, 3, 6], [1, 4, 7], [2, 5, 8], // 세로
             [0, 4, 8], [2, 4, 6]] // 대각선

while cnt < T {
    var binaryArr = [String]()
    
    for _ in 0..<3 {
        let line : [String] = readLine()!.split{$0 == " "}.map {
            if $0 == "H" {
                return "0"
            }
            return "1"
        }
        binaryArr.append(contentsOf: line)
    }
    
    print(bfs(binaryArr))
    
    
    cnt += 1
}

func bfs(_ start: [String]) -> Int {
    var decimal = Int(start.joined(), radix: 2)!
    var queue = [(start, decimal, 0)]
    var visited = Array(repeating: false, count: 512)
    visited[decimal] = true
    
    while !queue.isEmpty {
        let (curArr, curDiecimal, cnt) = queue.removeFirst()

        if curDiecimal == 0 || curDiecimal == 511 {
            return cnt
        }
        
        for element in cases {
            var arr = curArr

            for index in element {
                arr[index] = arr[index] == "0" ? "1" : "0"
            }

            decimal = Int(arr.map{String($0)}.joined(), radix: 2)!
            
            if !visited[decimal] {
                visited[decimal] = true
                queue.append((arr, decimal, cnt + 1))
            }
        }
    }
    return -1
}
