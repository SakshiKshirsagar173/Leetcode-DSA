** Problem
** Problem
LeetCode 122 – Best Time to Buy and Sell Stock II
You are given an array prices where prices[i] represents the stock price on day i.
You may complete as many transactions as you like (buy one and sell one share of the stock multiple times).

**Approach: Greedy

We take advantage of every increasing price sequence.
If the price increases from day i-1 to day i, we take that profit immediately.
The sum of all such local profits equals the maximum global profit when unlimited transactions are allowed.
This avoids dynamic programming and works because overlapping profitable segments can be decomposed into smaller gains.

**Algorithm

Initialize maxProfit = 0
Traverse the array from day 1 to end
If prices[i] > prices[i-1], add the difference to maxProfit
Return maxProfit

**code
class Solution {
    public int maxProfit(int[] prices) {
        int maxProfit=0;
        for(int i=1;i<prices.length;i++){
            if(prices[i]>prices[i-1]){
                maxProfit=maxProfit+prices[i]-prices[i-1];
            }
        }
        return maxProfit;
    }
}
