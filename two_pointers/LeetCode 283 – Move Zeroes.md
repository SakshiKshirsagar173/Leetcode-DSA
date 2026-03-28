# LeetCode 283 – Move Zeroes

## 📌 Problem Statement
Given an integer array `nums`, move all `0`’s to the end of the array while maintaining the
relative order of the non-zero elements.

The operation must be done **in-place** without making a copy of the array.

---

## 💡 Approach – Two Pointers (In-Place)

This solution uses a **two-pointer technique**:
- One pointer (`i`) traverses the array.
- Another pointer (`j`) keeps track of the position where the next non-zero element should be placed.

---

## 🧠 Algorithm
1. Initialize pointer `j = 0`.
2. Traverse the array using pointer `i`.
3. When a non-zero element is found:
   - Place it at index `j`
   - Increment `j`
4. After traversal, fill the remaining positions from `j` to end with `0`.

---

## 💻 Code Implementation (Java)

```java
class Solution {
    public void moveZeroes(int[] nums) {
        int j = 0;

        for (int i = 0; i < nums.length; i++) {
            if (nums[i] != 0) {
                nums[j] = nums[i];
                j++;
            }
        }

        while (j < nums.length) {
            nums[j] = 0;
            j++;
        }
    }
}
