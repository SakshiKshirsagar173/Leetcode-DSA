# LeetCode 657 – Robot Return to Origin

## 📌 Problem Statement
A robot starts at the origin `(0, 0)` on a 2D plane.  
You are given a string `moves` consisting of characters:

- `'U'` → move up  
- `'D'` → move down  
- `'L'` → move left  
- `'R'` → move right  

Each character represents one unit movement.

Return **true** if the robot returns to the origin after performing all moves, otherwise return **false**.

---

## 💡 Approach

We track the robot’s position using two variables:
- `xdir` → horizontal movement
- `ydir` → vertical movement

For each character in the string:
- Update `xdir` or `ydir` accordingly
- After processing all moves, check whether both coordinates are back to `0`

---

## 🧠 Algorithm
1. Initialize `xdir = 0` and `ydir = 0`
2. Traverse each character in `moves`
3. Update position based on direction
4. Return `true` if `(xdir == 0 && ydir == 0)`

---

## 💻 Java Code

```java
class Solution {
    public boolean judgeCircle(String moves) {
        int ydir = 0, xdir = 0;

        for (int i = 0; i < moves.length(); i++) {
            char ch = moves.charAt(i);

            if (ch == 'U')
                ydir++;
            else if (ch == 'D')
                ydir--;
            else if (ch == 'L')
                xdir--;
            else
                xdir++;
        }

        return xdir == 0 && ydir == 0;
    }
}
