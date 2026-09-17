# Train Request Manager Specification

## 1. Module Name

Train Request Manager

---

## 2. Purpose

The Train Request Manager is the first module of the Smart Railway Interlocking System. Its primary responsibility is to receive all incoming train requests from the station entry points and forward valid requests to the FIFO Request Buffer for further processing.

This module acts as the interface between external train arrivals and the internal railway controller.

---

## 3. Functional Description

The Train Request Manager continuously monitors train requests arriving from all station entry tracks. Whenever a new train request is detected, the module collects all required train information, validates the request, and generates a request packet.

If the request is valid, it is forwarded to the FIFO Request Buffer. Invalid requests are rejected and an error indication is generated.

---

## 4. Responsibilities

• Receive incoming train requests.

• Capture train information.

• Validate request data.

• Generate request packet.

• Send valid request to FIFO Request Buffer.

• Reject invalid requests.

• Generate request_valid signal.

---

## 5. Inputs

• Clock

• Reset

• Train Request

• Train ID

• Entry Track Number

• Train Direction

• Train Type

• Emergency Flag

---

## 6. Outputs

• Request Valid

• Request Packet

• Error Flag

---

## 7. Design Objectives

• Accept one request per clock cycle.

• Reject invalid requests.

• Generate synchronized output.

• Support future expansion.

• Provide reliable interface to FIFO.

---

## 8. Dependencies

Next Module:

FIFO Request Buffer

---

## 9. Verification Goals

The module shall be verified for

• Normal train request

• Multiple requests

• Emergency train request

• Invalid request

• Reset operation

• Continuous operation

---

End of Specification
