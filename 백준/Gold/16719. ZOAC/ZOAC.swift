let input = readLine()!.map{String($0)}
let count = input.count
var visited = Array(repeating: false, count: input.count)
var anw = ""

func getMinChar(_ left: Int, _ right: Int) {
    var anw = ""
    
    if left > right {
        return
    }
    
    var minIndex = left
    
    for i in left...right {
        if input[minIndex] > input[i] {
            minIndex = i
        }
    }
    
    visited[minIndex] = true

    for i in 0..<count {
        if visited[i] {
            anw += input[i]
        }
    }
    
    print(anw)
    getMinChar(minIndex + 1, right)
    getMinChar(left, minIndex - 1)
}

getMinChar(0, count - 1)
