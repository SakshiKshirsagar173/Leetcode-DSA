# LeetCode 1295 – Find Numbers with Even Number of Digits

## 📌 Problem Statement
Given an integer array `nums`, return the count of numbers that contain an **even number of digits**.

---

## 💡 Approach

The solution breaks the problem into two clear steps:

1. **Count digits of a number**
   - Repeatedly divide the number by 10
   - Increment a counter for each division
   - Check if the digit count is even

2. **Traverse the array**
   - For each number, check if it has even digits
   - Maintain a counter for valid numbers

This keeps the logic clean and readable by separating concerns.

---

## 🧠 Algorithm
1. Initialize `evenCount = 0`
2. For every number in `nums`:
   - Count digits using a helper function
   - If digit count is even, increment `evenCount`
3. Return `evenCount`

---

## 💻 Java Code

```java
class Solution {
    public boolean numberHasEvenDigits(int num) {
        int digitsCount = 0;
        while (num != 0) {
            num = num / 10;
            digitsCount++;
        }
        return digitsCount % 2 == 0;
    }

    public int findNumbers(int[] nums) {
        int evenCount = 0;

        for (int i = 0; i < nums.length; i++) {
            if (numberHasEvenDigits(nums[i])) {
                evenCount++;
            }
        }
        return evenCount;
    }
}
