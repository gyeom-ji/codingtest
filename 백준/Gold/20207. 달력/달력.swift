let N = Int(readLine()!)!
var arr:[Int] = Array(repeating: 0, count: 367)

for _ in 0..<N {
    let schedule = readLine()!.split{ $0 == " " }.map{Int(String($0))!}
    for j in schedule[0]...schedule[1] {
        arr[j] += 1
    }
}

var width = 0, height = 0
var anw = 0

for i in 1...366 {
    if arr[i] > 0 {
        width += 1
        height = max(height, arr[i])
    } else {
        anw += width * height
        height = 0
        width = 0
    }
}

print(anw)
