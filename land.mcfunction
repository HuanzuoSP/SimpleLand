#{ID系统}
#领地前置
#[命令]
scoreboard players add @a LoginInfo 0
#所有在线玩家的"登入信息"添加<0>分 本意:设置首次进入服务器新玩家的"登入信息"添加<0>分
scoreboard players add @a[scores={LoginInfo=0}] LoginInfo 1
#所有"登入信息"为<0>分的新玩家添加<1>分
execute @a[c=1,scores={LoginInfo=1}] ~ ~ ~ scoreboard players add 注册人数 RegInfo 1
#让一个最近的"登入信息"为<1>分的玩家执行向"注册人数"的"RegInfo"添加<X+1>分
execute @a[c=1,scores={LoginInfo=1}] ~ ~ ~ scoreboard players operation @s PlayerID = 注册人数 RegInfo
#让一个最近的"登入信息"为<1>分的玩家执行使自己"ID"的分数等于"注册人数"的"RegInfo"分数<X+1>
execute @a[c=1,scores={LoginInfo=1}] ~ ~ ~ scoreboard players add @s LoginInfo 1
#让一个最近的"登入信息"为<1>分的玩家执行使自己的"LoginInfo"添加<1>分
#{密码系统+菜单系统}
#*领地前置
#玩家初始化PasswordInfo & Password
scoreboard players add @a PasswordInfo 0
scoreboard players add @a Password 0
#初始化玩家密码
scoreboard players random @a[scores={PasswordInfo=0}] Password 0 9999
#标记已初始化密码的玩家
scoreboard players add @a[scores={PasswordInfo=0}] PasswordInfo 1
#初始化物品标记
execute @a ~ ~ ~ scoreboard players add @e[type=item,r=5] ItemDistinguish 0
#标记丢出的物品
execute @a ~ ~ ~ scoreboard players add @e[type=item,r=5,scores={ItemDistinguish=0}] ItemDistinguish 1
#初始化底部信息并默认开启
scoreboard players add @a Actionbar 0
scoreboard players add @a[scores={Actionbar=0}] Actionbar 1
#开启底部信息
execute @a[scores={Actionbar=2}] ~ ~ ~ execute @e[type=item,name="开启底部信息",r=5,scores={ItemDistinguish=1}] ~ ~ ~ scoreboard players remove @p Actionbar 1
execute @a[scores={Actionbar=1}] ~ ~ ~ scoreboard players add @e[type=item,name="开启底部信息",r=5,scores={ItemDistinguish=1}] ItemDistinguish 1
#关闭底部信息
execute @a[scores={Actionbar=1}] ~ ~ ~ execute @e[type=item,name="关闭底部信息",r=5,scores={ItemDistinguish=1}] ~ ~ ~ scoreboard players add @p Actionbar 1
execute @a[scores={Actionbar=2}] ~ ~ ~ scoreboard players add @e[type=item,name="关闭底部信息",r=5,scores={ItemDistinguish=1}] ItemDistinguish 1
#限制底部信息设置范围
scoreboard players add @a[scores={Actionbar=..-1}] Actionbar 1
scoreboard players remove @a[scores={Actionbar=3..}] Actionbar 1
#Help菜单

execute @a ~ ~ ~ execute @e[type=item,name="help",scores={ItemDistinguish=1}] ~ ~ ~ tell @p 重命名的物品功能预览 "圈地"的钻石丢到绿宝石块上,可圈地 "+1000"或"-1000",可修改领地密码的第一位 "+0100"或"-0100",可修改领地密码的第二位 "+0010"或"-0010",可修改领地密码的第三位 "+0001"或"-0001",可修改领地密码的第四位 把密码修改为 好友告诉你的数字 ,可获得他的领地生存模式权限 修改密码后重新进入你的领地,可修改领地的访问密码 "打乱密码"的物品丢出,可将密码随机设置 修改密码后重新进入你的领地,可修改领地的访问密码
execute @a ~ ~ ~ scoreboard players add @e[type=item,name="help",r=5,scores={ItemDistinguish=1}] ItemDistinguish 1

#修改第一位密码
execute @a ~ ~ ~ execute @e[type=item,name="+1000",scores={ItemDistinguish=1}] ~ ~ ~ scoreboard players add @p Password 1000
execute @a ~ ~ ~ execute @e[type=item,name="+1000",scores={ItemDistinguish=1}] ~ ~ ~ scoreboard players add @p SeePassword 1
execute @a ~ ~ ~ scoreboard players add @e[type=item,name="+1000",r=5,scores={ItemDistinguish=1}] ItemDistinguish 1
execute @a ~ ~ ~ execute @e[type=item,name="-1000",scores={ItemDistinguish=1}] ~ ~ ~ scoreboard players remove @p Password 1000
execute @a ~ ~ ~ execute @e[type=item,name="-1000",scores={ItemDistinguish=1}] ~ ~ ~ scoreboard players add @p SeePassword 1
execute @a ~ ~ ~ scoreboard players add @e[type=item,name="-1000",r=5,scores={ItemDistinguish=1}] ItemDistinguish 1
#修改第二位密码
execute @a ~ ~ ~ execute @e[type=item,name="+0100",scores={ItemDistinguish=1}] ~ ~ ~ scoreboard players add @p Password 100
execute @a ~ ~ ~ execute @e[type=item,name="+0100",scores={ItemDistinguish=1}] ~ ~ ~ scoreboard players add @p SeePassword 1
execute @a ~ ~ ~ scoreboard players add @e[type=item,name="+0100",r=5,scores={ItemDistinguish=1}] ItemDistinguish 1
execute @a ~ ~ ~ execute @e[type=item,name="-0100",scores={ItemDistinguish=1}] ~ ~ ~ scoreboard players remove @p Password 100
execute @a ~ ~ ~ execute @e[type=item,name="-0100",scores={ItemDistinguish=1}] ~ ~ ~ scoreboard players add @p SeePassword 1
execute @a ~ ~ ~ scoreboard players add @e[type=item,name="-0100",r=5,scores={ItemDistinguish=1}] ItemDistinguish 1
#修改第三位密码
execute @a ~ ~ ~ execute @e[type=item,name="+0010",scores={ItemDistinguish=1}] ~ ~ ~ scoreboard players add @p Password 1000
execute @a ~ ~ ~ execute @e[type=item,name="+0010",scores={ItemDistinguish=1}] ~ ~ ~ scoreboard players add @p SeePassword 1
execute @a ~ ~ ~ scoreboard players add @e[type=item,name="+0010",r=5,scores={ItemDistinguish=1}] ItemDistinguish 1
execute @a ~ ~ ~ execute @e[type=item,name="-0010",scores={ItemDistinguish=1}] ~ ~ ~ scoreboard players remove @p Password 10
execute @a ~ ~ ~ execute @e[type=item,name="-0010",scores={ItemDistinguish=1}] ~ ~ ~ scoreboard players add @p SeePassword 1
execute @a ~ ~ ~ scoreboard players add @e[type=item,name="-0010",r=5,scores={ItemDistinguish=1}] ItemDistinguish 1
#修改第四位密码
execute @a ~ ~ ~ execute @e[type=item,name="+0001",scores={ItemDistinguish=1}] ~ ~ ~ scoreboard players add @p Password 1
execute @a ~ ~ ~ execute @e[type=item,name="+0001",scores={ItemDistinguish=1}] ~ ~ ~ scoreboard players add @p SeePassword 1
execute @a ~ ~ ~ scoreboard players add @e[type=item,name="+0001",r=5,scores={ItemDistinguish=1}] ItemDistinguish 1
execute @a ~ ~ ~ execute @e[type=item,name="-0001",scores={ItemDistinguish=1}] ~ ~ ~ scoreboard players remove @p Password 1
execute @a ~ ~ ~ execute @e[type=item,name="-0001",scores={ItemDistinguish=1}] ~ ~ ~ scoreboard players add @p SeePassword 1
execute @a ~ ~ ~ scoreboard players add @e[type=item,name="-0001",r=5,scores={ItemDistinguish=1}] ItemDistinguish 1
#限制密码位数
scoreboard players operation @a[scores={Password=10000..}] Password %= @e[name="计数器"] CountE
scoreboard players operation @a[scores={Password=..-1}] Password += @e[name="计数器"] CountE
#打乱密码
execute @a ~ ~ ~ execute @e[type=item,name="打乱密码",r=5,scores={ItemDistinguish=1}] ~ ~ ~ scoreboard players random @p Password 0 9999
execute @a ~ ~ ~ scoreboard players add @e[type=item,name="打乱密码",r=5,scores={ItemDistinguish=1}] SeePassword 1
execute @a ~ ~ ~ scoreboard players add @e[type=item,name="打乱密码",r=5,scores={ItemDistinguish=1}] ItemDistinguish 1
 
#初始化Title显示
scoreboard players add @a SeePassword 0
scoreboard players add @a[scores={SeePassword=0}] SeePassword 1
#Title显示密码
execute @a[scores={SeePassword=1}] ~ ~ ~ execute @e[type=item,name="查看密码",r=5,scores={ItemDistinguish=1}] ~ ~ ~ scoreboard players add @p[scores={SeePassword=1}] SeePassword 1
execute @a ~ ~ ~ execute @e[type=item,name="查看密码",r=5,scores={ItemDistinguish=1}] ~ ~ ~ scoreboard players add @e[type=item,name="查看密码",r=5,scores={ItemDistinguish=1}] ItemDistinguish 1
#个位
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="1",scores={CounterID=1}] PasswordA = @e[type=tnt,name="1",scores={CounterID=1}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="2",scores={CounterID=2}] PasswordA = @e[type=tnt,name="2",scores={CounterID=2}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="3",scores={CounterID=3}] PasswordA = @e[type=tnt,name="3",scores={CounterID=3}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="4",scores={CounterID=4}] PasswordA = @e[type=tnt,name="4",scores={CounterID=4}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="5",scores={CounterID=5}] PasswordA = @e[type=tnt,name="5",scores={CounterID=5}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="6",scores={CounterID=6}] PasswordA = @e[type=tnt,name="6",scores={CounterID=6}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="7",scores={CounterID=7}] PasswordA = @e[type=tnt,name="7",scores={CounterID=1}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="8",scores={CounterID=8}] PasswordA = @e[type=tnt,name="8",scores={CounterID=8}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="9",scores={CounterID=9}] PasswordA = @e[type=tnt,name="9",scores={CounterID=1}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="0",scores={CounterID=10}] PasswordA = @e[type=tnt,name="0",scores={CounterID=10}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @s PasswordA = @s Password
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @s PasswordA %= @e[name="计数器"] CountD
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @s PasswordA %= @e[name="计数器"] CountC
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @s PasswordA %= @e[name="计数器"] CountB
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="1",scores={CounterID=1}] PasswordA -= @s PasswordA
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="2",scores={CounterID=2}] PasswordA -= @s PasswordA
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="3",scores={CounterID=3}] PasswordA -= @s PasswordA
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="4",scores={CounterID=4}] PasswordA -= @s PasswordA
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="5",scores={CounterID=5}] PasswordA -= @s PasswordA
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="6",scores={CounterID=6}] PasswordA -= @s PasswordA
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="7",scores={CounterID=7}] PasswordA -= @s PasswordA
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="8",scores={CounterID=8}] PasswordA -= @s PasswordA
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="9",scores={CounterID=9}] PasswordA -= @s PasswordA
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="0",scores={CounterID=10}] PasswordA -= @s PasswordA
#十位
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="1",scores={CounterID=1}] PasswordB = @e[type=tnt,name="1",scores={CounterID=1}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="2",scores={CounterID=2}] PasswordB = @e[type=tnt,name="2",scores={CounterID=2}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="3",scores={CounterID=3}] PasswordB = @e[type=tnt,name="3",scores={CounterID=3}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="4",scores={CounterID=4}] PasswordB = @e[type=tnt,name="4",scores={CounterID=4}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="5",scores={CounterID=5}] PasswordB = @e[type=tnt,name="5",scores={CounterID=5}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="6",scores={CounterID=6}] PasswordB = @e[type=tnt,name="6",scores={CounterID=6}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="7",scores={CounterID=7}] PasswordB = @e[type=tnt,name="7",scores={CounterID=7}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="8",scores={CounterID=8}] PasswordB = @e[type=tnt,name="8",scores={CounterID=8}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="9",scores={CounterID=9}] PasswordB = @e[type=tnt,name="9",scores={CounterID=9}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="0",scores={CounterID=10}] PasswordB = @e[type=tnt,name="0",scores={CounterID=10}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @s PasswordB = @s Password
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @s PasswordB %= @e[name="计数器"] CountD
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @s PasswordB %= @e[name="计数器"] CountC
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @s PasswordB /= @e[name="计数器"] CountB
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="1",scores={CounterID=1}] PasswordB -= @s PasswordB
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="2",scores={CounterID=2}] PasswordB -= @s PasswordB
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="3",scores={CounterID=3}] PasswordB -= @s PasswordB
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="4",scores={CounterID=4}] PasswordB -= @s PasswordB
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="5",scores={CounterID=5}] PasswordB -= @s PasswordB
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="6",scores={CounterID=6}] PasswordB -= @s PasswordB
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="7",scores={CounterID=7}] PasswordB -= @s PasswordB
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="8",scores={CounterID=8}] PasswordB -= @s PasswordB
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="9",scores={CounterID=9}] PasswordB -= @s PasswordB
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="0",scores={CounterID=10}] PasswordB -= @s PasswordB
#百位
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="1",scores={CounterID=1}] PasswordC = @e[type=tnt,name="1",scores={CounterID=1}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="2",scores={CounterID=2}] PasswordC = @e[type=tnt,name="2",scores={CounterID=2}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="3",scores={CounterID=3}] PasswordC = @e[type=tnt,name="3",scores={CounterID=3}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="4",scores={CounterID=4}] PasswordC = @e[type=tnt,name="4",scores={CounterID=4}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="5",scores={CounterID=5}] PasswordC = @e[type=tnt,name="5",scores={CounterID=5}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="6",scores={CounterID=6}] PasswordC = @e[type=tnt,name="6",scores={CounterID=6}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="7",scores={CounterID=7}] PasswordC = @e[type=tnt,name="7",scores={CounterID=7}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="8",scores={CounterID=8}] PasswordC = @e[type=tnt,name="8",scores={CounterID=8}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="9",scores={CounterID=9}] PasswordC = @e[type=tnt,name="9",scores={CounterID=9}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="0",scores={CounterID=10}] PasswordC = @e[type=tnt,name="0",scores={CounterID=10}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @s PasswordC = @s Password
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @s PasswordC %= @e[name="计数器"] CountD
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @s PasswordC /= @e[name="计数器"] CountC
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="1",scores={CounterID=1}] PasswordC -= @s PasswordC
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="2",scores={CounterID=2}] PasswordC -= @s PasswordC
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="3",scores={CounterID=3}] PasswordC -= @s PasswordC
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="4",scores={CounterID=4}] PasswordC -= @s PasswordC
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="5",scores={CounterID=5}] PasswordC -= @s PasswordC
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="6",scores={CounterID=6}] PasswordC -= @s PasswordC
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="7",scores={CounterID=7}] PasswordC -= @s PasswordC
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="8",scores={CounterID=8}] PasswordC -= @s PasswordC
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="9",scores={CounterID=9}] PasswordC -= @s PasswordC
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="0",scores={CounterID=10}] PasswordC -= @s PasswordC
#千位
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="1",scores={CounterID=1}] PasswordD = @e[type=tnt,name="1",scores={CounterID=1}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="2",scores={CounterID=2}] PasswordD = @e[type=tnt,name="2",scores={CounterID=2}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="3",scores={CounterID=3}] PasswordD = @e[type=tnt,name="3",scores={CounterID=3}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="4",scores={CounterID=4}] PasswordD = @e[type=tnt,name="4",scores={CounterID=4}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="5",scores={CounterID=5}] PasswordD = @e[type=tnt,name="5",scores={CounterID=5}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="6",scores={CounterID=6}] PasswordD = @e[type=tnt,name="6",scores={CounterID=6}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="7",scores={CounterID=7}] PasswordD = @e[type=tnt,name="7",scores={CounterID=7}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="8",scores={CounterID=8}] PasswordD = @e[type=tnt,name="8",scores={CounterID=8}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="9",scores={CounterID=9}] PasswordD = @e[type=tnt,name="9",scores={CounterID=9}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="0",scores={CounterID=10}] PasswordD = @e[type=tnt,name="0",scores={CounterID=10}] CounterID
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @s PasswordD = @s Password
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @s PasswordD /= @e[name="计数器"] CountD
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="1",scores={CounterID=1}] PasswordD -= @s PasswordD
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="2",scores={CounterID=2}] PasswordD -= @s PasswordD
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="3",scores={CounterID=3}] PasswordD -= @s PasswordD
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="4",scores={CounterID=4}] PasswordD -= @s PasswordD
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="5",scores={CounterID=5}] PasswordD -= @s PasswordD
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="6",scores={CounterID=6}] PasswordD -= @s PasswordD
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="7",scores={CounterID=7}] PasswordD -= @s PasswordD
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="8",scores={CounterID=8}] PasswordD -= @s PasswordD
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="9",scores={CounterID=9}] PasswordD -= @s PasswordD
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=tnt,name="0",scores={CounterID=10}] PasswordD -= @s PasswordD
#数据转移A
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="1",scores={CounterID=1}] PasswordA = @e[type=tnt,name="1",scores={CounterID=1}] PasswordA
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="2",scores={CounterID=2}] PasswordA = @e[type=tnt,name="2",scores={CounterID=2}] PasswordA
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="3",scores={CounterID=3}] PasswordA = @e[type=tnt,name="3",scores={CounterID=3}] PasswordA
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="4",scores={CounterID=4}] PasswordA = @e[type=tnt,name="4",scores={CounterID=4}] PasswordA
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="5",scores={CounterID=5}] PasswordA = @e[type=tnt,name="5",scores={CounterID=5}] PasswordA
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="6",scores={CounterID=6}] PasswordA = @e[type=tnt,name="6",scores={CounterID=6}] PasswordA
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="7",scores={CounterID=7}] PasswordA = @e[type=tnt,name="7",scores={CounterID=7}] PasswordA
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="8",scores={CounterID=8}] PasswordA = @e[type=tnt,name="8",scores={CounterID=8}] PasswordA
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="9",scores={CounterID=9}] PasswordA = @e[type=tnt,name="9",scores={CounterID=9}] PasswordA
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="0",scores={CounterID=10}] PasswordA = @e[type=tnt,name="0",scores={CounterID=10}] PasswordA
#数据转移B
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="1",scores={CounterID=1}] PasswordB = @e[type=tnt,name="1",scores={CounterID=1}] PasswordB
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="2",scores={CounterID=2}] PasswordB = @e[type=tnt,name="2",scores={CounterID=2}] PasswordB
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="3",scores={CounterID=3}] PasswordB = @e[type=tnt,name="3",scores={CounterID=3}] PasswordB
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="4",scores={CounterID=4}] PasswordB = @e[type=tnt,name="4",scores={CounterID=4}] PasswordB
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="5",scores={CounterID=5}] PasswordB = @e[type=tnt,name="5",scores={CounterID=5}] PasswordB
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="6",scores={CounterID=6}] PasswordB = @e[type=tnt,name="6",scores={CounterID=6}] PasswordB
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="7",scores={CounterID=7}] PasswordB = @e[type=tnt,name="7",scores={CounterID=7}] PasswordB
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="8",scores={CounterID=8}] PasswordB = @e[type=tnt,name="8",scores={CounterID=8}] PasswordB
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="9",scores={CounterID=9}] PasswordB = @e[type=tnt,name="9",scores={CounterID=9}] PasswordB
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="0",scores={CounterID=10}] PasswordB = @e[type=tnt,name="0",scores={CounterID=10}] PasswordB
#数据转移C
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="1",scores={CounterID=1}] PasswordC = @e[type=tnt,name="1",scores={CounterID=1}] PasswordC
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="2",scores={CounterID=2}] PasswordC = @e[type=tnt,name="2",scores={CounterID=2}] PasswordC
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="3",scores={CounterID=3}] PasswordC = @e[type=tnt,name="3",scores={CounterID=3}] PasswordC
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="4",scores={CounterID=4}] PasswordC = @e[type=tnt,name="4",scores={CounterID=4}] PasswordC
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="5",scores={CounterID=5}] PasswordC = @e[type=tnt,name="5",scores={CounterID=5}] PasswordC
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="6",scores={CounterID=6}] PasswordC = @e[type=tnt,name="6",scores={CounterID=6}] PasswordC
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="7",scores={CounterID=7}] PasswordC = @e[type=tnt,name="7",scores={CounterID=7}] PasswordC
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="8",scores={CounterID=8}] PasswordC = @e[type=tnt,name="8",scores={CounterID=8}] PasswordC
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="9",scores={CounterID=9}] PasswordC = @e[type=tnt,name="9",scores={CounterID=9}] PasswordC
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="0",scores={CounterID=10}] PasswordC = @e[type=tnt,name="0",scores={CounterID=10}] PasswordC
#数据转移D
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="1",scores={CounterID=1}] PasswordD = @e[type=tnt,name="1",scores={CounterID=1}] PasswordD
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="2",scores={CounterID=2}] PasswordD = @e[type=tnt,name="2",scores={CounterID=2}] PasswordD
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="3",scores={CounterID=3}] PasswordD = @e[type=tnt,name="3",scores={CounterID=3}] PasswordD
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="4",scores={CounterID=4}] PasswordD = @e[type=tnt,name="4",scores={CounterID=4}] PasswordD
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="5",scores={CounterID=5}] PasswordD = @e[type=tnt,name="5",scores={CounterID=5}] PasswordD
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="6",scores={CounterID=6}] PasswordD = @e[type=tnt,name="6",scores={CounterID=6}] PasswordD
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="7",scores={CounterID=7}] PasswordD = @e[type=tnt,name="7",scores={CounterID=7}] PasswordD
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="8",scores={CounterID=8}] PasswordD = @e[type=tnt,name="8",scores={CounterID=8}] PasswordD
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="9",scores={CounterID=9}] PasswordD = @e[type=tnt,name="9",scores={CounterID=9}] PasswordD
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name="0",scores={CounterID=10}] PasswordD = @e[type=tnt,name="0",scores={CounterID=10}] PasswordD
#Title
execute @a[scores={Actionbar=1,SeePassword=2}] ~ ~ ~ title @s title 领地密码:@e[scores={PasswordD=0},type=armor_stand]@e[scores={PasswordC=0},type=armor_stand]@e[scores={PasswordB=0},type=armor_stand]@e[scores={PasswordA=0},type=armor_stand]
#结束SeePassword
execute @a[scores={SeePassword=2}] ~ ~ ~ scoreboard players remove @s SeePassword 1
#限制SeePassword设置范围
scoreboard players add @a[scores={SeePassword=..-1}] SeePassword 1
scoreboard players remove @a[scores={SeePassword=3..}] SeePassword 1

#领地系统
#[命令]
#使领地内的玩家的”PlayerID“等于”CountF”
execute @a[scores={PlayerID=1..}] ~ ~ ~ execute @e[x=~-15,y=0,z=~-15,dx=31,dz=31,type=leash_knot,c=1,scores={LandID=1..}] ~ ~ ~ execute @a[x=~-16,y=0,z=~-16,dx=31,dy=256,dz=31] ~ ~ ~ scoreboard players operation @s CountF = @s PlayerID
#使领地内的玩家的”CountF”减去领地的”LandID”
execute @a[scores={PlayerID=1..}] ~ ~ ~ execute @e[x=~-15,y=0,z=~-15,dx=31,dz=31,type=leash_knot,c=1,scores={LandID=1..}] ~ ~ ~ scoreboard players operation @a[x=~-16,y=0,z=~-16,dx=31,dy=256,dz=31,c=1] CountF -= @s LandID
#使领地密码自动变为领地主人的领地密码
execute @a[scores={PlayerID=1..}] ~ ~ ~ execute @e[x=~-15,y=0,z=~-15,dx=31,dz=31,type=leash_knot,c=1,scores={LandID=1..}] ~ ~ ~ scoreboard players operation @s LandPassword = @a[x=~-16,y=0,z=~-16,dx=31,dy=256,dz=31,scores={CountF=0}] Password
#使领地内的玩家的”CountG“等于玩家自己的”Password”
execute @a[scores={PlayerID=1..}] ~ ~ ~ execute @e[x=~-15,y=0,z=~-15,dx=31,dz=31,type=leash_knot,c=1,scores={LandID=1..}] ~ ~ ~ execute @a[x=~-16,y=0,z=~-16,dx=31,dy=256,dz=31] ~ ~ ~ scoreboard players operation @s CountG = @s Password
#使领地内的玩家的”CountG”减去领地的”LandPassword”
execute @a[scores={PlayerID=1..}] ~ ~ ~ execute @e[x=~-15,y=0,z=~-15,dx=31,dz=31,type=leash_knot,c=1,scores={LandID=1..}] ~ ~ ~ scoreboard players operation @a[x=~-16,y=0,z=~-16,dx=31,dy=256,dz=31,c=1] CountG -= @s LandPassword
#使领地内为”CountG”为<0>分的玩家,该玩家游戏模式由冒险变为生存
execute @a[c=1,scores={PlayerID=1..}] ~ ~ ~ execute @e[x=~-15,y=0,z=~-15,dx=31,dz=31,type=leash_knot,c=1,scores={LandID=1..}] ~ ~ ~ gamemode s @a[x=~-16,y=0,z=~-16,dx=31,dy=256,dz=31,scores={CountG=0},m=a]
#使领地内除了”CountG”为<0>分的玩家,该玩家游戏模式由生存变为冒险
execute @a[c=1,scores={PlayerID=1..}] ~ ~ ~ execute @e[x=~-15,y=0,z=~-15,dx=31,dz=31,type=leash_knot,c=1,scores={LandID=1..}] ~ ~ ~ gamemode a @a[x=~-16,y=0,z=~-16,dx=31,dy=256,dz=31,scores={CountG=!0},m=s]
#不在领地内的冒险模式玩家变为生存模式
execute @a[m=a] ~ ~ ~ detect ~ 0 ~ bedrock 0 gamemode s
#[圈地命令]
execute @e[type=item,name="圈地",scores={ItemDistinguish=1}] ~ ~ ~ detect ~ ~-1 ~ emerald_block 0 scoreboard players add @s LandInfo 0
execute @e[type=item,name="圈地",scores={ItemDistinguish=1,LandInfo=0}] ~ ~ ~ execute @e[x=~-31,y=0,z=~-31,dx=62,dz=62,type=leash_knot,c=1,scores={LandID=1..}] ~ ~ ~ scoreboard players add @e[type=item,scores={LandInfo=0}] LandInfo 1
execute @e[type=item,name="圈地",scores={ItemDistinguish=1,LandInfo=1}] ~ ~ ~ title @p subtitle 这里和另一块领地存在重叠
execute @e[type=item,name="圈地",scores={ItemDistinguish=1,LandInfo=1}] ~ ~ ~ title @p title §4圈地失败！
execute @e[type=item,name="圈地",scores={ItemDistinguish=1,LandInfo=1}] ~ ~ ~ scoreboard players add @e[type=item,name="圈地",scores={ItemDistinguish=1,LandInfo=1}] ItemDistinguish 1
execute @e[type=item,name="圈地",scores={ItemDistinguish=1,LandInfo=0}] ~ ~ ~ execute @e[x=~-31,y=0,z=~-31,dx=62,dz=62,type=leash_knot,c=1,scores={LandID=1..}] ~ ~ ~ scoreboard players add @e[type=item,scores={LandInfo=0}] ItemDistinguish 1
execute @e[type=item,name="圈地",scores={ItemDistinguish=1,LandInfo=0}] ~ ~ ~ fill ~-20 0 ~-20 ~20 0 ~20 bedrock 1
execute @e[type=item,name="圈地",scores={ItemDistinguish=1,LandInfo=0}] ~ ~ ~ fill ~-15 0 ~-15 ~15 0 ~15 barrier 0
execute @e[type=item,name="圈地",scores={ItemDistinguish=1,LandInfo=0}] ~ ~ ~ fill ~ 1 ~ ~ 1 ~ barrier 0
execute @e[type=item,name="圈地",scores={ItemDistinguish=1,LandInfo=0}] ~ ~ ~ fill ~ 0 ~ ~ 0 ~ nether_brick_fence 0 destroy
execute @e[type=item,name="圈地",scores={ItemDistinguish=1,LandInfo=0}] ~ ~ ~ summon leash_knot ~ 0 ~
execute @e[type=item,name="圈地",scores={ItemDistinguish=1,LandInfo=0}] ~ ~ ~ scoreboard players operation @e[y=0,r=1,type=leash_knot,c=1] LandID = @p PlayerID
execute @e[type=item,name="圈地",scores={ItemDistinguish=1,LandInfo=0}] ~ ~ ~ scoreboard players operation @e[y=0,r=1,type=leash_knot,c=1] LandPassword = @p Password
execute @e[type=item,name="圈地",scores={ItemDistinguish=1,LandInfo=0}] ~ ~ ~ title @p title §6圈地成功！
execute @e[type=item,name="圈地",scores={ItemDistinguish=1,LandInfo=0}] ~ ~ ~ fill ~ ~-1 ~ ~ ~-1 ~ air
execute @e[type=item,name="圈地",scores={ItemDistinguish=1,LandInfo=0}] ~ ~ ~ kill
#领地拆除
#[运行]
execute @a[scores={PlayerID=1..}] ~ ~ ~ execute @e[x=~-15,y=0,z=~-15,dx=31,dz=31,type=leash_knot,c=1,scores={LandID=1..}] ~ ~ ~ execute @a[x=~,y=~,z=~,dy=3,scores={CountF=0}] ~ ~ ~ execute @e[x=~,y=~,z=~,type=item,name="拆除领地",scores={ItemDistinguish=1}] ~ ~ ~ title @p title §4领地拆除成功!
execute @a[scores={PlayerID=1..}] ~ ~ ~ execute @e[x=~-15,y=0,z=~-15,dx=31,dz=31,type=leash_knot,c=1,scores={LandID=1..}] ~ ~ ~ execute @a[x=~,y=~,z=~,dy=4,scores={CountF=0}] ~ ~ ~ execute @e[x=~,y=~,z=~,type=item,name="拆除领地",scores={ItemDistinguish=1}] ~ ~ ~ fill ~-20 0 ~-20 ~20 1 ~20 bedrock 0
execute @a[scores={PlayerID=1..}] ~ ~ ~ execute @e[x=~-15,y=0,z=~-15,dx=31,dz=31,type=leash_knot,c=1,scores={LandID=1..}] ~ ~ ~ execute @a[x=~,y=~,z=~,dy=4,scores={CountF=0}] ~ ~ ~ execute @e[x=~,y=~,z=~,type=item,name="拆除领地",scores={ItemDistinguish=1}] ~ ~ ~ scoreboard players add @e[x=~,y=~,z=~,type=item,name="拆除领地",scores={ItemDistinguish=1}] ItemDistinguish 1
execute @a[scores={PlayerID=1..}] ~ ~ ~ execute @e[x=~-15,y=0,z=~-15,dx=31,dz=31,type=leash_knot,c=1,scores={LandID=1..}] ~ ~ ~ execute @a[x=~,y=~,z=~,dy=4,scores={CountF=0}] ~ ~ ~ execute @e[x=~,y=~,z=~,type=item,name="拆除领地",scores={ItemDistinguish=2}] ~ ~ ~ kill
