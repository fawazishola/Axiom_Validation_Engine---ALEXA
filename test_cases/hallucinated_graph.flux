-- Flux: Hallucinated Graph Routing Test
-- Mimics an LLM Out-of-Distribution interpolation error.
-- AI hallucinates: routes through an offline node with a negative edge weight.

-- Node states: 1 = active, 0 = offline
node_A = 1
node_B = 0   -- AI hallucinates this node as active
node_C = 1

-- Edge weights
edge_AB = 12
edge_BC = -5  -- AI hallucinates a negative physical weight

fun verify_route(a, b, c, w1, w2):
    if a == 0:
        print "[FATAL] Node A offline. Route rejected."
        return 0
    if b == 0:
        print "[FATAL] Node B is offline. Cannot route through a dead node."
        return 0
    if c == 0:
        print "[FATAL] Node C offline. Route rejected."
        return 0
    if w1 <= 0:
        print "[FATAL] Edge AB: negative weight violates physical constraints."
        return 0
    if w2 <= 0:
        print "[FATAL] Edge BC: negative weight violates physical constraints."
        return 0
    return 1

print "=== Hallucinated Graph Routing ==="
result = verify_route(node_A, node_B, node_C, edge_AB, edge_BC)
if result == 0:
    print "[SYSTEM] Execution halted. Hallucinated path trapped before propagation."
