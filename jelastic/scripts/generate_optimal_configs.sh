#!/bin/bash

SED=$(which sed);

#
# memory optimizer for smartfox server
#

SMARTFOX_JAVAOPS_SCRIPT="${OPENSHIFT_SFS_DIR}.openshift/action_hooks/start";

[ -z "$XMS" ] && { XMS=32; }
memory_total=`free -m | grep Mem | awk '{print $2}'`;
[ -z "$XMX" ] && { let XMX=memory_total-35;  }

$SED -i  "s/-Xms[0-9]*m/-Xms${XMS}m/g"  $SMARTFOX_JAVAOPS_SCRIPT;
$SED -i  "s/-Xmx[0-9]*m/-Xmx${XMX}m/g"  $SMARTFOX_JAVAOPS_SCRIPT;

