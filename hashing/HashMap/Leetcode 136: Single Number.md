## Problem
**LeetCode 136 – Single Number**

Given a non-empty array of integers `nums`, every element appears twice except
for one. Find that single one.

You must implement a solution with linear runtime complexity.

---

## Approach: Hashing (Frequency Count)

We use a `HashMap` to store the frequency of each number.

- First, count how many times each number appears.
- Then, iterate through the array again to find the number with frequency `1`.

This approach is straightforward and easy to understand.

---

## Algorithm
1. Create an empty `HashMap<Integer, Integer>`
2. Traverse the array and count the frequency of each number
3. Traverse the array again
4. Return the number whose frequency is `1`

---

## Code
```java
class Solution {
    public int singleNumber(int[] nums) {
        Map<Integer, Integer> map = new HashMap<>();

        for (int num : nums) {
            if (!map.containsKey(num)) {
                map.put(num, 0);
            }
            map.put(num, map.get(num) + 1);
        }

        for (int num : nums) {
            if (map.get(num) == 1) {
                return num;
            }
        }
        return -1;
    }
}
