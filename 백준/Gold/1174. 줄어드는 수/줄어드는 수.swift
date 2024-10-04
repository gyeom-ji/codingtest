let N = Int(readLine()!)!

// 내림차순 배열 사용 (만들어지는 수가 줄어드는 수인지 확인할 필요 x)
var arr = [9,8,7,6,5,4,3,2,1,0]
var anw = Set<Int>()

backTracking(0, 0)

let sort = anw.sorted(by: <)

if sort.count <= N - 1 {
    print(-1)
} else {
    print(sort[N - 1])
}

func backTracking(_ num: Int, _ index: Int) {
    // 선택된 num Set에 insert
    anw.insert(num)
    
    // arr count == 10이기 때문에 index >= 10 이면 return
    if index >= 10 {
        return
    }
    
    // 줄어드는 수 만드는 법 : arr 배열의 index 값을 선택 or 선택하지 않느냐 2가지 경우 존재
    // 해당 num 선택하고 index + 1
    backTracking((num * 10) + arr[index], index + 1)
    // 해당 num 선택하지 않고 index + 1
    backTracking(num, index + 1)
}


