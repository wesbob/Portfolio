# Pattern Recognition Workbook
## Practice Identifying Patterns Before Coding

---

## How to Use This Workbook

For each problem below:
1. Read the problem description
2. **WITHOUT CODING**, write down:
   - What pattern(s) you think it is
   - Why you think that
   - What the key insight is
3. Then check the answer at the bottom
4. If you were right, try coding it
5. If you were wrong, understand why before moving on

---

## Exercise 1: Robot in Grid

**Problem:**
A robot starts at position (0,0) in a grid. It receives a string of commands:
- 'U' = move up
- 'D' = move down  
- 'L' = move left
- 'R' = move right

Return the final position after all commands.

**Input:** "UDLR"
**Output:** (0, 0)

**YOUR ANALYSIS:**
Pattern: _______________
Why: _______________
Key insight: _______________

---

## Exercise 2: Pair Sum

**Problem:**
Given a sorted array and a target sum, find if there exists a pair of numbers that add up to the target.

**Input:** arr = [1, 2, 3, 4, 6], target = 6
**Output:** True (2 + 4 = 6)

**YOUR ANALYSIS:**
Pattern: _______________
Why: _______________
Key insight: _______________

---

## Exercise 3: Max Profit

**Problem:**
You have an array of stock prices where prices[i] is the price on day i. You can buy on any day and sell on any later day. Find the maximum profit.

**Input:** [7, 1, 5, 3, 6, 4]
**Output:** 5 (buy at 1, sell at 6)

**YOUR ANALYSIS:**
Pattern: _______________
Why: _______________
Key insight: _______________

---

## Exercise 4: Longest Substring

**Problem:**
Find the length of the longest substring without repeating characters.

**Input:** "abcabcbb"
**Output:** 3 ("abc")

**YOUR ANALYSIS:**
Pattern: _______________
Why: _______________
Key insight: _______________

---

## Exercise 5: Maze Solver

**Problem:**
Given a maze represented as a 2D grid where:
- 0 = open path
- 1 = wall
- S = start
- E = end

Find if there's a path from S to E.

**YOUR ANALYSIS:**
Pattern: _______________
Why: _______________
Key insight: _______________

---

## Exercise 6: Coin Change

**Problem:**
Given an array of coin denominations and a target amount, find the minimum number of coins needed to make that amount. If impossible, return -1.

**Input:** coins = [1, 2, 5], amount = 11
**Output:** 3 (5 + 5 + 1)

**YOUR ANALYSIS:**
Pattern: _______________
Why: _______________
Key insight: _______________

---

## Exercise 7: Valid Parentheses

**Problem:**
Given a string containing '(', ')', '{', '}', '[', ']', determine if the brackets are valid (properly opened and closed in correct order).

**Input:** "({[]})"
**Output:** True

**YOUR ANALYSIS:**
Pattern: _______________
Why: _______________
Key insight: _______________

---

## Exercise 8: Falling Sand

**Problem:**
You have a 2D grid where 'S' represents sand and '.' is empty space. Each second, sand falls down one row if the space below is empty. Simulate until all sand has settled.

```
Initial:      After 1s:     After 2s:
.S..S.        ......        ......
......        .S..S.        ......
......        ......        .S..S.
```

**YOUR ANALYSIS:**
Pattern: _______________
Why: _______________
Key insight: _______________

---

## Exercise 9: Top K Frequent

**Problem:**
Given an array of integers, return the k most frequent elements.

**Input:** nums = [1,1,1,2,2,3], k = 2
**Output:** [1, 2]

**YOUR ANALYSIS:**
Pattern: _______________
Why: _______________
Key insight: _______________

---

## Exercise 10: Word Ladder

**Problem:**
Given two words (start and end) and a dictionary, find the shortest transformation sequence where:
- Each step changes only one letter
- Each intermediate word must be in the dictionary

**Input:** start = "hit", end = "cog", dict = ["hot","dot","dog","lot","log","cog"]
**Output:** 5 (hit → hot → dot → dog → cog)

**YOUR ANALYSIS:**
Pattern: _______________
Why: _______________
Key insight: _______________

---

## Exercise 11: Range Sum Query

**Problem:**
You're given an array of integers. Then you receive many queries asking for the sum of elements from index i to j. Implement this efficiently.

**YOUR ANALYSIS:**
Pattern: _______________
Why: _______________
Key insight: _______________

---

## Exercise 12: Generate Permutations

**Problem:**
Given an array of distinct integers, generate all possible permutations.

**Input:** [1, 2, 3]
**Output:** [[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2], [3,2,1]]

**YOUR ANALYSIS:**
Pattern: _______________
Why: _______________
Key insight: _______________

---

## Exercise 13: Meeting Rooms

**Problem:**
Given an array of meeting time intervals [start, end], determine if a person can attend all meetings (no overlaps).

**Input:** [[0,30], [5,10], [15,20]]
**Output:** False (first meeting overlaps with others)

**YOUR ANALYSIS:**
Pattern: _______________
Why: _______________
Key insight: _______________

---

## Exercise 14: Course Schedule

**Problem:**
There are n courses. Some courses have prerequisites (course A requires course B). Given the prerequisites, can you finish all courses?

**Input:** numCourses = 2, prerequisites = [[1,0]]
**Output:** True (take course 0 first, then 1)

**YOUR ANALYSIS:**
Pattern: _______________
Why: _______________
Key insight: _______________

---

## Exercise 15: Climbing Stairs

**Problem:**
You're climbing stairs. You can take 1 or 2 steps at a time. How many distinct ways can you climb n stairs?

**Input:** n = 3
**Output:** 3 (1+1+1, 1+2, 2+1)

**YOUR ANALYSIS:**
Pattern: _______________
Why: _______________
Key insight: _______________

---
---
---

## ANSWERS - Don't look until you've tried!

---

### Exercise 1: Robot in Grid
**Pattern:** Simulation
**Why:** We're tracking position changes over time, step by step
**Key insight:** Just track (x, y) coordinates and update based on each command
**Code structure:**
```python
x, y = 0, 0
for command in commands:
    if command == 'U': y += 1
    elif command == 'D': y -= 1
    # etc.
return (x, y)
```

---

### Exercise 2: Pair Sum
**Pattern:** Two Pointers
**Why:** Sorted array + looking for pair = classic two pointer scenario
**Key insight:** Start from both ends, move pointers based on sum comparison
**Code structure:**
```python
left, right = 0, len(arr) - 1
while left < right:
    current_sum = arr[left] + arr[right]
    if current_sum == target: return True
    elif current_sum < target: left += 1
    else: right -= 1
return False
```

---

### Exercise 3: Max Profit
**Pattern:** Greedy / Single Pass (also could be DP)
**Why:** We can make locally optimal choice (track minimum so far)
**Key insight:** Track the minimum price seen so far, calculate profit at each step
**Code structure:**
```python
min_price = float('inf')
max_profit = 0
for price in prices:
    min_price = min(min_price, price)
    max_profit = max(max_profit, price - min_price)
return max_profit
```

---

### Exercise 4: Longest Substring
**Pattern:** Sliding Window
**Why:** "Substring" + "longest/shortest that satisfies condition"
**Key insight:** Expand window by adding characters, contract when duplicates found
**Code structure:**
```python
seen = {}
left = 0
max_len = 0
for right, char in enumerate(s):
    if char in seen and seen[char] >= left:
        left = seen[char] + 1
    seen[char] = right
    max_len = max(max_len, right - left + 1)
return max_len
```

---

### Exercise 5: Maze Solver
**Pattern:** Search (BFS or DFS)
**Why:** Finding if path exists from A to B
**Key insight:** BFS for shortest path, DFS works too. Explore neighbors, mark visited
**Code structure:**
```python
from collections import deque
queue = deque([start_pos])
visited = {start_pos}
while queue:
    pos = queue.popleft()
    if pos == end_pos: return True
    for neighbor in get_neighbors(pos):
        if neighbor not in visited and not is_wall(neighbor):
            visited.add(neighbor)
            queue.append(neighbor)
return False
```

---

### Exercise 6: Coin Change
**Pattern:** Dynamic Programming
**Why:** "Minimum/maximum" + building up from smaller amounts + overlapping subproblems
**Key insight:** For each amount, try each coin and take min of all possibilities
**Code structure:**
```python
dp = [float('inf')] * (amount + 1)
dp[0] = 0
for i in range(1, amount + 1):
    for coin in coins:
        if i >= coin:
            dp[i] = min(dp[i], dp[i - coin] + 1)
return dp[amount] if dp[amount] != float('inf') else -1
```

---

### Exercise 7: Valid Parentheses
**Pattern:** Stack
**Why:** Matching pairs, last-in-first-out validation
**Key insight:** Push opening brackets, pop and match with closing brackets
**Code structure:**
```python
stack = []
matches = {'(': ')', '{': '}', '[': ']'}
for char in s:
    if char in matches:
        stack.append(char)
    else:
        if not stack or matches[stack.pop()] != char:
            return False
return len(stack) == 0
```

---

### Exercise 8: Falling Sand
**Pattern:** Simulation
**Why:** Physical process happening step by step
**Key insight:** Each step, check all sand from bottom up, move if space below is empty
**Code structure:**
```python
changed = True
while changed:
    changed = False
    for row in range(len(grid)-2, -1, -1):  # Bottom to top
        for col in range(len(grid[0])):
            if grid[row][col] == 'S' and grid[row+1][col] == '.':
                grid[row][col], grid[row+1][col] = '.', 'S'
                changed = True
```

---

### Exercise 9: Top K Frequent
**Pattern:** Counting/Frequency + Heap (or sorting)
**Why:** Need to count occurrences and find top K
**Key insight:** Count frequencies, then get K largest
**Code structure:**
```python
from collections import Counter
import heapq
counts = Counter(nums)
return heapq.nlargest(k, counts.keys(), key=counts.get)
# OR: return [item for item, count in counts.most_common(k)]
```

---

### Exercise 10: Word Ladder
**Pattern:** Search (BFS specifically)
**Why:** Shortest path between two states
**Key insight:** Each word is a node, neighbors are 1-letter-different words in dict
**Code structure:**
```python
from collections import deque
queue = deque([(start, 1)])
visited = {start}
while queue:
    word, length = queue.popleft()
    if word == end: return length
    for neighbor in get_one_letter_different(word, dictionary):
        if neighbor not in visited:
            visited.add(neighbor)
            queue.append((neighbor, length + 1))
return 0
```

---

### Exercise 11: Range Sum Query
**Pattern:** Prefix Sum
**Why:** Multiple range queries on same array
**Key insight:** Precompute cumulative sums for O(1) queries
**Code structure:**
```python
# Preprocessing
prefix = [0]
for num in arr:
    prefix.append(prefix[-1] + num)

# Query
def range_sum(i, j):
    return prefix[j+1] - prefix[i]
```

---

### Exercise 12: Generate Permutations
**Pattern:** Backtracking/Recursion
**Why:** "Generate all" + making choices and exploring them
**Key insight:** Try each element, recurse, undo (backtrack)
**Code structure:**
```python
def backtrack(current, remaining):
    if not remaining:
        result.append(current[:])
        return
    for i in range(len(remaining)):
        current.append(remaining[i])
        backtrack(current, remaining[:i] + remaining[i+1:])
        current.pop()
```

---

### Exercise 13: Meeting Rooms
**Pattern:** Greedy + Sorting
**Why:** Interval problems often need sorting
**Key insight:** Sort by start time, check if any overlap
**Code structure:**
```python
intervals.sort(key=lambda x: x[0])
for i in range(1, len(intervals)):
    if intervals[i][0] < intervals[i-1][1]:
        return False  # Overlap found
return True
```

---

### Exercise 14: Course Schedule
**Pattern:** Graph (Topological Sort or Cycle Detection)
**Why:** Dependencies = directed graph, checking if valid order exists
**Key insight:** If there's a cycle, impossible to complete all courses
**Code structure:**
```python
# Build graph
graph = {i: [] for i in range(numCourses)}
for course, prereq in prerequisites:
    graph[prereq].append(course)

# DFS cycle detection
visited = set()
in_stack = set()

def has_cycle(node):
    if node in in_stack: return True
    if node in visited: return False
    
    in_stack.add(node)
    for neighbor in graph[node]:
        if has_cycle(neighbor): return True
    in_stack.remove(node)
    visited.add(node)
    return False

return not any(has_cycle(i) for i in range(numCourses))
```

---

### Exercise 15: Climbing Stairs
**Pattern:** Dynamic Programming
**Why:** "How many ways" + can break into subproblems (ways to reach step n-1 and n-2)
**Key insight:** F(n) = F(n-1) + F(n-2) - it's actually Fibonacci!
**Code structure:**
```python
if n <= 2: return n
dp = [0] * (n + 1)
dp[1], dp[2] = 1, 2
for i in range(3, n + 1):
    dp[i] = dp[i-1] + dp[i-2]
return dp[n]
```

---

## Reflection Questions

After completing these exercises:

1. **Which patterns did you recognize easily?**
   - These are your strengths - lean into them!

2. **Which patterns surprised you?**
   - These are learning opportunities

3. **Did you notice any problems that could fit multiple patterns?**
   - This is advanced! Many problems have multiple valid approaches

4. **What keywords/phrases helped you identify patterns?**
   - Add these to your mental checklist

---

## Next Level: Mix Patterns

Advanced problems often combine patterns. For example:
- Search + DP (shortest path with constraints)
- Simulation + Greedy (process events in optimal order)
- Sliding Window + HashMap (substring problems with conditions)

As you get better, you'll start seeing: "Oh, this is 70% pattern A, 30% pattern B."

---

## Your Pattern Recognition Scorecard

Track your progress:

| Pattern | Problems Solved | Confidence (1-10) | Notes |
|---------|----------------|-------------------|-------|
| Simulation | | | |
| Search/BFS/DFS | | | |
| Two Pointers | | | |
| Sliding Window | | | |
| Dynamic Programming | | | |
| Backtracking | | | |
| Greedy | | | |
| Counting/HashMap | | | |
| Stack/Queue | | | |
| Graph | | | |
| Prefix Sum | | | |
| Binary Search | | | |

**Goal:** Get all patterns to 7+ confidence by solving 5-10 problems of each type.

---

## Remember

Pattern recognition is like learning to read music or speak a language. At first, it's all gibberish. Then you start recognizing words. Then phrases. Then you're fluent.

You're in the "recognizing words" phase. Keep going!
