# LeetCode 2839 – Check if Strings Can Be Made Equal With Operations I

## 📌 Problem Statement
You are given two strings `s1` and `s2`, each of **length 4**.

You are allowed to perform the following operation any number of times:
- Swap characters at **even indices** (`0` and `2`)
- Swap characters at **odd indices** (`1` and `3`)

Return `true` if `s1` can be made equal to `s2` using the allowed operations, otherwise return `false`.

---

## 💡 Key Insight
- Characters at **even positions** can only swap with other even positions
- Characters at **odd positions** can only swap with other odd positions
- So we just need to check:
  - Do the characters at indices `{0,2}` match between `s1` and `s2` (in any order)?
  - Do the characters at indices `{1,3}` match between `s1` and `s2` (in any order)?

---

## 🧠 Approach
1. Check all valid permutations for **even indices (0, 2)**
2. Check all valid permutations for **odd indices (1, 3)**
3. If **both conditions** are satisfied → return `true`

---

## 💻 Java Code

```java
class Solution {
    public boolean canBeEqual(String s1, String s2) {
        boolean condition1 =
            (s1.charAt(0) == s2.charAt(0) && s1.charAt(2) == s2.charAt(2)) ||
            (s1.charAt(0) == s2.charAt(2) && s1.charAt(2) == s2.charAt(0));

        boolean condition2 =
            (s1.charAt(1) == s2.charAt(1) && s1.charAt(3) == s2.charAt(3)) ||
            (s1.charAt(1) == s2.charAt(3) && s1.charAt(3) == s2.charAt(1));

        return condition1 && condition2;
    }
}
