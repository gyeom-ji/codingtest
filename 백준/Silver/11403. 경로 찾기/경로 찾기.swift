let N = Int(readLine()!)!
var map = Array(repeating: Array(repeating: 0, count: 0), count: N)

for i in 0..<N {
    let arr = readLine()!.split{$0 == " "}.map{Int($0)!}
    map[i] = arr
}

floydWarshall()

for i in 0..<N {
    for j in 0..<N {
        print(map[i][j], terminator: " ")
    }
    print()
}

func floydWarshall() {
    for k in 0..<N{
        for i in 0..<N {
            for j in 0..<N {
                if map[k][j] == 0 || map[i][k] == 0 { continue }
                map[i][j] = 1
            }
        }
    }
}
