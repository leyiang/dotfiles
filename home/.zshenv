more=()

more+=("/usr/local/lib/node/bin")
more+=("/home/yiang/.cargo/bin")
more+=("/home/yiang/App/WebStorm-221.5787.30/bin")
more+=("/home/yiang/.local/share/JetBrains/Toolbox/scripts")
more+=("/home/yiang/Work/chrome/depot_tools")


more=$(IFS=: ; echo "${more[*]}")

export PATH=$more:$PATH
