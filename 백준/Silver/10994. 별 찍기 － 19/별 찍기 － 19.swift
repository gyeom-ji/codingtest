let N: Int = Int(readLine()!)!
var stars: [String] = []
var star: String = "*"
var cnt = N

for i in 0..<(N - 1) {
    stars.append(star + String(repeating: "*", count: 4 * (cnt - 1) - 1) + star)
    stars.append(star + String(repeating: " ", count: 4 * (cnt - 1) - 1) + star)
    star += " *"
    cnt -= 1
}

for i in 0..<stars.count {
    print(stars[i])
}

print(String(repeating: "* ", count: 2*(N - 1)) + "*")

for i in (0..<stars.count).reversed() {
    print(stars[i])
}
