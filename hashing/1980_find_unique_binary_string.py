# LeetCode 1980 - Find Unique Binary String

# -----------------------------
# Brute Force
# -----------------------------

class SolutionBrute:
    def findDifferentBinaryString(self, nums):
        n = len(nums)
        nums_set = set(nums)

        for i in range(2**n):
            candidate = format(i, f'0{n}b')
            if candidate not in nums_set:
                return candidate


# -----------------------------
# Better Solution (Backtracking)
# -----------------------------

class SolutionBetter:
    def findDifferentBinaryString(self, nums):
        nums_set = set(nums)
        n = len(nums)

        def backtrack(path):
            if len(path) == n:
                s = "".join(path)
                if s not in nums_set:
                    return s
                return None

            for ch in ['0','1']:
                path.append(ch)
                res = backtrack(path)
                if res:
                    return res
                path.pop()

        return backtrack([])


# -----------------------------
# Optimal Solution (Diagonal Trick)
# -----------------------------

class SolutionOptimal:
    def findDifferentBinaryString(self, nums):
        res = []

        for i in range(len(nums)):
            if nums[i][i] == '0':
                res.append('1')
            else:
                res.append('0')

        return "".join(res)
