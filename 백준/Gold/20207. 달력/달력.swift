let N = Int(readLine()!)!
var arr:[Int] = Array(repeating: 0, count: 367)

for _ in 0..<N {
    let schedule = readLine()!.split{ $0 == " " }.map{Int(String($0))!}
    for j in schedule[0]...schedule[1] {
        arr[j] += 1
    }
}

var start = 0, end = 0, height = 0, index = 0
var anw = 0

while index <= 365 {
    if arr[index] > 0 {
        start = index
        while arr[index] != 0 {
            height = max(height, arr[index])
            index += 1
        }
        end = index
        anw += (end - start) * height
        height = 0
    } else {
        index += 1
    }
}

print(anw)