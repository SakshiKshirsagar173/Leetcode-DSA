# LeetCode 1594 – Maximum Non-Negative Product in a Matrix

## 📌 Problem Statement
You are given an `m x n` integer grid. Starting from the top-left cell `(0,0)`, you can move **only right or down** to reach the bottom-right cell `(m-1, n-1)`.

The **product** of a path is the multiplication of all values along the path.

- Return the **maximum non-negative product** of any valid path.
- If all possible paths result in a **negative product**, return `-1`.
- Since the product can be large, return the result modulo `10^9 + 7`.

---

## 💡 Approach – Dynamic Programming (dpMax & dpMin)

Because the grid may contain **negative numbers**, we must track **both**:
- The **maximum product** up to each cell
- The **minimum product** up to each cell

Why?
- A negative number can turn a minimum product into a maximum one (and vice versa).

### DP Definitions
- `dpMax[i][j]` → Maximum product to reach cell `(i, j)`
- `dpMin[i][j]` → Minimum product to reach cell `(i, j)`

---

## 🧠 Algorithm Steps
1. Initialize `dpMax` and `dpMin` arrays.
2. Set the starting cell `(0,0)`.
3. Fill the first row and first column (only one path possible).
4. For each cell, calculate all possible products from **top** and **left**.
5. Store the maximum and minimum values separately.
6. Check the final product:
   - If negative → return `-1`
   - Else → return product modulo `10^9 + 7`

---

## 💻 Code Implementation (Java)

```java
class Solution {
    int mod = 1_000_000_007;

    public int maxProductPath(int[][] grid) {
        int m = grid.length, n = grid[0].length;

        long[][] dpMax = new long[m][n];
        long[][] dpMin = new long[m][n];

        dpMax[0][0] = grid[0][0];
        dpMin[0][0] = grid[0][0];

        // First column
        for (int i = 1; i < m; i++) {
            dpMax[i][0] = dpMax[i - 1][0] * grid[i][0];
            dpMin[i][0] = dpMin[i - 1][0] * grid[i][0];
        }

        // First row
        for (int j = 1; j < n; j++) {
            dpMax[0][j] = dpMax[0][j - 1] * grid[0][j];
            dpMin[0][j] = dpMin[0][j - 1] * grid[0][j];
        }

        // Fill remaining cells
        for (int i = 1; i < m; i++) {
            for (int j = 1; j < n; j++) {
                long val = grid[i][j];

                long a = dpMax[i - 1][j] * val;
                long b = dpMin[i - 1][j] * val;
                long c = dpMax[i][j - 1] * val;
                long d = dpMin[i][j - 1] * val;

                dpMax[i][j] = Math.max(Math.max(a, b), Math.max(c, d));
                dpMin[i][j] = Math.min(Math.min(a, b), Math.min(c, d));
            }
        }

        long ans = dpMax[m - 1][n - 1];
        return ans < 0 ? -1 : (int)(ans % mod);
    }
}
