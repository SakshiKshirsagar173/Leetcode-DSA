# LeetCode 48 – Rotate Image

## 📌 Problem Statement
You are given an `n x n` 2D matrix representing an image.
Rotate the image by **90 degrees clockwise**, **in-place**.

You must modify the input matrix directly and **cannot use another matrix**.

---

## 💡 Approach – Transpose + Reverse

The rotation can be achieved in two steps:
1. **Transpose the matrix** (convert rows to columns).
2. **Reverse each row** of the transposed matrix.

This approach performs the rotation efficiently without extra space.

---

## 🧠 Algorithm
1. Get the size `n` of the matrix.
2. Transpose the matrix:
   - Swap `matrix[i][j]` with `matrix[j][i]` for `j > i`.
3. Reverse each row:
   - Swap elements from left and right within each row.
4. The matrix is now rotated by 90° clockwise.

---

## 💻 Code Implementation (Java)

```java
class Solution {
    public void rotate(int[][] matrix) {

        int n = matrix.length;

        // Step 1: Transpose the matrix
        for (int i = 0; i < n; i++) {
            for (int j = i + 1; j < n; j++) {
                int temp = matrix[i][j];
                matrix[i][j] = matrix[j][i];
                matrix[j][i] = temp;
            }
        }

        // Step 2: Reverse each row
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n / 2; j++) {
                int temp = matrix[i][j];
                matrix[i][j] = matrix[i][n - 1 - j];
                matrix[i][n - 1 - j] = temp;
            }
        }
    }
}
