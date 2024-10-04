let N = Int(readLine()!)!
var set = Set<String>()
var visited = [Bool]()
var anw = ""

for _ in 0..<N {
    // 사전 순으로 출력해야하기 때문에 < 로 정렬
    var arr = Array(readLine()!).sorted(by: <)

    // 정렬한 값이 첫 번째 문자열이기 때문에 anw에 +
    for i in 0..<arr.count {
        anw += "\(arr[i])"
    }
    anw += "\n"
    
    // arr을 다음 문자열로 갱신하고 anw에 +
    while nextPermutation(&arr) {
        for i in 0..<arr.count {
            anw += "\(arr[i])"
        }
        anw += "\n"
    }
}

print(anw)

/// Next Permutation 알고리즘
func nextPermutation(_ arr: inout [Character]) -> Bool {
    // 순열의 뒤에서부터 탐색
    var i = arr.count - 2, j = arr.count - 1
    
    // 1. 피벗포인트 i 찾기
    // i < i + 1
    while(i >= 0 && arr[i] >= arr[i + 1]) {
        i -= 1
    }
    
    // 피벗포인트가 존재하지 않으면 return false
    // 현재 순열이 가장 큰 순열
    if i < 0 {return false}
    
    // 2. 피벗포인트보다 오른쪽에 있는 값 중 피벗 값보다 큰 가장 작은 값 찾기
    // j > i
    while j > i && arr[j] <= arr[i] {
        j -= 1
    }
    
    // 3. i와 j swap
    arr.swapAt(i, j)
    
    // 4. i + 1부터 끝까지 요소들을 오름차순으로 정렬
    j = arr.count - 1
    i += 1
    
    while i < j {
        arr.swapAt(i, j)
        j -= 1
        i += 1
    }
    return true
}

/// 시간 초과
func backTracking(_ cur: Int, _ maxCnt: Int, _ arr: [Character], _ str: String) {
    if cur == maxCnt {
        set.insert(str)
        return
    }
    
    for i in 0..<maxCnt where !visited[i] {
        visited[i] = true
        backTracking(cur + 1, maxCnt, arr, str + "\(arr[i])")
        visited[i] = false
    }
}
