let N = Int(readLine()!)!
var locationA = readLine()!.split{ $0 == " "}.map{ Int($0)! }.sorted(by: {$0 < $1})
var locationB = readLine()!.split{ $0 == " "}.map{ Int($0)! }.sorted(by: {$0 < $1})
var cntA = Array(repeating: 0, count: locationA.max()! + 3)
var cntB = Array(repeating: 0, count: locationB.max()! + 3)
var valueA = (0, 0), valueB = (0, 0)

for i in 0..<N {
    
    for j in locationA[i] - 2...locationA[i] + 2 where j >= 0{
        cntA[j] += 1
        if valueA.1 < cntA[j] {
            valueA = (j, cntA[j])
        }
    }
    
    for j in locationB[i] - 2...locationB[i] + 2 where j >= 0{
        cntB[j] += 1
        if valueB.1 < cntB[j] {
            valueB = (j, cntB[j])
        }
    }
}

print(valueA.0, valueB.0)
print(valueA.0 > valueB.0 ? "good" : "bad" )
