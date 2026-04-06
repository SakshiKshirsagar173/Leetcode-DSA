# LeetCode 26 – Remove Duplicates from Sorted Array

## 📌 Problem Statement
Given a **sorted integer array** `nums`, remove the duplicates **in-place** such that each unique element appears only once.

Return the number of unique elements `k`.

The first `k` elements of `nums` should contain the final result.

---

## 🧠 Approach (Two Pointer Technique)

- Use **two pointers**:
  - `i` → tracks the position of the last unique element
  - `j` → scans the array to find new unique elements
- Since the array is already sorted:
  - Duplicates will be adjacent
- When `nums[j] != nums[i]`:
  - Increment `i`
  - Copy `nums[j]` to `nums[i]`

---

## 💻 Java Code

```java
class Solution {
    public int removeDuplicates(int[] nums) {
        if (nums == null || nums.length == 0) {
            return 0;
        }

        int i = 0;

        for (int j = 1; j < nums.length; j++) {
            if (nums[j] != nums[i]) {
                i++;
                nums[i] = nums[j];
            }
        }

        return i + 1;
    }
}
