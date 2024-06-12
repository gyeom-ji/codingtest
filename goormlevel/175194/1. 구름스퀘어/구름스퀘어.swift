let N = Int(readLine()!)!
var curTime = 0
var anw = 0
var eventArr = [[Int]]()

for _ in 0..<N {
	let event = readLine()!.split{ $0 == " "}.map {Int($0)!}
	eventArr.append(event)
}

eventArr.sort(by: {$0[1] < $1[1]})

for i in 0..<N {
	if curTime <= eventArr[i][0] {
		curTime = eventArr[i][1] + 1
		anw += 1
	}
}

print(anw)