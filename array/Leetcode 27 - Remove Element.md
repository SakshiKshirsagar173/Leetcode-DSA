# Leetcode 27 - Remove Element (In-Place Array Modification)

## Problem Overview

You are given an integer array `nums` and an integer `val`.  
Your task is to **remove all occurrences of `val` from the array in-place** and return the number of elements remaining.

### Key Constraints
- Do **not** use extra space for another array.
- The order of remaining elements **does not matter**.
- Only the first `k` elements after removal are considered valid.

---

## Approach (Two Pointers)

This solution uses a **two-pointer technique**:

- Pointer `i` scans each element of the array.
- Pointer `k` tracks the position where the next valid (non-`val`) element should be placed.

Whenever `nums[i] != val`, the element is copied to `nums[k]`, and `k` is incremented.

This guarantees:
- All valid elements are packed at the front of the array.
- The operation is done in-place.
- Only one pass over the array is required.

---

## Java Code

```java
class Solution {
    public int removeElement(int[] nums, int val) {
        int k = 0;

        for (int i = 0; i < nums.length; i++) {
            if (nums[i] != val) {
                nums[k] = nums[i];
                k++;
            }
        }
        return k;
    }
}
