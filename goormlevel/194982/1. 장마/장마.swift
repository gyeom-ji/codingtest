let input = readLine()!.split{ $0 == " "}.map { Int($0)! }
var ground = readLine()!.split{ $0 == " "}.map { Int($0)! }
var check = Set<Int>()

for day in 0..<input[1] {
	let rain = readLine()!.split{ $0 == " "}.map { Int($0)! }

	for i in rain[0] - 1..<rain[1] {
			ground[i] += 1
			check.insert(i)
	}
	
	if (day + 1) % 3 == 0 {
		drain()
	}
}

func drain() {
	for index in check {
			ground[index] -= 1
	}
	check = Set<Int>()
}

print(ground.map{String($0)}.joined(separator: " "))

