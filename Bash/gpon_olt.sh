#!/usr/bin/expect 

set timeout 5 

set datum [exec date +%Y%m%d]

set adresa [lindex $argv 0] 
set tip [lindex $argv 1]
set ime [lindex $argv 2]
set fajl [concat $ime\_$datum]
 
set user "xxx"
set password "xxx" 

spawn telnet $adresa
  expect "login:"
  send "$user\n"
  send "\r"
  expect "Password: " 
  send "$password\n"
  send "\r"
  expect "#"
  send "copy fs://config tftp://x.x.x.x/$tip/$ime/$fajl\n"
  send "\r"
  sleep 10
  expect "#"	
  send "exit\n"








  
