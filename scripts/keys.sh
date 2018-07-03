#!/bin/sh
#Author: @kanr

#export keystore from json
$GOPATH/src/github.com/vechain/thor/bin/thor master-key --export > keystore.json



# Import master key from keystore
#cat keystore.json | $GOPATH/src/github.com/vechain/thor/bin/thor master-key --Import
