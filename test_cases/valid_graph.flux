-- Flux: Valid Graph Routing Test
-- Demonstrates a verifiable, structurally sound logic trace.

-- Node states: 1 = active, 0 = offline
node_A = 1
node_B = 1
node_C = 1

-- Edge weights (must be positive)
edge_AB = 12
edge_BC = 5

fun verify_route(a, b, c, w1, w2):
    if a == 0:
        print "[FATAL] Node A offline. Route rejected."
        return 0
    if b == 0:
        print "[FATAL] Node B offline. Route rejected."
        return 0
    if c == 0:
        print "[FATAL] Node C offline. Route rejected."
        return 0
    if w1 <= 0:
        print "[FATAL] Edge AB: invalid weight. Route rejected."
        return 0
    if w2 <= 0:
        print "[FATAL] Edge BC: invalid weight. Route rejected."
        return 0
    return 1

print "=== Valid Graph Routing ==="
result = verify_route(node_A, node_B, node_C, edge_AB, edge_BC)
if result == 1:
    print "[VERIFIED] All nodes active. All weights positive. Routing accepted."
