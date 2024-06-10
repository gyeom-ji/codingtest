import Foundation
var arr = Array(readLine()!)
var anw = 0
let target : [Character] = ["q", "u", "a", "c", "k"]

if arr.count % 5 != 0 || arr[0] != "q" || arr.last! != "k" {
    print(-1)
    exit(0)
}

for i in 0..<arr.count - 4 {
    if arr[i] == "q" {
        findDuck(i)
    }
}

func findDuck(_ start: Int) {
    var index = 0
    var isNew = true
    
    for i in start..<arr.count {
        if target[index] == arr[i] {
            if arr[i] == "k" {
                if isNew {
                    anw += 1
                    isNew = false
                }
                index = 0
                arr[i] = " "
                continue
            }
            index += 1
            arr[i] = " "
        }
    }

    if isNew || index != 0 {
        print(-1)
        exit(0)
    }
}

if anw == 0 {
    print(-1)
} else {
    print(anw)
}

