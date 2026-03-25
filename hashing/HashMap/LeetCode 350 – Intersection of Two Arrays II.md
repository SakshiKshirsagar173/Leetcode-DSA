# LeetCode 350 – Intersection of Two Arrays II

## 📌 Problem Statement
Given two integer arrays `nums1` and `nums2`, return an array of their **intersection**.

Each element in the result should appear **as many times as it shows in both arrays**.
The order of elements in the result does not matter.

---

## 💡 Approach – HashMap (Frequency Counting)

This solution uses a **HashMap** to count the frequency of elements in the first array and
then checks elements from the second array against these frequencies.

---

## 🧠 Algorithm
1. Create a `HashMap` to store the frequency of each number in `nums1`.
2. Traverse `nums2`:
   - If the current number exists in the map with count > 0, add it to the result.
   - Decrease its frequency in the map.
3. Return the result array with the correct size.

---

## 💻 Code Implementation (Java)

```java
class Solution {
    public int[] intersect(int[] nums1, int[] nums2) {
        Map<Integer, Integer> map = new HashMap<>();

        // Count frequency of elements in nums1
        for (int num : nums1) {
            map.put(num, map.getOrDefault(num, 0) + 1);
        }

        int[] res = new int[nums1.length];
        int k = 0;

        // Find intersection using nums2
        for (int num : nums2) {
            int count = map.getOrDefault(num, 0);

            if (count == 0) {
                continue;
            } else {
                res[k] = num;
                k++;
                map.put(num, count - 1);
            }
        }

        return Arrays.copyOfRange(res, 0, k);
    }
}
