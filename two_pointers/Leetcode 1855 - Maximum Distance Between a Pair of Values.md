# Leetcode 1855 - Maximum Distance Between a Pair of Values

## 🧩 Problem Overview
You are given two **non-increasing (sorted in decreasing order)** integer arrays `nums1` and `nums2`.

Your task is to find the **maximum distance** `(j - i)` such that:

- `0 ≤ i < nums1.length`
- `0 ≤ j < nums2.length`
- `i ≤ j`
- `nums1[i] ≤ nums2[j]`

Return the maximum possible distance.  
If no valid pair exists, return `0`.

---

## 💡 Approach

### Technique Used
- **Two Pointers**
- **Greedy Traversal**
- **Arrays**

### Key Idea
Since both arrays are sorted in **non-increasing order**, we can efficiently scan them using two pointers:

- Pointer `i` traverses `nums1`
- Pointer `j` traverses `nums2`

At each step:
- If `nums1[i] ≤ nums2[j]`, the pair is valid → update the answer and move `j` forward.
- Otherwise, move `i` forward to try a smaller value.

This guarantees we check all valid pairs in **linear time**.

---

## 🧠 Algorithm
1. Initialize two pointers `i = 0`, `j = 0`
2. While both pointers are within bounds:
   - If `nums1[i] ≤ nums2[j]`, update `ans = max(ans, j - i)` and increment `j`
   - Else, increment `i`
3. Return `ans`

---

## 🧪 Example

```text
nums1 = [55, 30, 5, 4, 2]
nums2 = [100, 20, 10, 10, 5]

Output: 2
