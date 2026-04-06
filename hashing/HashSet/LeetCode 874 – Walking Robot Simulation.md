# LeetCode 874 – Walking Robot Simulation

## 📌 Problem Statement
A robot starts at position `(0, 0)` on an infinite 2D grid, facing **North**.

You are given:
- `commands[]` → list of instructions
- `obstacles[][]` → positions of obstacles on the grid

### Commands:
- `-2` → turn left 90°
- `-1` → turn right 90°
- `1 ≤ k ≤ 9` → move forward `k` units (one step at a time)

⚠️ If the robot hits an obstacle, it stops moving for that command and continues with the next one.

### Goal:
Return the **maximum squared Euclidean distance** from the origin `(0,0)` that the robot reaches at any point.

---

## 💡 Key Observations
- Robot always moves **step by step**, not in one jump
- Obstacles must be checked **before each step**
- Direction changes are cyclic (North → East → South → West)

---

## 🧠 Approach

1. Store obstacles in a `HashSet` for **O(1)** lookup  
2. Use a `direction` array to represent:
   - North `(0,1)`
   - East `(1,0)`
   - South `(0,-1)`
   - West `(-1,0)`
3. Maintain:
   - `(x, y)` → current position
   - `position` → current direction index
4. For movement commands:
   - Move one step at a time
   - Stop if the next cell is an obstacle
5. After every valid move, update the **maximum distance**

---

## 💻 Java Code

```java
class Solution {
    public int robotSim(int[] commands, int[][] obstacles) {
        HashSet<String> hset = new HashSet<>();

        for (int[] ob : obstacles) {
            hset.add(ob[0] + "#" + ob[1]);
        }

        int x = 0, y = 0;
        int[][] dir = {{0,1},{1,0},{0,-1},{-1,0}};
        int position = 0;
        int ans = 0;

        for (int c : commands) {
            if (c == -1) {
                position = (position + 1) % 4;   // turn right
            } else if (c == -2) {
                position = (position + 3) % 4;   // turn left
            } else {
                for (int i = 0; i < c; i++) {
                    String key = (x + dir[position][0]) + "#" + (y + dir[position][1]);
                    if (hset.contains(key)) break;

                    x += dir[position][0];
                    y += dir[position][1];
                    ans = Math.max(ans, x * x + y * y);
                }
            }
        }
        return ans;
    }
}
