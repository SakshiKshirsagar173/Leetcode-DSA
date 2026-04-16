# Leetcode 3488 - Closest Equal Element Queries

## 📌 Problem Overview

You are given:
- A **circular array** `nums`
- An array of indices `queries`

For each query index `q`, you must find:

> The **minimum circular distance** between index `q` and **any other index `j`** such that  
> `nums[j] == nums[q]` and `j ≠ q`.

If no such index exists, return `-1` for that query.

📍 **Circular distance rule**:  
For two indices `i` and `j` in an array of size `n`, the circular distance is:
min(|i - j|, n - |i - j|)


---

## 🧠 Key Insight

- Directly answering each query would be **too slow**.
- Instead, **precompute** the answer for **every index** once.
- Queries then become **O(1)** lookups.

---

## 🚀 Approach

### 1️⃣ Group Indices by Value
- Use a `HashMap<Integer, List<Integer>>`
- Each number maps to all indices where it appears.

### 2️⃣ Precompute Minimum Circular Distance
- Create an array `precomputed[]` initialized with `-1`.
- For each group:
  - If a value appears only once → distance stays `-1`.
  - Otherwise:
    - Treat the list as circular.
    - For each index:
      - Compare distance to previous and next occurrence.
      - Apply circular distance formula.

### 3️⃣ Answer Queries
- For each query `q`, return `precomputed[q]`.

---

## ✅ Java Implementation

```java
class Solution {
    public List<Integer> solveQueries(int[] nums, int[] queries) {
        int n = nums.length;
        List<Integer> ans = new ArrayList<>();

        // Step 1: Group indices by value
        HashMap<Integer, List<Integer>> hmap = new HashMap<>();
        for (int i = 0; i < n; i++) {
            hmap.putIfAbsent(nums[i], new ArrayList<>());
            hmap.get(nums[i]).add(i);
        }

        // Step 2: Precompute answers for all indices
        int[] precomputed = new int[n];
        Arrays.fill(precomputed, -1);

        for (List<Integer> list : hmap.values()) {
            int len = list.size();
            if (len == 1) continue;

            for (int i = 0; i < len; i++) {
                int curr = list.get(i);
                int prev = list.get((i - 1 + len) % len);
                int next = list.get((i + 1) % len);

                int d1 = Math.abs(curr - prev);
                int d2 = Math.abs(curr - next);

                precomputed[curr] = Math.min(
                        Math.min(d1, d2),
                        Math.min(n - d1, n - d2)
                );
            }
        }

        // Step 3: Resolve queries
        for (int q : queries) {
            ans.add(precomputed[q]);
        }

        return ans;
    }
}
