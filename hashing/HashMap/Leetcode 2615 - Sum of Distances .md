# Leetcode 2615 - Sum of Distances 

## 🧩 Problem Statement
You are given a **0-indexed integer array `nums`**.

There exists an array `arr` of length `nums.length` such that:

- `arr[i]` is the **sum of |i - j|** over all indices `j` where  
  `nums[j] == nums[i]` **and** `j ≠ i`
- If no such index `j` exists, then `arr[i] = 0`

Return the array `arr`.

---

## 💡 Intuition
For each index, we want the total distance to **all other indices with the same value**.

A brute-force solution checking all pairs would take **O(n²)** time — unacceptable for large inputs.

This solution optimizes the process using:
- **Index grouping with HashMap**
- **Prefix sums** to compute distances efficiently

---

## 🛠️ Approach
1. Group all indices for each unique value in `nums`.
2. For each group of indices:
   - Maintain running sums of indices on the **left** and **right**
   - Compute total distance contribution in **O(1)** time per index
3. Store the computed distance in the result array.

---

## 🚀 Java Implementation

```java
class Solution {
    public long[] distance(int[] nums) {
        HashMap<Integer, List<Integer>> hmap = new HashMap<>();

        // Group indices by value
        for (int i = 0; i < nums.length; i++) {
            hmap.putIfAbsent(nums[i], new ArrayList<>());
            hmap.get(nums[i]).add(i);
        }

        long[] ans = new long[nums.length];

        // Process each group
        for (List<Integer> list : hmap.values()) {
            int n = list.size();

            long leftSum = 0L;
            long rightSum = 0L;

            // Initial right sum
            for (int idx : list) {
                rightSum += idx;
            }

            for (int i = 0; i < n; i++) {
                int index = list.get(i);
                rightSum -= index;

                long curr = 0L;

                // Contribution from left indices
                curr += (long) index * i - leftSum;

                // Contribution from right indices
                curr += rightSum - (long) (n - i - 1) * index;

                leftSum += index;
                ans[index] = curr;
            }
        }

        return ans;
    }
}
