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
let M = file.readInt()
var graph = Array(repeating: Array(repeating: 0, count: 0), count: N + 1)
var inDegree = Array(repeating: 0, count: N + 1)
var queue = [Int]()
var order = "", cnt = 0

for _ in 0..<M {
    let cnt = file.readInt()
    var pre = file.readInt()
    
    if cnt > 1 {
        for i in 1..<cnt {
            let suc = file.readInt()
            graph[pre].append(suc)
            inDegree[suc] += 1
            pre = suc
        }
    }
}

for i in 1...N {
    if inDegree[i] == 0 {
        queue.append(i)
    }
}

bfs()

if cnt == N {
    print(order)
} else {
    print("0")
}

func bfs(){
    while !queue.isEmpty {
        let now = queue.removeFirst()
        order += "\(now)\n"
        cnt += 1
        for next in graph[now] {
            inDegree[next] -= 1
            if inDegree[next] == 0 {
                queue.append(next)
            }
        }
    }
}
