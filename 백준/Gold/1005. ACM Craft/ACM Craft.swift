import Foundation

// 라이노님의 오픈소스  - FileIO
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}

let file = FileIO()
let T = file.readInt()

var str = ""
var dp = [Int]()
var queue = [Int]()

/// dfs + dp
for _ in 0..<T {
    let N = file.readInt()
    let K = file.readInt()
    var sequence = Array(repeating:Array(repeating: 0, count: 0), count: N + 1)
    var timeArr = [0]
    dp = Array(repeating: Int.max, count: N + 1)
    
    for _ in 0..<N {
        timeArr.append(file.readInt())
    }
 
    for _ in 0..<K {
        let element = [file.readInt(), file.readInt()]
        sequence[element[1]].append(element[0])
    }
    
    let W = file.readInt()
   
    str += "\(dfs(W, sequence, timeArr))\n"
}

print(str)

func dfs(_ cur: Int,_ sequence: [[Int]], _ timeArr: [Int]) -> Int {
    var maxTime = 0
    for next in sequence[cur] {
        if dp[next] == Int.max {
            maxTime = max(dfs(next, sequence, timeArr), maxTime)
        } else {
            maxTime = max(dp[next], maxTime)
        }
    }
    // cur 최소 건설 시간 = 자신을 짓기 위한 건물들의 최대 건설 시간 + 자기 건설 시간
    dp[cur] = min(dp[cur], maxTime + timeArr[cur])
    return dp[cur]
}

/// 위상 정렬 Kahn’s Algorithms
////선행자 개수
//var inDegree = [0]
//
//for _ in 0..<T {
//    let N = file.readInt()
//    let K = file.readInt()
//    var sequence = Array(repeating:Array(repeating: 0, count: 0), count: N + 1)
//    var timeArr = [0]
//    
//    dp = Array(repeating: 0, count: N + 1)
//    inDegree = Array(repeating: 0, count: N + 1)
//    
//    for _ in 0..<N {
//        timeArr.append(file.readInt())
//    }
//    
//    for _ in 0..<K {
//        let element = [file.readInt(), file.readInt()]
//        sequence[element[0]].append(element[1])
//        // 진입 차수 계산
//        inDegree[element[1]] += 1
//    }
//    
//    // 진입 차수 0인 빌딩 큐에 삽입
//    for i in 1...N {
//        if inDegree[i] == 0 {
//            queue.append(i)
//        }
//    }
//
//    let W = file.readInt()
//    bfs(sequence, timeArr)
//
//    // W 건물 짓는 시간 + W를 짓기 위한 건물들의 최소 건설 시간
//    str += "\(dp[W] + timeArr[W])\n"
//}
//
//print(str)
//
//func bfs(_ sequence: [[Int]], _ timeArr: [Int]) {
//    while !queue.isEmpty {
//        let now = queue.removeFirst()
//
//        for next in sequence[now] {
//            // 자신을 짓기 위한 건물들의 최소 건설 시간 갱신
//            dp[next] = max(dp[next], dp[now] + timeArr[now])
//            
//            // 다음 빌딩의 선행자 제거
//            inDegree[next] -= 1
//
//            // 진입 차수 0이면 큐에 삽입
//            if inDegree[next] == 0 {
//                queue.append(next)
//            }
//        }
//    }
//}
