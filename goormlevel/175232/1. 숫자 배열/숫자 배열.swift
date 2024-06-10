let N = Int(readLine()!)!
var num = 1

for _ in 0..<N {
	for j in 0..<N {
		print(num, terminator: j != N - 1 ? " " : "\n")
		num += 1
	}
}

