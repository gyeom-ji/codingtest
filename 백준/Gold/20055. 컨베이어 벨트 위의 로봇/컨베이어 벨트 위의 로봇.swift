let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let N = input[0], K = input[1]

var arr = readLine()!.split{ $0 == " " }.map{ Int($0)! }
var conveyor = Array(repeating: 0, count: N)
var anw = 0

while true {
    // 1.
    arr.insert(arr.removeLast(), at: 0)
    conveyor.insert(conveyor.removeLast(), at: 0)
    conveyor[N - 1] = 0

    //2.
    for i in (0..<N - 1).reversed() {
        if conveyor[i] == 1 && conveyor[i + 1] == 0 && arr[i + 1] > 0 {
            conveyor[i + 1] = 1
            conveyor[i] = 0
            arr[i + 1] -= 1
        }
    }
    conveyor[N - 1] = 0
    
    // 3.
    if arr[0] > 0 {
        conveyor[0] = 1
        arr[0] -= 1
    }
    
    anw += 1

    // 4.
    if arr.filter({$0 == 0}).count >= K {
        break
    }
}

print(anw)
