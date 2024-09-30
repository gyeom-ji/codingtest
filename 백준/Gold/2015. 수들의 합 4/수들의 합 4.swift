let input = readLine()!.split{ $0 == " "}.map{Int($0)!}
var arr = readLine()!.split{ $0 == " "}.map{Int($0)!}
var sum = Array(repeating: 0, count: arr.count + 1)

// sum[i] == k 일 경우를 위해 초기값 설정
var sumDict = [0 : 1]
var anw = 0

for i in 1...input[0] {
    sum[i] = sum[i - 1] + arr[i - 1]
}

// sum[i] - sum[j] = target
// sum[i] - target = sum[j]
// sum[j]의 개수를 anw에 +

for i in 1...input[0] {
    anw += sumDict[sum[i] - input[1], default: 0]
    sumDict[sum[i], default: 0] += 1
}

print(anw)
