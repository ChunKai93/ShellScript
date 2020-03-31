#!/usr/bin/expect
set timeout 30
#port ip
spawn ssh -l root -p xxxxx xxx.xxx.xxx.xxx
expect {
    "(yes/no?" {
            send "yes\n"
            expect "*password:"
            #password
            send "xxxxxxxxx\r"
    }   
   "*password:" {
            #password
            send "xxxxxxxxx\r"
   }
}

expect "~#"
#ip
send "ssh -l root xxx.xxx.xxx.xxx\r"
expect "*password:"
#password
send "xxxxxxxxx\r"
interact
