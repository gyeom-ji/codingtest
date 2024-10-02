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
var distance = Array(repeating: Array(repeating: Int.max, count: N + 1), count: N + 1)
var anw = (N, N, Int.max)

for _ in 0..<M {
    let A = file.readInt(), B = file.readInt()
    distance[B][A] = 1
    distance[A][B] = 1
}

floydWarshall()

func floydWarshall() {
    // k = 거쳐가는 노드
    for k in 1...N {
        // i = 출발 노드
        for i in 1...N {
            // j = 도착 노드
            for j in 1...N {
                if i == j {
                    distance[i][j] = 0
                }
                if distance[k][j] == Int.max || distance[i][k] == Int.max { continue }
                distance[i][j] = min(distance[i][j], distance[i][k] + distance[k][j])
            }
        }
    }
}

for i in 1..<N {
    for j in i + 1...N {
        var sum = 0
        for k in 1...N {
            sum += min(distance[i][k], distance[j][k]) * 2
        }
        if sum < anw.2 {
            anw = (i, j, sum)
        } else if sum == anw.2 && i <= anw.0 && j <= anw.1 {
            anw = (i, j, sum)
        }
    }
}

print(anw.0, anw.1, anw.2)
