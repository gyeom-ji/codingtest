let input = readLine()!.split{ $0 == " " }.map { String($0) }
let arr = readLine()!.map { String($0) }

let keyboardMap = ["q": (0,0), "w" : (0,1), "e": (0,2), "r" : (0,3), "t": (0,4), "y" : (0,5), "u": (0,6), "i" : (0,7), "o": (0,8), "p" : (0,9),
                  "a" : (1,0), "s" : (1,1), "d": (1,2), "f" : (1,3), "g": (1,4), "h" : (1,5), "j": (1,6), "k" : (1,7), "l": (1,8),
                  "z" : (2,0), "x" : (2,1), "c": (2,2), "v" : (2,3), "b": (2,4), "n" : (2,5), "m": (2,6)]
var curL = keyboardMap[input[0]]!, curR = keyboardMap[input[1]]!
var anw = 0


for i in 0..<arr.count {
    let next = keyboardMap[arr[i]]!
    
    if isLeft(arr[i]) {
        anw += (abs(curL.0 - next.0) + abs(curL.1 - next.1)) + 1
        curL = next
    } else {
        anw += (abs(curR.0 - next.0) + abs(curR.1 - next.1)) + 1
        curR = next
    }
}

print(anw)

func isLeft(_ s: String) -> Bool {
    var left = ["q", "w", "e", "r", "t", "a", "s", "d","f","g", "z", "x", "c", "v"]
    return left.contains(s)
}
