/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var dummy = ListNode(0)
        var lists = lists
        var cur : ListNode? = dummy
        
        if lists.count == 0 { return nil }
        
    loop:
        while true {
            var min = Int.max
            var cnt = 0
            
            for i in 0..<lists.count {
                if let value = getVal(lists[i]) {
                    if value < min {
                        min = value
                    }
                } else {
                    cnt += 1
                    if cnt == lists.count {
                        break loop
                    }
                    continue
                }
                
            }
            
            for i in 0..<lists.count {
                if let value = getVal(lists[i]) {
                    if value == min {
                        cur?.next = ListNode(min)
                        cur = cur?.next
                        lists[i] = lists[i]?.next
                    }
                }
            }
        }
        
        return dummy.next
    }
    
    func getVal(_ node: ListNode?) -> Int? {
        guard let node = node else {return nil}
        return node.val
    }
}

