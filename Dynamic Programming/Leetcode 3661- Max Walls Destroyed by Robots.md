Leetcode 3661- Max Walls Destroyed by Robots

## 🧩 Problem Description
There is an endless straight line populated with **robots** and **walls**.

You are given:
- `robots[i]` → position of the *i-th* robot
- `distance[i]` → maximum distance the *i-th* robot's bullet can travel
- `walls[j]` → position of the *j-th* wall

### Rules:
- Each robot has **exactly one bullet**
- A robot can fire **either left or right**
- A bullet destroys **all walls** in its path within its range
- **Robots act as obstacles**:
  - If a bullet hits another robot first, it **stops immediately**
  - Walls beyond that robot are **not destroyed**

### Goal:
Return the **maximum number of unique walls** that can be destroyed by the robots.

---

## 💡 Key Observations
- Robots and walls lie on a **1D number line**
- Each wall can potentially be destroyed by:
  - The closest robot on the **left**
  - Or the closest robot on the **right**
- Choosing bullet directions independently is **not greedy**
- Decisions overlap → **dynamic programming is required**
- Processing must happen in **sorted order (sweep line)**

---

## 🧠 Technique Used
### ✅ Sweep Line + Dynamic Programming (State Compression)

This solution uses:
- Sorting to process entities from left to right
- A sweep-line approach over walls
- **4 DP states** to represent directional choices of adjacent robots

This is an **advanced DP + greedy hybrid problem**.

---

## 📐 DP State Meaning
We track 4 states while sweeping walls:

| State | Meaning |
|------|--------|
| `LL` | Left robot fires left |
| `LR` | Left robot fires right |
| `RL` | Right robot fires left |
| `RR` | Right robot fires right |

Each state tracks the **maximum walls destroyed so far** under that configuration.

Only **constant space** is used.

---

## 🔄 Algorithm Steps
1. Combine robot positions and distances
2. Add sentinel robots at `-∞` and `+∞`
3. Sort robots and walls
4. Sweep walls from left to right
5. For each wall:
   - Determine which adjacent robots can reach it
   - Update all DP states accordingly
6. Return the maximum DP value

---

## ⏱️ Complexity Analysis
- **Time Complexity:** `O(n log n + m log m)`
- **Space Complexity:** `O(1)` (constant DP states)

---

## 💻 Java Implementation

```java
import java.util.*;

class Solution {
    public int maxWalls(int[] robots, int[] distance, int[] walls) {
        int n = robots.length;

        // robot position + bullet distance
        int[][] r = new int[n + 2][2];
        for (int i = 0; i < n; i++) {
            r[i][0] = robots[i];
            r[i][1] = distance[i];
        }

        // Sentinel robots
        r[n][0] = -1;
        r[n][1] = 0;
        r[n + 1][0] = Integer.MAX_VALUE;
        r[n + 1][1] = 0;

        Arrays.sort(r, (a, b) -> Integer.compare(a[0], b[0]));
        Arrays.sort(walls);

        int LL = 0, LR = 1, RL = 2, RR = 3;
        int[] dp = new int[4];

        int leftRobot = 0, rightRobot = 1;

        for (int wall : walls) {

            while (wall > r[rightRobot][0]) {
                leftRobot++;
                rightRobot++;

                int maxLeft = Math.max(dp[LL], dp[RL]);
                int maxRight = Math.max(dp[LR], dp[RR]);

                dp[LL] = maxLeft;
                dp[LR] = maxLeft;
                dp[RL] = maxRight;
                dp[RR] = maxRight;
            }

            int leftReach = r[leftRobot][0] + r[leftRobot][1];
            int rightReach = r[rightRobot][0] - r[rightRobot][1];

            boolean canLeftRobot = wall <= leftReach;
            boolean canRightRobot = wall >= rightReach;
            boolean atRightRobot = wall == r[rightRobot][0];

            if (canRightRobot) dp[LL]++;
            if (atRightRobot) dp[LR]++;
            if (canLeftRobot || canRightRobot) dp[RL]++;
            if (canLeftRobot || atRightRobot) dp[RR]++;
        }

        int ans = 0;
        for (int v : dp) ans = Math.max(ans, v);
        return ans;
    }
}
