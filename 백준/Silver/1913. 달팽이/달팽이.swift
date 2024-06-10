let N = Int(readLine()!)!
let target = Int(readLine()!)!
var num = N*N
var arr = Array(repeating: Array(repeating: 0, count: N), count: N)
arr[N/2][N/2] = 1
var targetLocation = (N/2,N/2)

for index in 0..<N/2 {

    let maxI = N - index , maxJ = N - index
    
    for i in index..<maxI {
        arr[i][index] = num
        if num == target {
            targetLocation = (i, index)
        }
        num -= 1
    }
    
    for j in index + 1..<maxJ {
        arr[maxI - 1][j] = num
        if num == target {
            targetLocation = (maxI - 1, j)
        }
        num -= 1
    }
    
    for i in (index..<maxI - 1).reversed() {
        arr[i][maxJ - 1] = num
        if num == target {
            targetLocation = (i, maxJ - 1)
        }
        num -= 1
    }
    
    for j in (index + 1..<maxJ - 1).reversed() {
        arr[index][j] = num
        if num == target {
            targetLocation = (index, j)
        }
        num -= 1
    }
}


for i in 0..<N {
    for j in 0..<N {
        print(arr[i][j], terminator: " ")
    }
    print()
}

print(targetLocation.0 + 1, targetLocation.1 + 1)
