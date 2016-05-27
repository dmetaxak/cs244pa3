sudo sysctl -w net.ipv4.ip_forward=1
./run.sh 2>out.txt
python process_log.py out.txt out.tsv
