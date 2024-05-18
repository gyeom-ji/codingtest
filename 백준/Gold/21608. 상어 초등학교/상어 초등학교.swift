struct Seat : Hashable {
    var r : Int
    var c : Int
    
    static func == (lhs: Seat, rhs: Seat) -> Bool {
        return lhs.r == rhs.r && lhs.c == rhs.c
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(r)
        hasher.combine(c)
    }
}

var N = Int(readLine()!)!

var favoriteSt =  Array(repeating: [Int](), count: (N * N) + 1)
var room = Array(repeating: Array(repeating: 0, count: N), count: N)
var emptySeat = [Seat : Int]()
let dx = [-1,1,0,0], dy = [0,0,-1,1]


for i in 0..<N*N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    favoriteSt[input[0]] = Array(input[1...])
    
    var favoriteSeat = [Seat: (Int, Int)]()
    var maxFavoriteCnt = 0
    
    for i in 0..<N {
        for j in 0..<N {
            if room[i][j] == 0 {
                var favoriteCnt = 0
                var emptyCnt = 0
                
                for k in 0..<4 {
                    let r = i + dx[k], c = j + dy[k]
                    if isPossible(r, c) {
                        if favoriteSt[input[0]].contains(room[r][c]) {
                            favoriteCnt += 1
                        }
                        if room[r][c] == 0 {
                            emptyCnt += 1
                        }
                    }
                }
                
                maxFavoriteCnt = max(maxFavoriteCnt, favoriteCnt)
                favoriteSeat[Seat(r: i, c: j)] = (favoriteCnt, emptyCnt)
            }
        }
    }
    
    let mostFavoriteSeat = favoriteSeat.filter { $0.value.0 == maxFavoriteCnt }.sorted(by: {
        if $0.value == $1.value {
            if $0.key.r == $1.key.r {
                return $0.key.c < $1.key.c
            }
            return $0.key.r < $1.key.r
        }
        return $0.value > $1.value
    }).first!
    
    room[mostFavoriteSeat.key.r][mostFavoriteSeat.key.c] = input[0]
    
}

print(getSatisfaction())


func getSatisfaction() -> Int {
    var result = 0
    
    for i in 0..<N {
        for j in 0..<N {
            var studentCnt = 0
            
            for k in 0..<4 {
                let r = i + dx[k], c = j + dy[k]
                if isPossible(r, c) {
                    if favoriteSt[room[i][j]].contains(room[r][c]) {
                        studentCnt += 1
                    }
                }
            }
            if studentCnt < 2 {
                result += studentCnt
            } else {
                if studentCnt == 2 {
                    result += 10
                } else if studentCnt == 3 {
                    result += 100
                } else {
                    result += 1000
                }
            }
        }
    }
    return result
}

func isPossible(_ r: Int, _ c: Int) -> Bool {
    return r >= 0 && c >= 0 && r < N && c < N
}