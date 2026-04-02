-- Flux: Algorithmic Game Theory Suite
-- Part 1: Shapley Value (Cooperative Game Theory)
-- Part 2: Continuous Cournot Nash Equilibrium via solve()
--
-- Formula: φᵢ = Σ [|S|!(n-|S|-1)!/n!] × [v(S∪{i}) - v(S)]
--
-- This file demonstrates Flux's mathematical engine on two foundational
-- results in algorithmic game theory. The Shapley value computation uses
-- Flux's native factorial recursion and rational arithmetic. The Cournot
-- equilibrium uses Flux's built-in solve() to derive the Nash condition
-- analytically from the best-response correspondence.

-- ═══════════════════════════════════════════════
-- PART 1: SHAPLEY VALUE
-- ═══════════════════════════════════════════════

fun factorial(k):
    if k <= 1:
        return 1
    return k · factorial(k - 1)

-- Shapley marginal weight: |S|! · (n - |S| - 1)! / n!
fun weight(s, n):
    return factorial(s) · factorial(n - s - 1) / factorial(n)

-- 3-player symmetric supermodular game
-- v({i}) = 1  for any single player
-- v({i,j}) = 4  for any pair
-- v({1,2,3}) = 9  grand coalition
n = 3
v_null  = 0
v_solo  = 1
v_pair  = 4
v_grand = 9

w0 = weight(0, n)
w1 = weight(1, n)
w2 = weight(2, n)

-- Shapley value per player (game is symmetric, all three are equal)
phi = w0 · (v_solo - v_null) + w1 · (v_pair - v_solo) + w1 · (v_pair - v_solo) + w2 · (v_grand - v_pair)

-- Efficiency axiom: sum of all Shapley values must equal v(grand coalition)
total = 3 · phi

print "=== Part 1: Shapley Value ==="
print "Game: v(i)=1, v(i,j)=4, v(N)=9 — symmetric supermodular"
print "Shapley value per player:"
print phi
print "Efficiency axiom — 3φ must equal v(N) = 9:"
print total

-- ═══════════════════════════════════════════════
-- PART 2: CONTINUOUS COURNOT NASH EQUILIBRIUM
-- ═══════════════════════════════════════════════
-- Market: P = 100 - (q1 + q2),  unit cost c = 10
-- Firm i maximises: π = (100 - qᵢ - q_j - 10) · qᵢ
-- Best response FOC: 90 - 2qᵢ - q_j = 0
-- Symmetric Nash: q_j = qᵢ = q  →  3q - 90 = 0
-- Social optimum (joint profit): 4q - 90 = 0

print ""
print "=== Part 2: Continuous Cournot Duopoly ==="
print "P = 100 - Q,  c = 10"

-- Nash equilibrium: solve the symmetric best-response condition
nash_eq(q) = 3 · q - 90
q_nash = solve(nash_eq, 1)
price_nash = 100 - 2 · q_nash
profit_nash = (price_nash - 10) · q_nash

print "Nash equilibrium quantity per firm:"
print q_nash
print "Nash profit per firm:"
print profit_nash

-- Social optimum: maximise joint profit (100 - 2q - 10) · 2q
social_eq(q) = 4 · q - 90
q_social = solve(social_eq, 1)
price_social = 100 - 2 · q_social
profit_social = (price_social - 10) · q_social

print "Social optimum quantity per firm:"
print q_social
print "Social optimum profit per firm:"
print profit_social

-- Price of Anarchy: ratio of socially optimal welfare to Nash welfare
poa = (2 · profit_social) / (2 · profit_nash)

print ""
print "Price of Anarchy — welfare ratio (optimum / Nash):"
print poa
