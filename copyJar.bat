rem  use * /del /y 解决访问共享时提示多重连接的问题
net use * /del /y
rem 访问远端的密码以及用户名
net use \\192.168.1.134\%path_name% "forDEV123" /u:"root"


set product_134=\\192.168.1.134\%path_name%\test\product?%a%.jar
set productswf_134=\\192.168.1.134\%path_name%\test\product-swf?%a%.jar


if %path_name%==productJar (
set path_name=trunk
)
set product_141=%path_local%\%path_name%\test_%a%\product?%a%.jar 
set productswf_141=%path_local%\%path_name%\test_%a%\product-swf?%a%.jar


::复制product
if exist %product_134% (
if not exist %product_141% (
del %path_local%\%path_name%\test_%a%\product?20*
rem 将%product_134%路径下的所有东西，全部复制到本机的%product_141%下 文件夹；参数说明：在复制文件的同时也复制空目录或子目录，如果目标路径已经有相同文件了，使用覆盖方式而不进行提示
echo f|xcopy  %product_134% %product_141% /y 
)
) else (
goto pass )

for /f %%i in ("%product_134%") do (
rem 文件的日期/时间
set str_date1=%%~ti
)
set new_time=%str_date1:~0,10%/%str_date1:~-5,5%
set str_date1=%str_date1:~-5,2%%str_date1:~-2,2%

for /f %%i in ("%product_141%") do (
set str_date2=%%~ti
)
set str_date2=%str_date2:~-5,2%%str_date2:~-2,2%

if %str_date2% NEQ %str_date1% (
echo f|xcopy  %product_134% %product_141% /y 
start sendEmail.vbs 拷包邮件 %path_name%有新product，修改时间为%new_time%
)


::复制product-swf
if exist %productswf_134% (
if not exist %productswf_141% (
del %path_local%\%path_name%\test_%a%\product-swf?*
echo f|xcopy  %productswf_134% %productswf_141% /y 
)
) else (
goto pass )

for /f %%i in ("%productswf_134%") do (
set str_date1=%%~ti
)
set new_time=%str_date1:~0,10%/%str_date1:~-5,5%
set str_date1=%str_date1:~-5,2%%str_date1:~-2,2%

for /f %%i in ("%productswf_141%") do (
set str_date2=%%~ti
)
set str_date2=%str_date2:~-5,2%%str_date2:~-2,2%

if %str_date2% NEQ %str_date1% (
echo f|xcopy  %productswf_134% %productswf_141% /y 
start sendEmail.vbs 拷包邮件 %path_name%有新product_swf，修改时间为%new_time%
)

:pass