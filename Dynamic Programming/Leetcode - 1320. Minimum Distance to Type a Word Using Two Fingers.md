# Leetcode - 1320. Minimum Distance to Type a Word Using Two Fingers

## 📌 Problem Overview
You are given a string `word` consisting of uppercase English letters (`A`–`Z`).

You are typing this word using **two fingers** on a special keyboard layout:

- The keyboard has **6 columns**
- Letters are placed row-wise from `A` to `Z`
- Each finger can start at **any position** (no initial cost)

👉 **Goal:**  
Minimize the **total Manhattan distance** your fingers travel to type the entire word.

---

## 🧠 Key Idea
At every character, you have **two choices**:
- Type it using **Finger 1**
- Type it using **Finger 2**

This creates **overlapping subproblems**, making this a **Dynamic Programming (DP)** problem.

---

## 🧩 DP State Definition

We use **3D DP with memoization**:
dp[i][pos1][pos2]

Where:
- `i` → current index in the word
- `pos1` → last position of finger 1 (`-1` if unused)
- `pos2` → last position of finger 2 (`-1` if unused)

Each state stores the **minimum cost** to type from index `i` onward.

---

## 🔁 Transition Logic
At index `i`, let `ch` be the current character:

1. **Use Finger 1**
   - Cost = distance from `pos1 → ch`
   - Recurse with `(i+1, ch, pos2)`

2. **Use Finger 2**
   - Cost = distance from `pos2 → ch`
   - Recurse with `(i+1, pos1, ch)`

Take the **minimum** of both choices.

---

## 📐 Distance Calculation
Characters are mapped to a grid:
row = index / 6
col = index % 6


Manhattan distance:
|row1 - row2| + |col1 - col2|


If a finger hasn’t been used yet (`pos = -1`), distance = `0`.

---

## 💻 Java Implementation

```java
class Solution {

    Integer dp[][][];

    public int minimumDistance(String word) {
        dp = new Integer[word.length()][27][27];
        return helper(word, 0, -1, -1);
    }

    int helper(String word, int i, int pos1, int pos2) {
        if (i == word.length()) {
            return 0;
        }

        if (dp[i][pos1 + 1][pos2 + 1] != null)
            return dp[i][pos1 + 1][pos2 + 1];

        int ch = word.charAt(i) - 'A';

        int useFinger1 = getDist(ch, pos1) + helper(word, i + 1, ch, pos2);
        int useFinger2 = getDist(ch, pos2) + helper(word, i + 1, pos1, ch);

        return dp[i][pos1 + 1][pos2 + 1] = Math.min(useFinger1, useFinger2);
    }

    int getDist(int ch, int pos) {
        if (pos == -1) return 0;

        int x1 = ch / 6, y1 = ch % 6;
        int x2 = pos / 6, y2 = pos % 6;

        return Math.abs(x1 - x2) + Math.abs(y1 - y2);
    }
}
