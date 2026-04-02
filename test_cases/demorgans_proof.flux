-- Flux: De Morgan's Law Verification
-- Theorem: NOT(A AND B) == (NOT A) OR (NOT B)
-- Verified across all 4 entries of the truth table.

-- Boolean helpers (1 = true, 0 = false)
-- NOT a  = 1 - a
-- A AND B = a * b
-- A OR B  = a + b - (a * b)

fun check_demorgans(a, b):
    lhs = 1 - (a · b)
    not_a = 1 - a
    not_b = 1 - b
    rhs = not_a + not_b - (not_a · not_b)
    if lhs == rhs:
        return 1
    return 0

print "=== De Morgan's Law Verification ==="

r1 = check_demorgans(1, 1)
r2 = check_demorgans(1, 0)
r3 = check_demorgans(0, 1)
r4 = check_demorgans(0, 0)

all_pass = r1 · r2 · r3 · r4

if all_pass == 1:
    print "[VERIFIED] De Morgan's Law holds across all truth table entries."
else:
    print "[REJECTED] Violation detected."
