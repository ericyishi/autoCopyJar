# autoCopyJar
### 写的脚本拷包（主要解决自动从北京服务器上的jar包拷到成都服务器上，减少人工拷包的时间）
1. 包括自动发送邮件功能
### 文件结构
1. hide.vbs 未启动脚本
2. sync.bat 为自动轮询执行拷包的程序
3. versions.txt 用于存放需要拷包的不同版本
4. copyJar.bat 拷jar的运行程序
5. sendEmail.vbs 拷包成功后执行的发送邮件程序