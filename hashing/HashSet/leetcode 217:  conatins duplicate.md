## Problem
**LeetCode 217 – Contains Duplicate**

Given an integer array `nums`, return `true` if any value appears at least twice
in the array, and return `false` if every element is distinct.

---

## Approach: Hashing (Set)

We use a `HashSet` to keep track of elements we have already seen.

While iterating through the array:
- If the current element already exists in the set, a duplicate is found.
- Otherwise, add the element to the set and continue.

This allows us to detect duplicates efficiently in a single pass.

---

## Algorithm
1. Create an empty `HashSet`
2. Traverse the array element by element
3. If the current element exists in the set, return `true`
4. Otherwise, add the element to the set
5. If no duplicates are found, return `false`

---

## Code
```java
public boolean containsDuplicate(int[] nums) {
    Set<Integer> set = new HashSet<>();

    for (int num : nums) {
        if (set.contains(num)) {
            return true;
        }
        set.add(num);
    }
    return false;
}
