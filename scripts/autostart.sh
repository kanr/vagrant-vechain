#!/bin/sh
#Author: @kanr

## Input: beneficary address, 
## output: log data


mkdir ~/.thor ~/.thor/logs

#thor command
$GOPATH/src/github.com/vechain/thor/bin/thor \
--network main \
--beneficiary ${BENEFICIARY} \
--data-dir ~/.thor/logs
#--api-addr localhost:8669
#--api-cors domain0,domain1,domain2
#--verbosity 9
#--max-peers 25
#--p2p-port 11235
#--nat (any|none|upnp|pmp|exitip)

#Solo
#$GOPATH/src/github.com/vechain/thor/bin/thor solo\
#--on-demand
#--persist

