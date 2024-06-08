var input = readLine()!.split{ $0 == " "}.map{Int($0)!}
let n = input[0], m = input[1]
var r = input[2]
var arr = [[Int]]()


for _ in 0..<n {
    arr.append(readLine()!.split{ $0 == " "}.map{Int($0)!})
}

rotateArr()

for i in 0..<n{
    for j in 0..<m {
        print(arr[i][j], terminator: " ")
    }
    print()
}

func rotateArr() {
    
    for k in 0..<min(n, m)/2 {
        
        var maxN = n - k - 1, maxM = m - k - 1
        
        var rotateArr = [Int]()
        
        for i in k..<maxM {
            rotateArr.append(arr[k][i])
        }
        
        for i in k..<maxN {
            rotateArr.append(arr[i][maxM])
        }
        
        
        for i in (k..<maxM).reversed() {
            rotateArr.append(arr[maxN][i + 1])
        }
        
        
        for i in (k..<maxN).reversed() {
            rotateArr.append(arr[i+1][k])
        }
        
        let rCnt = r%rotateArr.count
        
        rotateArr = Array(rotateArr[rCnt...] + rotateArr[0..<rCnt])
        
        var index = 0
        
        for i in k..<maxM {
            arr[k][i] = rotateArr[index]
            index += 1
        }
        
        for i in k..<maxN {
            arr[i][maxM] = rotateArr[index]
            index += 1
        }
        
        
        for i in (k..<maxM).reversed() {
            arr[maxN][i + 1] = rotateArr[index]
            index += 1
        }
        
        
        for i in (k..<maxN).reversed() {
            arr[i+1][k] = rotateArr[index]
            index += 1
        }
        
    }
}

