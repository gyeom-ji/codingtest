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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1, l2 = l2
        var head = ListNode()
        var cur = head
        var temp = 0

        while true {
            let val = getVal(l1) + getVal(l2) + temp
            cur.val = val % 10
            temp = val / 10

            l1 = l1?.next
            l2 = l2?.next

            if l1 != nil || l2 != nil || temp != 0 {
                cur.next = ListNode()
                cur = cur.next!
            } else {
                break
            }
        }

        return head
    }

    func getVal(_ node: ListNode?) -> Int {
        guard let node = node else {return 0}
        return node.val
    }
}