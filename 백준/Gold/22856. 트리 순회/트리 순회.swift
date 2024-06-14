let N = Int(readLine()!)!
var moveCnt = 0
var tree = Array(repeating: (-1, -1), count: N + 1)
var parent = Array(repeating: 1, count: N + 1)
var visited = Array(repeating: false, count: N + 1)
var endNode = 0

for _ in 1...N {
    let info = readLine()!.split{ $0 == " "}.map {Int(String($0))!}
    if info[1] != -1 {
        parent[info[1]] = info[0]
    }
    if info[2] != -1 {
        parent[info[2]] = info[0]
    }
    tree[info[0]] = (info[1], info[2])
}

inorder(1)
similarInorder(1)
print(moveCnt)

func inorder(_ cur: Int) {
    if cur == -1 {
        return
    }
    inorder(tree[cur].0)
    endNode = cur
    inorder(tree[cur].1)
}

func similarInorder(_ cur: Int) {
    if tree[cur].0 != -1 && !visited[tree[cur].0] {
        moveCnt += 1
        visited[tree[cur].0] = true
        similarInorder(tree[cur].0)
    } else if tree[cur].1 != -1  && !visited[tree[cur].1] {
        moveCnt += 1
        visited[tree[cur].1] = true
        similarInorder(tree[cur].1)
    } else if cur == endNode {
        return
    } else {
        moveCnt += 1
        similarInorder(parent[cur])
    }
}