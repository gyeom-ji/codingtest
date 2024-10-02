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
    private var heap : [T?] = Array(repeating: nil, count: 1)
    private var size = 0
    
    mutating func creatHeap() {
        for i in stride(from: size/2, to: 0, by: -1) {
            downheap(i)
        }
    }
    
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
        while (2 * i <= size) {
            var k = 2 * i
            if k < size && (heap[k]! > heap[k + 1]!) { k += 1 }
            if heap[i]! < heap[k]! { break }
            heap.swapAt(i, k)
            i = k
        }
    }
    
    mutating func enqueue(_ value: T) {
        heap.append(value)
        size += 1
        upheap(size)
    }
    
    private mutating func upheap(_ j: Int) {
        var j = j
        while(j > 1 && heap[j/2]! > heap[j]!) {
            heap.swapAt(j/2, j)
            j = j/2
        }
    }
}

struct Edge: Comparable {
    let adjvertex : Int
    let cost : Int
    
    init(adjvertex: Int, cost: Int) {
        self.adjvertex = adjvertex
        self.cost = cost
    }
    
    static func < (lhs: Edge, rhs: Edge) -> Bool {
           lhs.cost < rhs.cost
    }
}

let file = FileIO()
let N = file.readInt(), M = file.readInt(), X = file.readInt()

var graph = Array(repeating: Array(repeating: Edge(adjvertex: 0, cost: 0), count: 0), count: N + 1)
var anw = Array(repeating: 0, count: N + 1)
var minHeap = MinHeap<Edge>()

for _ in 0..<M {
    let start = file.readInt(), end = file.readInt(), cost = file.readInt()
    graph[start].append(Edge(adjvertex: end, cost: cost))
}

anw = dikstra(X)

for i in 1...N where i != X {
    anw[i] += dikstra(i)[X]
}

print(anw[1...].max()!)

func dikstra(_ start: Int) -> [Int] {
    // 초기화
    var distance = Array(repeating: Int.max, count: N + 1)
    
    // 시작점 start 관련 정보 설정 (시작점이기 때문에 가중치 0)
    distance[start] = 0

    // 시작점 우선순위 큐에 삽입
    minHeap.enqueue(Edge(adjvertex: start, cost: 0))

    while true {
        guard let cur = minHeap.dequeue() else {break}
        
        if distance[cur.adjvertex] < cur.cost {
            continue
        }
        
        // 현재 정점에 인접한 각 정점에 대해
        for edge in graph[cur.adjvertex] {
            // 해당 정점을 거쳐 갈 때 거리
            let newCost = edge.cost + cur.cost
            
            if newCost < distance[edge.adjvertex] {
                // 간선 완화
                distance[edge.adjvertex] = newCost
                // 다음 인접 거리를 계산하기 위에 enqueue
                minHeap.enqueue(Edge(adjvertex: edge.adjvertex, cost: newCost))
            }
        }
    }

    return distance
}
