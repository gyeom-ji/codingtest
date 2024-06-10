let N = Int(readLine()!)!

var maxJ = 4 * (N - 1)
var maxI = 4 * (N - 1)
var arr = Array(repeating: Array(repeating: " ", count: maxJ + 1), count: (maxI/2) + 1)
arr[0] = Array(repeating: "*", count: maxJ + 1)

var jCnt = maxJ
var left = 2, right = maxJ - 2
var checkArr = Set<Int>()
checkArr.insert(0)
checkArr.insert(maxJ)


if N == 1 {
    print("*")
} else {
    for i in 1...maxI/2 {
        for j in 0...maxJ {
            if checkArr.contains(j) {
                arr[i][j] = "*"
            } else if i % 2 == 0 {
                if j >= left && j <= right {
                    arr[i][j] = "*"
                }
                checkArr.insert(left)
                checkArr.insert(right)
            }
            if i == maxI/2 && j % 2 == 0 {
                arr[i][j] = "*"
            }
        }
        if i % 2 == 0 {
            left += 2
            right -= 2
        }
    }
    
    printStars()
}


func printStars() {
    for i in 0...maxI/2 {
        for j in 0...maxJ {
            print(arr[i][j], terminator: "")
        }
        print()
    }
    for i in (0..<maxI/2).reversed() {
        for j in 0...maxJ {
            print(arr[i][j], terminator: "")
        }
        print()
    }
}
