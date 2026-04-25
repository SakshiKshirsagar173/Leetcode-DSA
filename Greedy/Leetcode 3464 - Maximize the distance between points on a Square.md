# Leetcode 3464 - Maximize the distance between points on a Square

## 🧩 Problem Overview
You are given:
- An integer `side` representing the length of a square’s side.
- A 2D array `points`, where each point lies **on the boundary** of the square.
- An integer `k`.

Your task is to select **k points** such that the **minimum distance between any two consecutive selected points (along the square’s perimeter)** is maximized.

Return that maximum possible minimum distance.

---

## 💡 Key Idea
The square’s boundary can be treated as a **1D circular perimeter** of length `4 × side`.

Each boundary point `(x, y)` is mapped to a **linear distance along the perimeter**:
- Left edge → `y`
- Top edge → `side + x`
- Right edge → `3 × side − y`
- Bottom edge → `4 × side − x`

Once mapped:
- Sort the points on the perimeter.
- Use **binary search** to find the largest minimum distance that allows placing `k` points.

---

## 🛠️ Approach
1. Convert all boundary points into their perimeter distances.
2. Sort the perimeter distances.
3. Binary search on the answer (`minimum distance`):
   - Check feasibility using greedy placement.
   - Ensure selected points stay within one full perimeter cycle.
4. Return the maximum valid distance.

---

## 🚀 Java Implementation

```java
class Solution {
    public int maxDistance(int side, int[][] points, int k) {

        List<Long> arr = new ArrayList<>();

        // Convert points to perimeter distances
        for (int[] p : points) {
            int x = p[0], y = p[1];
            if (x == 0)          arr.add((long) y);
            else if (y == side)  arr.add((long) side + x);
            else if (x == side)  arr.add(3L * side - y);
            else                 arr.add(4L * side - x);
        }

        Collections.sort(arr);

        long low = 1, high = 2L * side;
        int ans = 0;

        // Binary search for maximum minimum distance
        while (low <= high) {
            long mid = low + (high - low) / 2;

            if (isValid(arr, side, k, mid)) {
                ans = (int) mid;
                low = mid + 1;
            } else {
                high = mid - 1;
            }
        }

        return ans;
    }

    boolean isValid(List<Long> arr, int side, int k, long dist) {
        long perimeter = 4L * side;

        for (int i = 0; i < arr.size(); i++) {
            long start = arr.get(i);
            long limit = start + perimeter - dist;

            for (int j = 1; j < k; j++) {
                int next = lowerBound(arr, start + dist);
                if (next == arr.size() || arr.get(next) > limit) {
                    start = -1;
                    break;
                }
                start = arr.get(next);
            }

            if (start >= 0) return true;
        }

        return false;
    }

    int lowerBound(List<Long> arr, long target) {
        int low = 0, high = arr.size();
        while (low < high) {
            int mid = low + (high - low) / 2;
            if (arr.get(mid) < target) low = mid + 1;
            else high = mid;
        }
        return low;
    }
}
