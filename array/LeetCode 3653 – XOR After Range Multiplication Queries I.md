# LeetCode 3653 – XOR After Range Multiplication Queries I

## 📌 Problem Statement
You are given:
- An integer array `nums` of length `n`
- A 2D integer array `queries`, where  
  `queries[i] = [li, ri, ki, vi]`

For **each query**, perform the following steps:
1. Set `idx = li`
2. While `idx <= ri`:
   - Update `nums[idx] = (nums[idx] * vi) % (10^9 + 7)`
   - Set `idx += ki`
3. After processing all queries, return the **bitwise XOR** of all elements in `nums`.

---

## 🧠 Approach
This solution directly **simulates each query** as described:

- Iterate through every query
- For each query, update elements starting from `li` to `ri` with step `ki`
- Apply modulo multiplication to avoid overflow
- Finally, compute the XOR of all elements

This is a **brute-force simulation approach**, suitable for the constraints of this version of the problem.

---

## 💻 Java Code

```java
class Solution {
    int mod = 1_000_000_007;

    public int xorAfterQueries(int[] nums, int[][] queries) {

        for (int[] q : queries) {

            int idx = q[0];
            int r   = q[1];
            int k   = q[2];
            int v   = q[3];

            while (idx <= r) {
                long curr = nums[idx];
                curr = (curr * v) % mod;
                nums[idx] = (int) curr;
                idx += k;
            }
        }

        int xor = 0;
        for (int num : nums) {
            xor ^= num;
        }

        return xor;
    }
}
