# Required modules
require calc,3.7.3
require asyn,4.36.0
require stream,2.8.10
require autosave,5.10.0
require rssmx100a,1.0.0

# Signal Generator IP
epicsEnvSet("SMA_IP_ADDR","172.30.5.34")

# PV prefix
epicsEnvSet("P", "ICSLAB:")
epicsEnvSet("R", "SMA100A:")

# asyn and stream device macros
epicsEnvSet("ASYNPORT","SMA_ICS_LAB")
epicsEnvSet("STREAM_PROTOCOL_PATH", "$(rssmx100a_DIR)db")

# Configure asyn IP driver
drvAsynIPPortConfigure("${ASYNPORT}", "${SMA_IP_ADDR}:5025 TCP",0,0,0)

# Load record instances
dbLoadRecords("SMA.template", "P=${P}, R=${R}, PORT=${ASYNPORT}")

iocInit()

