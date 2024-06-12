let input = readLine()!.split{$0 == " "}.map{Int($0)!}
var arr = readLine()!.split{$0 == " "}.map{Int($0)!}
var cur = 0

for _ in 0..<input[1] {
    let cnt = arr[cur]
    cur = (cnt + cur) % input[0]
}

print(arr[cur])
