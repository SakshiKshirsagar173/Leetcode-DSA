# LeetCode 66 – Plus One

## 📌 Problem Statement
You are given a non-empty array of digits representing a non-negative integer.
Increment the integer by one and return the resulting array of digits.

The digits are stored such that the most significant digit is at the head of the list.

---

## 💡 Approach
We simulate **manual addition from right to left**, just like adding numbers on paper.

- Start from the last digit.
- If the digit is less than 9, increment it and return the array.
- If the digit is 9, convert it to 0 and continue carrying.
- If all digits are 9, create a new array with an extra digit.

---

## 🧠 Algorithm
1. Traverse the array from the last index to the first.
2. If a digit is `9`, set it to `0` and continue.
3. If a digit is not `9`, increment it and return the array.
4. If all digits were `9`, create a new array of size `n+1` with `1` at index `0`.

---

## 💻 Code Implementation (Java)

```java
class Solution {
    public int[] plusOne(int[] digits) {
        for (int i = digits.length - 1; i >= 0; i--) {
            if (digits[i] == 9) {
                digits[i] = 0;
            } else {
                digits[i] = digits[i] + 1;
                return digits;
            }
        }

        int[] res = new int[digits.length + 1];
        res[0] = 1;
        return res;
    }
}
