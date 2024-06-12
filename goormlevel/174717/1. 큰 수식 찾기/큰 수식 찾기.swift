let input = readLine()!.split{ $0 == " "}.map{ String($0) }
var anw = Int.min

for i in 0..<2 {
    var arr = setArr(Array(input[i]))
    var j = 1
    
    multiplication(&arr)
    var value = Int(arr[0])!
    
    while j < arr.count {
        if arr[j] == "+" {
            value += Int(arr[j + 1])!
            j += 2
        } else if arr[j] == "-" {
            value -= Int(arr[j + 1])!
            j += 2
        }
    }
    anw = max(anw, value)
}

print(anw)


func multiplication(_ arr: inout [String]) {
    var j = 1
    while j < arr.count {
        if arr[j] == "*" {
            arr[j - 1] = "\(Int(arr[j - 1])! * Int(arr[j + 1])!)"
            arr.remove(at: j + 1)
            arr.remove(at: j)
            
        } else {
            j += 1
        }
    }
}

func setArr(_ arr: [Character]) -> [String] {
    var newArr = [String]()
    var num = ""
    for i in 0..<arr.count {
        if arr[i] == "+" || arr[i] == "*" || arr[i] == "-" {
            newArr.append(num)
            num = ""
            newArr.append("\(arr[i])")
        } else {
            num += "\(arr[i])"
        }
    }
    newArr.append(num)
    return newArr
}
