# LeetCode 1089 – Duplicate Zeros

## 📌 Problem Statement
Given a **fixed-length integer array**, duplicate each occurrence of `0`, shifting the remaining elements to the right.  
Elements beyond the array length are discarded.  
The modification must be done **in-place**.

---

## 💡 Approach (In-place Two-Pass Strategy)

The key challenge is **not using extra space** while shifting elements.

### Idea:
1. **First Pass**
   - Count how many zeros can be duplicated within array bounds.
   - Adjust the effective last index to avoid overflow.

2. **Second Pass (Backward)**
   - Traverse from the back.
   - Shift elements to their new positions.
   - Duplicate zeros safely without overwriting needed values.

This backward traversal is crucial—forward shifting would overwrite values before they are copied.

---

## 🧠 Algorithm Steps
1. Count duplicable zeros (`possibleZeroDups`)
2. Adjust last valid index
3. Traverse from back:
   - If element is `0`, write it twice
   - Otherwise, shift normally

---

## 💻 Java Code

```java
class Solution {
    public void duplicateZeros(int[] arr) {
        int possibleZeroDups = 0;
        int lastIdx = arr.length - 1;

        // First pass: count zeros that can be duplicated
        for (int i = 0; i <= lastIdx - possibleZeroDups; i++) {
            if (arr[i] == 0) {
                if (i == lastIdx - possibleZeroDups) {
                    arr[lastIdx] = 0;
                    lastIdx -= 1;
                    break;
                }
                possibleZeroDups++;
            }
        }

        int newLastIdx = lastIdx - possibleZeroDups;

        // Second pass: shift elements from back
        for (int i = newLastIdx; i >= 0; i--) {
            if (arr[i] == 0) {
                arr[i + possibleZeroDups] = 0;
                possibleZeroDups--;
                arr[i + possibleZeroDups] = 0;
            } else {
                arr[i + possibleZeroDups] = arr[i];
            }
        }
    }
}
