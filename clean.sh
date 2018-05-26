#!/bin/sh 


for l in $(docker ps | cut -d " " -f 1  | grep -v CONTAINER) ; do docker stop  $l ; done 
 



