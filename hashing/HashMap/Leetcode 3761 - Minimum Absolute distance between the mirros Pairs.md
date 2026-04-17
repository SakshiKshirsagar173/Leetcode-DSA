# Leetcode 3761 - Minimum Absolute distance between the mirros Pairs

## 📌 Problem Statement

You are given an integer array `nums`.

A **mirror pair** is a pair of indices `(i, j)` such that:

- `0 ≤ i < j < nums.length`
- `reverse(nums[i]) == nums[j]`

Here, `reverse(x)` means reversing the digits of `x`.  
Leading zeros are removed after reversing (e.g., `reverse(120) = 21`).

The **distance** between indices `i` and `j` is `|i - j`.

### 🎯 Objective
Return the **minimum absolute distance** between the indices of any mirror pair.  
If no mirror pair exists, return `-1`.

---

## 🧠 Approach

- Use a **HashMap** to store previously seen reversed numbers along with their indices.
- Traverse the array once:
  - If the current number exists in the map, a mirror pair is found.
  - Update the minimum distance.
  - Compute the reverse of the current number and store it in the map with its index.
- If no valid mirror pair is found, return `-1`.

This ensures an efficient **single-pass** solution.

---

## ⚙️ Algorithm

1. Initialize a `HashMap<Integer, Integer>` to store reversed numbers and indices.
2. Iterate through the array:
   - If the current number is already in the map, update the minimum distance.
   - Reverse the current number and store it in the map.
3. Return the minimum distance if found; otherwise, return `-1`.

---

## 💻 Java Implementation

```java
class Solution {
    public int minMirrorPairDistance(int[] nums) {
        HashMap<Integer, Integer> hmap = new HashMap<>();
        int n = nums.length;
        int min = n + 1;

        for (int i = 0; i < n; i++) {
            if (hmap.containsKey(nums[i])) {
                min = Math.min(min, Math.abs(i - hmap.get(nums[i])));
            }

            int mirror = getReverse(nums[i]);
            hmap.put(mirror, i);
        }

        return min == n + 1 ? -1 : min;
    }

    int getReverse(int num) {
        int ans = 0;
        while (num > 0) {
            ans = ans * 10 + num % 10;
            num /= 10;
        }
        return ans;
    }
}
