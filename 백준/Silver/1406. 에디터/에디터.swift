var left = readLine()!
let MAX = Int(readLine()!)!
var right = ""

for _ in 0..<MAX {
    let command = readLine()!
    executeCommand(command)
}

func executeCommand(_ command : String){
    switch(command) {
    case "L" :
        if let last = left.popLast() {
            right.append(last)
        }
        
    case "D" :
        if let last = right.popLast() {
            left.append(last)
        }
        
    case "B" :
        left.popLast()
        
    default :
        left.append(command.last!)
    }
}

print(left + right.reversed())

