let input = readLine()!.split{ $0 == " "}.map{Int(String($0))!}
var block = readLine()!.split{ $0 == " "}.map{Int(String($0))!}
var anw = 0
var start = 0, cur = 0, next = 1

for i in 1..<input[1] - 1 {
    let value = min(getLeftMaxBlock(i), getRightMaxBlock(i))
    anw += max(0, value - block[i])
}

print(anw)

func getLeftMaxBlock(_ cur: Int) -> Int {
    var value = 0
    for i in 0..<cur {
        value = max(value, block[i])
    }
    return value
}

func getRightMaxBlock(_ cur: Int) -> Int {
    var value = 0
    for i in cur + 1..<input[1] {
        value = max(value, block[i])
    }
    return value
}
