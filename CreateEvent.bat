eventcreate /so Source /t error /id 881 /l application /d "Create event in application log"

:: /s   Computer                        指定远程计算机名称或 IP 地址（不能使用反斜杠）。默认值是本地计算机。
:: /u   Domain\User                     以User或 Domain\User 指定的用户帐户权限运行命令。默认值是当前登录到计算机上发出该命令的用户具有的权限。
:: /p   Password                        指定在 /u 参数中指定的用户帐户的密码。
:: /l   {APPLICATION | SYSTEM}          指定将在其中创建事件的事件日志的名称。有效日志名称为 APPLICATION 和 SYSTEM。
:: /so  SrcName                         指定要使用的事件来源。有效来源可以是任何字符串，并应代表生成事件的应用程序或组件。
:: /t   {ERROR | WARNING | INFORMATION} 指定要创建的事件类型。有效类型为 ERROR、WARNING 和 INFORMATION。
:: /id  EventID                         指定事件的事件 ID。有效 ID 为从 1 到 1000 的任意数字。
:: /d   Description                     指定用于新建事件的说明。
:: /?   在命令提示符下显示帮助。