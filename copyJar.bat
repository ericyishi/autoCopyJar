rem  use * /del /y ������ʹ���ʱ��ʾ�������ӵ�����
net use * /del /y
rem ����Զ�˵������Լ��û���
net use \\192.168.1.134\%path_name% "forDEV123" /u:"root"


set product_134=\\192.168.1.134\%path_name%\test\product?%a%.jar
set productswf_134=\\192.168.1.134\%path_name%\test\product-swf?%a%.jar


if %path_name%==productJar (
set path_name=trunk
)
set product_141=%path_local%\%path_name%\test_%a%\product?%a%.jar 
set productswf_141=%path_local%\%path_name%\test_%a%\product-swf?%a%.jar


::����product
if exist %product_134% (
if not exist %product_141% (
del %path_local%\%path_name%\test_%a%\product?20*
rem ��%product_134%·���µ����ж�����ȫ�����Ƶ�������%product_141%�� �ļ��У�����˵�����ڸ����ļ���ͬʱҲ���ƿ�Ŀ¼����Ŀ¼�����Ŀ��·���Ѿ�����ͬ�ļ��ˣ�ʹ�ø��Ƿ�ʽ����������ʾ
echo f|xcopy  %product_134% %product_141% /y 
)
) else (
goto pass )

for /f %%i in ("%product_134%") do (
rem �ļ�������/ʱ��
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
start sendEmail.vbs �����ʼ� %path_name%����product���޸�ʱ��Ϊ%new_time%
)


::����product-swf
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
start sendEmail.vbs �����ʼ� %path_name%����product_swf���޸�ʱ��Ϊ%new_time%
)

:pass