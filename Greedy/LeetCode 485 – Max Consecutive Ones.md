# LeetCode 485 – Max Consecutive Ones

## 📌 Problem Statement
Given a binary array `nums`, return the maximum number of consecutive `1`s in the array.

---

## 💡 Approach – Single Pass (Greedy / Array Scan)

We iterate through the array once while keeping:
- a counter for current consecutive `1`s
- a variable to store the maximum count found so far

Whenever a `0` is encountered, the current count is reset.

---

## 🧠 Algorithm
1. Initialize `count = 0` and `max = 0`
2. Traverse the array:
   - If the current element is `1`, increment `count`
   - If the current element is `0`:
     - Update `max`
     - Reset `count` to `0`
3. After traversal, return the maximum of `max` and `count`
   (to handle trailing `1`s)

---

## 💻 Code Implementation (Java)

```java
class Solution {
    public int findMaxConsecutiveOnes(int[] nums) {
        int count = 0;
        int max = 0;

        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == 1) {
                count++;
            } else {
                max = Math.max(max, count);
                count = 0;
            }
        }
        return Math.max(max, count);
    }
}
