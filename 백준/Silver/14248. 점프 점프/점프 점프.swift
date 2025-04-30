let N = Int(readLine()!)!
var arr = (readLine()!.split{$0 == " "}.map{Int($0)!})
let S = Int(readLine()!)!
var visited = Array(repeating: false, count: N)

visited[S - 1] = true
dfs(S - 1)

print(visited.filter{ $0 == true }.count)

func dfs(_ cur: Int) {

    if cur + arr[cur] < N && !visited[cur + arr[cur]] {
        dfs(cur + arr[cur])
        visited[cur + arr[cur]] = true
 
    } 
    if cur - arr[cur] >= 0 && !visited[cur - arr[cur]] {
        dfs(cur - arr[cur])
        visited[cur - arr[cur]] = true
    } 
     return
}