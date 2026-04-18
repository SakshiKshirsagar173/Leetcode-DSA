# Leetcode 3783 - Mirror Distance of an Integer

## 📌 Problem Statement

You are given an integer `n`.

The **mirror distance** of `n` is defined as:
abs(n - reverse(n))


where `reverse(n)` is the integer formed by reversing the digits of `n`.  
Leading zeros are ignored after reversing.

`abs(x)` denotes the absolute value of `x`.

### 🎯 Objective
Return the mirror distance of the given integer `n`.

---

## 🧠 Approach

1. Reverse the digits of the integer `n`.
2. Compute the absolute difference between `n` and its reversed value.
3. Return the result.

This is a straightforward **math + digit manipulation** problem.

---

## ⚙️ Algorithm

- Initialize `rev = 0`
- While `n > 0`:
  - Extract the last digit using `n % 10`
  - Append it to `rev`
  - Remove the last digit from `n`
- Return `abs(original_n - rev)`

---

## 💻 Java Implementation

```java
class Solution {
    public int mirrorDistance(int n) {
        int rev = getReverse(n);
        return Math.abs(n - rev);
    }

    int getReverse(int num) {
        int ans = 0;
        while (num > 0) {
            ans = ans * 10 + num % 10;
            num /= 10;
        }
        return ans;
    }
}
