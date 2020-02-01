Set ws = CreateObject("Wscript.Shell") '创建一个脚本命令窗口，换句话说就好像是打开了命令提示窗口，等待命令的输入
ws.run "cmd /c sync.bat",0 '一个是CMD /C ，另一个是CMD /K，这两个参数的区别在哪里？其实/C 是  /Close的简写；/K 是 /Keep的简写。一个是命令运行之后关闭窗口，一个是保留窗口。