let input = Array(readLine()!)
var visited = Array(repeating: false, count: input.count)
var anw = Array(repeating: "", count: input.count)

for _ in 0..<input.count {
    var minValue : (Int, String) = (0, anw.joined())
    var check = false
    for j in 0..<input.count where !visited[j] {
        var temp = anw
        temp[j] = "\(input[j])"
        let value = temp.joined()
        
        if !check {
            minValue = (j, value)
            check = true
        } else if minValue.1 > value {
            minValue = (j, value)
        }
    }
    anw[minValue.0] = "\(input[minValue.0])"
    visited[minValue.0] = true
    print("\(minValue.1)")
}