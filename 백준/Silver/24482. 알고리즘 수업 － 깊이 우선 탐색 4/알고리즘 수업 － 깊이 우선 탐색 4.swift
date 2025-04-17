let input = readLine()!.split{$0 == " "}.map{Int($0)!}
var map = Array(repeating: Array(repeating: 0, count: 0), count: input[0] + 1)
var visited = Array(repeating: false, count: input[0] + 1)
var result = Array(repeating: -1, count: input[0])
var cnt = 0

for _ in 0..<input[1] {
    let arr = readLine()!.split{$0 == " "}.map{Int($0)!}
    map[arr[0]].append(arr[1])
    map[arr[1]].append(arr[0])
}

dfs(input[2], 0)

for i in 1...input[0] where !visited[i] {
    result[i - 1] = -1
}

print(result.map{String($0)}.joined(separator: "\n"))

func dfs(_ cur: Int, _ pre: Int) {
    visited[cur] = true
    if pre != 0 {
        result[cur - 1] = result[pre - 1] + 1
    } else {
        result[cur - 1] = 0
    }
    
    for next in map[cur].sorted(by: > ) where !visited[next] {
        visited[next] = true
        dfs(next, cur)
    }

}