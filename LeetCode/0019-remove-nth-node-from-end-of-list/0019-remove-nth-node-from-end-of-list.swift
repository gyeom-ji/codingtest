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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var dummy = ListNode(0, head)
        var left : ListNode? = dummy
        var right : ListNode? = dummy

        for _ in 0..<n {
            right = right?.next
        } 

        while right?.next != nil {
            right = right?.next
            left = left?.next
        }

        left?.next = left?.next?.next

        return dummy.next
    }
}