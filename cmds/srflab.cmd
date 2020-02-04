# Required modules (will automatically load calc, asyn, stream and autosave)
require rssmx100a,1.0.0

# Signal Generator IP
epicsEnvSet("SMA_IP_ADDR","172.30.155.16")

# PV prefix
epicsEnvSet("P", "SRF:")
epicsEnvSet("R", "SMA100A:")

# asyn and stream device macros
epicsEnvSet("ASYNPORT","SMA_SRF_LAB")
epicsEnvSet("STREAM_PROTOCOL_PATH", "$(rssmx100a_DIR)db")

# Configure asyn IP driver
drvAsynIPPortConfigure("${ASYNPORT}", "${SMA_IP_ADDR}:5025 TCP",0,0,0)

# Load record instances
dbLoadRecords("SMA.template", "P=${P}, R=${R}, PORT=${ASYNPORT}")

iocInit()

