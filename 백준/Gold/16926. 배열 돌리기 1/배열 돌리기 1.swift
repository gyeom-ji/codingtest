let input = readLine()!.split{ $0 == " " }.map{ Int($0)!}
let N = input[0], M = input[1], R = input[2]
var arr = [[Int]]()

for _ in 0..<N {
    arr.append(readLine()!.split{ $0 == " " }.map{ Int($0)!})
}

rotate()

for i in 0..<N {
    for j in 0..<M {
        print(arr[i][j], terminator: " ")
    }
    print()
}

func rotate() {
    let cnt = min(N,M) / 2
    
    for index in 0..<cnt {
        let maxN = N - index - 1, maxM = M - index - 1
        var rotateArr = [Int]()
        
        for i in index..<maxM {
            rotateArr.append(arr[index][i])
        }
        
        for i in index..<maxN {
            rotateArr.append(arr[i][maxM])
        }
        
        for i in (index + 1...maxM).reversed() {
            rotateArr.append(arr[maxN][i])
        }
        
        for i in (index + 1...maxN).reversed() {
            rotateArr.append(arr[i][index])
        }
    
        let rotateCnt = R % rotateArr.count
        rotateArr = Array(rotateArr[rotateCnt...] + rotateArr[0..<rotateCnt])
        var k = 0
        
        for i in index..<maxM {
            arr[index][i] = rotateArr[k]
            k += 1
        }
        
        for i in index..<maxN {
            arr[i][maxM] = rotateArr[k]
            k += 1
        }
        
        for i in (index + 1...maxM).reversed() {
            arr[maxN][i] = rotateArr[k]
            k += 1
        }
        
        for i in (index + 1...maxN).reversed() {
            arr[i][index] = rotateArr[k]
            k += 1
        }
    }
}
