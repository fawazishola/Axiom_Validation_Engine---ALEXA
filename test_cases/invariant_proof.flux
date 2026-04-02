-- Flux: State Invariant Proof
-- Theorem: A transfer must preserve total balance and never cause negative funds.
-- This execution deliberately violates the invariant to demonstrate the trap.

sender_balance = 30
receiver_balance = 100
transfer_amount = 50   -- Invalid: sender only has 30

fun prove_safe_transfer(sender, receiver, amount):
    new_sender = sender - amount
    new_receiver = receiver + amount

    -- Invariant 1: transfer amount must be positive
    if amount <= 0:
        print "[FATAL] Transfer amount is non-positive. Rejected."
        return 0

    -- Invariant 2: sender cannot go negative
    if new_sender < 0:
        print "[FATAL] Transfer causes negative balance. Systemic debt prevented."
        return 0

    -- Invariant 3: conservation of value
    total_before = sender + receiver
    total_after = new_sender + new_receiver
    if total_before != total_after:
        print "[FATAL] Conservation of value violated."
        return 0

    return 1

print "=== State Invariant Proof ==="
result = prove_safe_transfer(sender_balance, receiver_balance, transfer_amount)
if result == 0:
    print "[SYSTEM] Invalid state trapped. Execution halted."
