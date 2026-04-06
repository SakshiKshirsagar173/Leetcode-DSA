# LeetCode 977 – Squares of a Sorted Array

## 📌 Problem Statement
You are given an integer array `nums` sorted in **non-decreasing order**.

Return an array of the **squares of each number**, also sorted in non-decreasing order.

---

## 🧠 Approach
1. Create a new array `result`.
2. Square every element from the original array and store it in `result`.
3. Sort the `result` array using `Arrays.sort()`.
4. Return the sorted squared array.

This approach focuses on **simplicity and clarity**.

---

## 💻 Java Code

```java
class Solution {
    public int[] sortedSquares(int[] nums) {
        int N = nums.length;
        int[] result = new int[N];

        for (int i = 0; i < N; i++) {
            result[i] = nums[i] * nums[i];
        }

        Arrays.sort(result);
        return result;
    }
}
