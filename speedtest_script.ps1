# https://www.twilio.com/docs/usage/tutorials/how-to-make-http-basic-request-twilio-powershell
# replace the following parameters with your own informaiton
$sid = ""
$token = ""
$number = ""
$receiver = ""

# rest of the script runs here.
Function ConvertTo-Mbps {
    param([int]$bytes)
    $bytes / 1024 / 1024 * 8
}

$date = Get-Date -Format "HH:mm:ss dd-MMM-yyyy"

try {
    $json = speedtest -f json
    $result = ConvertFrom-Json $json

    $db = ConvertTo-Mbps $result.download.bandwidth
    $ub = ConvertTo-Mbps $result.upload.bandwidth

    $output1 = " DL speed: {0,-9:n3}" -f $db
    $output2 = " UL speed: {0,-9:n3}" -f $ub
    $output3 = "Public IP: {0}" -f $result.interface.externalIp
    $output = $output1 + [Environment]::NewLine + $output2 + [Environment]::NewLine + $output3
}
catch {
    $output = "Error running speedtest"
}

$output = $output + [Environment]::NewLine + "Executed at {0}" -f $date

$params = @{ To = $receiver; From = $number; Body = $output }

$p = $token | ConvertTo-SecureString -asPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($sid, $p)

$url = "https://api.twilio.com/2010-04-01/Accounts/$sid/Messages.json"
$twilio_result = Invoke-WebRequest $url -Method Post -Credential $credential -Body $params -UseBasicParsing