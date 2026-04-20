# Leetcode 2078 - Maximum Distance Between Two Different Colors

## 🧩 Problem Overview

You are given an integer array `colors`, where `colors[i]` represents the color of the `i`-th house.

Your task is to find the **maximum distance** between two houses such that:
- The two houses have **different colors**
- Distance is calculated as `|i - j|`

Return the **maximum possible distance**.

---

## 💡 Approach

This solution uses a **single pass greedy strategy** with constant space.

### Key Observations:
- Fix the first color at index `0`
- Track:
  - `first`: index of the first color
  - `second`: index of the first different color found
- For every new index:
  - If the color differs from `first`, compute distance from `first`
  - If the color matches `first`, compute distance from `second` (if it exists)
- Keep updating the maximum distance

This avoids nested loops and works efficiently in one traversal.

---

## 🛠️ Java Implementation

```java
class Solution {
    public int maxDistance(int[] colors) {
        int first = 0, second = -1;
        int dist = 0;

        for(int i = 0; i < colors.length; i++) {
            if(colors[i] != colors[first]) {
                dist = Math.max(dist, i - first);
                if(second == -1)
                    second = i;
            } else {
                if(second != -1)
                    dist = Math.max(dist, i - second);
            }
        }

        return dist;
    }
}
