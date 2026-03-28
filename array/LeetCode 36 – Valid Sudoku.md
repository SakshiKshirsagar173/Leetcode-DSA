# LeetCode 36 – Valid Sudoku

## 📌 Problem Statement
Determine if a `9 x 9` Sudoku board is valid.

A Sudoku board is valid if:
- Each row contains digits `1–9` without repetition.
- Each column contains digits `1–9` without repetition.
- Each `3 x 3` sub-box contains digits `1–9` without repetition.

The board may contain empty cells represented by `'.'`.

---

## 💡 Approach – Array-Based Hashing

Instead of using `HashSet`, this solution uses **fixed-size 2D arrays** to track
whether a digit has already appeared in:
- a row
- a column
- a 3×3 sub-box

This works efficiently because the board size is fixed (9×9).

---

## 🧠 Algorithm
1. Create three `9 x 9` arrays:
   - `rows[r][d]` → digit `d` exists in row `r`
   - `cols[c][d]` → digit `d` exists in column `c`
   - `boxes[b][d]` → digit `d` exists in sub-box `b`
2. Traverse each cell in the board:
   - Skip empty cells (`.`)
   - Convert character digit to index (`digit - '1'`)
3. Check if the digit already exists in its row, column, or box.
4. If yes → return `false`
5. Otherwise, mark the digit as seen.
6. If no conflicts found → return `true`

---

## 💻 Code Implementation (Java)

```java
class Solution {
    public boolean isValidSudoku(char[][] board) {
        int[][] rows = new int[9][9];
        int[][] cols = new int[9][9];
        int[][] boxes = new int[9][9];

        for (int r = 0; r < 9; r++) {
            for (int c = 0; c < 9; c++) {

                if (board[r][c] == '.') continue;

                int val = board[r][c] - '1';

                if (rows[r][val] == 1) return false;
                rows[r][val] = 1;

                if (cols[c][val] == 1) return false;
                cols[c][val] = 1;

                int boxIdx = 3 * (r / 3) + (c / 3);
                if (boxes[boxIdx][val] == 1) return false;
                boxes[boxIdx][val] = 1;
            }
        }
        return true;
    }
}
