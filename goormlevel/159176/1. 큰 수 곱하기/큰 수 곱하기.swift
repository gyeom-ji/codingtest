let input = readLine()!.split{ $0 == " " }.map{ Int($0)!}
var anw = "100"

for _ in 1..<input.count {
	anw += "00"
}

print(anw)