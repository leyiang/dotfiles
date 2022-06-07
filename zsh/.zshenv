more=()

more+=("/usr/local/lib/node/bin")
more+=("/home/yiang/.cargo/bin")

more=$(IFS=: ; echo "${more[*]}")

export PATH=$more:$PATH
