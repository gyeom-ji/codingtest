let N = Int(readLine()!)!
var switchArr = [0]
switchArr += (readLine()!.split{ $0 == " " }.map { Int($0)! })
let studentCnt = Int(readLine()!)!
var studentArr = [(Int,Int)]()

for _ in 0..<studentCnt {
    let input = readLine()!.split{ $0 == " " }.map { Int($0)! }
    studentArr.append((input[0], input[1]))
}

for i in 0..<studentCnt {
    if studentArr[i].0 == 1 {  // 남학생
        changeSwitchMale(studentArr[i].1)
    } else { // 여학생
        changeSwitchFemale(studentArr[i].1)
    }
}

var cnt = 1
for i in 1...N {
    if cnt > 20 {
        print()
        cnt = 1
    }
    print(switchArr[i], terminator: " ")
    cnt += 1
}


func changeSwitchMale(_ num: Int) {
    for i in 1...N {
        if i % num == 0 {
            switchArr[i] = switchArr[i] == 0 ? 1: 0
        }
    }
}

func changeSwitchFemale(_ num: Int) {
    var left = num - 1, right = num + 1
    
    if left > 0 && right < N + 1 {
        while switchArr[left] == switchArr[right] {
            switchArr[left] = switchArr[left] == 0 ? 1: 0
            switchArr[right] = switchArr[right] == 0 ? 1: 0
            left -= 1
            right += 1
            if left == 0 || right == N + 1 {
                break
            }
        }
    }
    switchArr[num] = switchArr[num] == 0 ? 1: 0
}
