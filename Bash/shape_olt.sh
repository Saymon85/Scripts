#!/usr/bin/expect 

set timeout 5 

set user "xxx"
set password "xxx" 


spawn telnet x.x.x.x
  expect "login:"
  send "$user\n"
  send "\r"
  expect "Password: " 
  send "$password\n"
  send "\r"
  expect "#"
  send "configure terminal"
  send "\r"
  sleep 5
  expect "#"
  send "profile shaping Single500/50M"
  send "\r"
  sleep 5
  expect "#"
  send "description Single500/50M"
  send "\r"
  sleep 5
  expect "#"
  send "no downstream one-policer"
  send "\r"
  sleep 5
  expect "#"
  send "downstream policer 0 enable"
  send "\r"
  sleep 5
  expect "#"
  send "downstream policer 0 peak-rate 563200"
  send "\r"
  sleep 5
  expect "#"
  send "upstream 0 enable"
  send "\r"
  sleep 5
  expect "#"
  send "upstream  0 commited-rate 56320"
  send "\r"
  sleep 5
  expect "#"
  send "upstream 0 peak-rate 56320"
  send "\r"
  sleep 5
  expect "#"
  send "exit"
  send "\r"
  sleep 5
  expect "#"

  send "exit"
  send "\r"
  sleep 5
  expect "#"

  send "commit"
  send "\r"
  sleep 5
  expect "#"
  send "save"
  send "\r"
  sleep 5
  expect "#"







  
