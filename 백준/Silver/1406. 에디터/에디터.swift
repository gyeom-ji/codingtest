var stack = readLine()!
let MAX = Int(readLine()!)!
var reverseStack = ""

for _ in 0..<MAX {
    let command = readLine()!
    executeCommand(command)
}

func executeCommand(_ command : String){
    switch(command.first!) {
        case "L" :
        if let last = stack.popLast() {
            reverseStack.append(last)
        }

        case "D" :
        if let last = reverseStack.popLast() {
            stack.append(last)
        }
        case "B" :
        stack.popLast()
        case "P" :
        stack.append(command.last!)
        default :
        break
    }
}

print(stack + reverseStack.reversed())

