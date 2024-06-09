let cash = Int(readLine()!)!
var stock = readLine()!.split{ $0 == " " }.map{ Int($0)! }
var jInfo = (cash, 0), sInfo = (cash, 0)

for i in 0..<stock.count {
    if jInfo.0 >= stock[i] {
        jInfo.1 += jInfo.0 / stock[i]
        jInfo.0 = jInfo.0 % stock[i]
    }
    
    if isDown(i) && sInfo.0 >= stock[i] {
        sInfo.1 += sInfo.0 / stock[i]
        sInfo.0 = sInfo.0 % stock[i]
    }
    
    
    if isUp(i) && sInfo.1 > 0 {
        sInfo.0 += sInfo.1 * stock[i]
        sInfo.1 = 0
    }
}

func isUp(_ i : Int) -> Bool {
    return i - 3 >= 0 && stock[i - 3] < stock[i - 2] && stock[i - 2] < stock[i - 1]
}

func isDown(_ i : Int) -> Bool {
    return i - 3 >= 0 && stock[i - 3] > stock[i - 2] && stock[i - 2] > stock[i - 1]
}

sInfo.0 += sInfo.1 * stock.last!
jInfo.0 += jInfo.1 * stock.last!

if sInfo.0 > jInfo.0 {
    print("TIMING")
} else if sInfo.0 < jInfo.0 {
    print("BNP")
} else {
    print("SAMESAME")
}

