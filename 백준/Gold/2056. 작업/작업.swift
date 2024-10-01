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
let N = file.readInt()
var graph = Array(repeating: Array(repeating: 0, count: 0), count: N + 1)
var timeArr = Array(repeating: 0, count: N + 1)
var queue = [Int]()
var inDegree = Array(repeating: 0, count: N + 1)
var dp = Array(repeating: 0, count: N + 1)
var check = Array(repeating: false, count: N + 1)
        

for i in 1...N {
    let time = file.readInt()
    let cnt = file.readInt()
    
    if cnt != 0 {
        for _ in 0..<cnt {
            let pre = file.readInt()
            graph[pre].append(i)
            check[pre] = true
            check[i] = true
            inDegree[i] += 1
        }
    }
    timeArr[i] = time
}

for i in 1...N {
    if inDegree[i] == 0 {
        queue.append(i)
    }
}

bfs()

print(dp.max()!)

func bfs() {
    while !queue.isEmpty {
        let now = queue.removeFirst()
        // 현재 작업 시간 +
        dp[now] += timeArr[now]

        for next in graph[now] {
            // 다음 작업 시간, 현재 작업 시간 중 max 값 저장
            dp[next] = max(dp[next], dp[now])
            inDegree[next] -= 1
            
            if inDegree[next] == 0 {
                queue.append(next)
            }
        }
    }
}