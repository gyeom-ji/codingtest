let answerArr = readLine()!.split{$0 == " "}.map{Int($0)!}
var solution = Array(repeating: 0, count: 10)
var anw = 0

backTracking(0, 0)

print(anw)

func backTracking(_ cur: Int, _ correct: Int) {
    var invalid = 0
    
    // 남은 문제를 다 풀어도 정답 갯수가 5보다 적은 경우
    if correct + (10 - cur) < 5 {
        return
    }
    
    if cur == 10 {
        if correct >= 5 {
            anw += 1
        }
        return
    }
    
    // 2문제 연속 답
    if cur >= 2 && solution[cur - 1] == solution[cur - 2] {
        invalid = solution[cur - 1]
    }
    
    for i in 1...5 {
        // 3문제 연속 답이 아닐 경우
        if invalid != i {
            solution[cur] = i
            
            // 정답일 경우 correct + 1
            if answerArr[cur] == i {
                backTracking(cur + 1, correct + 1)
            } else {
                backTracking(cur + 1, correct)
            }
            // 초기화
            solution[cur] = 0
        }
    }
}
