# Train Request Manager Algorithm

## Objective

Receive train requests, validate the request information, generate a standardized request packet, and forward valid requests to the FIFO Request Buffer.

---

## Algorithm

Step 1:
Wait for a train request.

Step 2:
Detect a new train request at any station entry track.

Step 3:
Capture the following information:
• Train ID
• Entry Track
• Train Direction
• Train Type
• Emergency Flag
• Request Timestamp

Step 4:
Validate the received request.

The request is considered valid if:
• Entry track is within the valid range (0–7).
• Train ID is not zero.
• Train type is valid.
• No reset condition is active.

Step 5:
If the request is valid:
• Generate a 32-bit request packet.
• Assert request_valid signal.
• Send the request packet to the FIFO Request Buffer.

Step 6:
If the request is invalid:
• Assert error_flag.
• Discard the request.

Step 7:
Wait for the next train request.

---

End of Algorithm
