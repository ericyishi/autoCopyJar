'function sendEmail(strEmail_From, strEmail_To, strEmail_Subject, strEmail_Body)


    NameSpace = "http://schemas.microsoft.com/cdo/configuration/" 
	Set Email = CreateObject("CDO.Message") 
	Email.From = "sender@qq.com"
	Email.To = "receiver@qq.com"
	Email.Subject = WScript.Arguments(0)'strEmail_Subject
	Email.Textbody = WScript.Arguments(1)'strEmail_Body
	'set wshnamed=wscript.arguments.named
	'Email.Subject=wshnamed.item("a") 
	'Email.Textbody=wshnamed.item("b") 
	With Email.Configuration.Fields 
	.Item(NameSpace&"sendusing") = 2  '使用网络上的SMTP服务器而不是本地的SMTP服务器
	.Item(NameSpace&"smtpserver") = "smtp.exmail.qq.com" 
	.Item(NameSpace&"smtpserverport") = 465 
	.Item(NameSpace&"smtpusessl") = True
	.Item(NameSpace&"smtpauthenticate") = 1 
	.Item(NameSpace&"sendusername") = "sender@qq.com" 
	.Item(NameSpace&"sendpassword") = "pwd" 
	.Item(NameSpace&"smtpconnectiontimeout") = 60    '连接服务器的超时时间
	.Update 
	End With 
	Email.Send
	Set Email = nothing
	
'End function