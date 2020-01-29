# speedtestcli script
Currently only supports powershell

# Getting Started

## 1. Install speedtestcli
Go to https://www.speedtest.net/apps/cli and install the cli for Windows.  The script assumes that the executable is located in your path environment.  For details on how to edit the path, go to https://www.architectryan.com/2018/03/17/add-to-the-path-on-windows-10/.  Otherwise, you can replace "speedtest" with the full path to the executable.

## 2. Create a twilio account
Free trial accounts are available at https://www.twilio.com/.  This account will be used to send the SMS messages from the script.

## 3. Modify script
You will need to modify the following variables before running the script:
- sid: From your Twilio account, under "Account SID"
- token:  From your Twilio account, under "Auth Token"
- number:  From your Twilio account, under "Trial number", or any other Twilio-enabled number
- receiver:  The number you wish to receive the text message.  This must be verified in Twilio if you're only using the Trial period.

## 4. How to run
Either run the script directly, or set it on a schedule.  If everything works, you should receive a text message at the receiver number.  To set a schedule in Windows, this is a helpful reference:  https://www.windowscentral.com/how-create-automated-task-using-task-scheduler-windows-10.

# Further customization
You can customize the output of the message by looking inside of the try-catch block and modifying the output there.  The default is download/upload speeds, as well as time ran and public IP address.  Run "speedtest -f json-pretty" or inspect the $result variable in powershell to find other information available from the speedtestcli.
