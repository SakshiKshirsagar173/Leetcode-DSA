# Leetcode 3418- Maximum Amount of Money Robot Can Earn

## 🧩 Problem Overview
You are given a 2D grid `coins` where each cell contains a positive or negative value.

- You start from the **top-left cell (0,0)**
- You need to reach the **bottom-right cell (m-1, n-1)**
- You can move **only right or down**
- You are allowed to **skip collecting coins from at most 2 negative cells**

Your task is to return the **maximum total amount of coins** you can collect.

---

## 💡 Key Observations
- This is a **grid path problem**
- Simple greedy will fail because:
  - Sometimes taking a negative coin is unavoidable
  - Sometimes skipping a negative coin gives a better future path
- Overlapping subproblems exist → **Dynamic Programming is required**

---

## 🧠 Technique Used
### ✅ Dynamic Programming (DP) + Recursion + Memoization

**DP State:**
- `i, j` → current cell
- `skips` → number of remaining skips (0 to 2)
- Value → maximum coins collectable from `(i, j)` to destination

---

## 🔁 Recurrence Relation
From cell `(i, j)`:

1. **Normal move (collect coin):**
   - Move right or down
   - Add `coins[i][j]` to the result

2. **Skip move (only if coin is negative and skips > 0):**
   - Ignore `coins[i][j]`
   - Move right or down with `skips - 1`

Take the **maximum** of all valid choices.

---

## 🛑 Base Cases
- Out of bounds → return `-∞` (invalid path)
- Reached destination:
  - If coin is negative and skip available → return `0`
  - Else → return coin value

---

## 🧠 Why Memoization?
Without memoization:
- Time complexity becomes **exponential**
- Leads to **TLE**

With memoization:
- Each state `(i, j, skips)` computed once
- Efficient and optimal

---

## 🧮 Complexity Analysis
- **Time Complexity:** `O(m × n × 3)`
- **Space Complexity:** `O(m × n × 3)` (DP table)

---

## 🧩 Java Implementation

```java
class Solution {
    int m, n;
    Integer[][][] dp;

    public int maximumAmount(int[][] coins) {
        m = coins.length;
        n = coins[0].length;

        dp = new Integer[m][n][3];
        return helper(coins, 0, 0, 2);
    }

    int helper(int[][] coins, int i, int j, int skips) {

        if (i >= m || j >= n) return Integer.MIN_VALUE;

        if (dp[i][j][skips] != null) return dp[i][j][skips];

        if (i == m - 1 && j == n - 1) {
            if (coins[i][j] < 0 && skips > 0) return 0;
            return coins[i][j];
        }

        int right = helper(coins, i, j + 1, skips);
        int down  = helper(coins, i + 1, j, skips);

        int best = Integer.MIN_VALUE;
        int maxMove = Math.max(right, down);

        if (maxMove != Integer.MIN_VALUE) {
            best = maxMove + coins[i][j];
        }

        if (coins[i][j] < 0 && skips > 0) {
            int skipRight = helper(coins, i, j + 1, skips - 1);
            int skipDown  = helper(coins, i + 1, j, skips - 1);
            best = Math.max(best, Math.max(skipRight, skipDown));
        }

        return dp[i][j][skips] = best;
    }
}
