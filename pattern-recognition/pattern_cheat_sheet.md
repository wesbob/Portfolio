# Pattern Recognition Cheat Sheet
## Quick Reference When You're Stuck

---

## 🔍 The 30-Second Pattern Identifier

Read the problem and ask these questions IN ORDER:

### 1️⃣ Does something HAPPEN over time?
**→ SIMULATION**
- Keywords: "step", "round", "turn", "each second", "moves", "falls"
- Approach: Track state, loop until done

### 2️⃣ Are you FINDING A PATH or CHECKING CONNECTIVITY?
**→ SEARCH (BFS/DFS/Graph)**
- Keywords: "reach", "path", "connected", "from X to Y", "shortest"
- BFS = shortest path | DFS = exists or explore all

### 3️⃣ Is it OPTIMAL with SEQUENCES or CHOICES?
**→ DYNAMIC PROGRAMMING**
- Keywords: "maximum", "minimum", "how many ways", "optimal"
- Check: Can you break into smaller subproblems?
- Check: Would naive recursion repeat calculations?

### 4️⃣ Do you need to COUNT or TRACK FREQUENCY?
**→ COUNTING / HASHMAP**
- Keywords: "count", "how many", "frequency", "most/least common"
- Tool: Dictionary or Counter

### 5️⃣ Is the data SORTED or about PAIRS?
**→ TWO POINTERS**
- Keywords: "sorted array", "pair that sums to", "palindrome"
- Approach: Pointers from both ends or same direction

### 6️⃣ Is it about SUBSTRINGS or SUBARRAYS?
**→ SLIDING WINDOW**
- Keywords: "substring", "subarray", "longest/shortest that...", "window of size K"
- Approach: Expand right, contract left

### 7️⃣ Do you need to GENERATE ALL possibilities?
**→ BACKTRACKING**
- Keywords: "all permutations", "all combinations", "generate all", "find all valid"
- Approach: Try, recurse, undo

### 8️⃣ Can you SORT and take BEST at each step?
**→ GREEDY**
- Keywords: "maximize", "minimize", "schedule", "intervals"
- Check: Does local optimum lead to global optimum?

### 9️⃣ Are there DEPENDENCIES or RELATIONSHIPS?
**→ GRAPH**
- Keywords: "depends on", "prerequisites", "connected", "network"
- Common: Topological sort, cycle detection

### 🔟 Need FAST RANGE QUERIES?
**→ PREFIX SUM**
- Keywords: "sum of range", "multiple queries", "subarray sum"
- Approach: Precompute cumulative values

---

## 🎯 Pattern Matching Table

| Problem Phrase | → Pattern | Why |
|---------------|----------|-----|
| "Each turn/step/second" | Simulation | Temporal process |
| "Shortest path" | BFS | Level-by-level |
| "Any path exists" | DFS | Explore fully |
| "Maximum profit/sum" | DP or Greedy | Optimization |
| "How many ways to..." | DP | Counting subproblems |
| "Most frequent" | HashMap/Counter | Track occurrences |
| "Sorted array + find pair" | Two Pointers | Converge from ends |
| "Longest substring without..." | Sliding Window | Variable window |
| "Subarray with sum = K" | Sliding Window or Prefix Sum | Range + condition |
| "Generate all permutations" | Backtracking | Explore all choices |
| "Schedule intervals" | Greedy + Sort | Optimal ordering |
| "Prerequisites/dependencies" | Graph + Topological Sort | Ordering with constraints |
| "Connected components" | Graph + Union-Find | Group relationships |
| "Find in sorted array" | Binary Search | Halve search space |

---

## 🚦 Common Gotchas

### When Patterns Look Similar

**Search vs Simulation:**
- Search = finding a path/solution
- Simulation = executing a process

**Greedy vs DP:**
- Greedy = local optimum works (prove it!)
- DP = need to consider all possibilities

**Two Pointers vs Sliding Window:**
- Two Pointers = often converging (two directions)
- Sliding Window = always expanding right (one direction)

**DFS vs Backtracking:**
- DFS = exploring/searching
- Backtracking = DFS + undoing choices to explore alternatives

---

## 💡 Code Templates (Copy-Paste Starting Points)

### Simulation
```python
state = initialize()
while not finished(state):
    state = step(state)
return result(state)
```

### BFS
```python
from collections import deque
queue = deque([start])
visited = {start}
while queue:
    current = queue.popleft()
    if is_goal(current): return current
    for neighbor in get_neighbors(current):
        if neighbor not in visited:
            visited.add(neighbor)
            queue.append(neighbor)
```

### DFS
```python
visited = set()
def dfs(node):
    if node in visited: return
    visited.add(node)
    # Process node
    for neighbor in get_neighbors(node):
        dfs(neighbor)
```

### Two Pointers
```python
left, right = 0, len(arr) - 1
while left < right:
    if condition(arr[left], arr[right]):
        return True
    elif need_larger:
        left += 1
    else:
        right -= 1
```

### Sliding Window (Variable)
```python
left = 0
for right in range(len(arr)):
    # Add arr[right] to window
    while window_invalid():
        # Remove arr[left] from window
        left += 1
    # Update result
```

### DP (Top-Down with Memoization)
```python
memo = {}
def dp(state):
    if state in memo: return memo[state]
    if base_case(state): return base_value
    result = combine(dp(smaller_state1), dp(smaller_state2))
    memo[state] = result
    return result
```

### Backtracking
```python
results = []
def backtrack(path, remaining):
    if is_solution(path):
        results.append(path[:])
        return
    for choice in remaining:
        path.append(choice)
        backtrack(path, remaining - {choice})
        path.pop()
```

### HashMap Counting
```python
from collections import Counter
counts = Counter(items)
# or
freq = {}
for item in items:
    freq[item] = freq.get(item, 0) + 1
```

### Prefix Sum
```python
prefix = [0]
for num in arr:
    prefix.append(prefix[-1] + num)
# Range sum [i, j]: prefix[j+1] - prefix[i]
```

---

## 🎓 Pattern Learning Order (Easiest → Hardest)

**Level 1: Foundation (Start Here)**
1. Counting/HashMap - most straightforward
2. Two Pointers - clear logic
3. Simulation - intuitive

**Level 2: Core Skills**
4. BFS/DFS - fundamental for many problems
5. Sliding Window - builds on two pointers
6. Greedy - requires judgment

**Level 3: Advanced**
7. Dynamic Programming - requires practice
8. Backtracking - mentally demanding
9. Graph algorithms - combines multiple concepts

**Level 4: Optimization**
10. Binary Search - counterintuitive sometimes
11. Prefix Sum - specific use case
12. Advanced DP (2D, state machines)

---

## 📝 Problem-Solving Checklist

When you see a new problem:

- [ ] Read problem twice
- [ ] Identify inputs and outputs
- [ ] What changes/moves/updates? → Simulation
- [ ] Need to find something? → Search
- [ ] Need optimal solution? → DP/Greedy
- [ ] Counting occurrences? → HashMap
- [ ] Working with sorted data? → Two Pointers/Binary Search
- [ ] Substring/subarray? → Sliding Window
- [ ] Generate all? → Backtracking
- [ ] Relationships/dependencies? → Graph
- [ ] Range queries? → Prefix Sum

**If still stuck:** Solve a simpler version by hand and watch what YOU do

---

## 🔧 Debugging Your Pattern Recognition

### If your solution is too slow:
- Nested loops → Try Two Pointers or Sliding Window
- Recalculating same thing → Try DP or Prefix Sum
- Searching unsorted data → Try HashMap

### If your solution is too complex:
- Step back: Am I overthinking?
- Try: Can I sort first? Does that help?
- Try: Can I use a HashSet/HashMap?

### If you're completely stuck:
- Solve 1-2 examples by hand
- What did you naturally do? That's probably the pattern
- Ask: "What would change if input was 2x bigger?"

---

## 🎯 Quick Self-Test

Cover the answer, read the problem, guess the pattern:

1. "Find longest substring with at most K distinct characters"
   **Answer:** Sliding Window

2. "Can you finish all courses given prerequisites?"
   **Answer:** Graph (cycle detection)

3. "Count pairs that sum to target in sorted array"
   **Answer:** Two Pointers

4. "Robot moves on grid, avoid obstacles, reach goal"
   **Answer:** BFS (shortest path)

5. "Generate all valid parentheses combinations"
   **Answer:** Backtracking

6. "Maximum subarray sum of size K"
   **Answer:** Sliding Window (fixed size)

7. "Minimum coins to make change"
   **Answer:** DP (or Greedy if greedy works)

8. "Water falls down in grid, simulate until settled"
   **Answer:** Simulation

---

## 🚀 When You Get Good At This

You'll:
- Read a problem and immediately think "Oh, this is BFS"
- Know which data structure to use instantly
- See multiple valid approaches
- Estimate time complexity before coding

**That's the goal. You'll get there.**

---

## 💪 Final Reminder

**Before:** "I have no idea how to solve this"
**After:** "This is [pattern]. I'll use [approach]. If that doesn't work, I'll try [alternative]."

Pattern recognition transforms confusion into confidence.

**Your mantra:** "What pattern is this? Have I solved something similar?"

---

## 📚 Resources for Practice

**By Pattern:**
- LeetCode: Filter by tags (e.g., "Sliding Window", "Dynamic Programming")
- NeetCode: Curated list grouped by pattern
- AlgoExpert: Organized by category

**Build Pattern Fluency:**
- Solve 5-10 problems per pattern
- Don't jump around randomly
- Master one pattern before moving to next

**Track Progress:**
- Keep a notebook: Problem → Pattern → Key Insight
- Review weekly: What patterns am I missing?

---

**Print this. Keep it next to your computer. Reference it every time you're stuck.**

The patterns are always there. You just need to learn to see them.
