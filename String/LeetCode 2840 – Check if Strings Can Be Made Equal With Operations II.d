# LeetCode 2840 – Check if Strings Can Be Made Equal With Operations II

## 📌 Problem Statement
You are given two strings `s1` and `s2` of equal length.

You can perform the following operation any number of times:
- Swap characters at **even indices** among themselves
- Swap characters at **odd indices** among themselves

Return `true` if `s1` can be made equal to `s2`, otherwise return `false`.

---

## 💡 Approach – Frequency Counting by Index Parity

Key observation:
- Characters at **even indices** can only move to other even indices
- Characters at **odd indices** can only move to other odd indices

So instead of performing swaps, we compare **character frequencies** at even and odd positions separately.

---

## 🧠 Algorithm
1. Create two frequency arrays:
   - `even[26]` for characters at even indices
   - `odd[26]` for characters at odd indices
2. Traverse both strings at the same time:
   - At even index:
     - Increment frequency from `s1`
     - Decrement frequency from `s2`
   - At odd index:
     - Do the same using the `odd` array
3. If all frequencies are zero, return `true`
4. Otherwise, return `false`

---

## 💻 Code Implementation (Java)

```java
class Solution {
    public boolean checkStrings(String s1, String s2) {

        int[] even = new int[26];
        int[] odd = new int[26];

        int n = s1.length();

        for (int i = 0; i < n; i++) {
            int c1 = s1.charAt(i) - 'a';
            int c2 = s2.charAt(i) - 'a';

            if (i % 2 == 0) {
                even[c1]++;
                even[c2]--;
            } else {
                odd[c1]++;
                odd[c2]--;
            }
        }

        for (int i = 0; i < 26; i++) {
            if (even[i] != 0 || odd[i] != 0) {
                return false;
            }
        }

        return true;
    }
}
