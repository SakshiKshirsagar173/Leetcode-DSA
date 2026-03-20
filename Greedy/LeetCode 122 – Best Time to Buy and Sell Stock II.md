## Problem
**LeetCode 122 – Best Time to Buy and Sell Stock II**

You are given an array `prices` where `prices[i]` represents the stock price on day `i`.
You may complete as many transactions as you like (buy and sell multiple times).

---

## Approach: Greedy

We take advantage of every increasing price sequence.
If the price increases from day `i-1` to day `i`, we take that profit immediately.

The sum of all such local profits equals the maximum global profit when unlimited
transactions are allowed.

---

## Algorithm
1. Initialize `maxProfit = 0`
2. Traverse the array from index `1` to the end
3. If `prices[i] > prices[i-1]`, add the difference to `maxProfit`
4. Return `maxProfit`

---

## Code
```java
class Solution {
    public int maxProfit(int[] prices) {
        int maxProfit = 0;

        for (int i = 1; i < prices.length; i++) {
            if (prices[i] > prices[i - 1]) {
                maxProfit += prices[i] - prices[i - 1];
            }
        }
        return maxProfit;
    }
}
