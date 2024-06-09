import Foundation

func solution(_ edges:[[Int]]) -> [Int] {
    var anw = [0,0,0,0]
    var nodes = [Int : (Int, Int)]()
    
    for edge in edges {
        if let exist = nodes[edge[0]] {
            nodes[edge[0]] = (exist.0, exist.1 + 1)
        } else {
            nodes[edge[0]] = (0,1)
        }
        
        if let exist = nodes[edge[1]] {
            nodes[edge[1]] = (exist.0 + 1, exist.1)
        } else {
            nodes[edge[1]] = (1,0)
        }
    }
    
    for node in nodes {
        if node.value.1 == 0 {
            anw[2] += 1
        }
        
        if node.value.1 == 2 {
            if node.value.0 > 0 {
                anw[3] += 1
            } else {
                anw[0] = node.key
                anw[1] = node.value.1
            }
        }
        
        if node.value.1 > 2 {
            anw[0] = node.key
            anw[1] = node.value.1
        }
    }
    
    anw[1] -= (anw[2] + anw[3])
    
    return anw
}
