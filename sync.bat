rem 当echo设置off值的时候，那么下面的指令都将只执行而不显示，当再次出现echo on时下面的语句才为可见的（回显）。
@echo off

set path_local=D:\productJar

:RunTime
rem 取出格式为 YYYYMMDD 存到变量a上 ，可以参考https://blog.csdn.net/iw1210/article/details/39313677
set a=%date:~0,4%%date:~5,2%%date:~8,2%
rem 取出当前的小时
set NowTime=%time:~0,2%

rem 如果小时数大于8那么，延时 120s，即2分钟执行一次跳转到Copy标签去，否则延时1小时
if %NowTime% GEQ 8 (
	timeout /t 120
	goto Copy
) else (
timeout /t 3600 )


:Copy
rem 读取version.txt文件里面的内容，将每一行值赋给变量i /f才能解析字符串内容
for /f %%i in (versions.txt) do (
set path_name=%%i
rem 从批处理程序调用另一个批处理程序，在被调用的批处理执行完后在执行call下面的命令
call copyJar.bat
)

goto RunTime
