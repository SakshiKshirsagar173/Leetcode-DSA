# LeetCode 3474 – Generate String With Constraints 

## 📌 Problem Overview
You are given two strings:
- `str1` consisting of characters `'T'` and `'F'`
- `str2` consisting of lowercase English letters

You must generate a string `word` such that:
- For every index `i` where `str1[i] == 'T'`,  
  `str2` **must exactly match** `word` starting at index `i`
- For every index `i` where `str1[i] == 'F'`,  
  `str2` **must NOT match** `word` starting at index `i`

If it’s impossible to generate such a string, return an empty string `""`.

---

## 🧠 Core Idea
This problem is about **constructing a valid string under forced (`T`) and forbidden (`F`) substring constraints**.

The solution works in **three logical phases**:
1. **Force placements for `'T'`**
2. **Fill remaining characters safely**
3. **Break forbidden matches for `'F'`**

---

## 🚀 Approach Breakdown

### 1️⃣ Handle `'T'` Constraints (Forced Matches)
- Whenever `str1[i] == 'T'`, we **force-copy `str2` into `word` starting at index `i`**
- If a character is already set and conflicts → **impossible**, return `""`

This ensures all `'T'` conditions are satisfied first.

---

### 2️⃣ Fill Remaining Characters
- Any position in `word` that is still unset is filled with `'a'`
- This keeps the string valid and simple while avoiding unnecessary matches

---

### 3️⃣ Handle `'F'` Constraints (Forbidden Matches)
- For each `str1[i] == 'F'`, we check:
  - If `str2` **accidentally matches** `word` at position `i`
- If it matches:
  - Try to break the match by changing **one character**
  - But **do not modify positions that are required by a `'T'`**
- If no safe change is possible → return `""`

---

## 💻 Java Implementation

```java
class Solution {
    public String generateString(String str1, String str2) {
        int n = str1.length(), m = str2.length();
        char[] word = new char[n + m - 1];

        // Handle 'T' cases
        for (int i = 0; i < n; i++) {
            if (str1.charAt(i) == 'T') {
                for (int j = 0; j < m; j++) {
                    if (word[i + j] != '\u0000' && word[i + j] != str2.charAt(j)) {
                        return "";
                    } else {
                        word[i + j] = str2.charAt(j);
                    }
                }
            }
        }

        // Fill remaining characters
        for (int i = 0; i < word.length; i++) {
            if (word[i] == '\u0000') {
                word[i] = 'a';
            }
        }

        // Handle 'F' cases
        for (int i = 0; i < n; i++) {
            if (str1.charAt(i) == 'T') continue;

            boolean match = true;
            for (int j = 0; j < m; j++) {
                if (word[i + j] != str2.charAt(j)) {
                    match = false;
                    break;
                }
            }

            if (match) {
                boolean fixed = false;
                for (int j = m - 1; j >= 0; j--) {
                    if (!setByT(i, j, str1, m)) {
                        word[i + j] = (word[i + j] == 'a') ? 'b' : 'a';
                        fixed = true;
                        break;
                    }
                }
                if (!fixed) return "";
            }
        }

        return new String(word);
    }

    boolean setByT(int i, int j, String str1, int m) {
        int pos = i + j;
        int first = Math.max(0, pos - m + 1);
        int last = Math.min(pos, str1.length() - 1);

        for (int ind = first; ind <= last; ind++) {
            if (str1.charAt(ind) == 'T')
                return true;
        }
        return false;
    }
}
