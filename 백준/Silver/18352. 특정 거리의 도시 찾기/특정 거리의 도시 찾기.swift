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
    var heap: [T?] = Array(repeating: nil, count: 1)
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
    
    private mutating func downheap(_ i: Int) {
        var i = i
        while (i * 2 <= size) {
            var k = i * 2
            if k < size && heap[k]! > heap[k + 1]! { k += 1 }
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
    
    private mutating func upheap(_ i: Int) {
        var i = i
        while (i > 1 && heap[i]! < heap[i/2]! ) {
            heap.swapAt(i, i/2)
            i = i/2
        }
    }
}

struct Edge: Comparable {
    var adj : Int
    var cost : Int
    init(adj: Int, cost: Int) {
        self.adj = adj
        self.cost = cost
    }
    
    static func < (lhs: Edge, rhs: Edge) -> Bool {
        lhs.cost < rhs.cost
    }
}

let file = FileIO()
let N = file.readInt(), M = file.readInt(), K = file.readInt(), X = file.readInt()
var graph = Array(repeating: Array(repeating: 0, count: 0), count: N + 1)
var minHeap = MinHeap<Edge>()

for _ in 0..<M {
    let A = file.readInt(), B = file.readInt()
    graph[A].append(B)
}

var distance = dijkstra(X)
var check = false

for i in 1...N {
    if distance[i] == K {
        print(i)
        check = true
    }
}

if !check {
    print(-1)
}

func dijkstra(_ start: Int) -> [Int] {
    var distance = Array(repeating: Int.max, count: N + 1)
    distance[start] = 0
    minHeap.enqueue(Edge(adj: start, cost: 0))
    
    while true {
        guard let cur = minHeap.dequeue() else {break}
        
        if distance[cur.adj] < cur.cost {continue}
        
        for next in graph[cur.adj] {
            if cur.cost + 1 < distance[next] {
                distance[next] = cur.cost + 1
                minHeap.enqueue(Edge(adj: next, cost: cur.cost + 1))
            }
        }
    }
    return distance
}