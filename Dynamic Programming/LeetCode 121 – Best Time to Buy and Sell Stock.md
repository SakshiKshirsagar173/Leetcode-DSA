# LeetCode 121 – Best Time to Buy and Sell Stock

## 📌 Problem Statement
You are given an array `prices` where `prices[i]` represents the price of a stock on the `i-th` day.

You want to maximize your profit by choosing **one day to buy** and **one later day to sell** the stock.

Return the maximum profit you can achieve.  
If no profit is possible, return `0`.

---

## 💡 Approach – Dynamic Programming (Space Optimized)

This solution uses a **space-optimized dynamic programming approach**.

### Key Observations:
- To maximize profit, we should always buy at the **lowest price seen so far**.
- For each day, we calculate the profit if we sell on that day.
- We keep updating the maximum profit encountered.

---

## 🧠 Algorithm
1. Initialize `minPrice` to a very large value.
2. Initialize `maxProfit` to `0`.
3. Traverse the array:
   - Update `minPrice` if a lower price is found.
   - Update `maxProfit` if selling on the current day gives more profit.
4. Return `maxProfit`.

---

## 💻 Code Implementation (Java)

```java
class Solution {
    public int maxProfit(int[] prices) {
        int minPrice = Integer.MAX_VALUE;
        int maxProfit = 0;

        for (int price : prices) {
            if (price < minPrice) {
                minPrice = price;
            }

            if (price - minPrice > maxProfit) {
                maxProfit = price - minPrice;
            }
        }

        return maxProfit;
    }
}
