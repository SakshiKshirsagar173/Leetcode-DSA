# Leetcode 10 - Regular Expression Matching (Dynamic Programming)

## 📌 Problem Overview
This solution solves the **Regular Expression Matching** problem (LeetCode 10).

You are given:
- A string `s`
- A pattern `p` that supports:
  - `.` → matches any single character
  - `*` → matches zero or more of the preceding character

The task is to determine whether the **entire string `s`** matches the **entire pattern `p`**.

---

## 🧠 Approach Used
**Bottom-Up Dynamic Programming (Tabulation)**

This is **not** a greedy problem. Any greedy attempt fails because `*` introduces branching decisions.  
DP is mandatory.

---

## 💡 Key Idea

Define a DP table:
