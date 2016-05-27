# cs244pa3

Running Sprout on mahimahi
==========================

0. Install things

1. Run things

`$ ./inception.sh`

This will take approximately 5 hrs and will produce two output files: `out.txt` (the raw log) and `out.tsv` (the nicely formatted output)

If you want to produce graphs with matplotlib:

`$ python make_graphs.py out.tsv <PREFIX>`

This will produce one graph for each trace that was run (5 in total) in the format `PREFIX_TRACE.png`


Installation
============

0. Clone this repo

1. Install mahimahi

`
$ sudo apt-get install build-essential git debhelper autotools-dev dh-autoreconf iptables protobuf-compiler libprotobuf-dev pkg-config libssl-dev dnsmasq-base ssl-cert libxcb-present-dev libcairo2-dev libpango1.0-dev iproute2 apache2-dev apache2-bin iptables dnsmasq-base gnuplot iproute2 apache2-api-20120211 libwww-perl` (these dependencies are listed in mahimahi/debian/control, plus some for the contest itself)
`
To check if mahimahi is running, try:

`$ mm-delay 20`
`$ exit`

2. Build Sprout

`$ cd alfalfa`
`$ ./autogen.sh`
`$ ./configure --enable-examples`
`$ make`

This will likely require that you install some things along the way. If you get any errors of someting not being found when you try to `make`, install those packages using `apt-get`.

3. Install iperf

4. (For graphing the results) install matplotlib

`$ sudo apt-get install python-matplotlib`
