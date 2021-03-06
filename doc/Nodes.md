# Node Administration

This list contains active network nodes that either have already joined the network
using the over-the-air activation (OTAA) or have been activated-by-personalization
(ABP). All devices that can join the network using OTAA are listed on the
[Devices](Devices.md) list.

![alt tag](https://raw.githubusercontent.com/gotthardp/lorawan-server/master/doc/images/admin-node.png)

## General

For each active network Node you can set:
 * *DevAddr* of the node
 * *Region* that determines the LoRaWAN regional parameters
 * *Application* identifier corresponding to one of the [Applications](Applications.md) configured.
 * *Group* denotes application-specific device group or behaviour.
 * *Arguments*, which is an opaque string with application-specific settings.
 * *NwkSKey* and *AppSKey*
 * *FCnt Check* to be used for this device (see the Devices section for more explanation).
 * *TX Window* to be used for downlinks to this device.

The *US 902-928MHz* region allows a private *hybrid* mode introduced by
[Multitech](www.multitech.net/developer/software/lora/introduction-to-lora).
This is useful when you want to split the radio spectrum to 8 different sub-bands,
but it requires custom device firmware.

The *Downlinks* table contains frames created by the application, which are scheduled for
transmission. Class A devices listen for downlinks only for 2 seconds after an uplink
transmission, so it may take a while until all messages are transmitted. Class C
downlinks are not listed there as these are scheduled immediately.

To clone an existing node, simply save it under a different *DevAddr*.


## ADR

Optionally, you can also set the [ADR](ADR.md) parameters. The server will attempt
to configure the device accordingly.

Below the configuration options you can monitor the performance of the node. You
can see the assumed ADR parameters and two graphs that display the last 50 received
frames.


## Status

Device status indicates the recent device *Battery* level (0-255) and the
Signal-to-Noise-Ratio (*SNR*) of received downlinks.

The *Status Time* and *Status FCnt* indicate when was the status last
received by the server.

The server requests the device status upon join or reset and then at given
time/fcnt intervals defined by the `devstat_gap` parameter. By default
`{devstat_gap, {86400, 24}}`, which requests the status every 24 hours or
every 24 frames (whatever occurs first).

The server also requests device status when the ADR parameters change.
