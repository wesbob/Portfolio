# The Pattern Recognition Guide
## From "I Have No Idea" to "I've Seen This Before"

---

## Why Pattern Recognition Matters

When you see a new problem and think "I have no clue," you're trying to solve it from scratch. When you recognize a pattern, you're thinking: "This is like that other problem - I can adapt that approach."

**The secret:** There are only about 10-15 core patterns in programming problems. Everything else is a variation.

---

## The Core Problem Patterns

### 1. SIMULATION
**What it is:** Step-by-step execution of a process over time

**How to recognize it:**
- Problem describes something that "happens" in stages
- Words like: "move", "step", "turn", "each round", "continues until"
- You need to track changing state over time
- Often has a grid, game board, or moving entities

**Examples:**
- Day 7 (beam splitting) - beams move and interact with environment
- Conway's Game of Life
- Robot moving on a grid
- Traffic simulation
- Game turns

**Solution structure:**
```python
state = initialize()
while not finished(state):
    state = simulate_one_step(state)
return extract_answer(state)
```

**Key insight:** Don't think about the final result - think about what happens in ONE step, then repeat.

---

### 2. SEARCH / PATHFINDING
**What it is:** Finding a way from point A to point B (literally or metaphorically)

**How to recognize it:**
- "Find a path", "reach the goal", "shortest route"
- "Can you get from X to Y?"
- Grid navigation
- State transitions (moving between different configurations)

**Sub-patterns:**
- **BFS (Breadth-First Search):** Shortest path, level-by-level exploration
- **DFS (Depth-First Search):** Explore one path fully before backtracking
- **Dijkstra:** Weighted shortest path
- **A*:** Shortest path with heuristics

**Examples:**
- Maze solving
- "Minimum steps to reach target"
- Network routing
- State space exploration

**Solution structure (BFS):**
```python
queue = [start]
visited = {start}
while queue:
    current = queue.pop(0)
    if is_goal(current):
        return current
    for neighbor in get_neighbors(current):
        if neighbor not in visited:
            visited.add(neighbor)
            queue.append(neighbor)
```

**Key insight:** Explore all possibilities systematically. BFS for shortest, DFS for existence.

---

### 3. PARSING / STRING MANIPULATION
**What it is:** Transform text/data from one format to another

**How to recognize it:**
- "Parse this input"
- Dealing with structured text (CSV, logs, code)
- "Extract information from..."
- Pattern matching in strings

**Examples:**
- Reading coordinates: "x=5, y=10"
- Processing log files
- Validating formats
- Calculator/interpreter problems

**Solution structure:**
```python
for line in input_lines:
    # Use split(), regex, or parsing libraries
    parts = line.split(',')
    x = int(parts[0].split('=')[1])
    # Process extracted data
```

**Key insight:** Break down the structure piece by piece. What separates sections? What patterns repeat?

---

### 4. COUNTING / FREQUENCY
**What it is:** How many times does X occur? How often? 

**How to recognize it:**
- "Count the number of..."
- "How many times..."
- "Most/least frequent"
- Analyzing distributions

**Examples:**
- Count words in text
- Find duplicates
- Histogram of values
- Most common element

**Solution structure:**
```python
from collections import Counter
counts = Counter(items)
# or
frequency = {}
for item in items:
    frequency[item] = frequency.get(item, 0) + 1
```

**Key insight:** Use dictionaries/hashmaps for O(1) lookups. Counter is your friend.

---

### 5. DYNAMIC PROGRAMMING (DP)
**What it is:** Build solution from smaller subproblems, reuse computed results

**How to recognize it:**
- "Maximum/minimum/optimal" something
- "How many ways to..."
- Problem can be broken into overlapping subproblems
- Naive recursion would repeat calculations
- Often involves sequences or choices

**Classic examples:**
- Fibonacci sequence
- Longest common subsequence
- Coin change problem
- Knapsack problem
- "Climbing stairs" problems

**Solution structure:**
```python
# Top-down (memoization)
memo = {}
def solve(n):
    if n in memo:
        return memo[n]
    # Base case
    if n <= 1:
        return n
    # Recursive case
    result = solve(n-1) + solve(n-2)
    memo[n] = result
    return result

# Bottom-up (tabulation)
dp = [0] * (n + 1)
dp[0], dp[1] = 0, 1
for i in range(2, n + 1):
    dp[i] = dp[i-1] + dp[i-2]
```

**Key insight:** If you're solving the same subproblem multiple times, cache it!

---

### 6. TWO POINTERS
**What it is:** Use two indices moving through data, often from different directions

**How to recognize it:**
- Sorted array problems
- "Find pair that sums to X"
- Comparing elements from both ends
- Sliding window of variable size

**Examples:**
- Two sum in sorted array
- Palindrome checking
- Removing duplicates
- Container with most water

**Solution structure:**
```python
left, right = 0, len(arr) - 1
while left < right:
    if condition(arr[left], arr[right]):
        # Found answer
        return
    elif need_larger:
        left += 1
    else:
        right -= 1
```

**Key insight:** Can often reduce O(n²) to O(n) by avoiding nested loops.

---

### 7. SLIDING WINDOW
**What it is:** Maintain a "window" over data that slides/expands/contracts

**How to recognize it:**
- "Subarray/substring with..."
- "Maximum/minimum in all windows of size K"
- "Longest/shortest sequence that satisfies..."
- Fixed or variable window size

**Examples:**
- Maximum sum subarray of size K
- Longest substring without repeating characters
- Minimum window substring

**Solution structure:**
```python
# Fixed size
window_sum = sum(arr[:k])
max_sum = window_sum
for i in range(k, len(arr)):
    window_sum += arr[i] - arr[i-k]
    max_sum = max(max_sum, window_sum)

# Variable size
left = 0
for right in range(len(arr)):
    # Expand window
    add_to_window(arr[right])
    
    # Contract if needed
    while window_invalid():
        remove_from_window(arr[left])
        left += 1
```

**Key insight:** Avoid recalculating from scratch - update incrementally.

---

### 8. RECURSION / BACKTRACKING
**What it is:** Explore all possibilities by trying options and undoing them

**How to recognize it:**
- "Generate all..." (permutations, combinations, subsets)
- "Find all valid..."
- Decision tree problems
- Constraint satisfaction (Sudoku, N-Queens)

**Examples:**
- Generate all permutations
- Solve Sudoku
- N-Queens problem
- Word search in grid
- Combination sum

**Solution structure:**
```python
def backtrack(state, choices):
    if is_solution(state):
        results.append(state.copy())
        return
    
    for choice in choices:
        if is_valid(choice, state):
            # Make choice
            state.add(choice)
            
            # Recurse
            backtrack(state, remaining_choices)
            
            # Undo choice (backtrack)
            state.remove(choice)
```

**Key insight:** Try it, recurse, undo it. The "undo" is what makes it backtracking.

---

### 9. GREEDY ALGORITHMS
**What it is:** Make the locally optimal choice at each step

**How to recognize it:**
- "Maximize/minimize" something
- Choices don't affect future choices (or problem says to be greedy)
- Sorting often helps
- Interval/scheduling problems

**Examples:**
- Activity selection
- Huffman coding  
- Minimum coins for change (if coin system allows)
- Job scheduling

**Solution structure:**
```python
# Often involves sorting first
items.sort(key=lambda x: x.value/x.weight, reverse=True)

result = 0
for item in items:
    if can_take(item):
        result += item.value
        take(item)
```

**Key insight:** Only works when local optimum leads to global optimum. Not always correct!

---

### 10. GRAPH ALGORITHMS
**What it is:** Relationships between nodes/entities

**How to recognize it:**
- "Connected components"
- "Dependencies", "prerequisites"
- Network problems
- Social graphs
- State machines

**Common algorithms:**
- **DFS/BFS:** Traversal, connectivity
- **Topological Sort:** Order with dependencies
- **Union-Find:** Connected components
- **Shortest Path:** Dijkstra, Bellman-Ford

**Solution structure:**
```python
# Graph representation
graph = {node: [neighbors] for node in nodes}

# DFS
def dfs(node, visited):
    if node in visited:
        return
    visited.add(node)
    for neighbor in graph[node]:
        dfs(neighbor, visited)
```

**Key insight:** Many problems are secretly graphs! "Can reach", "depends on", "connected to" → graph.

---

### 11. BINARY SEARCH / DIVIDE & CONQUER
**What it is:** Halve the search space repeatedly

**How to recognize it:**
- "Find X in sorted data"
- "First/last occurrence of..."
- "Minimum value such that..."
- Problem space can be divided

**Examples:**
- Search in sorted array
- Find square root
- Peak element
- Search in rotated array

**Solution structure:**
```python
left, right = 0, len(arr) - 1
while left <= right:
    mid = (left + right) // 2
    if arr[mid] == target:
        return mid
    elif arr[mid] < target:
        left = mid + 1
    else:
        right = mid - 1
```

**Key insight:** O(log n) is powerful. If you can eliminate half the options, use this.

---

### 12. BIT MANIPULATION
**What it is:** Work directly with binary representations

**How to recognize it:**
- "XOR", "AND", "OR" operations mentioned
- "Single number", "missing number" problems
- Powers of 2
- Set operations (subset generation)

**Examples:**
- Find single number in array of pairs
- Count set bits
- Generate all subsets
- Check if power of 2

**Common tricks:**
```python
# Check if power of 2
is_power_of_2 = (n & (n-1)) == 0

# Toggle bit
n ^= (1 << i)

# XOR properties: a ^ a = 0, a ^ 0 = a
# Useful for finding unique elements
```

**Key insight:** Often provides clever O(1) space solutions.

---

### 13. PREFIX SUM / CUMULATIVE
**What it is:** Precompute cumulative values for fast range queries

**How to recognize it:**
- "Sum of subarray from i to j"
- Multiple range queries on same array
- "Average of elements in range"

**Examples:**
- Range sum queries
- 2D matrix sum queries
- Equilibrium index

**Solution structure:**
```python
# Build prefix sum
prefix = [0]
for num in arr:
    prefix.append(prefix[-1] + num)

# Query sum from i to j (inclusive)
range_sum = prefix[j+1] - prefix[i]
```

**Key insight:** O(n) preprocessing for O(1) queries. Trade space for time.

---

## How to Develop Pattern Recognition

### 1. **Keep a Pattern Journal**
After solving each problem, write:
- What pattern was it?
- How did I recognize it?
- What was the key insight?
- What variations might exist?

### 2. **Solve Problems by Pattern**
Don't solve problems randomly. Pick a pattern and solve 5-10 problems of that type in a row.

**Resources:**
- LeetCode has tags by pattern
- NeetCode groups problems by pattern
- Advent of Code often repeats patterns across years

### 3. **Practice the "What Pattern?" Game**
Read a problem description and **before coding**, ask:
- What is this problem fundamentally about?
- What changes over time? (simulation)
- Do I need to find something? (search)
- Do I need to count/track frequency? (counting/hashmap)
- Can I break it into subproblems? (DP/recursion)
- Is there a natural order/sequence? (greedy/sorting)

### 4. **Learn to Spot Variations**
The Day 7 beam problem is:
- **Primarily:** Simulation (beams moving step by step)
- **With elements of:** Graph traversal (beams branching)

Many problems mix patterns! The skill is recognizing the primary pattern.

### 5. **Build Pattern Templates**
For each pattern, have a code template ready. When you recognize the pattern, you're 80% done - just adapt the template.

### 6. **Study Multiple Solutions**
After solving (or reading solutions), look for:
- "Oh, they used BFS. I used DFS. Why did BFS work better?"
- "They used a sliding window. I used nested loops. That's why mine was slow!"

---

## Pattern Recognition Cheat Sheet

Quick reference when you're stuck:

| If the problem mentions... | Consider pattern... |
|---------------------------|-------------------|
| "Step by step", "each round", "simulation" | **Simulation** |
| "Shortest path", "can you reach" | **Search (BFS/DFS)** |
| "Count how many", "frequency" | **Counting/HashMap** |
| "Maximum/minimum/optimal" + sequences | **Dynamic Programming** |
| "Sorted array", "find pair" | **Two Pointers** |
| "Subarray/substring that..." | **Sliding Window** |
| "Generate all", "find all valid" | **Backtracking** |
| "Connected", "dependencies" | **Graph** |
| "Sort + take best at each step" | **Greedy** |
| "Search in sorted" | **Binary Search** |
| "Sum of range [i,j]" | **Prefix Sum** |

---

## Your Practice Plan

### Week 1-2: Pattern Introduction
- Pick 2-3 patterns from above
- Solve 3 easy problems per pattern
- Focus on recognition, not speed

### Week 3-4: Pattern Mixing
- Solve medium problems
- Identify which patterns they combine
- Study solutions to see what you missed

### Week 5-6: Speed and Intuition
- Time yourself
- Try to identify pattern in first 2 minutes
- Build your template library

### Ongoing: Pattern Journal
Every problem:
1. What pattern is this? (before solving)
2. Was I right? (after solving)
3. What gave it away?
4. What would I look for next time?

---

## The Truth About Experience

That programmer who "just knows"? They've seen:
- 100+ simulation problems
- 50+ search problems  
- 200+ problems total

They're not smarter. They've just seen the patterns before.

**Your goal:** Build that pattern library faster by being intentional about it.

---

## Final Mindset Shift

**Before:** "How do I solve THIS specific problem?"
**After:** "What pattern is this? How do I adapt the pattern to THIS problem?"

The first is starting from zero every time.
The second is starting from 80% and finishing the last 20%.

That's the difference.

---

## Next Steps

1. Save this guide
2. Pick ONE pattern (start with Simulation or Counting - they're easiest)
3. Find 5 problems tagged with that pattern on LeetCode
4. Solve them
5. Come back and pick another pattern

You're not building problem-solving skills from scratch. You're building a library of 10-15 patterns. Once you have those, you can solve thousands of problems.

Let's get started.
