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

struct DoubleStackQueue<T> {
    private var inStack: [T] = []
    private var outStack: [T] = []

    mutating func enqueue(_ value: T) {
        inStack.append(value)
    }

    mutating func dequeue() -> T? {
        if outStack.isEmpty {
            outStack = inStack.reversed()
            inStack.removeAll()
        }
        return outStack.popLast()
    }
}


let file = FileIO()
let start = file.readInt(), target = file.readInt()
var dp = Array(repeating: Int.max, count: 1000010)

print(bfs())

func bfs() -> Int {
    var queue = DoubleStackQueue<(Int, Int)>()
    queue.enqueue((start, 0))
    dp[start] = 0

    while true {
        guard let (cur, cnt) = queue.dequeue() else { break }

        if cur + 1 <= target && dp[cur + 1] > cnt + 1 {
            dp[cur + 1] = cnt + 1
            queue.enqueue((cur + 1, cnt + 1))
        }
        if cur * 2 <= target && dp[cur * 2] > cnt + 1 {
            dp[cur * 2] = cnt + 1
            queue.enqueue((cur * 2, cnt + 1))
        }
    }
    return dp[target]
}