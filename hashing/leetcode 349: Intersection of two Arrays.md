# LeetCode 349 – Intersection of Two Arrays

## Problem Statement
Given two integer arrays `nums1` and `nums2`, return an array of their **intersection**.
Each element in the result must be **unique**, and the order of elements does not matter.

---

## Approach
This solution uses **HashSet (Hashing technique)** to efficiently find common unique elements
between two arrays.

### Steps:
1. Store all elements of `nums1` in a HashSet.
2. Store all elements of `nums2` in another HashSet.
3. Traverse the first set and check which elements also exist in the second set.
4. Store common elements in a result array.
5. Return the result array with the correct size.

---
## Code Implementation (Java)

```java
class Solution {
    public int[] intersection(int[] nums1, int[] nums2) {
        Set<Integer> s1 = new HashSet<>();
        Set<Integer> s2 = new HashSet<>();

        for (int num : nums1) {
            s1.add(num);
        }

        for (int num : nums2) {
            s2.add(num);
        }

        int[] res = new int[s1.size()];
        int k = 0;

        for (int num : s1) {
            if (s2.contains(num)) {
                res[k] = num;
                k++;
            }
        }

        return Arrays.copyOfRange(res, 0, k);
    }
}
