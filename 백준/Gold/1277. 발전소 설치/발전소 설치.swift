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

struct MinHeap<T: Comparable> {
    var heap: [T?] = Array(repeating: nil, count : 1)
    var size = 0
    
    mutating func dequeue() -> T? {
        if size == 0 {return nil}
        let min = heap[1]
        heap.swapAt(1, size)
        heap.removeLast()
        size -= 1
        downheap(1)
        
        return min
    }
    
    private mutating func downheap(_ i : Int) {
        var i = i
        
        while (i * 2 <= size) {
            var k = i * 2
            if k < size && heap[k]! > heap[k + 1]! {k += 1}
            if heap[i]! < heap[k]! {break}
            heap.swapAt(i, k)
            i = k
        }
    }
    
    mutating func enqueue(_ value: T) {
        heap.append(value)
        size += 1
        upheap(size)
    }
    
    private mutating func upheap(_ i : Int) {
        var i = i
        
        while (i > 1 && heap[i/2]! > heap[i]!) {
            heap.swapAt(i, i/2)
            i = i / 2
        }
    }
}

struct Edge: Comparable {
    var adv : Int
    var cost: Double
    
    init(adv: Int, cost: Double) {
        self.adv = adv
        self.cost = cost
    }
    
    static func < (lhs: Edge, rhs: Edge) -> Bool {
        lhs.cost < rhs.cost
    }
}

let file = FileIO()
let N = file.readInt(), W = file.readInt()
let M = Double(file.readString())!
var map = Array(repeating:(0,0), count: N + 1)
var distance = Array(repeating:Array(repeating:  Double(Int.max), count: N + 1), count: N + 1)
var minHeap = MinHeap<Edge>()

for i in 1...N {
    let x = file.readInt(), y = file.readInt()
    map[i] = (x,y)
}

for i in 1...N {
    for j in 1...N {
        let newDist = sqrt(pow(Double(abs(map[i].0 - map[j].0)), 2.0) + pow(Double(abs(map[i].1 - map[j].1)), 2.0))
        if newDist <= M {
            distance[i][j] = newDist
            distance[j][i] = newDist
        }
    }
}

for _ in 0..<W {
    let start = file.readInt(), end = file.readInt()
    distance[start][end] = 0
    distance[end][start] = 0
}

print(Int(dikstra(1)[N] * 1000))


func dikstra(_ start: Int) -> [Double] {
    var dp = Array(repeating: Double(Int.max), count: N + 1)
    minHeap.enqueue(Edge(adv: 1, cost: 0))
    dp[start] = 0
    
    while true {
        guard let cur = minHeap.dequeue() else {break}
        
        if dp[cur.adv] < cur.cost { continue }
        
        for next in 1...N {
            if distance[cur.adv][next] == M {continue}
            let newCost = distance[cur.adv][next] + cur.cost
            
            if newCost < dp[next] {
                dp[next] = newCost
                minHeap.enqueue(Edge(adv: next, cost: newCost))
            }
        }
    }
    return dp
}
