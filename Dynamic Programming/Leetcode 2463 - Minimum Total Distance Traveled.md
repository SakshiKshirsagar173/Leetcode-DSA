# Leetcode 2463 - Minimum Total Distance Traveled by Robots

## 📌 Problem Summary
You are given:
- A list of robot positions on the X-axis.
- A list of factories, where each factory has:
  - A position on the X-axis.
  - A maximum number of robots it can repair.

All robots are broken and will move either left or right.  
When a robot reaches a factory **that still has remaining capacity**, it gets repaired and stops.

🎯 **Goal:**  
Assign each robot to a factory (respecting factory limits) such that the **total distance traveled by all robots is minimized**.

The problem guarantees that all robots **can** be repaired.

---

## 🧠 Key Observations
- Robots and factories are on a **1D line** → sorting helps.
- Each robot must be assigned to **exactly one factory**.
- Each factory has a **capacity constraint**.
- Direction choice doesn’t matter once assignment is fixed → distance is absolute difference.

This is **not greedy**.  
It is a **Dynamic Programming + Optimization** problem.

---

## 🧩 Approach Used

### 🔹 Strategy
1. **Sort robots by position**
2. **Sort factories by position**
3. Use **DP with recursion + memoization** to decide:
   - Skip a factory
   - Or assign 1 to `limit` robots to that factory

---

## 🧮 DP Definition
dp[r][f] = minimum total distance to repair robots starting from
robot index r using factories from index f onward


---

## 🔁 Transitions

At state `(rindex, findex)`:

### 1️⃣ Skip current factory
```java
skip = helper(robot, factory, rindex, findex + 1)

### 2️⃣ Use current factory

Assign up to limit robots:

Accumulate distance
Recurse for remaining robots and next factory

Take the minimum of all valid choices.

### ⛔ Base Cases
All robots assigned → cost = 0
Factories exhausted but robots remain → invalid (Long.MAX_VALUE)

### Java Implementation 
``` java
class Solution {
    Long dp[][];
    
    public long minimumTotalDistance(List<Integer> robot, int[][] factory) {
        dp = new Long[robot.size()][factory.length];
        
        // Sort robots and factories by position
        Collections.sort(robot);
        Arrays.sort(factory, (a, b) -> a[0] - b[0]);
        
        return helper(robot, factory, 0, 0);
    }

    long helper(List<Integer> robot, int[][] factory, int rindex, int findex) {
        // All robots repaired
        if (rindex == robot.size())
            return 0;

        // No factories left but robots remain
        if (findex == factory.length)
            return Long.MAX_VALUE;

        if (dp[rindex][findex] != null)
            return dp[rindex][findex];

        // Option 1: Skip this factory
        long skip = helper(robot, factory, rindex, findex + 1);

        // Option 2: Use this factory
        long dist = 0;
        long ans = Long.MAX_VALUE;

        for (int k = 0; k < factory[findex][1] && rindex + k < robot.size(); k++) {
            dist += Math.abs(robot.get(rindex + k) - factory[findex][0]);
            long next = helper(robot, factory, rindex + k + 1, findex + 1);

            if (next < Long.MAX_VALUE)
                ans = Math.min(ans, dist + next);
        }

        return dp[rindex][findex] = Math.min(skip, ans);
    }
}
