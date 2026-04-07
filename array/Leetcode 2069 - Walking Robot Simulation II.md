# Leetcode 2069 - Walking Robot Simulation II

## 📌 Problem Statement
A `width × height` grid lies on the XY-plane:

- Bottom-left cell is `(0, 0)`
- Top-right cell is `(width - 1, height - 1)`
- The robot starts at `(0, 0)` facing **East**

The robot follows these rules for each step:
1. Tries to move **one cell forward** in the direction it is facing
2. If the next cell is **out of bounds**, the robot turns **90° counterclockwise** and retries the step
3. After completing all steps, the robot stops

---

## 🛠️ You must implement the `Robot` class with:
- `Robot(int width, int height)`
- `void step(int num)`
- `int[] getPos()`
- `String getDir()`

---

## 🧠 Key Insight
The robot **never enters the grid interior**.  
It only walks along the **border of the grid** in a fixed loop.

So instead of simulating each step:
- Precompute **all border cells in clockwise order**
- Store `(x, y, direction)` for each border cell
- Use **modulo arithmetic** to jump to the correct position instantly

This makes every operation **O(1)**.

---

## 💡 Approach

### 1️⃣ Precompute the Border
Store all border cells in order:
- Bottom edge → East
- Right edge → North
- Top edge → West
- Left edge → South

Each cell also stores the direction the robot is facing at that position.

---

### 2️⃣ Track Total Steps
Maintain a variable `count`:
- `step(num)` → `count += num`
- Actual position index = `count % borderLength`

---

### 3️⃣ Constant-Time Queries
- `getPos()` → return `(x, y)` from the precomputed list
- `getDir()` → return direction from the same index

---

## 💻 Java Code

```java
class Robot {

    List<int[]> cells;
    int count;

    public Robot(int width, int height) {
        cells = new ArrayList<>();
        count = 0;

        // Starting point (0,0) – internal direction South
        cells.add(new int[]{0, 0, 3});

        // Bottom edge (East)
        for (int i = 1; i < width; i++)
            cells.add(new int[]{i, 0, 0});

        // Right edge (North)
        for (int j = 1; j < height; j++)
            cells.add(new int[]{width - 1, j, 1});

        // Top edge (West)
        for (int i = width - 2; i >= 0; i--)
            cells.add(new int[]{i, height - 1, 2});

        // Left edge (South)
        for (int j = height - 2; j > 0; j--)
            cells.add(new int[]{0, j, 3});
    }

    public void step(int num) {
        count += num;
    }

    public int[] getPos() {
        int index = count % cells.size();
        return new int[]{cells.get(index)[0], cells.get(index)[1]};
    }

    public String getDir() {
        if (count == 0) return "East";

        int index = count % cells.size();
        int dir = cells.get(index)[2];

        if (dir == 0) return "East";
        if (dir == 1) return "North";
        if (dir == 2) return "West";
        return "South";
    }
}
