var cnt = Int(readLine()!)!
var n = 0, degree = 0
var arr = [[Int]]()

while cnt > 0 {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    n = input[0]
    degree = input[1]
    
    if degree < 0 {
        degree += 360
    }
    
    arr = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
    for i in 0..<n {
        arr[i] = readLine()!.split(separator: " ").map{ Int($0)! }
    }
    
    if degree == 0 || degree == 360 {
        for i in 0..<n {
            for j in 0..<n {
                print(arr[i][j], terminator: " ")
            }
            print()
        }
    } else {
        rotateRight()
        for i in 0..<n {
            for j in 0..<n {
                print(arr[i][j], terminator: " ")
            }
            print()
        }
    }
    cnt -= 1
}

func rotateRight() {
    var newArr = arr
    
    while degree > 0 {
        for i in 0..<n {
            newArr[i][i] = arr[n/2][i]
            newArr[i][n / 2] = arr[i][i]
            newArr[i][(n - 1) - i] = arr[i][n / 2]
            newArr[n / 2][(n - 1) - i] = arr[i][(n - 1) - i]
        }
        degree -= 45
        arr = newArr
    }
}
