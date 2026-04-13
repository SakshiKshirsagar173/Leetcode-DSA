# Leetcode - 1848. Minimum Distance to the Target Element

## 📌 Problem Overview
You are given:
- An integer array `nums`
- An integer `target`
- An integer `start` index

Your task is to find the **minimum absolute distance** between `start` and **any index `i` such that `nums[i] == target`**.

Distance is defined as:
|start - i|
It is guaranteed that `target` exists at least once in the array.

---

## 🧠 Approach Explanation

This solution uses a **simple linear scan**.

### Key Idea
- Traverse the entire array
- Whenever you find `nums[i] == target`:
  - Compute distance `|start - i|`
  - Keep track of the minimum distance found so far

There is **no need for sorting or extra data structures**.

---

## 🔍 Algorithm Steps
1. Initialize `minDiff` to a very large value (`Integer.MAX_VALUE`)
2. Loop through the array
3. If the current element equals `target`:
   - Compute distance from `start`
   - Update `minDiff` if this distance is smaller
4. Return `minDiff`

---

## 💻 Java Code

```java
class Solution {
    public int getMinDistance(int[] nums, int target, int start) {
        int minDiff = Integer.MAX_VALUE;
        for (int i = 0; i < nums.length; i++) {
            int diff = Math.abs(start - i);
            if (nums[i] == target && diff < minDiff)
                minDiff = diff;
        }
        return minDiff;
    }
}
