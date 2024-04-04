# IP Packet Monitor

This script monitors incoming IP packets and displays the count in both decimal and Roman numeral formats.

## Description

The script runs in an infinite loop, checking the number of incoming IP packets every 60 seconds. It then displays the current time, the number of packets, and a visual representation of the packet count in Roman numerals.

## Usage

To run the script, use the following command:

```bash
./packetsInRoman.sh
```

## Output

The script outputs a table with the following columns:

- Time: The current time when the check was performed.
- Count: The number of incoming IP packets in the last 10 seconds.
- Line: A visual representation of the packet count in Roman numerals.

## Example Output

```bash
|   Time   | Count  |    Line    |
--------------------------------
| 12:00:00 | 100    | C          |
| 12:01:00 | 200    | CC         |
| 12:02:00 | 300    | CCC        |
```

In this example, the script detected 100 packets in the first 60 seconds, 200 in the next 60 seconds, and 300 in the 60 seconds after that.

## Dependencies

This script depends on the `nstat` command, which is included in the `iproute2` package on most Linux distributions.
