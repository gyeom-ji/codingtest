let N = Int(readLine()!)!
let maxArr = readLine()!.split{ $0 == " "}.map {Int($0)! + 1}
var arr = readLine()!.split{ $0 == " "}.map {Int($0)!}
let K = Int(readLine()!)!


var next = arr[N - 1] + K
var index = N - 1
arr[N - 1] = 0

while index >= 0 {

	arr[index] += next % maxArr[index]
	next /= maxArr[index]
	
	if arr[index] >= maxArr[index] {
		if index != 0 {
			arr[index - 1] += 1
		}
		arr[index] %= maxArr[index]
	}
	
	index -= 1
}

print(arr.map{String($0)}.joined())