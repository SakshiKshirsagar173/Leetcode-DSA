# Leetcode - 88. Merge Sorted Array

## 📌 Problem Statement
You are given two integer arrays `nums1` and `nums2`, sorted in **non-decreasing order**, and two integers `m` and `n` representing the number of valid elements in `nums1` and `nums2`.

- `nums1` has a length of `m + n`
  - First `m` elements are valid
  - Last `n` elements are placeholders (`0`) and should be ignored
- `nums2` has a length of `n`

### Task
Merge `nums2` into `nums1` such that `nums1` becomes a **single sorted array**.

⚠️ **Important constraint:**  
You must modify `nums1` **in-place**. Do **not** return anything.

---

## 🧠 Key Insight
Merging from the **start** will overwrite useful values in `nums1`.

So the only correct strategy is:
👉 **Merge from the end of the arrays**, where empty space already exists.

---

## 💡 Approach (Two Pointers – Backward)

### Pointers Used
- `p1 = m - 1` → last valid element of `nums1`
- `p2 = n - 1` → last element of `nums2`
- `p = m + n - 1` → last index of `nums1`

### Steps
1. Compare `nums1[p1]` and `nums2[p2]`
2. Place the larger value at position `p`
3. Move the corresponding pointer backward
4. Stop early if all elements of `nums2` are merged

---

## 💻 Java Implementation

```java
class Solution {
    public void merge(int[] nums1, int m, int[] nums2, int n) {
        int p1 = m - 1;
        int p2 = n - 1;

        for (int p = m + n - 1; p >= 0; p--) {
            if (p2 < 0) {
                break;
            }

            if (p1 >= 0 && nums1[p1] > nums2[p2]) {
                nums1[p] = nums1[p1];
                p1--;
            } else {
                nums1[p] = nums2[p2];
                p2--;
            }
        }
    }
}
