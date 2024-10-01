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
let N = file.readInt(), M = file.readInt()

var graph : [[Int]] = Array(repeating: [], count: N + 1)
var queue = [Int]()
var preArr = Array(repeating: 0, count: N + 1)
var order = ""

for _ in 0..<M {
    let pre = file.readInt(), suc = file.readInt()
    graph[pre].append(suc)
    preArr[suc] += 1
}

for i in 1...N {
    if preArr[i] == 0 {
        queue.append(i)
    }
}

bfs()

print(order)

func bfs() {
    while !queue.isEmpty {
        // 가장 쉬운(낮은 숫자)문제 부터
        queue.sort(by: <)
        let now = queue.removeFirst()

        order += "\(now) "

        for next in graph[now] {
            preArr[next] -= 1
            if preArr[next] == 0 {
                queue.append(next)
            }
        }
    }
}
