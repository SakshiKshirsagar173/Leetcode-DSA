## Problem
**LeetCode 189 – Rotate Array**

Given an integer array `nums`, rotate the array to the right by `k` steps,
where `k` is non-negative.

The rotation must be done **in-place**, without using extra space.

---

## Approach: Reversal Technique (In-place)

Instead of rotating elements one by one, we use array reversal to achieve
the rotation efficiently.

The idea is based on the observation that a right rotation by `k` steps can
be achieved using three reversals.

---

## Algorithm
1. Compute `k = k % n` to handle cases where `k > n`
2. Reverse the entire array
3. Reverse the first `k` elements
4. Reverse the remaining `n - k` elements

---

## Code
```java
class Solution {

    public void rev(int[] nums, int start, int end){
        while(start <= end){
            int temp = nums[start];
            nums[start] = nums[end];
            nums[end] = temp;
            start++;
            end--;
        }
    }

    public void rotate(int[] nums, int k) {
        int n = nums.length;

        if(k % n == 0){
            return;
        }

        k = k % n;
        rev(nums, 0, n - 1);
        rev(nums, 0, k - 1);
        rev(nums, k, n - 1);
    }
}
