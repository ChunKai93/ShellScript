#!/usr/bin/expect
set timeout 30
#调整窗口触发
trap {
    set rows [stty rows]
    set cols [stty columns]
    stty rows $rows columns $cols < $spawn_out(slave,name)
} WINCH
#端口 ip
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
