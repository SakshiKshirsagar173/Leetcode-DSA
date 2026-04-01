# LeetCode – Survived Robots Healths

## 🧩 Problem Summary
You are given:
- `positions[]` → position of each robot on a line
- `healths[]` → health of each robot
- `directions` → `'L'` or `'R'` indicating movement direction

Robots move simultaneously.  
When two robots collide:
- The robot with **lower health dies**
- The robot with **higher health loses 1 health**
- If both have equal health, **both die**

Your task is to return the **healths of robots that survive**, in any order.

---

## 💡 Key Idea
Robots only collide when:
- A robot moving **right (`R`)** meets a robot moving **left (`L`)**

So we:
1. **Sort robots by position**
2. Use a **stack** to keep track of right-moving robots
3. Process collisions when a left-moving robot appears

---

## 🛠️ Approach Used

### 1️⃣ Sort by Position
- We sort robot indices based on `positions[]`
- This ensures robots are processed **left to right**, just like real movement

### 2️⃣ Stack for Collision Handling
- Push indices of robots moving `'R'`
- When a robot moving `'L'` is encountered:
  - It collides with the **top of the stack**
  - Health is compared and updated accordingly
  - Continue until collision resolves or stack becomes empty

### 3️⃣ Collect Survivors
- Any robot with `health > 0` at the end survives

---

## 🧠 Algorithm Type
- **Stack**
- **Sorting**
- **Simulation**
- **Greedy Collision Resolution**

❌ This is **NOT DP**  
❌ This is **NOT Two Pointer**

---

## 💻 Java Code

```java
import java.util.*;

class Solution {
    public List<Integer> survivedRobotsHealths(int[] positions, int[] healths, String directions) {
        int n = positions.length;

        List<Integer> indices = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            indices.add(i);
        }

        Collections.sort(indices, (a, b) -> positions[a] - positions[b]);

        Stack<Integer> st = new Stack<>();

        for (int i : indices) {
            if (directions.charAt(i) == 'R') {
                st.push(i);
                continue;
            }

            while (!st.isEmpty() && healths[i] > 0) {
                int htop = st.peek();

                if (healths[htop] > healths[i]) {
                    healths[htop]--;
                    healths[i] = 0;
                } else if (healths[htop] < healths[i]) {
                    healths[st.pop()] = 0;
                    healths[i]--;
                } else {
                    healths[st.pop()] = 0;
                    healths[i] = 0;
                }
            }
        }

        List<Integer> ans = new ArrayList<>();
        for (int h : healths) {
            if (h > 0) ans.add(h);
        }
        return ans;
    }
}
