# Train Request Manager FSM

## Objective

The Train Request Manager operates as a sequential controller using a Finite State Machine (FSM). It continuously waits for new train requests, validates them, generates a request packet, and forwards valid requests to the FIFO Request Buffer.

---

## FSM States

### State 0 : IDLE

• Wait for a new train request.

• Monitor all station entry tracks.

---

### State 1 : RECEIVE_REQUEST

• Capture Train ID.

• Capture Entry Track.

• Capture Direction.

• Capture Train Type.

• Capture Emergency Flag.

• Capture Timestamp.

---

### State 2 : VALIDATE_REQUEST

Check whether:

• Train ID is valid.

• Entry Track Number is valid.

• Train Type is valid.

If validation fails, move to ERROR state.

Otherwise, continue.

---

### State 3 : GENERATE_PACKET

Generate the standardized 32-bit request packet.

Store the packet into the internal request buffer.

---

### State 4 : SEND_TO_FIFO

Assert request_valid.

Transfer the request packet to the FIFO Request Buffer.

---

### State 5 : ERROR

Assert error_flag.

Discard the invalid request.

Return to IDLE.

---

## State Transition

```
IDLE
   │
   ▼
RECEIVE_REQUEST
   │
   ▼
VALIDATE_REQUEST
   │
   ├──────── Invalid ───────► ERROR
   │
 Valid
   ▼
GENERATE_PACKET
   │
   ▼
SEND_TO_FIFO
   │
   ▼
IDLE
```

---

End of FSM
