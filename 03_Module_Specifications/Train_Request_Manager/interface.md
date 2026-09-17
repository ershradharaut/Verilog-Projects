# Train Request Manager Interface Specification

## Module Name

Train Request Manager

---

## Inputs

| Signal | Width | Description |
|--------|-------|-------------|
| clk | 1 | System clock |
| rst_n | 1 | Active-low reset |
| train_request | 1 | Indicates arrival of a new train |
| train_id | 8 | Unique train identification number |
| entry_track | 3 | Entry track number (0–7) |
| direction | 1 | Train direction (0 = Up, 1 = Down) |
| train_type | 2 | 00 = Passenger, 01 = Express, 10 = Freight, 11 = Emergency |
| request_time | 16 | Timestamp of request generation |

---

## Outputs

| Signal | Width | Description |
|--------|-------|-------------|
| request_valid | 1 | Valid request indication |
| request_packet | 32 | Encoded train request packet |
| error_flag | 1 | Invalid request detected |

---

## Internal Registers

| Register | Width | Purpose |
|----------|-------|----------|
| request_buffer | 32 | Temporary storage for request packet |
| valid_request | 1 | Internal validation flag |

---

## Connected Module

FIFO Request Buffer

---

## Interface Timing

• Inputs are sampled on the rising edge of the clock.

• Outputs become valid on the next clock cycle.

• Reset clears all outputs and internal registers.

---

End of Interface Specification
