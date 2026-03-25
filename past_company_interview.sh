# Past company interview questions and answer 

How do you troubleshoot slow linux server issue?
==> So to troubleshoot slow server first of all ping the server is reachable or not.
2. try to ssh to the server while you try to ssh if it's slow the server is slow.
3. check the big four resource, cpu,ram,disk,and network in detail

1. Initial Assessment (The "Quick Look")
Before diving deep, check the overall "vibe" of the system and historical logs.

uptime: Check the load averages (1, 5, and 15 minutes). If the numbers are higher than the number of CPU cores, the system is saturated.

dmesg | tail: Look for "Out of Memory" (OOM) kills, hardware errors, or file system resets.

journalctl -xe: View the latest system-level errors that might explain sudden hangs.

2. Resource-Specific Troubleshooting
A. CPU Bottlenecks

The Tool: top or htop (highly recommended for visual clarity).

What to look for:

%us (User): High values mean your applications (web server, DB) are working hard.

%sy (System): High values suggest kernel overhead or driver issues.

%wa (I/O Wait): This is a "hidden" CPU killer—the CPU is idle because it's waiting for the disk to respond.

Command: ps aux --sort=-%cpu | head -10 (Lists the top 10 CPU-consuming processes).

B. Memory (RAM) Issues

The Tool: free -h or vmstat 1.

What to look for:

Available vs. Free: "Available" is the real number that matters. If it's near zero, you’re in trouble.

Swap (si/so): If si (swap in) or so (swap out) in vmstat are consistently non-zero, the server is "thrashing"—moving data to the slow disk because RAM is full.

Command: ps aux --sort=-%mem | head -10 (Identify memory-hogging processes).

C. Disk I/O Bottlenecks

The Tool: iostat -xz 1 or iotop.

What to look for:

%util: If a disk is at 90-100% utilization, it cannot handle more requests.

await: The average time (ms) for an I/O request. Values over 20-30ms on SSDs usually indicate a bottleneck.

Command: df -h (Check if a full disk is preventing logs or temp files from being written).

D. Network Latency

The Tool: iftop, nload, or ss -tulpn.

What to look for:

Bandwidth saturation: Is a backup or a DDoS attack eating all your throughput?

Retransmissions: High segments retransmitted in netstat -s suggests packet loss.

3. Summary of Core Commands
Category	Command	Goal
Global	htop	Real-time interactive process viewer.
CPU	mpstat -P ALL 1	Check if one specific core is being hammered.
Memory	vmstat 1	Check for swapping and context switching.
Disk	iostat -kx 2	Detailed disk utilization and wait times.
Disk	iotop -o	Show only processes actually doing disk I/O.
Network	ss -s	Summary of active socket connections.

4. Next Steps
Once you identify the culprit (e.g., a specific process or a disk at 100%):

If it's a process: Use strace -p <PID> to see what system calls it's making (is it stuck in a loop?).

If it's Disk I/O: Check application logs (like MySQL slow query logs) to see what is triggering the heavy writes.

If it's Network: Use tcpdump to capture a small sample of traffic to check for anomalies.

# Would you like me to explain how to interpret the output of a specific command like iostat or vmstat?
# =====================================
How will you check ssh service not running and troubleshoot?
============================================================
# practice from basic to advance level shell scripting 

how do you manage eks access to 1000s of users prace and learn?
how do you work on terrafrom worksapce and how do you recover terraform lost state file
