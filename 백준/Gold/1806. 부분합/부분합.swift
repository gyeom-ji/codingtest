let input = readLine()!.split{ $0 == " "}.map{Int($0)!}
var arr = readLine()!.split{ $0 == " "}.map{Int($0)!}
var cnt = Int.max, sum = 0
var left = 0, right = 0

while left < input[0] {
    if sum < input[1] {
        if right < input[0] {
            sum += arr[right]
            right += 1
        } else {
            left += 1
        }
    } else {
        cnt = min(cnt, right - left)
        sum -= arr[left]
        left += 1
    }
}

print(cnt == Int.max ? 0 : cnt)
