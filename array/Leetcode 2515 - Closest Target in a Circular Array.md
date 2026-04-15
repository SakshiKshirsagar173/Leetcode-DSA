# Leetcode 2515 - Closest Target in a Circular Array

## 📌 Problem Overview
You are given:
- A **circular array** of strings `words`
- A string `target`
- A starting index `startIndex`

You can move **left or right** in the array, and because the array is circular, moving past one end wraps you around to the other end.

🎯 **Goal:**  
Return the **minimum number of steps** required to reach **any occurrence of `target`** starting from `startIndex`.  
If the target does **not exist**, return `-1`.

---

## 🧠 Key Insight
Since the array is **circular**, the distance between two indices `i` and `startIndex` can be:
- Direct distance: `|startIndex - i|`
- Circular distance: `n - |startIndex - i|`

We take the **minimum** of these two.

---

## 🧩 Approach
1. Traverse the entire `words` array.
2. For every index where `words[i] == target`:
   - Compute direct distance.
   - Compute circular distance.
   - Keep track of the minimum.
3. If no target is found, return `-1`.

---

## 💻 Java Implementation

```java
class Solution {
    public int closestTarget(String[] words, String target, int startIndex) {
        int n = words.length;
        int ans = n + 1;

        for (int i = 0; i < n; i++) {
            if (words[i].equals(target)) {
                int dist1 = Math.abs(startIndex - i);
                int dist2 = n - dist1;
                ans = Math.min(ans, Math.min(dist1, dist2));
            }
        }

        return ans > n ? -1 : ans;
    }
}
